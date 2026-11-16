using System;
using System.IO;
using System.Diagnostics;
using System.Windows.Forms;
internal static class PortableLauncher {
 [STAThread] static int Main(string[] arguments) {
  bool check=Array.IndexOf(arguments,"--check-package")>=0;
  try {
   string root=AppDomain.CurrentDomain.BaseDirectory;
   string client=Path.Combine(root,"client");
   string runtime=Path.Combine(client,"node_modules","electron","dist","electron.exe");
   string[] required={"client/node_modules/electron/dist/electron.exe","client/node_modules/electron/dist/resources.pak","client/node_modules/mithril/package.json","client/src/main.js","client/src/desktop.html","server/bin/odyssey.js","runtime/node.exe"};
   string missing=null;
   foreach(string file in required)if(!File.Exists(Path.Combine(root,file.Replace('/',Path.DirectorySeparatorChar)))){missing=file;break;}
   // Source checkouts use an installed Node runtime; portable downloads include it.
   if(missing=="runtime/node.exe" && File.Exists(Path.Combine(root,"tools","build-portable.cjs")) && !File.Exists(Path.Combine(root,"release-manifest.json")))missing=null;
   if(missing!=null){
    if(check)return 2;
    string message=File.Exists(Path.Combine(root,"release-manifest.json"))?
     "This game package is incomplete. Missing: "+missing+"\n\nExtract the entire Windows game ZIP into one folder. If files are still missing, download a fresh copy.":
     "This folder contains the source-code download, not the complete Windows game. Extracting it again will not add the missing game runtime.\n\nDownload Odyssey-Reimagined-Windows.zip from Releases, extract it, then run Odyssey.exe inside that folder. Do not select GitHub's Source code ZIP.\n\nDevelopers can instead follow Build from source in README.md.";
    if(MessageBox.Show(message+"\n\nOpen the Windows download page?","Odyssey Reimagined",MessageBoxButtons.YesNo,MessageBoxIcon.Information)==DialogResult.Yes)Process.Start(new ProcessStartInfo("https://github.com/OtosanX/Odyssey-Re-imagined/releases/latest"){UseShellExecute=true});
    return 2;
   }
   if(check)return 0;
   string args=".";
#if SERVER
   args+=" --host";
#elif EDITOR
   args+=" --editor";
#endif
   var start=new ProcessStartInfo(runtime,args){WorkingDirectory=client,UseShellExecute=false,CreateNoWindow=true};
#if EDITOR
   string community=Path.Combine(root,"community-world");
   if(Directory.Exists(Path.Combine(community,"server","data")) || Directory.Exists(Path.Combine(community,"odyssey-2-server-develop","data")))start.EnvironmentVariables["ODYSSEY_STUDIO_ROOT"]=community;
#endif
   using(var game=Process.Start(start)){game.WaitForExit();return game.ExitCode;}
  }catch(Exception error){if(!check)MessageBox.Show(error.Message,"Odyssey Reimagined",MessageBoxButtons.OK,MessageBoxIcon.Error);return 1;}
 }
}
