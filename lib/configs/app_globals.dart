import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:location/location.dart';
import 'package:salon/configs/app_theme.dart';
import 'package:salon/data/models/category_model.dart';
import 'package:salon/data/models/user_model.dart';

/// Class to store runtime global settings.
class AppGlobals {
  factory AppGlobals() => instance;

  AppGlobals._();

  /// App primary color.
  final Color backgroundColor = const Color(0xfff8f8f8);

  /// App primary color.
  final Color primaryColor = const Color(0xffee2a7b);

  /// Adds dynamic styles to text widgets.
  TextStyle buildTextStyle(double fontSize, bool fontWeight, Color color) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight ? FontWeight.bold : FontWeight.normal,
        color: color);
  }

  /// Singleton instance.
  static final AppGlobals instance = AppGlobals._();

  /// List of available cameras on device.
  List<CameraDescription> cameras;

  /// [GlobalKey] for our bottom bar.
  GlobalKey globalKeyBottomBar;

  /// [GlobalKey] for our [HomeScreen].
  GlobalKey globalKeyHomeScreen;

  /// [GlobalKey] for our [SearchScreen].
  GlobalKey globalKeySearchScreen;

  /// [GlobalKey] for tab bar in [SearchScreen].
  GlobalKey globalKeySearchTabs;

  /// Dark Theme option
  DarkOption darkThemeOption = DarkOption.dynamic;

  /// User's current position.
  LocationData currentPosition;

  /// Business/Location categories.
  List<CategoryModel> categories;

  /// Logged in user data.
  UserModel user;

  /// Currently selected [Locale].
  Locale selectedLocale;

  /// Is user onbaorded or this is their first run?
  bool isUserOnboarded = false;

  /// App is running on emulator (or real device)?
  bool isEmulator;

  /// Is the current locale RTL?
  bool isRTL;

  /// The current brightness mode of the host platform.
  Brightness get getPlatformBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  /// Is the current brightness mode of the host platform dark?
  bool get isPlatformBrightnessDark {
    switch (darkThemeOption) {
      case DarkOption.alwaysOff:
        return false;
        break;
      case DarkOption.alwaysOn:
        return true;
      default:
        return Brightness.dark == getPlatformBrightness;
    }
  }
}
