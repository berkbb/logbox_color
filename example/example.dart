import 'package:colorlogger/colorlogger.dart';

void main() {
  print("hello");
  // printLog(
  //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  //     LogLevel.debug);
  printLog("hello world !", LogLevel.verbose);
  printLog("love dotnet :)", LogLevel.info);
  printLog("hey check that!", LogLevel.warning);
  printLog("please use c# !", LogLevel.error);
  printLog("dotnet rocks !", LogLevel.unknown);
}
