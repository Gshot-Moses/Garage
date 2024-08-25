import 'en_us.dart';
import 'fr_fr.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en": enUS,
    "fr": frFR,
  };
}