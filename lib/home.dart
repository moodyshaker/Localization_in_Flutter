import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localization_project/lang_provider.dart';
import 'package:localization_project/localization/demo_localization.dart';
import 'package:provider/provider.dart';

import 'language.dart';

class Home extends StatelessWidget {
  final List<Language> languages = [
    Language(
        flag: 'assets/images/eg.png',
        name: 'Arabic',
        langCode: 'ar',
        countryCode: 'EG'),
    Language(
        flag: 'assets/images/us.png',
        name: 'English',
        langCode: 'en',
        countryCode: 'US'),
  ];

  @override
  Widget build(BuildContext context) {
    final _style = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
    );
    return Consumer<LanguageProvider>(
      builder: (context, data, child) => Scaffold(
        appBar: AppBar(
          title: Text(
              '${DemoLocalization.of(context).getTranslatedValue('home')}'),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.all(
                8.0,
              ),
              child: DropdownButton<Language>(
                underline: Container(),
                icon: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                onChanged: (Language l) {
                  Locale _temp;
                  switch (l.langCode) {
                    case 'en':
                      _temp = Locale(l.langCode, l.countryCode);
                      break;
                    case 'ar':
                      _temp = Locale(l.langCode, l.countryCode);
                      break;
                    default:
                      _temp = Locale('ar', 'EG');
                  }
                  data.setLocale(_temp);
                },
                items: languages
                    .map(
                      (e) => DropdownMenuItem<Language>(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              e.flag,
                              width: 24.0,
                              height: 24.0,
                            ),
                            Text(e.name),
                          ],
                        ),
                        onTap: () {},
                        value: e,
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${DemoLocalization.of(context).getTranslatedValue('personal_information')}',
              style: _style,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '${DemoLocalization.of(context).getTranslatedValue('address')}',
              style: _style,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '${DemoLocalization.of(context).getTranslatedValue('about_us')}',
              style: _style,
            ),
          ],
        )),
      ),
    );
  }
}
