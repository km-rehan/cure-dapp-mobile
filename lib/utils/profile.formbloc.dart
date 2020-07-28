import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:validators/validators.dart';

class ProfileFormBloc extends FormBloc<String, String> {
  // ignore: close_sinks
  final firstname = TextFieldBloc(validators: [FieldBlocValidators.required]);
  // ignore: close_sinks
  final lastname = TextFieldBloc(validators: [FieldBlocValidators.required]);
  // ignore: close_sinks
  final contactNo = TextFieldBloc(
      validators: [FieldBlocValidators.required, _checkContactNo]);
  // ignore: close_sinks
  final emailId = TextFieldBloc(
      validators: [FieldBlocValidators.required, FieldBlocValidators.email]);
  // ignore: close_sinks
  final genderMultiSelect = SelectFieldBloc<String, dynamic>(
      items: ["Select your gender", "Male", "Female", "Others"],
      validators: [_checkValidGenderSelected]);

  // ignore: close_sinks
  final dateOfBirth = InputFieldBloc<DateTime, Object>(
      validators: [FieldBlocValidators.required]);

  final bloodGroup = SelectFieldBloc<String, dynamic>(items: [
    "Select your blood group",
    "A RhD positive",
    "A RhD negative",
    "B RhD positive",
    "B RhD negative",
    "O RhD positive",
    "O RhD negative",
    "AB RhD positive",
    "AB RhD negative",
  ]);

  final timeZone = TextFieldBloc(
    initialValue: getCurrentTimezone(),
  );

  static getCurrentTimezone() {
    return DateTime.now().timeZoneName;
  }

  final address = TextFieldBloc(
      validators: [FieldBlocValidators.required, _checkValidAddress]);

  final city = TextFieldBloc(validators: [
    FieldBlocValidators.required,
  ]);

  final stateBc = TextFieldBloc(validators: [FieldBlocValidators.required]);

  final country = TextFieldBloc(validators: [FieldBlocValidators.required]);

  final profileImage = InputFieldBloc<File, Object>(validators: []);

  final pincode = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final alternativeMobile = TextFieldBloc();
  final alternativeEmail = TextFieldBloc();
  final langauge = SelectFieldBloc<String, dynamic>(items: [
    "Select your language",
    "Afrikaans",
    "Albanian",
    "Arabic",
    "Armenian",
    "Basque",
    "Bengali",
    "Bulgarian",
    "Catalan",
    "Cambodian",
    "Chinese (Mandarin)",
    "Croatian",
    "Czech",
    "Danish",
    "Dutch",
    "English",
    "Estonian",
    "Fiji",
    "Finnish",
    "French",
    "Georgian",
    "German",
    "Greek",
    "Gujarati",
    "Hebrew",
    "Hindi",
    "Hungarian",
    "Icelandic",
    "Indonesian",
    "Irish",
    "Italian",
    "Japanese",
    "Javanese",
    "Korean",
    "Latin",
    "Latvian",
    "Lithuanian",
    "Macedonian",
    "Malay",
    "Malayalam",
    "Maltese",
    "Maori",
    "Marathi",
    "Mongolian",
    "Nepali",
    "Norwegian",
    "Persian",
    "Polish",
    "Portuguese",
    "Punjabi",
    "Quechua",
    "Romanian",
    "Russian",
    "Samoan",
    "Serbian",
    "Slovak",
    "Slovenian",
    "Spanish",
    "Swahili",
    "Swedish",
    "Tamil",
    "Tatar",
    "Telugu",
    "Thai",
    "Tibetan",
    "Tonga",
    "Turkish",
    "Ukrainian",
    "Urdu",
    "Uzbek",
    "Vietnamese",
    "Welsh",
    "Xhosa",
  ], validators: [
    _checkValidLanguageSelected
  ]);

  ProfileFormBloc() {
    addFieldBlocs(fieldBlocs: [
      firstname,
      lastname,
      profileImage,
      contactNo,
      emailId,
      genderMultiSelect,
      dateOfBirth,
      bloodGroup,
      timeZone,
      address,
      city,
      stateBc,
      country,
      pincode,
      alternativeMobile,
      alternativeEmail,
      langauge
    ]);
  }

  static String _checkValidAddress(String address) {
    if (address.length >= 140) {
      return "Address should be more than 140 characters";
    }

    return null;
  }

  static String _checkValidGenderSelected(String selectedGender) {
    if (selectedGender == "Select your gender") {
      return "Not a valid gender selected";
    }

    return null;
  }

  static String _checkValidBloogGroupSelect(String selectedBloodGroup) {
    if (selectedBloodGroup == "Select your blood group") {
      return "Not a valid blood group";
    }
    return null;
  }

  static String _checkValidLanguageSelected(String selectedLanguage) {
    if (selectedLanguage == "Select your language") {
      return "Not a valid language";
    }
    return null;
  }

  static String _checkContactNo(String number) {
    Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regExp = new RegExp(pattern);
    if (!regExp.hasMatch(number) && number.length != 10) {
      return "Please enter a valid phone number";
    }
    return null;
  }

  static String _checkPincode(String pincode) {
    if (!isPostalCode(pincode, "IN") || !isPostalCode(pincode, "GB")) {
      return "Please enter a valid pin code";
    }
    return null;
  }

  @override
  void onSubmitting() {}
}
