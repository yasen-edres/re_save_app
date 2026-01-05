import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/features/ui/cubit/profile_view_model.dart';
import 'package:re_save_app/features/widget/custom_elevatedbutton.dart';
import 'package:re_save_app/features/widget/custom_text_form_field.dart';

import '../../../../../../core/utils/flutter_toast.dart';
import '../../../../cubit/profile_state.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String imageUrl = '';
  bool checkImage = false;
  bool isUploading = false;
  final ImagePicker _picker = ImagePicker();
  final cloudinary = CloudinaryPublic(
    'dd2gpv170',
    'resave_upload',
    cache: false,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileViewModel>().getUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewModel, ProfileState>(
      builder: (context, state) {
        final viewModel = context.read<ProfileViewModel>();
        final user = viewModel.user;

        if (user != null) {
          phoneController.text = user.phone ?? '';
          nameController.text = user.name ?? '';
          if (!checkImage && user.image != null) {
            imageUrl = user.image!;
          }
        }

        if (state is ProfileLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ProfileError) {
          return Scaffold(
            body: Center(
              child: Text(state.errorMessage, style: AppStyles.bold24White),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.lightYellowColor,
              leading: IconButton(
                icon: const Icon(CupertinoIcons.back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('تعديل بيانات الحساب', style: AppStyles.bold22Black),
                      SizedBox(height: 20.h),
                      InkWell(
                        onTap: isUploading ? null : () {
                          _showImageSourceDialog();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                (checkImage || (user?.image != null && user!.image!.isNotEmpty))
                                    ? CircleAvatar(
                                  radius: 70.w,
                                  backgroundColor: AppColors.greenColor,
                                  backgroundImage: NetworkImage(
                                    checkImage ? imageUrl : user!.image!,
                                  ),
                                )
                                    : CircleAvatar(
                                  radius: 70.w,
                                  backgroundColor: AppColors.greenColor,
                                  child: Icon(
                                    CupertinoIcons.person_fill,
                                    color: AppColors.whiteColor,
                                    size: 100.w,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: AppColors.darkGreenColor,
                                    child: isUploading
                                        ? SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: AppColors.whiteColor,
                                        strokeWidth: 2,
                                      ),
                                    )
                                        : Icon(
                                      Icons.edit_outlined,
                                      color: AppColors.whiteColor,
                                      size: 25.w,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text('الاسم', style: AppStyles.bold18Black),
                      SizedBox(height: 8.h),
                      CustomTextFormField(
                        filledColor: AppColors.transparentColor,
                        borderColor: AppColors.lightGrayColor,
                        hintText: 'أدخل الاسم',
                        controller: nameController,
                      ),
                      SizedBox(height: 16.h),
                      Text('رقم التليفون', style: AppStyles.bold18Black),
                      SizedBox(height: 8.h),
                      CustomTextFormField(
                        controller: phoneController,
                        hintText: 'أدخل رقم الهاتف',
                        filledColor: AppColors.transparentColor,
                        borderColor: AppColors.lightGrayColor,
                      ),
                      Spacer(),
                      CustomElevatedButton(
                        text: 'حفظ',
                        onPressed: isUploading ? null : () {
                          if (nameController.text.isEmpty) {
                            ToastMessage.toastMsg(
                              'من فضلك أدخل الاسم',
                              Colors.red,
                              AppColors.whiteColor,
                            );
                            return;
                          }
                          if (phoneController.text.isEmpty) {
                            ToastMessage.toastMsg(
                              'من فضلك أدخل رقم الهاتف',
                              Colors.red,
                              AppColors.whiteColor,
                            );
                            return;
                          }

                          viewModel.updateProfile(
                            nameController.text,
                            phoneController.text,
                            imageUrl.isNotEmpty ? imageUrl : user?.image ?? '',
                          );
                          Navigator.pop(context);
                        },
                        backgroundColor: AppColors.darkGreenColor,
                        textStyle: AppStyles.bold24White,
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_camera, color: AppColors.darkGreenColor),
                title: Text('التقاط صورة', style: AppStyles.bold18Black),
                onTap: () {
                  Navigator.pop(context);
                  pickFromCamera();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: AppColors.darkGreenColor),
                title: Text('اختيار من المعرض', style: AppStyles.bold18Black),
                onTap: () {
                  Navigator.pop(context);
                  pickFromGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> pickFromCamera() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 70,
    );

    if (image != null) {
      File file = File(image.path);
      await uploadImageToCloudinary(file);
    }
  }

  Future<void> pickFromGallery() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (image != null) {
      File file = File(image.path);
      await uploadImageToCloudinary(file);
    }
  }

  Future<void> uploadImageToCloudinary(File file) async {
    setState(() {
      isUploading = true;
    });

    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          file.path,
          resourceType: CloudinaryResourceType.Image,
        ),
      );

      setState(() {
        checkImage = true;
        imageUrl = response.secureUrl ?? '';
        isUploading = false;
      });

      ToastMessage.toastMsg(
        'تم رفع الصورة بنجاح',
        AppColors.greenColor,
        AppColors.whiteColor,
      );
    } on CloudinaryException catch (e) {
      print('Cloudinary Error: ${e.message}');
      setState(() {
        isUploading = false;
      });

      ToastMessage.toastMsg(
        'فشل رفع الصورة، حاول مرة أخرى',
        Colors.red,
        AppColors.whiteColor,
      );
    } catch (e) {
      print('Error: $e');
      setState(() {
        isUploading = false;
      });

      ToastMessage.toastMsg(
        'حدث خطأ، حاول مرة أخرى',
        Colors.red,
        AppColors.whiteColor,
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}