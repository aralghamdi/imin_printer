package com.sary.imin_printer;

import static com.sary.imin_printer.IminPrinterPlugin.call;
import static com.sary.imin_printer.IminPrinterPlugin.result;

import android.content.Context;
import android.graphics.Typeface;
import android.os.Build;
import android.util.Log;

import com.imin.library.IminSDKManager;
import com.imin.printerlib.IminPrintUtils;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;

public class IminPrinter {
    private IminPrintUtils iminPrintUtils;
    public static final String initPrinter = "initPrinter";
    public static final String getPrinterStatus = "getPrinterStatus";
    public static final String printAndLineFeed = "printAndLineFeed";
    public static final String printAndFeedPaper = "printAndFeedPaper";
    public static final String partialCut = "partialCut";
    public static final String setAlignment = "setAlignment";
    public static final String setTextSize = "setTextSize";
    public static final String setTextTypeface = "setTextTypeface";
    public static final String setTextStyle = "setTextStyle";
    public static final String setTextLineSpacing = "setTextLineSpacing";
    public static final String setTextWidth = "setTextWidth";
    public static final String printText = "printText";
    public static final String printColumnsText = "printColumnsText";
    public static final String setBarCodeHeight = "setBarCodeHeight";
    public static final String setBarCodeContentPrintPos = "setBarCodeContentPrintPos";
    public static final String printBarCode = "printBarCode";
    public static final String setLeftMargin = "setLeftMargin";
    public static final String printQrCode = "printQrCode";
    public static final String setQrSize = "setQrSize";
    public static final String setQrCorrectionLevel = "setQrCorrectionLevel";
    public static final String setPageFormat = "setPageFormat";
    public static final String openCashBox = "openCashBox";
    public static final List<String> channelMethods = Arrays.asList(initPrinter,getPrinterStatus,printAndLineFeed,printAndFeedPaper,partialCut,setAlignment,setTextSize,setTextTypeface,setTextStyle,setTextLineSpacing,setTextWidth,printText,printColumnsText,setBarCodeHeight,setBarCodeContentPrintPos,printBarCode,setLeftMargin,printQrCode,setPageFormat,setQrSize,setQrCorrectionLevel,openCashBox);


    public void runSDkMethods(String method){
        switch (method){
            case getPrinterStatus:
                getPrinterStatus();
                break;
            case printAndLineFeed:
                printAndLineFeed();
                break;
            case printAndFeedPaper:
                printAndFeedPaper();
            case partialCut:
                partialCut();
                break;
            case setAlignment:
                setAlignment();
                break;
            case setTextSize:
                setTextSize();
                break;
            case setTextTypeface:
                setTextTypeface();
                break;
            case setTextStyle:
                setTextStyle();
                break;
            case setTextLineSpacing:
                setTextLineSpacing();
                break;
            case setTextWidth:
                setTextWidth();
                break;
            case printText:
                printText();
                break;
            case printColumnsText:
                printColumnsText();
                break;
            case printQrCode:
                printQr();
                break;
            case setQrSize:
                setQrSize();
                break;
            case setQrCorrectionLevel:
                setQrCorrectionLevel();
                break;
            case openCashBox:
                openCashBox();
                break;
            default:
                result.notImplemented();
                break;

        }
    }

    public void init(Context context) {
        iminPrintUtils = IminPrintUtils.getInstance(context);
        iminPrintUtils.resetDevice();
        iminPrintUtils.initPrinter(IminPrintUtils.PrintConnectType.USB);
        result.success(true);
    }

    private void getPrinterStatus() {
        int status = iminPrintUtils.getPrinterStatus(IminPrintUtils.PrintConnectType.USB);
        result.success(status);
    }


    private void printAndLineFeed() {
        iminPrintUtils.printAndLineFeed();
        result.success(true);
    }


    private void printAndFeedPaper() {
        int lines = Objects.requireNonNull(call.argument("lines"));
        iminPrintUtils.printAndFeedPaper(lines);
        result.success(true);
    }


    private void partialCut() {
        iminPrintUtils.partialCut();
        result.success(true);
    }


    private void setAlignment() {
        int alignment = Objects.requireNonNull(call.argument("alignment"));
        iminPrintUtils.setAlignment(alignment);
        result.success(true);
    }


    private void setTextSize() {
        int textSize = Objects.requireNonNull(call.argument("textSize"));
        iminPrintUtils.setTextSize(textSize);
        result.success(true);
    }


    private void setTextTypeface() {
        int typeface = Objects.requireNonNull(call.argument("typeface"));
        Typeface selectedTypeFace;
        switch (typeface){
            case 1:
                selectedTypeFace = Typeface.MONOSPACE;
                break;
            case 2:
                selectedTypeFace = Typeface.DEFAULT_BOLD;
                break;
            case 3:
                selectedTypeFace = Typeface.SANS_SERIF;
                break;
            case 4:
                selectedTypeFace = Typeface.SERIF;
                break;
            default:
                selectedTypeFace = Typeface.DEFAULT;
                break;
        }
        iminPrintUtils.setTextTypeface(selectedTypeFace);
        result.success(true);
    }


    private void setTextStyle() {
        int textStyle = Objects.requireNonNull(call.argument("textStyle"));
        iminPrintUtils.setTextStyle(textStyle);
        result.success(true);
    }


    private void setTextLineSpacing() {
        float lineSpacing = Objects.requireNonNull(call.argument("lineSpacing"));
        iminPrintUtils.setTextLineSpacing(lineSpacing);
        result.success(true);
    }


    private void setTextWidth() {
        int textWidth = Objects.requireNonNull(call.argument("textWidth"));
        iminPrintUtils.setTextWidth(textWidth);
        result.success(true);
    }


    private void printText() {
        String text = Objects.requireNonNull(call.argument("text"));
        iminPrintUtils.printText(text);
        result.success(true);
    }


    private void printColumnsText() {
        String colsStr = call.argument("columns");
        try {
            JSONArray cols = new JSONArray(colsStr);
            String[] colsText = new String[cols.length()];
            int[] colsWidth = new int[cols.length()];
            int[] colsAlign = new int[cols.length()];
            int[] colsTextSize = new int[cols.length()];
            for (int i = 0; i < cols.length(); i++) {
                JSONObject col = cols.getJSONObject(i);
                String textColumn = col.getString("text");
                int widthColumn = col.getInt("width");
                int alignColumn = col.getInt("align");
                int textSize = col.getInt("textSize");
                colsText[i] = textColumn;
                colsWidth[i] = widthColumn;
                colsAlign[i] = alignColumn;
                colsTextSize[i] = textSize;
            }

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                iminPrintUtils.printColumnsText(colsText, colsWidth, colsAlign, colsTextSize);
            }
        } catch (Exception err) {
            Log.d("imin_printer", err.getMessage());
        }
        result.success(true);
    }

    private void printQr() {
        String data = Objects.requireNonNull(call.argument("data"));
        int alignment = Objects.requireNonNull(call.argument("alignment"));
        iminPrintUtils.printQrCode(data, alignment);
        result.success(true);
    }

    private void setQrSize() {
        int size = Objects.requireNonNull(call.argument("size"));
        iminPrintUtils.setQrCodeSize(size);
        result.success(true);
    }

    private void setQrCorrectionLevel() {
        int level = Objects.requireNonNull(call.argument("level"));
        iminPrintUtils.setQrCodeErrorCorrectionLev(level);
        result.success(true);
    }

    private void openCashBox() {
        IminSDKManager.opencashBox();
        result.success(true);
    }
}
