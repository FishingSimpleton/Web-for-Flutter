import 'package:flutter/material.dart';
import 'package:web_flutter/login/LoginView.dart';
import 'package:web_flutter/main/MainView.dart';
import 'package:web_flutter/register/RegisterView.dart';
import 'package:web_flutter/reset/ResetBody.dart';

import 'package:web_flutter/reset/ResetView.dart';

//配置路由
final routes = {
  '/login': (context, {arguments}) => LoginView(),
  '/main': (context, {arguments}) => MainView(),
  '/register': (context, {arguments}) => RegisterView(),
  '/reset': (context, {arguments}) => ResetView(),
  '/resetBody': (context, {arguments}) => ResetBody(),
};

//固定写法u4
// ignore: top_level_function_literal_block
var myGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments));
    return route;
  } else {
    final Route route =
        MaterialPageRoute(builder: (context) => pageContentBuilder(context));
    return route;
  }
};
