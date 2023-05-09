import 'package:imin_printer/src/printer_column.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'imin_printer_method_channel.dart';

abstract class IminPrinterPlatform extends PlatformInterface {
  /// Constructs a IminPrinterPlatform.
  IminPrinterPlatform() : super(token: _token);

  static final Object _token = Object();

  static IminPrinterPlatform _instance = MethodChannelIminPrinter();

  /// The default instance of [IminPrinterPlatform] to use.
  ///
  /// Defaults to [MethodChannelIminPrinter].
  static IminPrinterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IminPrinterPlatform] when
  /// they register themselves.
  static set instance(IminPrinterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }


  Future<void> initPrinter() {
    throw UnimplementedError('initPrinter() has not been implemented.');
  }

  Future<int?> getPrinterStatus() {
    throw UnimplementedError('getPrinterStatus() has not been implemented.');
  }

  Future<void> printAndLineFeed() {
    throw UnimplementedError('printAndLineFeed() has not been implemented.');
  }

  Future<void> printAndFeedPaper(int lines){
    throw UnimplementedError('printAndFeedPaper() has not been implemented.');
  }

  Future<void> cut(){
    throw UnimplementedError('cut() has not been implemented.');
  }

  Future<void> setAlignment(int alignment){
    throw UnimplementedError('setAlignment() has not been implemented.');
  }

  Future<void> setTextSize(int textSize){
    throw UnimplementedError('setTextSize() has not been implemented.');
  }

  Future<void> setTextTypeface(int typeface){
    throw UnimplementedError('setTextTypeface() has not been implemented.');
  }

  Future<void> setTextStyle(int textStyle){
    throw UnimplementedError('setTextStyle() has not been implemented.');
  }

  Future<void> setTextLineSpacing(double spacing){
    throw UnimplementedError('setTextLineSpacing() has not been implemented.');
  }

  Future<void> setTextWidth(int width){
    throw UnimplementedError('setTextWidth() has not been implemented.');
  }

  Future<void> printText(String text){
    throw UnimplementedError('printText() has not been implemented.');
  }

  Future<void> printRow(List<PrinterColumn> columns){
    throw UnimplementedError('printText() has not been implemented.');
  }
}
