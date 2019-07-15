import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:maidme_app/controllers/constants.dart';
import 'package:maidme_app/controllers/serviceProvider/personal_information_page.dart';
import 'package:maidme_app/widgets/raw_widgets.dart';

class ConfirmationController extends StatefulWidget {
  static final id = 'confirmation';
  @override
  _ConfirmationControllerState createState() => _ConfirmationControllerState();
}

class _ConfirmationControllerState extends State<ConfirmationController> {
  final _formKey = GlobalKey<FormState>();

  Country _selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBr('Verification'),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Hero(
                  tag: 'logo',
                  child: Container(
                      width: 190.0,
                      height: 190.0,
                      child: Image.asset('images/MaidMe.png'))),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: makeVerifyFormField(
                                'Verification Code', (value) {}, (value) {
                              if (value.toString().length == 0) {
                                return 'Verification code field should not be empty';
                              }
                            }, TextInputType.number),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: makeButton(() {
                        final formState = _formKey.currentState;
                        if (formState.validate()) {
                          formState.save();
                          Navigator.pushNamed(
                              context, PersonalInformationController.id);
                        }
                      }, 'Verify', 20.0, FontWeight.bold, font, Colors.white),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

Widget makeVerifyFormField(String hint, Function onSave, Function validator,
    TextInputType textInputType) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Theme(
      data: ThemeData(primaryColor: appColor, hintColor: Colors.grey),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: hint,
        ),
        keyboardType: textInputType,
        onSaved: onSave,
        obscureText: true,
        validator: validator,
      ),
    ),
  );
}
