import 'package:curedapp/utils/image.field.bloc.builder.dart';
import 'package:curedapp/utils/profile.formbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
        create: (context) => ProfileFormBloc(),
        child: Builder(
          builder: (BuildContext context) {
            // ignore: close_sinks
            final profileFormBloc = context.bloc<ProfileFormBloc>();

            return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: new Text('Update profile'),
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
                        child:
                            FormBlocListener<ProfileFormBloc, String, String>(
                          onSubmitting: (context, state) {},
                          onSuccess: (context, state) {},
                          onFailure: (context, state) {},
                          child: SingleChildScrollView(
                            physics: ClampingScrollPhysics(),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 7,
                                        child: new Container(
                                          margin: EdgeInsets.all(5.0),
                                          padding: EdgeInsets.all(5.0),
                                          child: new Column(
                                            children: [
                                              TextFieldBlocBuilder(
                                                  textFieldBloc:
                                                      profileFormBloc.firstname,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  obscureText: true,
                                                  enableInteractiveSelection:
                                                      true,
                                                  animateWhenCanShow: true,
                                                  decoration: InputDecoration(
                                                      labelText: "First name",
                                                      labelStyle: TextStyle(
                                                          fontSize: 16.0,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      border: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              style: BorderStyle
                                                                  .solid,
                                                              color: Colors
                                                                  .blue)))),
                                              TextFieldBlocBuilder(
                                                  textFieldBloc:
                                                      profileFormBloc.lastname,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  obscureText: true,
                                                  enableInteractiveSelection:
                                                      true,
                                                  animateWhenCanShow: true,
                                                  decoration: InputDecoration(
                                                      labelText: "Last name",
                                                      labelStyle: TextStyle(
                                                          fontSize: 16.0,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      border: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              style: BorderStyle
                                                                  .solid,
                                                              color: Colors
                                                                  .blue)))),
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child:
                                            ImageFieldBlocBuilder(
                                                placeHolder: "Upload profile photo",
                                                source: ImageSource.gallery,
                                                fileFieldBloc: profileFormBloc
                                                    .profileImage,
                                                formBloc: profileFormBloc))
                                  ],
                                ),
                                TextFieldBlocBuilder(
                                    padding: EdgeInsets.all(14.0),
                                    textFieldBloc: profileFormBloc.contactNo,
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
                                    textFieldBloc: profileFormBloc.emailId,
                                    keyboardType: TextInputType.emailAddress,
                                    obscureText: true,
                                    enableInteractiveSelection: true,
                                    animateWhenCanShow: true,
                                    decoration: InputDecoration(
                                        labelText: "Email id",
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
                                    selectFieldBloc:
                                        profileFormBloc.genderMultiSelect,
                                    showEmptyItem: false,
                                    textAlign: TextAlign.center,
                                    itemBuilder:
                                        (BuildContext context, String value) =>
                                            value,
                                    animateWhenCanShow: true,
                                    decoration: InputDecoration(
                                        labelText: "Gender",
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
                                    dateTimeFieldBloc:
                                        profileFormBloc.dateOfBirth,
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
                                DropdownFieldBlocBuilder<String>(
                                    padding: EdgeInsets.all(14.0),
                                    selectFieldBloc: profileFormBloc.bloodGroup,
                                    showEmptyItem: false,
                                    textAlign: TextAlign.center,
                                    itemBuilder:
                                        (BuildContext context, String value) =>
                                            value,
                                    animateWhenCanShow: true,
                                    decoration: InputDecoration(
                                        labelText: "Blood group",
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
                                    textFieldBloc: profileFormBloc.timeZone,
                                    keyboardType: TextInputType.text,
                                    obscureText: true,
                                    enableInteractiveSelection: true,
                                    animateWhenCanShow: true,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        labelText: "Time zone",
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
                                    textFieldBloc: profileFormBloc.address,
                                    keyboardType: TextInputType.text,
                                    obscureText: true,
                                    maxLines: 8,
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
                                    textFieldBloc: profileFormBloc.city,
                                    keyboardType: TextInputType.text,
                                    obscureText: true,
                                    enableInteractiveSelection: true,
                                    animateWhenCanShow: true,
                                    decoration: InputDecoration(
                                        labelText: "City",
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
                                    textFieldBloc: profileFormBloc.stateBc,
                                    keyboardType: TextInputType.text,
                                    obscureText: true,
                                    enableInteractiveSelection: true,
                                    animateWhenCanShow: true,
                                    decoration: InputDecoration(
                                        labelText: "State",
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
                                    textFieldBloc: profileFormBloc.country,
                                    keyboardType: TextInputType.text,
                                    obscureText: true,
                                    enableInteractiveSelection: true,
                                    animateWhenCanShow: true,
                                    decoration: InputDecoration(
                                        labelText: "Country",
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
                                    textFieldBloc: profileFormBloc.pincode,
                                    keyboardType: TextInputType.number,
                                    obscureText: true,
                                    enableInteractiveSelection: true,
                                    animateWhenCanShow: true,
                                    decoration: InputDecoration(
                                        labelText: "Pincode",
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
                                    selectFieldBloc: profileFormBloc.langauge,
                                    showEmptyItem: false,
                                    textAlign: TextAlign.center,
                                    itemBuilder:
                                        (BuildContext context, String value) =>
                                            value,
                                    animateWhenCanShow: true,
                                    decoration: InputDecoration(
                                        labelText: "Select your language",
                                        labelStyle: TextStyle(
                                            fontSize: 16.0,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                style: BorderStyle.solid,
                                                color: Colors.blue)))),
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
                                        borderRadius:
                                            BorderRadius.circular(50.0),
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
        ));
  }
}
