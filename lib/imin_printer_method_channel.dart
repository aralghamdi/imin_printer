import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:imin_printer/src/constants.dart';
import 'package:imin_printer/src/printer_column.dart';

import 'imin_printer_platform_interface.dart';

/// An implementation of [IminPrinterPlatform] that uses method channels.
class MethodChannelIminPrinter extends IminPrinterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('imin_printer');

  @override
  Future<void> initPrinter() async {
   await methodChannel.invokeMethod<void>(ChannelMethods.initPrinter);
  }

  @override
  Future<int?> getPrinterStatus() async {
    return await methodChannel.invokeMethod<int>(ChannelMethods.getPrinterStatus);
  }

  @override
  Future<void> printAndLineFeed() async {
    await methodChannel.invokeMethod<void>(ChannelMethods.printAndLineFeed);
  }

  @override
  Future<void> printAndFeedPaper(int lines) async {
    await methodChannel.invokeMethod<void>(ChannelMethods.printAndFeedPaper, {'lines': lines});
  }

  @override
  Future<void> cut() async {
    await methodChannel.invokeMethod<void>(ChannelMethods.partialCut);
  }

  @override
  Future<void> setAlignment(int alignment) async {
    await methodChannel.invokeMethod<void>(ChannelMethods.setAlignment, {'alignment': alignment});
  }

  @override
  Future<void> setTextSize(int textSize) async {
    await methodChannel.invokeMethod<void>(ChannelMethods.setTextSize, {'textSize': textSize});
  }

  @override
  Future<void> setTextTypeface(int typeface) async {
    await methodChannel.invokeMethod<void>(ChannelMethods.setTextTypeface, {'typeface': typeface});
  }

  @override
  Future<void> setTextStyle(int textStyle) async {
    await methodChannel.invokeMethod<void>(ChannelMethods.setTextStyle, {'textStyle': textStyle});
  }

  @override
  Future<void> setTextLineSpacing(double spacing) async {
    await methodChannel.invokeMethod<void>(ChannelMethods.setTextLineSpacing, {'lineSpacing': spacing});
  }

  @override
  Future<void> setTextWidth(int width) async {
    await methodChannel.invokeMethod<void>(ChannelMethods.setTextWidth, {'textWidth': width});
  }

  @override
  Future<void> printText(String text) async {
    await methodChannel.invokeMethod<void>(ChannelMethods.printText, {'text': "$text\n"});
  }

  @override
  Future<void> printRow(List<PrinterColumn> columns) async {
    final jsonCols = List<Map<String, String>>.from(
        columns.map<Map<String, String>>((PrinterColumn column) => column.toJson()));
      await methodChannel.invokeMethod<void>(ChannelMethods.printColumnsText, {'columns': json.encode(jsonCols)});
  }

  @override
  Future<void> printQrCode(String data, int alignment) async {
    await methodChannel.invokeMethod<void>(ChannelMethods.printQrCode, {'data': data, "alignment": alignment});
  }

  @override
  Future<void> setQrSize(int size) async {
    await methodChannel.invokeMethod<void>(ChannelMethods.setQrSize, {'size': size});
  }

  @override
  Future<void> setQrCorrectionLevel(int level) async {
    await methodChannel.invokeMethod<void>(ChannelMethods.setQrCorrectionLevel, {'level': level});
  }
}
