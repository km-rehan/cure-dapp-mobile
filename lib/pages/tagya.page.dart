import 'package:curedapp/utils/image.field.bloc.builder.dart';
import 'package:curedapp/utils/tagya.formbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:image_picker/image_picker.dart';

class TagyaPage extends StatelessWidget {
  const TagyaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TagyaFormBlock(),
      child: Builder(
        builder: (BuildContext context) {
          // ignore: close_sinks
          final tagyaFormFlock = context.bloc<TagyaFormBlock>();

          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: new Text('Apply as Tagya'),
                actions: <Widget>[
                  new Padding(
                    padding: EdgeInsets.all(12.0),
                    child: new Image.asset("assets/images/logo.png"),
                  )
                ],
              ),
              body: new Container(
                padding: EdgeInsets.all(2.0),
                child: new Column(
                  children: [
                    Expanded(
                      child: FormBlocListener<TagyaFormBlock, String, String>(
                        onSubmitting: (context, state) {},
                        onSuccess: (context, state) {},
                        onFailure: (context, state) {},
                        child: SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          child: Column(
                            children: <Widget>[
                              TextFieldBlocBuilder(
                                  padding: EdgeInsets.all(14.0),
                                  textFieldBloc: tagyaFormFlock.solution,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  enableInteractiveSelection: true,
                                  animateWhenCanShow: true,
                                  decoration: InputDecoration(
                                      labelText: "Solution",
                                      labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: Colors.blue)))),
                              TextFieldBlocBuilder(
                                  padding: EdgeInsets.all(14.0),
                                  textFieldBloc: tagyaFormFlock.placeOfBirth,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  enableInteractiveSelection: true,
                                  animateWhenCanShow: true,
                                  decoration: InputDecoration(
                                      labelText: "Place of birth",
                                      labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: Colors.blue)))),
                              TextFieldBlocBuilder(
                                  padding: EdgeInsets.all(14.0),
                                  textFieldBloc: tagyaFormFlock.firstname,
                                  keyboardType: TextInputType.phone,
                                  obscureText: true,
                                  enableInteractiveSelection: true,
                                  animateWhenCanShow: true,
                                  decoration: InputDecoration(
                                      labelText: "First name",
                                      labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: Colors.blue)))),
                              TextFieldBlocBuilder(
                                  padding: EdgeInsets.all(14.0),
                                  textFieldBloc: tagyaFormFlock.lastname,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  enableInteractiveSelection: true,
                                  animateWhenCanShow: true,
                                  decoration: InputDecoration(
                                      labelText: "Last name",
                                      labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: Colors.blue)))),
                              DateTimeFieldBlocBuilder(
                                  padding: EdgeInsets.all(14.0),
                                  dateTimeFieldBloc: tagyaFormFlock.dateOfBirth,
                                  format: DateFormat("dd-mm-yyyy"),
                                  initialDate: DateTime(1990),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                  animateWhenCanShow: true,
                                  decoration: InputDecoration(
                                      labelText: "Date of birth",
                                      helperText: "Select date of birth",
                                      prefixIcon: Icon(Icons.calendar_today),
                                      labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: Colors.blue)))),
                              TextFieldBlocBuilder(
                                  padding: EdgeInsets.all(14.0),
                                  textFieldBloc: tagyaFormFlock.nationality,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  enableInteractiveSelection: true,
                                  animateWhenCanShow: true,
                                  decoration: InputDecoration(
                                      labelText: "Nationality",
                                      labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: Colors.blue)))),
                              DropdownFieldBlocBuilder<String>(
                                  padding: EdgeInsets.all(14.0),
                                  selectFieldBloc: tagyaFormFlock.maritalStatus,
                                  showEmptyItem: false,
                                  textAlign: TextAlign.center,
                                  itemBuilder:
                                      (BuildContext context, String value) =>
                                          value,
                                  animateWhenCanShow: true,
                                  decoration: InputDecoration(
                                      labelText: "Marital status",
                                      labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: Colors.blue)))),
                              TextFieldBlocBuilder(
                                  padding: EdgeInsets.all(14.0),
                                  textFieldBloc: tagyaFormFlock.address,
                                  keyboardType: TextInputType.text,
                                  maxLines: 4,
                                  obscureText: true,
                                  enableInteractiveSelection: true,
                                  animateWhenCanShow: true,
                                  decoration: InputDecoration(
                                      labelText: "Address",
                                      labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: Colors.blue)))),
                              TextFieldBlocBuilder(
                                  padding: EdgeInsets.all(14.0),
                                  textFieldBloc: tagyaFormFlock.idType,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  enableInteractiveSelection: true,
                                  animateWhenCanShow: true,
                                  decoration: InputDecoration(
                                      labelText: "Id type",
                                      labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: Colors.blue)))),
                              TextFieldBlocBuilder(
                                  padding: EdgeInsets.all(14.0),
                                  textFieldBloc: tagyaFormFlock.idNumber,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  enableInteractiveSelection: true,
                                  animateWhenCanShow: true,
                                  decoration: InputDecoration(
                                      labelText: "Id number",
                                      labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: Colors.blue)))),
                              TextFieldBlocBuilder(
                                  padding: EdgeInsets.all(14.0),
                                  textFieldBloc: tagyaFormFlock.contactNo,
                                  keyboardType: TextInputType.phone,
                                  obscureText: true,
                                  enableInteractiveSelection: true,
                                  animateWhenCanShow: true,
                                  decoration: InputDecoration(
                                      labelText: "Contact number",
                                      labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: Colors.blue)))),
                              TextFieldBlocBuilder(
                                  padding: EdgeInsets.all(14.0),
                                  textFieldBloc: tagyaFormFlock.userName,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  enableInteractiveSelection: true,
                                  animateWhenCanShow: true,
                                  decoration: InputDecoration(
                                      labelText: "User name",
                                      labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: Colors.blue)))),
                              ImageFieldBlocBuilder(
                                  placeHolder: "Upload id card image",
                                  source: ImageSource.gallery,
                                  fileFieldBloc: tagyaFormFlock.idImage,
                                  formBloc: tagyaFormFlock),
                              CheckboxFieldBlocBuilder(
                                booleanFieldBloc: tagyaFormFlock.agreement,
                                body: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'I hereby confirm that all the information provided by me is accurate and I agree to the terms and coditions',
                                    maxLines: 3,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80.0,
                      width: double.infinity,
                      child: new Align(
                          alignment: Alignment.bottomCenter,
                          child: new Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ButtonTheme(
                              minWidth: 380,
                              height: 60,
                              child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: BorderSide(color: Colors.blue)),
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  child: new Text("Submit",
                                      style: TextStyle(fontSize: 20.0)),
                                  onPressed: () => {}),
                            ),
                          )),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
