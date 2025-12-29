import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/domain/entities/response/get_cart_response.dart';
import 'package:re_save_app/features/ui/home/tabs/cart_tab/cubit/cart_state.dart';
import 'package:re_save_app/features/ui/home/tabs/cart_tab/cubit/cart_view_model.dart';
import 'package:re_save_app/features/ui/home/tabs/cart_tab/widget/cart_widget.dart';
import 'package:re_save_app/features/widget/custom_elevatedbutton.dart';

import '../../../../../core/utils/app_colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CartViewModel>().getCart();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartViewModel, CartState>(
      builder: (context, state) {
        List<Items> items = context.read<CartViewModel>().items;
        if(state is CartLoading){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else if(state is CartError){
          return Center(
            child: Text(state.errorMessage,style: AppStyles.bold22Black,),
          );
        }else{
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

          body: items.isNotEmpty?
          Column(
            children: [
              Expanded(
                flex: 3,
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 30.h),
                  itemCount: 4,
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
                          Text('100.5جنيه', style: AppStyles.light16Gray),
                        ],
                      ),
                      CustomElevatedButton(
                        text: 'اتمام الطلب',
                        onPressed: () {},
                        backgroundColor: AppColors.darkGreenColor,
                        textStyle: AppStyles.bold24White,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ):
          Center(
              child: Text('لم يتم العثور على طلبات',style: AppStyles.bold22Black,)
          ),
        );
        }
      },
    );
  }
}
