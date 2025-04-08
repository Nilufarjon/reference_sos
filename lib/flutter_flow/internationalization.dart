import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'tr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ruText = '',
    String? trText = '',
  }) =>
      [ruText, trText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // BooksScreen
  {
    'fljhzox5': {
      'ru': '112',
      'tr': '',
    },
    'oqzoogd9': {
      'ru': 'Главная',
      'tr': 'Асосӣ',
    },
  },
  // SubList
  {
    '3ax7z9st': {
      'ru': '112',
      'tr': '',
    },
    'pewhx0ub': {
      'ru': 'Главная',
      'tr': 'Асоси',
    },
  },
  // DetailsScreen
  {
    'dvabtmtr': {
      'ru': 'Выбрать шрифт',
      'tr': '',
    },
    'la1pv22y': {
      'ru': 'Главная',
      'tr': 'Хона',
    },
  },
  // HomePage
  {
    '23e7oz0o': {
      'ru': 'Переключение на тёмную тему',
      'tr': 'Интихоби темаи рузу шаб',
    },
    'a5v6yhhk': {
      'ru': '112',
      'tr': '',
    },
    'pmzxbwen': {
      'ru': 'Home',
      'tr': '',
    },
  },
  // DemoPage
  {
    'qd7m4szf': {
      'ru': 'Home',
      'tr': '',
    },
  },
  // QuizDetailsScreen
  {
    'm9p55m8o': {
      'ru': 'Следующий',
      'tr': '',
    },
    's9c9rpzy': {
      'ru': 'Home',
      'tr': '',
    },
  },
  // BooksScreenCopy
  {
    'dsq9uyul': {
      'ru': '112',
      'tr': '',
    },
    'epjok82s': {
      'ru': 'Главная',
      'tr': 'Асоси',
    },
  },
  // QuizResultPage
  {
    'na0p0v5s': {
      'ru': 'Home',
      'tr': '',
    },
  },
  // textSizerComp
  {
    '6q11t4dt': {
      'ru': 'Размер шрифта',
      'tr': '',
    },
    'qc3clhvb': {
      'ru': 'Ok',
      'tr': '',
    },
  },
  // CallActionComp
  {
    'wh6sjxo8': {
      'ru': 'Позвоните 112',
      'tr': '',
    },
    'l6qcliv5': {
      'ru': 'Отмена',
      'tr': '',
    },
  },
  // Miscellaneous
  {
    'tr1fo8zq': {
      'ru': '',
      'tr': '',
    },
    'tn0nzno4': {
      'ru': '',
      'tr': '',
    },
    'kwa0mp7p': {
      'ru': '',
      'tr': '',
    },
    'bk8tqp7t': {
      'ru': '',
      'tr': '',
    },
    'lm0m9ftc': {
      'ru': '',
      'tr': '',
    },
    'k66dz7fz': {
      'ru': '',
      'tr': '',
    },
    'rxrrsq0x': {
      'ru': '',
      'tr': '',
    },
    'l1p86x1m': {
      'ru': '',
      'tr': '',
    },
    '1lr93awr': {
      'ru': '',
      'tr': '',
    },
    'eqptx9hu': {
      'ru': '',
      'tr': '',
    },
    'mvr9azi6': {
      'ru': '',
      'tr': '',
    },
    '968ge7ys': {
      'ru': '',
      'tr': '',
    },
    '636ulc4s': {
      'ru': '',
      'tr': '',
    },
    'isar02xr': {
      'ru': '',
      'tr': '',
    },
    'zssyn8ue': {
      'ru': '',
      'tr': '',
    },
    't4a0b9fs': {
      'ru': '',
      'tr': '',
    },
    '66ydliq8': {
      'ru': '',
      'tr': '',
    },
    'umtskp82': {
      'ru': '',
      'tr': '',
    },
    't0dpu83n': {
      'ru': '',
      'tr': '',
    },
    'obu4n6rm': {
      'ru': '',
      'tr': '',
    },
    'wwqrs90n': {
      'ru': '',
      'tr': '',
    },
    'c8snln4z': {
      'ru': '',
      'tr': '',
    },
    'x81hxx9g': {
      'ru': '',
      'tr': '',
    },
    'zwrqv3dl': {
      'ru': '',
      'tr': '',
    },
    'tcyb8r86': {
      'ru': '',
      'tr': '',
    },
    'jpgc9buu': {
      'ru': '',
      'tr': '',
    },
    'oozr4mia': {
      'ru': '',
      'tr': '',
    },
    'oxxpnj51': {
      'ru': '',
      'tr': '',
    },
    'p6bo12g8': {
      'ru': '',
      'tr': '',
    },
    'mwtdpfzn': {
      'ru': '',
      'tr': '',
    },
    '0hz651d7': {
      'ru': '',
      'tr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
