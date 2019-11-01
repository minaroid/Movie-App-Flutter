//import 'package:easy_localization/easy_localization.dart';
//import 'package:flutter/material.dart';
//
//
//
//class LocalizationApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
////    Localize.initialize(context);
//    Locale locale = new Locale("ar");
//    var data = EasyLocalizationProvider.of(context).data;
//
//    return EasyLocalizationProvider(
//        data: data,
//        child: MaterialApp(
//          debugShowCheckedModeBanner: false,
//          localizationsDelegates: [
//            GlobalMaterialLocalizations.delegate,
//            GlobalWidgetsLocalizations.delegate,
//            EasylocaLizationDelegate(locale: locale, path: 'translation'),
//          ],
//          supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
//          locale: locale,
//          title: "Recyclers EG",
//          theme: ThemeData(
////          fontFamily: AppCache.getLocal() == 'ar' ? "Hacen" : "Comfortaa",
//            dividerColor: Colors.white,
//            brightness: Brightness.light,
//            backgroundColor: Colors.green,
////            primaryColor: new Color(0xFFFFFFFF),
////            primaryColorDark: new Color(0xFFFFFFFF),
//          ),
//          initialRoute: '/',
//          routes: {
//            '/': (context) => Splash(),
//            '/home': (context) => Home(),
//          },
//        ));
//  }
//}
