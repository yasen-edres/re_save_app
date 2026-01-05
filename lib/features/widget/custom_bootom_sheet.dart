import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/core/utils/flutter_toast.dart';
import 'package:re_save_app/domain/entities/request/cart/add_item_to_cart_request.dart';
import 'package:re_save_app/domain/entities/response/public/item.dart';
import 'package:re_save_app/features/widget/custom_elevatedbutton.dart';
import 'package:re_save_app/features/widget/custom_text_form_field.dart';
import 'package:shimmer/shimmer.dart';

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
  final TextEditingController quantityController = TextEditingController(text: '0');
  int quantity = 0;
  bool checkPrice = false;
  int minPrice = 100;
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
  Widget build(BuildContext context) {
    return BlocBuilder<OrderViewModel, OrderState>(
      builder: (context, state) {
        final price = double.parse(widget.item.price!);
        double totalPrice = quantity * double.parse(widget.item.price!);
        final cloudImages = context.read<OrderViewModel>().cloudImageUrls;

        return Container(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.item.pricingType == 'kg' ? Text('أضف الكمية بالوزن', style: AppStyles.bold24Black) : Text('أضف العدد', style: AppStyles.bold24Black),
                widget.item.pricingType == 'kg'? Text('الوزن يقاس بالكيلوجرام', style: AppStyles.light16Gray) : Text('الوزن يقاس بالقطعه', style: AppStyles.light16Gray),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: isUploading
                            ? Container(
                          width: 180.w,
                          height: 150.h,
                          decoration: BoxDecoration(
                            color: AppColors.lightGrayColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppColors.darkGreenColor.withOpacity(0.3),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                  color: AppColors.darkGreenColor,
                                  strokeWidth: 3,
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  'جاري رفع الصورة...',
                                  style: AppStyles.semi14TextBlack.copyWith(
                                    color: AppColors.darkGreenColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                            : cloudImages.isNotEmpty
                            ? CachedNetworkImage(
                          imageUrl: cloudImages[0],
                          width: 180.w,
                          height: 150.h,
                          fit: BoxFit.cover,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 180.w,
                              height: 150.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: 180.w,
                            height: 150.h,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.grey,
                              size: 40,
                            ),
                          ),
                        )
                            : InkWell(
                          onTap: pickFromCamera,
                          child: Container(
                            width: 180.w,
                            height: 150.h,
                            decoration: BoxDecoration(
                              color: AppColors.lightGrayColor,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppColors.darkGreenColor.withOpacity(0.3),
                                width: 2,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.camera,
                                    size: 40,
                                    color: AppColors.darkGreenColor,
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    'إضافة صورة',
                                    style: AppStyles.light16Gray.copyWith(
                                      color: AppColors.darkGreenColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      !checkImage
                          ? Text('يجب إضافة صورة', style: AppStyles.bold16Red)
                          : SizedBox.shrink(),
                      SizedBox(height: 10.h),
                      Center(
                        child: Column(
                          children: [
                            Text(widget.item.name!, style: AppStyles.bold20Black),
                            SizedBox(height: 5.h),
                            Text(widget.item.description!, style: AppStyles.light16Gray),
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
                      SizedBox(height: 10.h),
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
                          ? Text('السعر أقل من الحد الأدنى! ${minPrice}',
                          style: AppStyles.bold16Red)
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        backgroundColor: AppColors.darkGreenColor,
                        textStyle: AppStyles.bold20White,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: CustomElevatedButton(
                        text: 'اتمام الطلب',
                        onPressed:isUploading?null: () {
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

                          if (!checkImage) {
                            return;
                          }

                          final addItemToCartRequest = AddItemToCartRequest(
                            estimatedQuantity: quantity,
                            itemId: widget.item.id,
                            image: imageUrl,
                          );
                          ToastMessage.toastMsg(
                            'تمت إضافة المنتج إلى سلة التسوق بنجاح',
                            AppColors.darkGreenColor,
                            AppColors.whiteColor,
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
        imageUrl = response.secureUrl;
        isUploading = false;
      });

      context.read<OrderViewModel>().addImage(response.secureUrl);
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
    }
  }

  void increaseQuantity() {
    setState(() {
      quantity += 1;
      quantityController.text = quantity.toString();
    });
  }

  void decreaseQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity -= 1;
        quantityController.text = quantity.toString();
      });
    }
  }

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }
}