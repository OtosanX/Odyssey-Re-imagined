using System;
using System.IO;
using System.Diagnostics;
using System.Windows.Forms;
internal static class PortableLauncher {
 [STAThread] static void Main() {
  try {
   string root=AppDomain.CurrentDomain.BaseDirectory;
   string client=Path.Combine(root,"client");
   string runtime=Path.Combine(client,"node_modules","electron","dist","electron.exe");
   if(!File.Exists(runtime))throw new Exception("Extract the entire Odyssey Reimagined ZIP before starting the game. Keep the EXE beside its folders.");
   string args=".";
#if SERVER
   args+=" --host";
#elif EDITOR
   args+=" --editor";
#endif
   var start=new ProcessStartInfo(runtime,args){WorkingDirectory=client,UseShellExecute=false,CreateNoWindow=true};
#if EDITOR
   // The desktop's Edit community world button selects the host's exact folder.
   string community=Path.Combine(root,"community-world");
   if(Directory.Exists(Path.Combine(community,"server","data")) || Directory.Exists(Path.Combine(community,"odyssey-2-server-develop","data")))start.EnvironmentVariables["ODYSSEY_STUDIO_ROOT"]=community;
#endif
   using(var game=Process.Start(start)){game.WaitForExit();}
  }catch(Exception error){MessageBox.Show(error.Message,"Odyssey Reimagined",MessageBoxButtons.OK,MessageBoxIcon.Error);}
 }
}
