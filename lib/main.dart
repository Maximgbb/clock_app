import 'package:clock_app/Models/menu_info.dart';
import 'package:clock_app/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
        create: (context) => MenuInfo(menuType: MenuType.clock, title: 'Clock'),
        child: const HomePage(),
      ),
    );
  }
}
