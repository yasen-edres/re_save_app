import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/domain/entities/order_entities.dart';
import 'package:re_save_app/features/ui/home/tabs/add_tab/cubit/order_states.dart';
import 'package:re_save_app/features/ui/home/tabs/add_tab/cubit/order_view_model.dart';
import 'package:re_save_app/features/widget/custom_elevatedbutton.dart';
import 'package:re_save_app/features/widget/custom_text_form_field.dart';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final ImagePicker _picker = ImagePicker();
  late TextEditingController orderNameController;
  List<File> images = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderNameController = TextEditingController(
      text: context
          .read<OrderViewModel>()
          .state
          .orderName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderViewModel, OrderState>(
      builder: (context, state) {
        images = state.images;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.lightYellowColor,
            leading: IconButton(
              onPressed: () {
                context.read<OrderViewModel>().deleteOrder();
                Navigator.pop(context);
              },
              icon: Icon(CupertinoIcons.back),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(bottom: 30.h, left: 20.w, right: 20.w),
            child: Form(
              key: context
                  .read<OrderViewModel>()
                  .formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('تفاصيل الطلب الجديد', style: AppStyles.bold22Black),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('الصور', style: AppStyles.bold18Black),
                      TextButton(
                        onPressed: () {
                          //todo: add photo
                          showBottomSheet(context);
                        },
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.add,
                                color: AppColors.darkGreenColor),
                            SizedBox(width: 10.w),
                            Text('إضافة', style: AppStyles.bold18Green),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  images.isEmpty ?
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        vertical: 18.w, horizontal: 100.h),
                    decoration: BoxDecoration(
                      color: AppColors.lightGrayColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'لم يتم إرفاق أي صور بعد.',
                      style: AppStyles.light16Gray,
                    ),
                  ) :
                  SizedBox(
                    height: 170.h,
                    child: showImages(),
                  ),
                  if (state.imageError)
                    Padding(
                      padding: EdgeInsets.only(top: 6.h),
                      child: Text(
                        'من فضلك أضف صورة واحدة على الأقل',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),

                  SizedBox(height: 20.h),
                  Text('تفاصيل الطلب', style: AppStyles.bold20Black),
                  SizedBox(height: 10.h),
                  Text('التصنيف', style: AppStyles.bold18Black),
                  SizedBox(height: 10.h),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      items: state.options
                          .map(
                            (item) =>
                            DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            ),
                      )
                          .toList(),
                      value: state.selectedOption,
                      onChanged: (value) {
                        context.read<OrderViewModel>().changeSelectOption(
                            value as String);
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey),
                          color: Colors.transparent,
                        ),
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text('اسم الصنف', style: AppStyles.bold18Black),
                  SizedBox(height: 5.h),
                  CustomTextFormField(
                    validator: (text) {
                      if (text == null || text
                          .trim()
                          .isEmpty) {
                        return "please enter title";
                      }
                      return null;
                    },
                    controller: orderNameController,
                    filledColor: AppColors.transparentColor,
                    borderColor: AppColors.grayColor,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Checkbox(
                        value: state.isCheck,
                        fillColor: MaterialStateProperty.all(
                            state.isCheck ? AppColors.darkGreenColor : AppColors
                                .transparentColor
                        ),
                        onChanged: (value) {
                          context.read<OrderViewModel>().toggleCheck(value!);
                        },
                      ),
                      Expanded(
                        child: Text(
                          'لقد تلقينا طلبك وسنتصل بك قريباً.',
                          style: AppStyles.light16Black,
                        ),
                      ),
                    ],
                  ),
                  if (state.checkError)
                    Padding(
                      padding: EdgeInsets.only(top: 6.h),
                      child: Text(
                        'من فضلك أضف صورة واحدة على الأقل',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  Spacer(),
                  CustomElevatedButton(
                      text: 'تأكيد',
                      onPressed: () {
                        //todo: save order
                        var order = OrderEntity(
                          name: orderNameController.text,
                          category: state.selectedOption,
                          imageList: List<File>.from(state.images),
                        );
                        final isValid = context.read<OrderViewModel>().submit(
                            order);
                        if (isValid) {
                          Navigator.pop(context);
                        }
                      },
                      backgroundColor: AppColors.darkGreenColor,
                      textStyle: AppStyles.bold24White
                  )
                ],
              ),
            ),
          ),
        );
      },
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
                      Icon(CupertinoIcons.photo, color: AppColors.blackColor,
                        size: 25,),
                      SizedBox(width: 20.w,),
                      Text('من الهاتف', style: AppStyles.bold22Black,),
                    ],
                  )
              ),
              SizedBox(height: 10.h,),
              TextButton(
                  onPressed: () {
                    //todo: take image from camera
                    Navigator.pop(context);
                    pickFromCamera();
                  },
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.camera, color: AppColors.blackColor,
                        size: 25,),
                      SizedBox(width: 20.w,),
                      Text('إلتقط الصور', style: AppStyles.bold22Black,),
                    ],
                  )
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
      context.read<OrderViewModel>().addImage(image: File(image.path));
    }
  }

  Future<void> pickFromGallery() async {
    final List<XFile> pickedImages = await _picker.pickMultiImage(
      imageQuality: 70,
    );

    if (pickedImages.isNotEmpty) {
      context.read<OrderViewModel>().addImage(
          images: pickedImages.map((e) => File(e.path)).toList());
    }
  }

  ListView showImages() {
    return ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 130.w,
            height: 110.h,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 20.h,),
                    Image.file(images[index], fit: BoxFit.fill,
                      width: 130.w,
                      height: 110.h,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        //todo: remove image,
                        orderNameController.text = '';
                        context.read<OrderViewModel>().removeImage(
                            images[index]);
                      },
                      icon: CircleAvatar(
                        radius: 13,
                        backgroundColor: AppColors.redColor,
                        child: Icon(
                          CupertinoIcons.xmark, color: AppColors.whiteColor,
                          size: 18,),
                      ),
                    ),

                  ],
                )

              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 10.w,),
        itemCount: images.length
    );
  }
}
