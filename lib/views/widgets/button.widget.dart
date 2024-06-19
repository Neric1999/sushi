import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  Button({
    super.key,
    required this.txt,
    required this.onTap,
    this.radius,
    this.width,
    this.height,
    this.color,
    this.fntColor,
    this.fntSize,
    this.icon,
    this.pad,
    this.fontWeight,
    this.iconSide,
  });
  String txt;
  void Function() onTap;
  double? radius;
  double? width;
  int? iconSide;

  double? height;
  Color? color;
  Color? fntColor;
  FontWeight? fontWeight;
  double? fntSize;
  Widget? icon;
  EdgeInsets? pad;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 49.h,
        width: width ?? 291.w,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(radius ?? 10.6.r),
        ),
        child: Padding(
          padding: pad ?? EdgeInsets.only(left: 11.83.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? const SizedBox.shrink(),
              Visibility(
                visible: icon != null,
                child: SizedBox(
                  width: 8.w,
                ),
              ),
              Text(
                txt,
                style: TextStyle(
                  fontSize: fntSize ?? 20.sp,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  color: fntColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
