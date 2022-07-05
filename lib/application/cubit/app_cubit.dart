import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_state.dart';

const String VALUE_KEY = 'locale_key';

@lazySingleton
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  changeLocale(bool value) {
    debugPrint(value.toString());
    emit(state.copyWith(locale: value));
  }

  setLocaleToCache(bool value) async {
    final _pref = await SharedPreferences.getInstance();
    _pref.setBool(VALUE_KEY, value);
  }

  Future<void> getLocaleFromCache() async {
    final _pref = await SharedPreferences.getInstance();
    final locale = _pref.getBool(VALUE_KEY) ?? false;
    emit(state.copyWith(locale: locale));
  }
}
