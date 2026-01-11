import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';

class CartLocationPickerScreen extends StatefulWidget {
  const CartLocationPickerScreen({Key? key}) : super(key: key);

  @override
  State<CartLocationPickerScreen> createState() => _CartLocationPickerScreenState();
}

class _CartLocationPickerScreenState extends State<CartLocationPickerScreen> {
  final MapController _mapController = MapController();

  LatLng? _selectedLocation;
  LatLng _currentLocation = LatLng(30.0444, 31.2357);

  bool _isLoading = false;
  bool _isLoadingAddress = false;
  String _displayMessage = 'جاري تحديد موقعك الحالي...';
  String? _fullAddress;

  @override
  void initState() {
    super.initState();
    _getCurrentLocationAndSelect(); // تحديد الموقع تلقائياً عند فتح الصفحة
  }

  // الحصول على الموقع الحالي وتحديده تلقائياً
  Future<void> _getCurrentLocationAndSelect() async {
    setState(() => _isLoading = true);

    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _isLoading = false;
            _displayMessage = 'يرجى السماح بالوصول للموقع';
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _isLoading = false;
          _displayMessage = 'الرجاء تفعيل صلاحية الموقع من الإعدادات';
        });
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _selectedLocation = _currentLocation; // تحديد الموقع تلقائياً
        _isLoading = false;
      });

      _mapController.move(_currentLocation, 15.0);

      // الحصول على العنوان للموقع الحالي تلقائياً
      await _getAddressFromLatLng(_currentLocation);

    } catch (e) {
      setState(() {
        _isLoading = false;
        _displayMessage = 'تعذر الحصول على الموقع الحالي';
      });
    }
  }

  // تحويل الإحداثيات إلى عنوان
  Future<void> _getAddressFromLatLng(LatLng location) async {
    setState(() => _isLoadingAddress = true);

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];

        // بناء العنوان الكامل
        List<String> addressParts = [];

        if (place.street != null && place.street!.isNotEmpty) {
          addressParts.add(place.street!);
        }
        if (place.subLocality != null && place.subLocality!.isNotEmpty) {
          addressParts.add(place.subLocality!);
        }
        if (place.locality != null && place.locality!.isNotEmpty) {
          addressParts.add(place.locality!);
        }
        if (place.administrativeArea != null && place.administrativeArea!.isNotEmpty) {
          addressParts.add(place.administrativeArea!);
        }
        if (place.country != null && place.country!.isNotEmpty) {
          addressParts.add(place.country!);
        }

        String fullAddress = addressParts.join(', ');

        setState(() {
          _fullAddress = fullAddress.isNotEmpty
              ? fullAddress
              : 'الموقع: ${location.latitude.toStringAsFixed(5)}, ${location.longitude.toStringAsFixed(5)}';
          _displayMessage = _fullAddress!;
          _isLoadingAddress = false;
        });
      } else {
        setState(() {
          _fullAddress = 'الموقع: ${location.latitude.toStringAsFixed(5)}, ${location.longitude.toStringAsFixed(5)}';
          _displayMessage = _fullAddress!;
          _isLoadingAddress = false;
        });
      }
    } catch (e) {
      setState(() {
        _fullAddress = 'الموقع: ${location.latitude.toStringAsFixed(5)}, ${location.longitude.toStringAsFixed(5)}';
        _displayMessage = _fullAddress!;
        _isLoadingAddress = false;
      });
    }
  }

  // عند الضغط على الخريطة - تغيير الموقع يدوياً (اختياري)
  void _onMapTap(TapPosition tapPosition, LatLng latLng) {
    setState(() {
      _selectedLocation = latLng;
      _displayMessage = 'جاري تحميل العنوان...';
    });

    // الحصول على العنوان للموقع المختار
    _getAddressFromLatLng(latLng);
  }

  void _confirmLocation() {
    if (_selectedLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('الرجاء الانتظار حتى يتم تحديد موقعك'),
          backgroundColor: AppColors.redColor,
        ),
      );
      return;
    }

    // إرجاع الموقع والعنوان
    Navigator.pop(context, {
      'latitude': _selectedLocation!.latitude,
      'longitude': _selectedLocation!.longitude,
      'address': _fullAddress ?? 'عنوان غير محدد',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تأكيد موقع التوصيل', style: AppStyles.bold20Black),
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // الخريطة
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _currentLocation,
              initialZoom: 13.0,
              onTap: _onMapTap, // لو المستخدم عايز يغير الموقع
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.resave.app',
              ),

              // الموقع المحدد
              if (_selectedLocation != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _selectedLocation!,
                      width: 50,
                      height: 50,
                      alignment: Alignment.topCenter,
                      child: Icon(
                        Icons.location_pin,
                        color: AppColors.darkGreenColor,
                        size: 50,
                        shadows: [
                          Shadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),

          // مؤشر التحميل
          if (_isLoading)
            Container(
              color: Colors.black26,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      color: AppColors.darkGreenColor,
                      strokeWidth: 3,
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'جاري تحديد موقعك الحالي...',
                        style: AppStyles.bold16Black,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // بطاقة العنوان
          Positioned(
            top: 16.h,
            left: 16.w,
            right: 16.w,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.darkGreenColor,
                          size: 24,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            'عنوان التوصيل',
                            style: AppStyles.bold16Black,
                          ),
                        ),
                        if (_isLoadingAddress)
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.darkGreenColor,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      _displayMessage,
                      style: AppStyles.light16Gray,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (_selectedLocation != null) ...[
                      SizedBox(height: 12.h),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.darkGreenColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: AppColors.darkGreenColor,
                              size: 16,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'تم تحديد موقعك بنجاح',
                              style: TextStyle(
                                color: AppColors.darkGreenColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),

          // أزرار التحكم
          Positioned(
            right: 16.w,
            bottom: 100.h,
            child: Column(
              children: [
                // زر تكبير
                FloatingActionButton(
                  mini: true,
                  heroTag: 'zoom_in',
                  backgroundColor: AppColors.whiteColor,
                  onPressed: () {
                    _mapController.move(
                      _mapController.camera.center,
                      _mapController.camera.zoom + 1,
                    );
                  },
                  child: Icon(Icons.add, color: AppColors.darkGreenColor),
                ),
                SizedBox(height: 8.h),

                // زر تصغير
                FloatingActionButton(
                  mini: true,
                  heroTag: 'zoom_out',
                  backgroundColor: AppColors.whiteColor,
                  onPressed: () {
                    _mapController.move(
                      _mapController.camera.center,
                      _mapController.camera.zoom - 1,
                    );
                  },
                  child: Icon(Icons.remove, color: AppColors.darkGreenColor),
                ),
                SizedBox(height: 8.h),

                // زر إعادة تحديد الموقع الحالي
                FloatingActionButton(
                  mini: true,
                  heroTag: 'current_location',
                  backgroundColor: AppColors.darkGreenColor,
                  onPressed: _getCurrentLocationAndSelect,
                  child: Icon(Icons.my_location, color: AppColors.whiteColor),
                ),
              ],
            ),
          ),
        ],
      ),

      // زر تأكيد الموقع
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: (_isLoadingAddress || _isLoading || _selectedLocation == null)
                ? null
                : _confirmLocation,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.darkGreenColor,
              disabledBackgroundColor: Colors.grey,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            child: (_isLoadingAddress || _isLoading)
                ? SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: AppColors.whiteColor,
                strokeWidth: 2,
              ),
            )
                : Text(
              'تأكيد موقع التوصيل',
              style: AppStyles.bold24White,
            ),
          ),
        ),
      ),
    );
  }
}