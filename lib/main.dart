/**
 * 《Flutter从入门到进阶-实战携程网App》
 * 课程地址：
 * https://coding.imooc.com/class/321.html
 * 课程代码、文档：
 * https://git.imooc.com/coding-321/
 * 课程辅导答疑区：
 * http://coding.imooc.com/learn/qa/321.html
 */

import 'package:flutter/material.dart';
import 'package:flutter_trip/navigator/tab_navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: TabNavigator(),
    );
  }
}