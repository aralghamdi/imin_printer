import 'package:flutter_test/flutter_test.dart';
import 'package:imin_printer/imin_printer.dart';
import 'package:imin_printer/imin_printer_platform_interface.dart';
import 'package:imin_printer/imin_printer_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockIminPrinterPlatform
    with MockPlatformInterfaceMixin
    implements IminPrinterPlatform {

  @override
  Future<void> initPrinter() {
    // TODO: implement initPrinter
    throw UnimplementedError();
  }

  @override
  Future<int?> getPrinterStatus() {
    // TODO: implement getPrinterStatus
    throw UnimplementedError();
  }

  @override
  Future<void> cut() {
    // TODO: implement cut
    throw UnimplementedError();
  }

  @override
  Future<void> printAndFeedPaper(int lines) {
    // TODO: implement printAndFeedPaper
    throw UnimplementedError();
  }

  @override
  Future<void> printAndLineFeed() {
    // TODO: implement printAndLineFeed
    throw UnimplementedError();
  }

  @override
  Future<void> printText(String text) {
    // TODO: implement printText
    throw UnimplementedError();
  }

  @override
  Future<void> setAlignment(int alignment) {
    // TODO: implement setAlignment
    throw UnimplementedError();
  }

  @override
  Future<void> setTextLineSpacing(double spacing) {
    // TODO: implement setTextLineSpacing
    throw UnimplementedError();
  }

  @override
  Future<void> setTextSize(int textSize) {
    // TODO: implement setTextSize
    throw UnimplementedError();
  }

  @override
  Future<void> setTextStyle(int textStyle) {
    // TODO: implement setTextStyle
    throw UnimplementedError();
  }

  @override
  Future<void> setTextTypeface(int typeface) {
    // TODO: implement setTextTypeface
    throw UnimplementedError();
  }

  @override
  Future<void> setTextWidth(int width) {
    // TODO: implement setTextWidth
    throw UnimplementedError();
  }

  @override
  Future<void> printRow(List<PrinterColumn> columns) {
    // TODO: implement printRow
    throw UnimplementedError();
  }

  @override
  Future<void> printQrCode(String data, int alignment) {
    // TODO: implement printQrCode
    throw UnimplementedError();
  }

  @override
  Future<void> setQrCorrectionLevel(int level) {
    // TODO: implement setQrCorrectionLevel
    throw UnimplementedError();
  }

  @override
  Future<void> setQrSize(int size) {
    // TODO: implement setQrSize
    throw UnimplementedError();
  }

  @override
  Future<void> openCashBox() {
    // TODO: implement openCashBox
    throw UnimplementedError();
  }
}

void main() {
  final IminPrinterPlatform initialPlatform = IminPrinterPlatform.instance;

  test('$MethodChannelIminPrinter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelIminPrinter>());
  });

}
