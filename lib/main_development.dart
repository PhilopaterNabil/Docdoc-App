import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/di/dependency_injection.dart';
import 'package:flutter_advanced/doc_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(appRouter: AppRouter()));
}
