library flutter_lib_common;

import 'package:flutter/widgets.dart';
import 'package:flutter_lib_common/widget/custom-widgets.dart';
import 'package:flutter_lib_common/widget/image-cut-view.dart';
import 'package:flutter_lib_common/widget/page-not-found.dart';

export 'package:flutter_riverpod/flutter_riverpod.dart';

export 'package:dio/dio.dart';

export 'base/base-widget-riverpod.dart';
export 'base/base-widget.dart';
export 'http/http-service.dart';
export 'i18n/tl-locale-delegate.dart';
export 'i18n/tl-localizations.dart';
export 'start/main-2026.dart';
export 'start/main-riverpod.dart';
export 'start/main.dart';
export 'themes/main.dart';
export 'themes/main-riverpod.dart';

final Map<String, WidgetBuilder> commonRoutes = {
  'NotFoundPage': (BuildContext context) => NotFoundPage(),
  'ImageCutView': (BuildContext context, { arguments }) => ImageCutView(arguments: arguments),
  'CustomWidgets': (BuildContext context) => CustomWidgets()
};

