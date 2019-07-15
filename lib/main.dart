import 'package:flutter/material.dart';
import 'package:maidme_app/controllers/home_controller/drawer_page.dart';
import 'package:maidme_app/controllers/serviceProvider/login_screen.dart';

import 'controllers/serviceProvider//number_registration.dart';
import 'controllers/serviceProvider//sign_up.dart';
import 'controllers/serviceProvider/confirmation_screen.dart';
import 'controllers/serviceProvider/personal_information_page.dart';
import 'controllers/welcome_controller/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maid Me',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: WelcomeController(),
      initialRoute: '/',
      routes: {
        SignupController.id: (context) => SignupController(),
        NumberRegistration.id: (context) => NumberRegistration(),
        ConfirmationController.id: (context) => ConfirmationController(),
        LoginController.id: (context) => LoginController(),
        DrawerPage.id: (context) => DrawerPage(),
        PersonalInformationController.id: (context) =>
            PersonalInformationController(),
      },
    );
  }
}
