import 'package:imin_printer/imin_printer.dart';

class PrinterColumn {
  final String text;
  final int width;
  final PrinterAlignment alignment;
  final int textSize;

  const PrinterColumn(
      {required this.text,
      required this.width,
      required this.alignment,
      required this.textSize});

  Map<String, String> toJson(){
    return {
      "text": text,
      "width": width.toString(),
      "align": alignment.index.toString(),
      "textSize": textSize.toString()
    };
  }
}
