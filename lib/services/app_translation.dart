import 'package:ikinokat/translations/en.dart';
import 'package:ikinokat/translations/ru.dart';
import 'package:ikinokat/translations/tm.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translationKeys = {
    'en': en,
    'ru': ru,
    'tm': tm,
  };
}
