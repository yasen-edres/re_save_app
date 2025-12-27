import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/features/widget/custom_elevatedbutton.dart';
import 'package:re_save_app/features/widget/custom_text_form_field.dart';

import '../../../../cubit/profile_state.dart';
import '../../../../cubit/profile_view_model.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController(

  );


  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
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
        phoneController.text = user?.phone ?? '';
        nameController.text = user!.name!;
        if (state is ProfileLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProfileError) {
          return Center(
            child: Text(state.errorMessage, style: AppStyles.bold24White,),
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
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('تعديل بينات الحساب', style: AppStyles.bold22Black),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 70.w,
                            backgroundColor: AppColors.greenColor,
                            child: Icon(
                              CupertinoIcons.person_fill,
                              color: AppColors.whiteColor,
                              size: 100.w,
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(height: 100.h),
                              Row(
                                children: [
                                  SizedBox(width: 100.w),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: AppColors.darkGreenColor,
                                    child: Icon(
                                      Icons.edit_outlined,
                                      color: AppColors.whiteColor,
                                      size: 25.w,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text('الاسم', style: AppStyles.bold18Black),
                  SizedBox(
                    width: double.infinity,
                    child: CustomTextFormField(
                      filledColor: AppColors.transparentColor,
                      borderColor: AppColors.lightGrayColor,
                      hintText: 'أدخل الاسم',
                      controller: nameController,
                    ),
                  ),

                  Text('رقم التليفون', style: AppStyles.bold18Black),
                  SizedBox(
                    width: double.infinity,
                    child: CustomTextFormField(
                      controller: phoneController,
                      hintText: 'أدخل رقم الهاتف',
                      filledColor: AppColors.transparentColor,
                      borderColor: AppColors.lightGrayColor,
                    ),
                  ),
                  Spacer(),
                  CustomElevatedButton(
                    text: 'حفظ',
                    onPressed: () {
                      //todo: save changes
                      viewModel.updateProfile(
                          nameController.text, phoneController.text, '');
                      Navigator.pop(context);
                    },
                    backgroundColor: AppColors.darkGreenColor,
                    textStyle: AppStyles.bold24White,
                  ),
                ],
              ),
            ),
          );
        }
      },

    );
  }
}
