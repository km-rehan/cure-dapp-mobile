import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:validators/validators.dart';

class TagyaFormBlock extends FormBloc<String, String> {
  // ignore: close_sinks
  final solution = TextFieldBloc(validators: [FieldBlocValidators.required]);

  // ignore: close_sinks
  final placeOfBirth =
      TextFieldBloc(validators: [FieldBlocValidators.required]);

  // ignore: close_sinks
  final firstname = TextFieldBloc(validators: [FieldBlocValidators.required]);

  // ignore: close_sinks
  final lastname = TextFieldBloc(validators: [FieldBlocValidators.required]);

  // ignore: close_sinks
  final dateOfBirth = InputFieldBloc<DateTime, Object>(
      validators: [FieldBlocValidators.required]);

  // ignore: close_sinks
  final nationality = TextFieldBloc(validators: [FieldBlocValidators.required]);

  // ignore: close_sinks
  final maritalStatus = SelectFieldBloc<String, dynamic>(
      items: ["Select your marital status", "Married", "Unmarried", "Others"],
      validators: []);

  // ignore: close_sinks
  final address = TextFieldBloc(validators: [FieldBlocValidators.required]);

  // ignore: close_sinks
  final idType = TextFieldBloc(validators: [FieldBlocValidators.required]);

  // ignore: close_sinks
  final idNumber = TextFieldBloc(validators: [FieldBlocValidators.required]);

  // ignore: close_sinks
  final contactNo = TextFieldBloc(validators: [FieldBlocValidators.required]);

  // ignore: close_sinks
  final userName = TextFieldBloc(validators: [FieldBlocValidators.required]);

  // ignore: close_sinks
  final idImage =
      InputFieldBloc<File, Object>(validators: [FieldBlocValidators.required]);

  // ignore: close_sinks
  final agreement = BooleanFieldBloc(initialValue: false);

  TagyaFormBlock() {
    addFieldBlocs(fieldBlocs: [
      solution,
      placeOfBirth,
      firstname,
      lastname,
      dateOfBirth,
      nationality,
      maritalStatus,
      address,
      idType,
      idNumber,
      contactNo,
      userName,
      idImage,
      agreement
    ]);
  }

  @override
  void onSubmitting() {}
}
