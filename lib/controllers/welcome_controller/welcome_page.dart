import 'package:flutter/material.dart';
import 'package:maidme_app/controllers/constants.dart';
import 'package:maidme_app/controllers/serviceProvider//number_registration.dart';
import 'package:maidme_app/controllers/serviceProvider/login_screen.dart';
import 'package:maidme_app/widgets/raw_widgets.dart';

class WelcomeController extends StatefulWidget {
  @override
  _WelcomeControllerState createState() => _WelcomeControllerState();
}

class _WelcomeControllerState extends State<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 150.0,
              child: Column(
                children: <Widget>[
                  Hero(tag: 'logo', child: Image.asset('images/MaidMe.png')),
                  makeText('Connect on-demand maids to your home', 16.0,
                      FontWeight.normal, appColor, font)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                makeButton(() {}, 'Get a maid', 18.0, FontWeight.bold, font,
                    Colors.white),
                makeButton(() {
                  Navigator.pushNamed(context, NumberRegistration.id);
                }, 'Be a maid', 18.0, FontWeight.bold, font, Colors.white),
              ],
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, LoginController.id);
                },
                child: makeText(
                    'log in instead', 18.0, FontWeight.normal, appColor, font))
          ],
        ),
      ),
    );
  }
}
