package com.sary.imin_printer;


import static com.sary.imin_printer.IminPrinter.channelMethods;
import static com.sary.imin_printer.IminPrinter.initPrinter;

import android.content.Context;

import androidx.annotation.NonNull;


import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** IminPrinterPlugin */
public class IminPrinterPlugin implements FlutterPlugin, MethodCallHandler{
  private MethodChannel channel;
  private Context context;
  private  IminPrinter iminPrinter;
  public static MethodCall call;
  public static Result result;


  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "imin_printer");
    context = flutterPluginBinding.getApplicationContext();
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall methodCall, @NonNull Result res) {
    call = methodCall;
    result = res;

    if(call.method.equals(initPrinter)){
      iminPrinter = new IminPrinter();
      iminPrinter.init(context);
    } else if(channelMethods.contains(call.method)){
      iminPrinter.runSDkMethods(call.method);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}

