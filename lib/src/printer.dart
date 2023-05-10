import 'package:imin_printer/imin_printer_platform_interface.dart';

import '../imin_printer.dart';

class IminPrinter {

  Future<void> init() async {
    await IminPrinterPlatform.instance.initPrinter();
  }


  Future<PrinterStatus> getStatus() async {
    var status = await IminPrinterPlatform.instance.getPrinterStatus();
    switch (status){
      case -1:
        return PrinterStatus.notConnected;
      case 0:
        return PrinterStatus.normal;
      case 1:
        return PrinterStatus.notConnected;
      case 7:
        return PrinterStatus.noPaperFeed;
      case 8:
        return PrinterStatus.paperRunningOut;
      default:
        return PrinterStatus.unknown;
    }
  }


  Future<void> printAndLineFeed() async {
    await IminPrinterPlatform.instance.printAndLineFeed();
  }


  Future<void> printAndFeedPaper(int lines) async {
    assert(lines >= 0 && lines <= 255, "Lines should be between 0 - 255");
    await IminPrinterPlatform.instance.printAndFeedPaper(lines);
  }


  Future<void> cut() async {
    await IminPrinterPlatform.instance.cut();
  }


  Future<void> setAlignment(PrinterAlignment alignment) async {
    await IminPrinterPlatform.instance.setAlignment(alignment.index);
  }


  Future<void> setTextSize(int size) async {
    await IminPrinterPlatform.instance.setTextSize(size);
  }


  Future<void> setTextTypeface(PrinterTypeFace typeface) async {
    await IminPrinterPlatform.instance.setTextTypeface(typeface.index);
  }


  Future<void> setTextStyle(PrinterTextStyle textStyle) async {
    await IminPrinterPlatform.instance.setTextStyle(textStyle.index);
  }


  Future<void> setTextLineSpacing(double spacing) async {
    await IminPrinterPlatform.instance.setTextLineSpacing(spacing);
  }


  Future<void> setTextWidth(int width) async {
    await IminPrinterPlatform.instance.setTextWidth(width);
  }


  Future<void> printText(String text) async {
    await IminPrinterPlatform.instance.printText(text);
  }


  Future<void> printRow(List<PrinterColumn> columns) async {
    await IminPrinterPlatform.instance.printRow(columns);
  }

  Future<void> printQrCode(String data, PrinterAlignment alignment) async {
    await IminPrinterPlatform.instance.printQrCode(data,alignment.index);
  }

  Future<void> setQrSize(int size) async {
    assert(size >= 1 && size <= 13, "Qr size must be between 1 - 13");
    await IminPrinterPlatform.instance.setQrSize(size);
  }

  Future<void> setQrCorrectionLevel(int level) async {
    assert(level >= 48 && level <= 51, "QR correction Level must be between 48 - 51");
    await IminPrinterPlatform.instance.setQrCorrectionLevel(level);
  }
}
