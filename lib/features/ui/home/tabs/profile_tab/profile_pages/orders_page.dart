import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/features/ui/home/cubit/home_view_model.dart';
import 'package:re_save_app/features/ui/home/tabs/add_tab/cubit/order_states.dart';
import 'package:re_save_app/features/ui/home/tabs/add_tab/cubit/order_view_model.dart';
import 'package:re_save_app/features/ui/home/tabs/add_tab/widget/order_item.dart';
import 'package:re_save_app/features/widget/custom_elevatedbutton.dart';


class OrdersPage extends StatefulWidget {
  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderViewModel, OrderState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.lightYellowColor,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(CupertinoIcons.back),
            ),
            title: Text('طلباتي', style: AppStyles.bold22Black),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.only(
                top: 20.h,
                bottom: 30.h,
                left: 20.w,
                right: 20.w
            ),
            child: DefaultTabController(
              length: state.orderState.length,
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: AppColors.darkGreenColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: AppColors.greenColor,
                    unselectedLabelColor: AppColors.blackColor,
                    labelStyle: AppStyles.bold20Black,
                    tabs: state.orderState.map((e) => Tab(text: e)).toList(),
                  ),

                  SizedBox(height: 20.h),

                  Expanded(
                    child: TabBarView(
                      children: [
                        state.orderProgress.isEmpty
                            ? emptyStateWidget(Icons.shopping_bag_outlined,
                            'لا يوجد طلبات قيد التنفيذ', context)
                            : SizedBox(
                          child: GridView.builder(
                            itemCount: state.orderProgress.length,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10.h,
                              crossAxisSpacing: 10.w,
                              childAspectRatio: 1 / 1.6,
                            ),
                            itemBuilder: (context, index) {
                              return OrderItem(
                                  order: state.orderProgress[index]
                              );
                            },
                          ),
                        ),
                        state.orderReceived.isEmpty
                            ? emptyStateWidget(
                            Icons.check_circle_outline, 'لا يوجد طلبات مستلمة',
                            context)
                            : SizedBox(
                          child: GridView.builder(
                            itemCount: state.orderReceived.length,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10.h,
                              crossAxisSpacing: 10.w,
                              childAspectRatio: 1 / 1.6,
                            ),
                            itemBuilder: (context, index) {
                              return OrderItem(
                                  order: state.orderReceived[index]
                              );
                            },
                          ),
                        ),
                        state.orderCancelled.isEmpty
                            ? emptyStateWidget(
                            Icons.cancel_outlined, 'لا يوجد طلبات ملغاه',
                            context)
                            : SizedBox(
                          child: GridView.builder(
                            itemCount: state.orderCancelled.length,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10.h,
                              crossAxisSpacing: 10.w,
                              childAspectRatio: 1 / 1.6,
                            ),
                            itemBuilder: (context, index) {
                              return OrderItem(
                                  order: state.orderCancelled[index]
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget emptyStateWidget(IconData iconData, String message,
      BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData, size: 120.w, color: AppColors.lightGrayColor),
        SizedBox(height: 20.h),
        Text(
          message,
          style: AppStyles.bold20Black,
          textAlign: TextAlign.center,
        ),
        Spacer(),
        CustomElevatedButton(
            text: "ابدأ الآن",
            onPressed: () {
              Navigator.pop(context);
              context.read<HomeViewModel>().changeSelectedIndex(1);
            },
            backgroundColor: AppColors.darkGreenColor,
            textStyle: AppStyles.bold24White
        )
      ],
    );
  }
}
