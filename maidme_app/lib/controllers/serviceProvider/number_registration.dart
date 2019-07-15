import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:maidme_app/controllers/constants.dart';
import 'package:maidme_app/controllers/serviceProvider/confirmation_screen.dart';
import 'package:maidme_app/widgets/raw_widgets.dart';

class NumberRegistration extends StatefulWidget {
  static final id = 'registration';
  @override
  _NumberRegistrationState createState() => _NumberRegistrationState();
}

class _NumberRegistrationState extends State<NumberRegistration> {
  final _formKey = GlobalKey<FormState>();

  Country _selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBr('Registration'),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: CountryPicker(
                              dense: false,
                              showFlag: true, //displays flag, true by default
                              showDialingCode:
                                  true, //displays dialing code, false by default
                              showName:
                                  false, //displays country name, true by default
                              onChanged: (Country country) {
                                setState(() {
                                  _selected = country;
                                });
                              },
                              selectedCountry: _selected,
                            ),
                          ),
                          Expanded(
                            child: makeFormField('Number', (value) {}, (value) {
                              if (value.toString().length == 0) {
                                return 'Phone number field should not be empty';
                              }
                            }, TextInputType.phone),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: makeButton(() {
                        final formState = _formKey.currentState;
                        formState.save();
                        if (formState.validate()) {
                          Navigator.pushNamed(
                              context, ConfirmationController.id);
                        }
                      }, 'Register', 20.0, FontWeight.bold, font, Colors.white),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
