import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hive_ce/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/functions/errorDialog.dart';
import 'package:taskati/core/functions/naviagtions.dart';
import 'package:taskati/core/services/local/hive_helper.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/core/widgets/custom_text_field.dart';
import 'package:taskati/core/widgets/main_button2.dart';
import 'package:taskati/features/home/screen/home_screen.dart';

import '../../core/widgets/main_button.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final controller = TextEditingController();
  String imagePath = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Complete Your Profile", style: TextStyles.title2),
      ),
      body: Stack(
        children: [
          Image.asset(AppImages.background, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 160, bottom: 40),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Profile Image",
                            style: TextStyles.body.copyWith(
                              color: AppColors.greyColor,
                            ),
                          ),
                        ),
                        Gap(20),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            if (imagePath.isNotEmpty)
                              ClipOval(
                                child: Image.file(
                                  File(imagePath),
                                  height: 180,
                                  width: 180,
                                  fit: BoxFit.cover,
                                ),
                              )
                            else
                              Image.asset(
                                AppImages.profile,
                                width: 200,
                                height: 200,
                              ),

                            if (imagePath.isNotEmpty)
                              Positioned(
                                bottom: 5,
                                right: 20,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      imagePath = '';
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5,
                                          spreadRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: SvgPicture.asset(AppImages.delete),
                                  ),
                                ),
                              ),
                          ],
                        ),

                        Gap(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MainButton2(
                              text: "From Camera",
                              onPressed: () {
                                pickImage(true);
                              },
                            ),
                            Gap(20),
                            MainButton2(
                              text: "From Gallery",
                              onPressed: () {
                                pickImage(false);
                              },
                            ),
                          ],
                        ),
                        Gap(20),

                        Gap(20),
                        CustomTextField(
                          title: 'Your Name',
                          controller: controller,
                        ),
                      ],
                    ),
                  ),
                ),
                MainButton(
                  text: 'Let’s Start !',
                  onPressed: () async {
                    if (imagePath.isEmpty && controller.text.isEmpty) {
                      showErrorDialog(
                        context,
                        'Please enter a name and select an image',
                      );
                    } else if (imagePath.isEmpty &&
                        controller.text.isNotEmpty) {
                      showErrorDialog(context, 'Please select an image');
                    } else if (imagePath.isNotEmpty &&
                        controller.text.isEmpty) {
                      showErrorDialog(context, 'Please enter a name');
                    } else {
                      await HiveHelper.cacheUserData(
                        name: controller.text,
                        imagePath: imagePath,
                      );
                      pushReplacement(context, HomeScreen());
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> pickImage(bool isCamera) async {
    final imagePicker = ImagePicker();
    XFile? pickedImage = await imagePicker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }
}
