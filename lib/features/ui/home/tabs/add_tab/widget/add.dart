import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/features/widget/custom_elevatedbutton.dart';
import 'package:re_save_app/features/widget/custom_text_form_field.dart';

class Add extends StatefulWidget {
  // String name;
  // String description;
  // String image;
  //
  // Add({
  //   required this.image,
  //   required this.name,
  //   required this.description,
  // });

  @override
  State<Add> createState() => _CustomBottomSheetContentState();
}

class _CustomBottomSheetContentState extends State<Add> {
  final TextEditingController quantityController = TextEditingController(
    text: '0.5',
  );

  double quantity = 0.5;
  final ImagePicker _picker = ImagePicker();
  List<String> cloudImageUrls = [];
  List<File> images = [];
  final cloudinary = CloudinaryPublic(
    'dd2gpv170',
    'resave_upload',
    cache: false,
  );

  void increaseQuantity() {
    setState(() {
      quantity += 0.5;
      quantityController.text = quantity.toString();
    });
  }

  void decreaseQuantity() {
    if (quantity > 0.5) {
      setState(() {
        quantity -= 0.5;
        quantityController.text = quantity.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('أضف الكمية بالولزن', style: AppStyles.bold24Black),
            Text('الوزن يقاس بالكيلوجرام', style: AppStyles.light16Gray),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: cloudImageUrls.isNotEmpty
                        ? SizedBox(
                            width: 180.w,
                            height: 150.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/placeholder.png',
                                image: cloudImageUrls[0],
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              showBottomSheet(context);
                            },
                            child: Container(
                              width: 180.w,
                              height: 150.h,
                              decoration: BoxDecoration(
                                color: AppColors.lightGrayColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: Text(
                                  'إضافة صورة.',
                                  style: AppStyles.light16Gray,
                                ),
                              ),
                            ),
                          ),
                  ),

                  SizedBox(height: 10.h),
                  Center(
                    child: Column(
                      children: [
                        Text('widget.name', style: AppStyles.bold20Black),
                        SizedBox(height: 5.h),
                        Text(
                          'widget.description',
                          style: AppStyles.light16Gray,
                        ),
                        SizedBox(height: 10.h),
                        Text('الحد الادني للطلب هو 25 جنيهًا'),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text('الكمية', style: AppStyles.semi16TextBlack),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        color: AppColors.lightGrayColor,
                        child: InkWell(
                          onTap: decreaseQuantity,
                          child: Icon(CupertinoIcons.minus, size: 20),
                        ),
                      ),

                      SizedBox(width: 20.w),
                      Expanded(
                        child: CustomTextFormField(
                          filledColor: AppColors.whiteColor,
                          borderColor: AppColors.lightGrayColor,
                          keyboardType: TextInputType.number,
                          controller: quantityController,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Container(
                        padding: EdgeInsets.all(5),
                        color: AppColors.darkGreenColor,
                        child: InkWell(
                          onTap: increaseQuantity,
                          child: Icon(
                            CupertinoIcons.add,
                            size: 20,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text('السعر', style: AppStyles.semi16TextBlack),
                  SizedBox(height: 5.h),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      border: Border.all(color: AppColors.lightGrayColor),
                    ),
                    child: Text(
                      '${quantity * 7.5}جنيه',
                      style: AppStyles.bold16Black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    text: 'مواصلة التسوق',
                    onPressed: () {},
                    backgroundColor: AppColors.darkGreenColor,
                    textStyle: AppStyles.bold20White,
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: CustomElevatedButton(
                    text: 'اتمام الطلب',
                    onPressed: () {},
                    backgroundColor: AppColors.whiteColor,
                    textStyle: AppStyles.bold20Green,
                    borderColor: AppColors.darkGreenColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: 50.h,
            top: 10.h,
            left: 20.w,
            right: 20.w,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  //todo: take image from photos
                  Navigator.pop(context);
                  pickFromGallery();
                },
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.photo,
                      color: AppColors.blackColor,
                      size: 25,
                    ),
                    SizedBox(width: 20.w),
                    Text('من الهاتف', style: AppStyles.bold22Black),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              TextButton(
                onPressed: () {
                  //todo: take image from camera
                  Navigator.pop(context);
                  pickFromCamera();
                },
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.camera,
                      color: AppColors.blackColor,
                      size: 25,
                    ),
                    SizedBox(width: 20.w),
                    Text('إلتقط الصور', style: AppStyles.bold22Black),
                  ],
                ),
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

      try {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(
            file.path,
            resourceType: CloudinaryResourceType.Image,
          ),
        );
        print('تم رفع الصورة بنجاح: ${response.secureUrl}');
      } on CloudinaryException catch (e) {
        print('حدث خطأ أثناء رفع الصورة: ${e.message}');
      }
    }
  }

  Future<void> pickFromGallery() async {
    final List<XFile> pickedImages = await _picker.pickMultiImage(
      imageQuality: 70,
    );

    if (pickedImages.isNotEmpty) {
      for (var image in pickedImages) {
        File file = File(image.path);
        await uploadImageToCloudinary(file);
      }
    }
  }

  Future<void> uploadImageToCloudinary(File file) async {
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          file.path,
          resourceType: CloudinaryResourceType.Image,
        ),
      );
      print('Image URL: ${response.secureUrl}');
      setState(() {
        cloudImageUrls.add(response.secureUrl); // تخزين الرابط للعرض لاحقًا
      });
    } on CloudinaryException catch (e) {
      print('Cloudinary Error: ${e.message}');
    }
  }
}
