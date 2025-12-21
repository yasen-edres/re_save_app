import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/features/ui/home/tabs/add_tab/cubit/order_states.dart';
import 'package:re_save_app/features/ui/home/tabs/add_tab/cubit/order_view_model.dart';
import 'package:re_save_app/features/ui/home/tabs/add_tab/widget/order_item.dart';


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
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                            ? emptyStateWidget(
                          Icons.shopping_bag_outlined,
                          'لا يوجد طلبات قيد التنفيذ',
                        )
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
                        emptyStateWidget(
                          Icons.check_circle_outline,
                          'لا يوجد طلبات مستلمة',
                        ),
                        emptyStateWidget(
                          Icons.cancel_outlined,
                          'لا يوجد طلبات ملغاه',
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

  Widget emptyStateWidget(IconData iconData, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: 120.w, color: AppColors.lightGrayColor),
          SizedBox(height: 20.h),
          Text(
            message,
            style: AppStyles.bold20Black,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
