import 'package:fl_lib/fl_lib.dart';
import 'package:flutter/services.dart';
import 'package:server_box/data/res/misc.dart';
import 'package:server_box/data/res/store.dart';

abstract final class MethodChans {
  static const _channel = MethodChannel('${Miscs.pkgName}/main_chan');

  static void moveToBg() {
    _channel.invokeMethod('sendToBackground');
  }

  /// Issue #662
  static void startService() {
    // if (Stores.setting.fgService.fetch() != true) return;
    // _channel.invokeMethod('startService');
  }

  /// Issue #662
  static void stopService() {
    // if (Stores.setting.fgService.fetch() != true) return;
    // _channel.invokeMethod('stopService');
  }

  static void updateHomeWidget() async {
    if (!isIOS || !isAndroid) return;
    if (!Stores.setting.autoUpdateHomeWidget.fetch()) return;
    await _channel.invokeMethod('updateHomeWidget');
  }
}
