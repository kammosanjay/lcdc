import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LanguageController extends GetxController {
  // Default language
  var selectedLanguage = 'en'.obs;

  // Map of supported languages
  final Map<String, Locale> supportedLanguages = {
    'English': const Locale('en', 'US'),
    'Hindi': const Locale('hi', 'IN'),
    'Spanish': const Locale('es', 'ES'),
  };

  // Change language method
  void changeLanguage(String language) {
    selectedLanguage.value = language;
    Get.updateLocale(supportedLanguages[language]!);
  }
}