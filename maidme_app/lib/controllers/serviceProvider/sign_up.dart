import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maidme_app/controllers/constants.dart';
import 'package:maidme_app/controllers/home_controller/drawer_page.dart';
import 'package:maidme_app/widgets/raw_widgets.dart';

class SignupController extends StatefulWidget {
  static final id = 'sign_up';

  @override
  _SignupControllerState createState() => _SignupControllerState();
}

class _SignupControllerState extends State<SignupController> {
  bool isCleaning = true;
  bool isIrony = true;
  bool isTerms = false;
  double _lowerValue = 18800.0;
  double _upperValue = 100000.0;
  final _fomKey = GlobalKey<FormState>();
  File _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _cropImage(image);
  }

  Future<Null> _cropImage(File imageFile) async {
    print(imageFile.path);
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      ratioX: 1.0,
      ratioY: 1.0,
      maxWidth: 512,
      maxHeight: 512,
    );
    setState(() {
      _image = croppedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: makeText('Sign Up', 20.0, FontWeight.bold, Colors.white, font),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: makeText(
                  'Upload HSE/HMS ', 20.0, FontWeight.bold, Colors.black, font),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  getImage();
                },
                child: Container(
                  height: 200.0,
                  alignment: Alignment.center,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: _image == null
                          ? AssetImage(
                              'images/signup_page_9_profile.png',
                            )
                          : FileImage(
                              _image,
                            ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: makeText(
                  'Set Price(kr)', 18.0, FontWeight.normal, Colors.black, font),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: rangeSlider((double newLowerValue, double newUpperValue) {
                setState(() {
                  _lowerValue = newLowerValue;
                  _upperValue = newUpperValue;
                });
              }, _lowerValue, _upperValue),
            ),
            Form(
                key: _fomKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    makeFormField(organizationNo, (value) {}, (value) {
                      if (value == null) {
                        return errorMsg(organizationNo);
                      }
                    }, TextInputType.text),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: makeTextLeft('Bank Account No :', 16.0,
                          FontWeight.normal, Colors.black, font),
                    ),
                    makeFormField('XXXXX XX XXXXX', (value) {}, (value) {
                      if (value == null) {
                        return errorMsg(bankAccount);
                      }
                    }, TextInputType.text),

                    /* InkWell(
                    onTap: () {
                      launchURL();
                    },
                    child: Text('Link to apply')),*/
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: makeTextLeft(
                  'Services : ', 18.0, FontWeight.normal, Colors.black, font),
            ),
            ListTile(
              title: Text(service1),
              leading: Checkbox(
                  value: isCleaning,
                  onChanged: (value) {
                    setState(() {
                      isCleaning = isCleaning ? false : true;
                    });
                  }),
            ),
            ListTile(
              title: Text(service2),
              leading: Checkbox(
                  value: isIrony,
                  onChanged: (value) {
                    setState(() {
                      isIrony = isIrony ? false : true;
                    });
                  }),
            ),
            Divider(),
            ListTile(
              title: Text('I agree to terms and conditions'),
              leading: Checkbox(
                  value: isTerms,
                  onChanged: (value) {
                    setState(() {
                      isTerms = isTerms ? false : true;
                    });
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 80.0, right: 80.0, top: 8.0, bottom: 10.0),
              child: makeButton(() {
                final formState = _fomKey.currentState;
                if (formState.validate()) {
                  formState.save();
                  Navigator.pushNamed(context, DrawerPage.id);
                }
              }, 'Signup', 20.0, FontWeight.bold, font, Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

/*launchURL() async {
  const url = 'https://www.hmskort.no/renholdskort/Login.aspx';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}*/

Widget rangeSlider(Function onChanged, double _lowerValue, double _upperValue) {
  return RangeSlider(
    min: 18800.0,
    max: 100000.0,
    lowerValue: _lowerValue,
    upperValue: _upperValue,
    divisions: 500,
    showValueIndicator: true,
    valueIndicatorMaxDecimals: 1,
    onChanged: onChanged,
    onChangeStart: (double startLowerValue, double startUpperValue) {
      //print('Started with values: $startLowerValue and $startUpperValue');
    },
    onChangeEnd: (double newLowerValue, double newUpperValue) {
      //  print('Ended with values: $newLowerValue and $newUpperValue');
    },
  );
}
