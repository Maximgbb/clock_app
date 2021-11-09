import 'package:clock_app/Models/alarm_info.dart';
import 'package:clock_app/Models/menu_info.dart';
import 'package:clock_app/enums.dart';
import 'package:clock_app/theme_data.dart';

List<MenuInfo> menuItems = [
  MenuInfo(
      menuType: MenuType.clock,
      title: 'Clock',
      imageSource: 'Assets/clock_icon.png'),
  MenuInfo(
      menuType: MenuType.alarm,
      title: 'Alarm',
      imageSource: 'Assets/alarm_icon.png'),
  MenuInfo(
      menuType: MenuType.timer,
      title: 'Timer',
      imageSource: 'Assets/timer_icon.png'),
  MenuInfo(
      menuType: MenuType.stopwatch,
      title: 'Stopwatch',
      imageSource: 'Assets/stopwatch_icon.png'),
];

List<AlarmInfo> alarms = [
  AlarmInfo(
    alarmDateTime: DateTime.now().add(const Duration(hours: 1)),
    description: 'Office',
    gradientColors: GradientColors.sunset,
  ),
  AlarmInfo(
    alarmDateTime: DateTime.now().add(const Duration(hours: 3)),
    description: 'Gym',
    gradientColors: GradientColors.sea,
  ),
  AlarmInfo(
    alarmDateTime: DateTime.now().add(const Duration(hours: 2)),
    description: 'Meeting',
    gradientColors: GradientColors.mango,
  )
];
