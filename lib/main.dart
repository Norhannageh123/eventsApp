import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/UI/authentication/forget_password/forget_password_screen.dart';
import 'package:evently_app/UI/authentication/login/login_screen.dart';
import 'package:evently_app/UI/authentication/register/lregister_screen.dart';
import 'package:evently_app/UI/home/home_screen.dart';
import 'package:evently_app/UI/tabs/add_event/add_event.dart';
import 'package:evently_app/firebase_options.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/providers/eventList_proider.dart';
import 'package:evently_app/utls/app_routes.dart';
import 'package:evently_app/utls/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
   await FirebaseFirestore.instance.disableNetwork();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
        ChangeNotifierProvider(create: (context) => AppThemeProvider()),
        ChangeNotifierProvider(create:(context)=> EventListProvider()),
      ],
      child: const EventlyApp(),
    ),
  );
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouting.routeLogin,
      routes: {
        AppRouting.routeHome: (context) => const HomeScreen(),
        AppRouting.routeLogin:(context)=> const LoginScreen(),
        AppRouting.routeRegister:(context)=> const RegisterScreen(),
        AppRouting.routeForgetPassword:(context)=> const ForgetPasswordScreen(),
        AppRouting.routeAddEvent:(context)=> const AddEvent(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.appLanguage),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
    );
  }
}
