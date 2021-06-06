import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/app_colors.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.SCAFFOLD_LIGHT_COLOR,
    primaryColor: AppColors.PRIMARY_COLOR,
    accentColor: AppColors.ACCENT_COLOR,
    hoverColor: AppColors.LIGHT_TEXT_COLOR,
    highlightColor: AppColors.LIGHT_TEXT_COLOR,
    brightness: Brightness.light,
    splashColor: AppColors.TERTIARY_COLOR,
  );

  static final _darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.SCAFFOLD_DARK_COLOR,
    primaryColor: AppColors.PRIMARY_COLOR,
    accentColor: AppColors.ACCENT_COLOR,
    brightness: Brightness.dark,
    splashColor: AppColors.TERTIARY_COLOR,
    hoverColor: AppColors.DARK_TEXT_COLOR,
    highlightColor: AppColors.DARK_TEXT_COLOR,
  );
  bool lightTheme = true;

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
    lightTheme = !lightTheme;
  }
}
