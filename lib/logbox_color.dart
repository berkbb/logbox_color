/// Support for doing something awesome.
///
/// More dartdocs go here.
library logbox_color;

import 'dart:io';
import 'package:ansicolor/ansicolor.dart';
import 'package:logbox_color/extensions.dart';

///* Info: Prints to console with color. Like print() with colored foreground.
///* Params: [msg] is message, [lvl] is log level.
///* Returns: none.
///* Notes: Note that coloring only available on external OS terminals and Visual Studio and Visual Studio Code integrated terminal . Visual Studio and Visual Studio Code internalConsoke does not support coloring. Set dart.cliConsole to ecternalTerminal or terminal please.

void printLog(String msg, LogLevel lvl) {
  late bool consoleNotTerminal;

  try {
    consoleNotTerminal = stdout.hasTerminal == false ? true : false;
  } catch (e) {
    consoleNotTerminal =
        true; // If error occurred, environmentis web (not supports dart:io), default is console.
  }
  if (consoleNotTerminal) // Console
  {
    print("It is a web browser console ?");
    var classicPen = AnsiPen() // Return ansi term color.
      ..reset()
      ..xterm(40); //  green 2 xterm
    print(classicPen(
        "\n${DateTime.now().toString()} --> ${lvl.getStringFromPriorityType()}\n---------------\n$msg\n---------------"));
  } else // Terminal
  {
    var colorPen = lvl.getColorPen(); //Foreground selector.

    print("");
    // Empty space.

    StringBuffer header = StringBuffer(); // String buffer for header.
    var headerTitle =
        "⎧${DateTime.now().toString()} --> ${lvl.getStringFromPriorityType()}⎫"; // Title
    // Write to title
    header.write(headerTitle);
    for (int i = 0; i < stdout.terminalColumns - headerTitle.length - 1; i++) {
      header.write("⎯");
    }

    var msgOut = " → $msg"; // body
    // Calculating the lines for long text.

    double divide = msgOut.length / stdout.terminalColumns;
    int ceiledDivide = divide.ceil();
    int chunk = (msgOut.length / ceiledDivide - 1).toInt();

    //Print header.
    var upper = header.toString();
    print(colorPen(upper));
    header.clear(); // Clear header buffer.

    StringBuffer body = StringBuffer(); // String buffer for body.
    if (divide <= 1) // If 0 (empty) or 1 line.
    {
      var printCount = stdout.terminalColumns - msgOut.length; // Print count

      for (int i = 0; i < printCount - 1; i++) {
        if (i == 0) {
          body.write(colorPen("⎮ $msgOut")); // Write message.
        } else if (i != printCount - 2) {
          body.write(" "); // Space
        } else {
          body.write(colorPen("⎮")); // End plate.
        }
      }
      print(body.toString()); // Print body 1.
      body.clear(); // Clear body buffer.
    } else // 2 or more line.
    {
      var groups = msgOut.splitWithCount(chunk); // Split text into chunks.

      for (int i = 0; i < groups.length; i++) {
        var startPrint = "⎮ ${groups[i]}"; // Message
        body.write(startPrint); // Write message into buffer.
        var printCount = stdout.terminalColumns - startPrint.length;
        for (var z = 0; z < printCount; z++) {
          if (z == printCount - 1) {
            body.write("⎮"); // Write end plate into buffer.
          } else {
            body.write(" "); // Write space into buffer.
          }
        }
        print(colorPen(body.toString())); // Print body 2.
        body.clear(); // Clear body buffer.
      }
    }

    StringBuffer footer = StringBuffer(); // String buffer for footer.
    // Print footer.
    for (int i = 0; i < upper.length; i++) {
      footer.write(colorPen("⎯"));
    }
    print(footer.toString()); // Print footer.
    footer.clear();
  }
}
