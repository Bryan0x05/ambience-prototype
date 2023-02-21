import 'dart:io';

void main() {
  //win file path sample
  String imagepath = "C:/Users/bryan/Downloads/background.png";

  //linux file path sample
  //String imagepath = '//home/bryan/Downloads/background.jpg';

  if (Platform.isWindows) {
    String shell = 'powershell';
    String command = 'python pythonWinBG.py';
    changeBG(imagepath, shell, command);
  } else if (Platform.isLinux) {
    //Only Linux distros with bash shell and Gnome desktop manager e.g. Ubuntu
    String shell = 'bash';
    String command = 'gsetting set org.gnome.desktop.background picture-uri file://$imagepath';
    changeBGLin(shell, command);
  }
}

void changeBG(imagepath, shell, command) async {
  //opens given shell and types into shell: command imagepath
  var result = await Process.run(shell, [command, imagepath]);

    if (result.exitCode == 0) {
    print('Background changed successfully.');
  } else {
    print('Failed to change background: ${result.stderr}');
  }
}

//trying to make an universal function, but linux is being difficult
void changeBGLin(shell, command) async {
  //opens given shell and types into shell: command imagepath
  var result = await Process.run(shell, ['-c', command]);

  if (result.exitCode == 0) {
    print('Background changed successfully.');
  } else {
    print('Failed to change background: ${result.stderr}');
  }
}
