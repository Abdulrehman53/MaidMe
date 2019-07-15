import 'package:flutter/material.dart';
import 'package:maidme_app/controllers/constants.dart';

Widget makeText(String text, double fontSize, FontWeight fontWeight,
    Color color, String fontFamily) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    ),
  );
}

Widget makeTextLeft(String text, double fontSize, FontWeight fontWeight,
    Color color, String fontFamily) {
  return Text(
    text,
    textAlign: TextAlign.left,
    style: TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    ),
  );
}

Widget makeButton(Function onPressed, String text, double fontSize,
    FontWeight fontWeight, String fontFamily, Color color) {
  return Material(
    color: appColor,
    elevation: 15.0,
    borderRadius: BorderRadius.circular(30.0),
    child: MaterialButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 14.0, right: 14.0),
        child: Text(
          text,
          style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontFamily: fontFamily),
        ),
      ),
    ),
  );
}

Widget makeFormField(String hint, Function onSave, Function validator,
    TextInputType textInputType) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Theme(
      data: ThemeData(primaryColor: appColor, hintColor: Colors.grey),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: hint,
        ),
        keyboardType: textInputType,
        onSaved: onSave,
        validator: validator,
      ),
    ),
  );
}

Widget makeFormFieldWithIcon(String hint, Function onSave, Function validator,
    TextInputType textInputType, IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Theme(
      data: ThemeData(primaryColor: appColor, hintColor: Colors.grey),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: hint,
          icon: Icon(
            icon,
            color: appColor,
          ),
        ),
        keyboardType: textInputType,
        onSaved: onSave,
        validator: validator,
      ),
    ),
  );
}

Widget makePasswordFormField(String hint, Function onSave, Function validator,
    TextInputType textInputType, IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Theme(
      data: ThemeData(primaryColor: appColor, hintColor: Colors.grey),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: hint,
            icon: Icon(
              icon,
              color: appColor,
            )),
        obscureText: true,
        keyboardType: textInputType,
        onSaved: onSave,
        validator: validator,
      ),
    ),
  );
}

Widget makeSimplePasswordFormField(String hint, Function onSave,
    Function validator, TextInputType textInputType) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Theme(
      data: ThemeData(primaryColor: appColor, hintColor: Colors.grey),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: hint,
        ),
        obscureText: true,
        keyboardType: textInputType,
        onSaved: onSave,
        validator: validator,
      ),
    ),
  );
}

Widget getAppBr(String title) {
  return AppBar(
    backgroundColor: appColor,
    title: makeText(title, 20.0, FontWeight.bold, Colors.white, font),
  );
}

String errorMsg(String msg) {
  return msg + ' Should not be empty';
}
