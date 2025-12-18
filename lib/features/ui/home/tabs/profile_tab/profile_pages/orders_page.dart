import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_assets.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/features/ui/home/tabs/home_tab/widget/category_item.dart';

class OrdersPage extends StatefulWidget {
  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<Map<String, String>> orderProgress = [
    {
      "title": "هاتف ذكي",
      "price": "5000",
      'image': AppAssets.carton,
      "description": "هاتف ذكي بمواصفات ممتازة وكاميرا رائعة",
    },
    {
      "title": "سماعات بلوتوث",
      "price": "800",
      'image': AppAssets.carton,
      "description": "سماعات لاسلكية بجودة صوت ممتازة وعمر بطارية طويل",
    },
    {
      "title": "ساعة ذكية",
      "price": "1500",
      'image': AppAssets.carton,
      "description": "ساعة ذكية لمتابعة الصحة واللياقة البدنية",
    },
    {
      "title": "لاب توب",
      "price": "12000 ",
      'image': AppAssets.laptop,
      "description": "لاب توب للأعمال والدراسة بأداء عالي",
    },
    {
      "title": "حقيبة ظهر",
      "price": "400",
      'image': AppAssets.carton,
      "description": "حقيبة ظهر قوية وعملية لجميع الاستخدامات اليومية",
    },
  ];
  List<String> orderReceived = [];
  List<String> orderCancelled = [];
  final List<String> orderState = ['قيد التنفيذ', 'المستلمه', 'الملغاه'];

  @override
  Widget build(BuildContext context) {
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
          length: orderState.length,
          child: Column(
            children: [
              TabBar(
                indicatorColor: AppColors.darkGreenColor,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: AppColors.greenColor,
                unselectedLabelColor: AppColors.blackColor,
                labelStyle: AppStyles.bold20Black,
                tabs: orderState.map((e) => Tab(text: e)).toList(),
              ),

              SizedBox(height: 20.h),

              Expanded(
                child: TabBarView(
                  children: [
                    orderProgress.isEmpty
                        ? emptyStateWidget(
                            Icons.shopping_bag_outlined,
                            'لا يوجد طلبات قيد التنفيذ',
                          )
                        : SizedBox(
                            child: GridView.builder(
                              itemCount: orderProgress.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10.h,
                                    crossAxisSpacing: 10.w,
                                    childAspectRatio: 1 / 1.6,
                                  ),
                              itemBuilder: (context, index) {
                                return CategoryItem(
                                  title: orderProgress[index]['title']!,
                                  image: orderProgress[index]['image']!,
                                  price: double.parse(
                                    orderProgress[index]['price']!,
                                  ),
                                  description:
                                      orderProgress[index]['description']!,
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
