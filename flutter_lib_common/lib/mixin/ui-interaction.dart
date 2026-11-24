import 'package:flutter/material.dart';
import 'package:flutter_lib_common/main.dart';

enum MsgType { success, info, warning, error }

mixin UIInteraction on ConsumerState {
  /// showMaterialBanner
  /// msg: 提示内容
  void m_showMaterialBanner(String msg, {MsgType type = MsgType.info}) {
    final color = _getTypeColor(type);
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(msg),
        backgroundColor: color,
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  /// showSnackBar
  void m_showSnackBar(String msg, {MsgType type = MsgType.info}) {
    final color = _getTypeColor(type);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsetsDirectional.only(bottom: 100, start: 20, end: 20),
        content: Text('请输入提问内容'),
        duration: Duration(seconds: 1),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        showCloseIcon: true,
      ),
    );
  }

  Color _getTypeColor(MsgType type) {
    var color = Colors.black45;
    if (type == MsgType.info) {
      color = Colors.black45;
    } else if (type == MsgType.success) {
      color = Colors.green.shade400;
    } else if (type == MsgType.warning) {
      color = Colors.yellowAccent;
    } else if (type == MsgType.error) {
      color = Colors.redAccent.shade200;
    }
    return color;
  }
}
