import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/features/ui/home/tabs/cart_tab/cubit/cart_state.dart';
import 'package:re_save_app/features/ui/home/tabs/cart_tab/cubit/cart_view_model.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../domain/entities/response/get_cart_response.dart';

class CartWidget extends StatefulWidget {
  final Item item;
  final Items itemDetails;

  const CartWidget({
    super.key,
    required this.item,
    required this.itemDetails,
  });

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = double
        .parse(widget.itemDetails.estimatedQuantity!)
        .toInt();
  }

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartViewModel, CartState>(
      builder: (context, state) {
        if(state is CartLoading){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else if(state is CartError){
          return Center(
            child: Text(state.errorMessage,style: AppStyles.bold22Black,),
          );
        }else{
          return Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightGrayColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:  EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: Image.network(widget.item.image!, fit: BoxFit.fill),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.item.name!, style: AppStyles.bold16Black),
                          Text(widget.item.description!,
                              style: AppStyles.light16Gray),
                          SizedBox(
                            width: 300.w,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: decrement,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    color: AppColors.lightGrayColor,
                                    child: const Icon(
                                      CupertinoIcons.minus,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Text('$quantity',
                                    style: AppStyles.bold14Black),
                                SizedBox(width: 20.w),
                                GestureDetector(
                                  onTap: increment,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    color: AppColors.darkGreenColor,
                                    child: const Icon(
                                      CupertinoIcons.add,
                                      color: AppColors.whiteColor,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.h,
                                    horizontal: 20.w,
                                  ),
                                  color: AppColors.lightGrayColor,
                                  child: Text(
                                    '${quantity * double.parse(widget.itemDetails.price!)}',
                                    style: AppStyles.bold14Black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Transform.translate(
                  offset: const Offset(-8, -8),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: AppColors.redColor,
                    child: IconButton(
                      onPressed: () {
                        //todo: remove order from cart
                        context.read<CartViewModel>().removeItem(widget.itemDetails.id!);
                      },
                      icon: Icon(
                        CupertinoIcons.xmark,
                        size: 14,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }

      },

    );
  }
}