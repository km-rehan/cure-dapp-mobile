import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageFieldBlocBuilder extends StatelessWidget {
  final InputFieldBloc<File, Object> fileFieldBloc;
  final FormBloc formBloc;
  final String placeHolder;
  final ImageSource source;

  const ImageFieldBlocBuilder(
      {Key key,
      @required this.fileFieldBloc,
      @required this.formBloc,
      @required this.placeHolder,
      @required this.source})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputFieldBloc<File, Object>,
        InputFieldBlocState<File, Object>>(
      bloc: fileFieldBloc,
      builder: (context, fieldBlocState) {
        return BlocBuilder<FormBloc, FormBlocState>(
          bloc: formBloc,
          builder: (context, formBlocState) {
            return Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.antiAlias,
                      elevation: 16,
                      color: fieldBlocState.value != null
                          ? Colors.grey[700]
                          : Colors.white,
                      child: Opacity(
                        opacity: formBlocState.canSubmit ? 1 : 0.5,
                        child: fieldBlocState.value != null
                            ? Image.file(
                                fieldBlocState.value,
                                height: 120,
                                width: 120,
                                fit: BoxFit.fill,
                              )
                            : Container(
                                height: 120,
                                width: 120,
                                child: new Center(
                                  child: new Text(
                                    this.placeHolder,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12.0,
                                        textBaseline: TextBaseline.ideographic,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal),
                                  ),
                                ),
                              ),
                      ),
                    ),
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor:
                              Theme.of(context).accentColor.withAlpha(50),
                          highlightColor:
                              Theme.of(context).accentColor.withAlpha(50),
                          borderRadius: BorderRadius.circular(60),
                          onTap: formBlocState.canSubmit
                              ? () async {
                                  final image = await ImagePicker().getImage(
                                      source: source,
                                      preferredCameraDevice: CameraDevice.rear);
                                  if (image.path != null) {
                                    fileFieldBloc.updateValue(File(image.path));
                                  }
                                }
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: fieldBlocState.canShowError ? 30 : 0,
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 8),
                        Text(
                          fieldBlocState?.error ?? '',
                          style: TextStyle(
                            color: Theme.of(context).errorColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
