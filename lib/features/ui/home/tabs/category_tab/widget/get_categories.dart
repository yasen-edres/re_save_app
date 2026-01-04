import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/domain/entities/response/public/item.dart';
import 'package:re_save_app/features/ui/home/tabs/category_tab/cubit/category_state.dart';
import 'package:re_save_app/features/ui/home/tabs/category_tab/cubit/category_view_model.dart';
import 'package:re_save_app/features/ui/home/tabs/home_tab/widget/category_item.dart';

class GetCategories extends StatefulWidget {
  String categoryName;
  final String searchText;

  GetCategories({required this.categoryName, this.searchText = ''});


  @override
  State<GetCategories> createState() => _GetCategoriesState();
}

class _GetCategoriesState extends State<GetCategories> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    context.read<CategoryViewModel>().getItems();
  }
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryViewModel, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoryErrorState) {
          return Center(
            child: Text(state.message, style: AppStyles.bold22Black,),
          );
        } else if (state is CategorySuccessState) {
          final items = context
              .read<CategoryViewModel>()
              .items;
          List<Item> filterProduct = items.where((p) {
            bool matchesCategory =
                widget.categoryName == 'الكل' ||
                    p.category == widget.categoryName;

            bool matchesSearch =
                widget.searchText.isEmpty ||
                    p.name!.toLowerCase().contains(
                        widget.searchText.toLowerCase());

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
              padding: EdgeInsets.symmetric(
                  vertical: 20.h
              ),
              itemCount: filterProduct.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 5.w,
                childAspectRatio: 1 / 1.5,
              ),
              itemBuilder: (context, index) {
                return CategoryItem(
                  item: filterProduct[index],
                );
              },
            ),
          );
        } else {
          final items = context
              .read<CategoryViewModel>()
              .items;
          List<Item> filterProduct = items.where((p) {
            bool matchesCategory =
                widget.categoryName == 'الكل' ||
                    p.category == widget.categoryName;

            bool matchesSearch =
                widget.searchText.isEmpty ||
                    p.name!.toLowerCase().contains(
                        widget.searchText.toLowerCase());

            return matchesCategory && matchesSearch;
          }).toList();

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
              padding: EdgeInsets.symmetric(vertical: 20.h),
              itemCount: filterProduct.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 5.w,
                childAspectRatio: 1 / 1.5,
              ),
              itemBuilder: (context, index) {
                return CategoryItem(
                  item: filterProduct[index],
                );
              },
            ),
          );
        }
      },
    );
  }
}
