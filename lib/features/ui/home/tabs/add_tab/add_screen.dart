import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/features/widget/custom_elevatedbutton.dart';
import 'package:re_save_app/features/widget/custom_text_form_field.dart';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String selectedOption = 'بلاستيك';
  bool isCheck = false;

  List<String> options = [
    'بلاستيك',
    'الالكترونيات',
    'أدوات منزلية',
    'معادن',
    'عبوات كرتون',
    'ورقيات',
    'قطع غيار',
    'زيوت',
    'اقمشه',
  ];

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
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 30.h, left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('تفاصيل البكيا جديدة', style: AppStyles.bold22Black),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('الصور', style: AppStyles.bold18Black),
                TextButton(
                  onPressed: () {
                    //todo: add photo
                    showBottomSheet(context);
                  },
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.add, color: AppColors.darkGreenColor),
                      SizedBox(width: 10.w),
                      Text('إضافة', style: AppStyles.bold18Green),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 18.w, horizontal: 100.h),
              decoration: BoxDecoration(
                color: AppColors.lightGrayColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'لم يتم إرفاق أي صور بعد.',
                style: AppStyles.light16Gray,
              ),
            ),
            SizedBox(height: 20.h),
            Text('تفاصيل البكيا', style: AppStyles.bold20Black),
            SizedBox(height: 10.h),
            Text('التصنيف', style: AppStyles.bold18Black),
            SizedBox(height: 10.h),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                items: options
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ),
                    )
                    .toList(),
                value: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value as String;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                    color: Colors.transparent,
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Text('اسم البكيا', style: AppStyles.bold18Black),
            SizedBox(height: 5.h),
            CustomTextFormField(
              filledColor: AppColors.transparentColor,
              borderColor: AppColors.grayColor,
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Checkbox(
                  value: isCheck,
                  fillColor: MaterialStateProperty.all(
                      isCheck ? AppColors.darkGreenColor : AppColors
                          .transparentColor
                  ),
                  onChanged: (value) {
                    isCheck = value!;
                    setState(() {});
                  },
                ),
                Expanded(
                  child: Text(
                    'لقد تلقينا طلبك وسنتصل بك قريباً.',
                    style: AppStyles.light16Black,
                  ),
                ),
              ],
            ),
            Spacer(),
            CustomElevatedButton(
                text: 'تأكيد',
                onPressed: () {
                  //todo: save order
                },
                backgroundColor: AppColors.darkGreenColor,
                textStyle: AppStyles.bold24White
            )
          ],
        ),
      ),
    );
  }

  Future showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('إلتقط الصور', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: pickItem(
                      icon: Icons.photo_library_outlined,
                      text: 'إلتقط من الهاتف',
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: pickItem(
                      icon: Icons.camera_alt_outlined,
                      text: 'إلتقط من الكاميرا',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget pickItem(
      {required IconData icon, required String text, required VoidCallback onTap,}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.green),
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
