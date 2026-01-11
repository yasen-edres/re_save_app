import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/core/utils/flutter_toast.dart';
import 'package:re_save_app/domain/entities/response/cart/get_cart_response.dart';
import 'package:re_save_app/features/ui/home/tabs/cart_tab/cart_location.dart';
import 'package:re_save_app/features/ui/home/tabs/cart_tab/cubit/cart_state.dart';
import 'package:re_save_app/features/ui/home/tabs/cart_tab/cubit/cart_view_model.dart';
import 'package:re_save_app/features/ui/home/tabs/cart_tab/widget/cart_widget.dart';
import 'package:re_save_app/features/widget/custom_elevatedbutton.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/app_colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String? _selectedAddress;
  double? _latitude;
  double? _longitude;

  @override
  void initState() {
    super.initState();
    context.read<CartViewModel>().getCart();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartViewModel, CartState>(
      builder: (context, state) {
        List<Items> items = context.read<CartViewModel>().items;

        if (state is CartLoading) {
          return Scaffold(
            body: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 30.h,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: AppColors.whiteColor,
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.whiteColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 100.w,
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 150.w,
                                        height: 15.h,
                                        color: AppColors.whiteColor,
                                      ),
                                      SizedBox(height: 10.h),
                                      Container(
                                        width: 100.w,
                                        height: 12.h,
                                        color: AppColors.whiteColor,
                                      ),
                                      SizedBox(height: 10.h),
                                      Container(
                                        width: 80.w,
                                        height: 20.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(height: 16.h),
                        itemCount: 4,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 15.h,
                          width: 100.w,
                          color: AppColors.whiteColor,
                        ),
                        Container(
                          height: 15.h,
                          width: 100.w,
                          color: AppColors.whiteColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      width: double.infinity,
                      height: 55.h,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is CartError) {
          return Center(
            child: Text(state.errorMessage, style: AppStyles.bold22Black),
          );
        } else {
          String? message = context.read<CartViewModel>().cartMessage;
          double totalPoints = 0.0;
          for (var item in items) {
            final price = double.parse(item.price ?? '0');
            final quantity = double.parse(item.estimatedQuantity ?? '1');
            totalPoints += price * quantity;
          }
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(CupertinoIcons.back),
              ),
              actionsPadding: EdgeInsets.symmetric(horizontal: 20.w),
              actions: [
                CircleAvatar(
                  backgroundColor: AppColors.darkGreenColor,
                  child: Icon(CupertinoIcons.qrcode, color: AppColors.whiteColor),
                ),
              ],
            ),
            body: message == 'Cart has items'
                ? Column(
              children: [
                Expanded(
                  flex: 3,
                  child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 30.h),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: CartWidget(
                          item: items[index].item!,
                          itemDetails: items[index],
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      left: 20.w,
                      right: 20.w,
                      bottom: 30.h,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('السعر الإجمالي', style: AppStyles.light16Gray),
                            Text('${totalPoints}نقطة', style: AppStyles.light16Gray),
                          ],
                        ),
                        CustomElevatedButton(
                          text: 'اختر موقع التوصيل',
                          onPressed: () {
                            _openLocationPicker();
                          },
                          backgroundColor: AppColors.darkGreenColor,
                          textStyle: AppStyles.bold24White,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
                : Center(
              child: Text('لم يتم العثور على طلبات', style: AppStyles.bold22Black),
            ),
          );
        }
      },
    );
  }

  // فتح شاشة اختيار الموقع
  Future<void> _openLocationPicker() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartLocationPickerScreen(),
      ),
    );

    if (result != null) {
      setState(() {
        _latitude = result['latitude'];
        _longitude = result['longitude'];
        _selectedAddress = result['address'];
      });

      // عرض Bottom Sheet للتأكيد
      _showConfirmationBottomSheet();
    }
  }

  // Bottom Sheet للتأكيد النهائي
  void _showConfirmationBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppColors.darkGreenColor,
                    size: 30,
                  ),
                  SizedBox(width: 12.w),
                  Text('تأكيد موقع التوصيل', style: AppStyles.bold20Black),
                ],
              ),
              SizedBox(height: 20.h),

              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.darkGreenColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: AppColors.darkGreenColor.withOpacity(0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.darkGreenColor,
                          size: 20,
                        ),
                        SizedBox(width: 8.w),
                        Text('عنوان التوصيل:', style: AppStyles.bold16Black),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      _selectedAddress ?? '',
                      style: AppStyles.light16Gray,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.h),
                    Divider(color: AppColors.darkGreenColor.withOpacity(0.3)),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Icon(Icons.push_pin_outlined,
                            color: Colors.grey, size: 16),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            'خط العرض: ${_latitude?.toStringAsFixed(5) ?? ''}\nخط الطول: ${_longitude?.toStringAsFixed(5) ?? ''}',
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.h),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _openLocationPicker(); // فتح الخريطة مرة أخرى
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        side: BorderSide(color: AppColors.darkGreenColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        'تغيير الموقع',
                        style: TextStyle(
                          color: AppColors.darkGreenColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _confirmOrder();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkGreenColor,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        'إتمام الطلب',
                        style: AppStyles.bold24White.copyWith(fontSize: 16.sp),
                      ),
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

  // تأكيد الطلب
  void _confirmOrder() {
    if (_selectedAddress != null && _latitude != null && _longitude != null) {
      // إرسال الموقع للـ ViewModel
      context.read<CartViewModel>().confirm(_selectedAddress!);

      Navigator.popUntil(context, (route) => route.isFirst);

      ToastMessage.toastMsg(
        'تم إتمام الطلب بنجاح',
        AppColors.darkGreenColor,
        AppColors.whiteColor,
      );
    } else {
      ToastMessage.toastMsg(
        'يجب اختيار موقع التوصيل',
        AppColors.redColor,
        AppColors.whiteColor,
      );
    }
  }
}