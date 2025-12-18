import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_assets.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/features/ui/home/tabs/home_tab/widget/category_item.dart';

class GetCategories extends StatelessWidget {
  String categoryName;
  final String searchText;

  GetCategories({required this.categoryName, this.searchText = ''});

  List<Map<String, String>> productItems = [
    {
      'name': 'مكيف',
      'category': "الالكترونيات",
      "image": AppAssets.airConditioning,
      'price': '100',
    },
    {
      'name': 'زجاج',
      'category': "معادن",
      "image": AppAssets.glass,
      'price': '100',
    },
    {
      'name': 'سخان',
      'category': "الالكترونيات",
      "image": AppAssets.heater,
      'price': '100',
    },
    {
      'name': 'حديد',
      'category': "معادن",
      "image": AppAssets.iron,
      'price': '100',
    },
    {
      'name': 'كيبورد',
      'category': "الالكترونيات",
      "image": AppAssets.keyboard,
      'price': '100',
    },
    {
      'name': 'كيسي',
      'category': "الالكترونيات",
      "image": AppAssets.kisa,
      'price': '100',
    },
    {
      'name': 'لابتوب',
      'category': "الالكترونيات",
      "image": AppAssets.laptop,
      'price': '100',
    },
    {
      'name': 'المسامير',
      'category': "معادن",
      "image": AppAssets.metalNails,
      'price': '1800',
    },
    {
      'name': 'موبايل',
      'category': "الالكترونيات",
      "image": AppAssets.mobile,
      'price': '100',
    },
    {
      'name': 'موس',
      'category': "الالكترونيات",
      "image": AppAssets.mouse,
      'price': '1080',
    },
    {
      'name': 'ورق',
      'category': "ورقيات",
      "image": AppAssets.paper,
      'price': '100',
    },
    {
      'name': 'بلاستيك',
      'category': "بلاستيك",
      "image": AppAssets.plastic,
      'price': '1080',
    },
    {
      'name': 'كيس بلاستيك',
      'category': "بلاستيك",
      "image": AppAssets.plasticBag,
      'price': '100',
    },
    {
      'name': 'طابعه',
      'category': "الالكترونيات",
      "image": AppAssets.printer,
      'price': '100',
    },
    {
      'name': 'روتر',
      'category': "الالكترونيات",
      "image": AppAssets.router,
      'price': '1080',
    },
    {
      'name': 'شاشه',
      'category': "الالكترونيات",
      "image": AppAssets.screen,
      'price': '100',
    },
    {
      'name': 'بوتاجاز',
      'category': "أدوات منزلية",
      "image": AppAssets.stove,
      'price': '1080',
    },
    {
      'name': 'غساله',
      'category': "أدوات منزلية",
      "image": AppAssets.washingMachine,
      'price': '100',
    },
    {
      'name': 'سلوك',
      'category': "معادن",
      "image": AppAssets.wires,
      'price': '100',
    },
    // {'name':'خشب ', 'category': "عبوات كرتون","image": AppAssets.wood,'price' : '100' },
    {
      'name': 'ألومنيوم',
      'category': "معادن",
      "image": AppAssets.alamonyom,
      'price': '170',
    },
    {
      'name': 'زجاجه',
      'category': "بلاستيك",
      "image": AppAssets.bottle,
      'price': '120',
    },
    {
      'name': 'بطاريه سياره',
      'category': "قطع غيار",
      "image": AppAssets.carBattery,
      'price': '180',
    },
    {
      'name': 'زيت سياره',
      'category': "زيوت",
      "image": AppAssets.carOil,
      'price': '1080',
    },
    {
      'name': 'سجاده',
      'category': "اقمشه",
      "image": AppAssets.carpet,
      'price': '4100',
    },
    {
      'name': 'كرتون',
      'category': "ورقيات",
      "image": AppAssets.carton,
      'price': '1040',
    },
    {
      'name': 'ملابس',
      'category': "اقمشه",
      "image": AppAssets.cloths,
      'price': '10',
    },
    {
      'name': 'زيت طبخ',
      'category': "زيوت",
      "image": AppAssets.cookOil,
      'price': '1200',
    },
    {
      'name': 'نحاس',
      'category': "معادن",
      "image": AppAssets.copper,
      'price': '100',
    },
    {
      'name': 'ثلاجه',
      'category': "أدوات منزلية",
      "image": AppAssets.fridge,
      'price': '1020',
    },
    {
      'name': 'زجاج',
      'category': "معادن",
      "image": AppAssets.glass,
      'price': '1200',
    },
  ];

  Widget build(BuildContext context) {
    List<Map<String, String>> filterProduct = productItems.where((p) {
      bool matchesCategory =
          categoryName == 'الكل' || p['category'] == categoryName;

      bool matchesSearch =
          searchText.isEmpty ||
          p['name']!.toLowerCase().contains(searchText.toLowerCase());

      return matchesCategory && matchesSearch;
    }).toList();

    if (filterProduct.isEmpty) {
      return Center(
        heightFactor: 20.h,
        child: Text(
          'لم يتم العثور على أي عناصر في هذه الفئة!',
          style: AppStyles.bold20Black,
        ),
      );
    }
    return filterProduct.isEmpty
        ? Center(
            heightFactor: 20.h,
            child: Text(
              'لم يتم العثور على أي عناصر في هذه الفئة!',
              style: AppStyles.bold20Black,
            ),
          )
        : SizedBox(
            height: 4000.h,
            child: GridView.builder(
              itemCount: filterProduct.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 18.w,
                childAspectRatio: 1 / 1.5,
              ),
              itemBuilder: (context, index) {
                return CategoryItem(
                  title: filterProduct[index]['name']!,
                  image: filterProduct[index]['image']!,
                  price: double.parse(filterProduct[index]['price']!),
                  description: filterProduct[index]['name']!,
                );
              },
            ),
          );
  }
}
