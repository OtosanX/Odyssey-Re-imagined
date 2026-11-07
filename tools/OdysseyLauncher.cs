using System;
using System.Diagnostics;
using System.IO;
using System.Net.Sockets;
using System.Threading;
using System.Windows.Forms;

internal static class OdysseyLauncher
{
    [STAThread]
    private static void Main()
    {
#if SERVER
        const bool editor = false;
        const bool serverOnly = true;
        const string title = "Odyssey Server";
#elif EDITOR
        const bool editor = true;
        const bool serverOnly = false;
        const string title = "Odyssey Studio";
#else
        const bool editor = false;
        const bool serverOnly = false;
        const string title = "Odyssey";
#endif
        string root = AppDomain.CurrentDomain.BaseDirectory;
        Process server = null;
        bool owned;
        using (Mutex instance = new Mutex(true, "Local\\OdysseyWorkspace_" + (editor ? "Editor_" : serverOnly ? "Server_" : "Game_" + Guid.NewGuid().ToString("N")) + root.ToLowerInvariant().GetHashCode().ToString("X"), out owned))
        {
            if (!owned) { MessageBox.Show(title + " is already running.", title); return; }
            try
            {
                string clientRoot = Path.Combine(root, "odyssey-2-client-develop");
                string serverRoot = Path.Combine(root, "odyssey-2-server-develop");
                string electron = Path.Combine(clientRoot, "node_modules", "electron", "dist", "electron.exe");
                if (!serverOnly && !File.Exists(electron)) throw new Exception("The bundled client runtime is missing. Keep this launcher in the ody server folder alongside odyssey-2-client-develop.");
                Directory.CreateDirectory(Path.Combine(root, "logs"));
                if (serverOnly && Listening()) throw new Exception("A server is already listening on port 5751.");
                if (!editor && !Listening())
                {

                    string node = FindNode();
                    if (!File.Exists(Path.Combine(serverRoot, "bin", "odyssey.js"))) throw new Exception("The compiled server is missing. Run Start-Odyssey.ps1 to build it.");
                    var info = new ProcessStartInfo(node, "bin/odyssey.js") { WorkingDirectory = serverRoot, UseShellExecute = false, CreateNoWindow = true, RedirectStandardOutput = true, RedirectStandardError = true };
                    server = new Process(); server.StartInfo = info;
                    string output = Path.Combine(root, "logs", "server.log"), error = Path.Combine(root, "logs", "server-error.log");
                    File.WriteAllText(output, ""); File.WriteAllText(error, "");
                    object logLock = new object();
                    server.OutputDataReceived += delegate(object sender, DataReceivedEventArgs e) { if (e.Data != null) lock (logLock) File.AppendAllText(output, e.Data + Environment.NewLine); };
                    server.ErrorDataReceived += delegate(object sender, DataReceivedEventArgs e) { if (e.Data != null) lock (logLock) File.AppendAllText(error, e.Data + Environment.NewLine); };
                    server.Start(); server.BeginOutputReadLine(); server.BeginErrorReadLine();
                    DateTime deadline = DateTime.UtcNow.AddSeconds(15);
                    while (!Listening())
                    {
                        if (server.HasExited) { server.WaitForExit(); throw new Exception("Server startup failed.\n\n" + File.ReadAllText(error)); }
                        if (DateTime.UtcNow >= deadline) throw new Exception("Server startup timed out. See logs/server-error.log.");
                        Thread.Sleep(150);
                    }
                    if (server.HasExited) throw new Exception("Server exited during startup. See logs/server-error.log.");
                }
                if (serverOnly)
                {
                    Application.EnableVisualStyles();
                    using (Form form = new Form())
                    {
                        form.Text = "Odyssey Reimagined Server"; form.Width = 650; form.Height = 260;
                        TextBox text = new TextBox(); text.Multiline = true; text.ReadOnly = true; text.Dock = DockStyle.Fill;
                        string addresses = "";
                        foreach (System.Net.IPAddress ip in System.Net.Dns.GetHostAddresses(System.Net.Dns.GetHostName()))
                            if (ip.AddressFamily == AddressFamily.InterNetwork && !System.Net.IPAddress.IsLoopback(ip)) addresses += "http://" + ip + ":8080/" + Environment.NewLine;
                        text.Text = "Server is running. You can open Odyssey.exe separately." + Environment.NewLine + Environment.NewLine + "Phone/browser addresses on the same network:" + Environment.NewLine + addresses + Environment.NewLine + "Closing this window stops this server. Logs are in the logs folder.";
                        form.Controls.Add(text); Application.Run(form);
                    }
                    return;
                }
                var client = new ProcessStartInfo(electron, editor ? ". --editor" : ".") { WorkingDirectory = clientRoot, UseShellExecute = false, CreateNoWindow = true };
                using (Process window = Process.Start(client)) { window.WaitForExit(); if (window.ExitCode != 0) throw new Exception("The client exited with code " + window.ExitCode + "."); }
            }
            catch (Exception e) { MessageBox.Show(e.Message, title + " startup", MessageBoxButtons.OK, MessageBoxIcon.Error); }
            finally { if (server != null) { try { if (!serverOnly) { while (!server.HasExited && HasClients()) Thread.Sleep(500); } if (!server.HasExited) { server.Kill(); server.WaitForExit(); } } catch { } server.Dispose(); } instance.ReleaseMutex(); }
        }
    }
    private static bool HasClients()
    {
        foreach (System.Net.NetworkInformation.TcpConnectionInformation connection in System.Net.NetworkInformation.IPGlobalProperties.GetIPGlobalProperties().GetActiveTcpConnections())
            if ((connection.LocalEndPoint.Port == 5751 || connection.LocalEndPoint.Port == 8080) && connection.State == System.Net.NetworkInformation.TcpState.Established) return true;
        return false;
    }
    private static bool Listening()
    {
        using (var client = new TcpClient())
        {
            try { var attempt = client.BeginConnect("127.0.0.1", 5751, null, null); if (!attempt.AsyncWaitHandle.WaitOne(250)) return false; client.EndConnect(attempt); return true; }
            catch (SocketException) { return false; }
        }
    }
    private static string FindNode()
    {
        foreach (string folder in new string[] { Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles), Environment.GetFolderPath(Environment.SpecialFolder.ProgramFilesX86) })
        { string file = Path.Combine(folder, "nodejs", "node.exe"); if (File.Exists(file)) return file; }
        foreach (string folder in (Environment.GetEnvironmentVariable("PATH") ?? "").Split(Path.PathSeparator))
        { try { string file = Path.Combine(folder.Trim('"'), "node.exe"); if (File.Exists(file)) return file; } catch { } }
        throw new Exception("Node.js is missing. Install Node.js before starting the server.");
    }
}
