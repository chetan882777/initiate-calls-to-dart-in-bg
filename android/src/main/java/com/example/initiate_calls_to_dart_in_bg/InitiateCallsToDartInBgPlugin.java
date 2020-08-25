package com.example.initiate_calls_to_dart_in_bg;

import android.content.Context;
import android.content.Intent;

import androidx.annotation.NonNull;

import java.util.ArrayList;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

public class InitiateCallsToDartInBgPlugin implements FlutterPlugin, MethodCallHandler {

    public static final String CALLBACK_HANDLE_KEY = "callback_handle_key";
    public static final String CALLBACK_DISPATCHER_HANDLE_KEY = "callback_dispatcher_handle_key";

    private MethodChannel channel;
    private Context mContext;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "main_channel");
        channel.setMethodCallHandler(this);
        mContext = flutterPluginBinding.getApplicationContext();
    }

    private long mCallbackDispatcherHandle;

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

        if (call.method.equals("initializeService")) {

            ArrayList args = call.arguments();
            long callBackHandle = (long) args.get(0);
            mCallbackDispatcherHandle = callBackHandle;

            result.success(null);
            return;
        } else if (call.method.equals("run")) {

            ArrayList args = call.arguments();
            long callbackHandle = (long) args.get(0);

            Intent i = new Intent(mContext, MyService.class);
            i.putExtra(CALLBACK_HANDLE_KEY, callbackHandle);
            i.putExtra(CALLBACK_DISPATCHER_HANDLE_KEY, mCallbackDispatcherHandle);
            mContext.startService(i);

            result.success(null);
            return;
        }
        result.notImplemented();
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}
