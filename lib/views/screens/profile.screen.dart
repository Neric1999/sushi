import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/image.png',
              fit: BoxFit.cover,
            ),
          ),
          // Body content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 70.h),
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Icon(
                        Icons.person,
                        size: 60.w,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  'Hey 👋',
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
                Text(
                  'Eric Trillionaire',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 30.h),
                Container(
                  height: 50.h,
                  width: 250.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6838),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/lorry.png',
                        width: 35,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Delivery Location',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 50.h,
                  width: 250.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/notification-bell.png',
                        width: 35,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Notification',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 50.h,
                  width: 250.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/wallet.png',
                        width: 35,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Payment Methods',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 50.h,
                  width: 250.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/people.png',
                        width: 35,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  width: 150.w,
                  height: 1.5.h,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(137, 54, 53, 53),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 50.h,
                  width: 250.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/logout (1).png',
                        width: 35,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Log out',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black54,
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
    );
  }
}
