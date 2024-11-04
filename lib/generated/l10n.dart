// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Search near you`
  String get search_nearby {
    return Intl.message(
      'Search near you',
      name: 'search_nearby',
      desc: '',
      args: [],
    );
  }

  /// `Find your favorite stores \nat your location or neighborhood`
  String get find_favorite_stores {
    return Intl.message(
      'Find your favorite stores \nat your location or neighborhood',
      name: 'find_favorite_stores',
      desc: '',
      args: [],
    );
  }

  /// `Fresh offers and quality`
  String get fresh_offers {
    return Intl.message(
      'Fresh offers and quality',
      name: 'fresh_offers',
      desc: '',
      args: [],
    );
  }

  /// `All items have real freshness and are tailored to your needs`
  String get all_items_have_real_freshness {
    return Intl.message(
      'All items have real freshness and are tailored to your needs',
      name: 'all_items_have_real_freshness',
      desc: '',
      args: [],
    );
  }

  /// `Fast home delivery`
  String get fast_home_delivery {
    return Intl.message(
      'Fast home delivery',
      name: 'fast_home_delivery',
      desc: '',
      args: [],
    );
  }

  /// `All items have real freshness and are customized to your needs`
  String get all_items_have_real_freshness_customized {
    return Intl.message(
      'All items have real freshness and are customized to your needs',
      name: 'all_items_have_real_freshness_customized',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get Skip {
    return Intl.message(
      'Skip',
      name: 'Skip',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
