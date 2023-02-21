import 'dart:io';

void main() {
  //win file path sample
  String imagepath = "C:/Users/bryan/Downloads/background.png";

  //linux file path sample
  //String imagepath = '//home/bryan/Downloads/background.jpg';
  changeBG(imagepath);
}

void changeBG(imagepath) async {
  if (Platform.isWindows) {
    var result =
        await Process.run('powershell', ['python pythonWinBG.py $imagepath']);
    if (result.exitCode != 0) {
      print("wallpaper change command did NOT terminate correctly becase:");
      print(result.stderr);
    }
  } else if (Platform.isLinux) {
    String command =
        'gsetting set org.gnome.desktop.background picture-uri file://$imagepath';
    var result = await Process.run('bash', ['-c', command]);
    if (result.exitCode != 0) {
      print("wallpaper change command did NOT terminate correctly because:");
      print(result.stderr);

    }
  }
}
