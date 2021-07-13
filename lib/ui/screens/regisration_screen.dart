import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task/widgets/custom_icon.dart';
import 'package:task/widgets/custom_text_widget.dart';
import 'package:task/widgets/export.dart';
import 'package:task/widgets/validate.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  File _image;

  var _nameController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorWhite,
      appBar: AppBar(
        title: CustomText(
          'Create startup account',
          fontWeight: FontWeight.w600,
          fontSize: 13,
          color: Styles.colorBlack,
        ),
        centerTitle: true,
        backgroundColor: Styles.colorWhite,
        elevation: 0.0,
        leading: CustomIcon(icon: Icons.navigate_before),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      verticalSpaceMedium,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            'Tell us about your startup',
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      verticalSpaceMedium,
                      verticalSpaceMedium,

                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              showDialog<void>(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                              getImageGallery(
                                                  ImageSource.gallery);
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: CustomText(
                                                'Choose Image from Gallery',
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                              getImageGallery(
                                                  ImageSource.camera);
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: CustomText(
                                                'Take image from Camera',
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Container(
                                height: 80,
                                width: 80,
                                color: Styles.colorGrey.withOpacity(0.15),
                                child: _image != null
                                    ? Image.file(
                                        _image,
                                        fit: BoxFit.fill,
                                      )
                                    : CustomIcon(
                                        icon: Icons.add_a_photo,
                                        color: Styles.colorLightBlue,
                                      ),
                              ),
                            ),
                          ),
                          horizontalSpaceSmall,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                'select your logo',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Styles.colorGrey,
                              ),
                              CustomText(
                                'PNG, 3png',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Styles.colorGrey,
                              ),
                            ],
                          )
                        ],
                      ),
                      verticalSpaceMedium,
                      CustomTextField(
                          // labelText: '*',
                          hintText: 'Startup name',
                          suffixText: "*",
                          controller: _nameController,
                          validator: (value) => Validate.isValidName(value)),
                      verticalSpaceMedium,

                      CustomTextField(
                        keyboardType: TextInputType.multiline,
                        hintText:
                            'Desribe your startup\nin a couple of sentence....',
                        maxLines: 5,
                        validator: (value) => Validate.isDescription(value),
                      ),
                      verticalSpaceTiny,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                            '0/150',
                            fontSize: 10,
                            color: Styles.colorBlack,
                          )
                        ],
                      ),
                      // verticalSpaceMedium,
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                      '1/10',
                      fontSize: 13,
                      color: Styles.colorBlack,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
                verticalSpaceSmall,
                Container(
                  width: double.infinity,
                  height: 7,
                  color: Styles.colorGreyLight,
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 7,
                        color: Styles.colorBlack,
                      ),
                    ],
                  ),
                ),
                verticalSpaceSmall,
                verticalSpaceTiny,
                CustomButton(
                  height: 50,
                  title: 'Next',
                  buttonColor: Colors.redAccent[200],
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print('hello');
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getImageGallery(ImageSource source) async {
    final PickedFile result = await ImagePicker().getImage(source: source);

    if (result != null) {
      _image = File(result.path);
    } else {
      return;
    }
    setState(() {});
  }
}
