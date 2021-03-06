import 'package:logbox_color/extensions.dart';
import 'package:logbox_color/logbox_color.dart';

void main() {
  printLog(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      LogLevel.debug); // Debug - Long example.
  printLog("hello world !", LogLevel.verbose); // Verbose
  printLog("love flutter :)", LogLevel.info); // Info
  printLog("hey check that!", LogLevel.warning); // Warning
  printLog("please use dart !", LogLevel.error); // Error
  printLog("flutter rocks !", LogLevel.unknown); // Unknown
}
