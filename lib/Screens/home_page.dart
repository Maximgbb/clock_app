import 'package:clock_app/Models/menu_info.dart';
import 'package:clock_app/data.dart';
import 'package:clock_app/enums.dart';
import 'package:clock_app/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.pageBackgroundColor,
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems.map((e) => buildMenuButton(e)).toList(),
          ),
          VerticalDivider(
            color: CustomColors.dividerColor,
            width: 1.0,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (context, value, child) {
                if (value.menuType == MenuType.clock) {
                  return const ClockPage();
                } else if (value.menuType == MenuType.alarm) {
                  return const AlarmPage();
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (context, value, child) {
        return TextButton(
          onPressed: () {
            final menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenuInfo(currentMenuInfo);
          },
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 0.0,
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              currentMenuInfo.menuType == value.menuType
                  ? CustomColors.menuBackgroundColor
                  : Colors.transparent,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32.0),
                ),
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                currentMenuInfo.imageSource ?? '',
                scale: 1.5,
              ),
              const SizedBox(height: 14.0),
              Text(
                currentMenuInfo.title ?? '',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  color: CustomColors.primaryTextColor,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
