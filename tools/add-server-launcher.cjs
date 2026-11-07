const fs=require('fs'),f='tools/OdysseyLauncher.cs';let s=fs.readFileSync(f,'utf8');s=s.replace('#if EDITOR','#if SERVER\n        const bool editor = false;\n        const bool serverOnly = true;\n        const string title = "Odyssey Server";\n#elif EDITOR');s=s.replace('const bool editor = true;','const bool editor = true;\n        const bool serverOnly = false;');s=s.replace('const bool editor = false;\r\n        const string title = "Odyssey";','const bool editor = false;\r\n        const bool serverOnly = false;\r\n        const string title = "Odyssey";');s=s.replace('const bool editor = false;\n        const string title = "Odyssey";','const bool editor = false;\n        const bool serverOnly = false;\n        const string title = "Odyssey";');s=s.replace('(editor ? "Editor_" : "Game_")','(editor ? "Editor_" : serverOnly ? "Server_" : "Game_")');s=s.replace('if (!File.Exists(electron))','if (!serverOnly && !File.Exists(electron))');s=s.replace('if (!editor)\r\n','if (serverOnly && Listening()) throw new Exception("A server is already listening on port 5751.");\r\n                if (!editor && !Listening())\r\n');s=s.replace('if (!editor)\n','if (serverOnly && Listening()) throw new Exception("A server is already listening on port 5751.");\n                if (!editor && !Listening())\n');s=s.replace('                    if (Listening()) throw new Exception("Port 5751 is already in use. Close the existing Odyssey game/server, then start this launcher again.");','');s=s.replace('                var client = new ProcessStartInfo',`                if (serverOnly)
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
                var client = new ProcessStartInfo`);fs.writeFileSync(f,s);
