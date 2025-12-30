import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/domain/entities/request/add_item_to_cart_request.dart';
import 'package:re_save_app/domain/entities/response/item.dart';
import 'package:re_save_app/features/widget/custom_elevatedbutton.dart';
import 'package:re_save_app/features/widget/custom_text_form_field.dart';

import '../ui/home/tabs/add_tab/cubit/order_states.dart';
import '../ui/home/tabs/add_tab/cubit/order_view_model.dart';


class CustomBottomSheetContent extends StatefulWidget {
  Item item;

  CustomBottomSheetContent({required this.item});

  @override
  State<CustomBottomSheetContent> createState() =>
      _CustomBottomSheetContentState();
}

class _CustomBottomSheetContentState extends State<CustomBottomSheetContent> {
  final TextEditingController quantityController = TextEditingController(
      text: '0');
  int quantity = 0;
  bool checkPrice = false;
  int minPrice = 100;
  bool checkImage = false ;
  String imageUrl = '';
  final ImagePicker _picker = ImagePicker();
  final cloudinary = CloudinaryPublic(
    'dd2gpv170',
    'resave_upload',
    cache: false,
  );



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderViewModel, OrderState>(
      builder: (context, state) {
        final price = double.parse(widget.item.price!);
        double totalPrice = quantity * double.parse(widget.item.price!);
        final cloudImages = context
            .read<OrderViewModel>()
            .cloudImageUrls;
        return Container(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.item.pricingType == 'kg' ?
              Text('أضف الكمية بالوزن', style: AppStyles.bold24Black) :
              Text('أضف العدد', style: AppStyles.bold24Black),
              widget.item.pricingType == 'kg' ?
              Text('الوزن يقاس بالكيلوجرام', style: AppStyles.light16Gray) :
              Text('الوزن يقاس بالقطعه', style: AppStyles.light16Gray),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: cloudImages.isNotEmpty
                          ? Image.network(
                        cloudImages[0],
                        width: 180.w,
                        height: 150.h,
                        fit: BoxFit.cover,
                      )
                          : InkWell(
                        onTap: () {
                          pickFromCamera();
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
                    SizedBox(height: 10.h,),
                    !checkImage?
                        Text('يجب إضافة صورة',style: AppStyles.bold16Red,)
                        :SizedBox.shrink(),
                    SizedBox(height: 10.h),
                    Center(
                      child: Column(
                        children: [
                          Text(widget.item.name!, style: AppStyles.bold20Black),
                          SizedBox(height: 5.h),
                          Text(widget.item.description!, style: AppStyles
                              .light16Gray),
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

                      child: Text('${totalPrice.toStringAsFixed(2)} جنيه',
                          style: AppStyles.bold16Black),
                    ),
                    checkPrice
                        ? Text('السعر أقل من الحد الأدنى! ${minPrice}', style: AppStyles.bold16Red)
                        : SizedBox.shrink(),
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
                      onPressed: () {
                        if (quantity * price < minPrice) {
                          setState(() {
                            checkPrice = true;
                          });
                          return;
                        } else {
                          setState(() {
                            checkPrice = false;
                          });
                        }
                        if(!checkImage){
                          return;
                        }
                        final addItemToCartRequest = AddItemToCartRequest(
                          estimatedQuantity: quantity,
                          itemId: widget.item.id,
                          image: imageUrl,
                        );
                        context.read<OrderViewModel>().addItemToCart(addItemToCartRequest);
                        Navigator.pop(context);
                      },
                      backgroundColor: AppColors.whiteColor,
                      textStyle: AppStyles.bold20Green,
                      borderColor: AppColors.darkGreenColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }


  Future<void> pickFromCamera() async {
    final XFile? image = await _picker.pickImage(
        source: ImageSource.camera, imageQuality: 70);

    if (image != null) {
      File file = File(image.path);
      await uploadImageToCloudinary(file);
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

      setState(() {
        checkImage = true;
        imageUrl = response.secureUrl;
      });

      context.read<OrderViewModel>().addImage(response.secureUrl);

    } on CloudinaryException catch (e) {
      print('Cloudinary Error: ${e.message}');
    }
  }
  void increaseQuantity() {
    setState(() {
      quantity += 1;
      quantityController.text = quantity.toString();
    }) ;
  }

  void decreaseQuantity() {

    if (quantity > 1) {

      setState(() {
        quantity -= 1;
        quantityController.text = quantity.toString();
      });
    }
  }
}
