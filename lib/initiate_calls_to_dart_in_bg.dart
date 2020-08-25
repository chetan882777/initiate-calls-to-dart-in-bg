import 'dart:async';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:initiate_calls_to_dart_in_bg/callbackDispatcher.dart';

class InitiateCalls {

  static const MethodChannel _channel = const MethodChannel('main_channel');

  static Future<void> initialize() async {
    final CallbackHandle callback =
    PluginUtilities.getCallbackHandle(callbackDispatcher);
    await _channel.invokeMethod('initialize',
        <dynamic>[callback.toRawHandle()]);
  }

  static void test(void Function(String s) callback) async   {

    final List<dynamic> args = <dynamic>[
      PluginUtilities.getCallbackHandle(callback).toRawHandle()
    ];
    await _channel.invokeMethod('run', args);
  }
}