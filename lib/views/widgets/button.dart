import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button1 extends StatelessWidget {
  const Button1({
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
    required this.isSelected,
  });

  final String txt;
  final void Function() onTap;
  final double? radius;
  final double? width;
  final int? iconSide;
  final bool isSelected;
  final double? height;
  final Color? color;
  final Color? fntColor;
  final FontWeight? fontWeight;
  final double? fntSize;
  final Widget? icon;
  final EdgeInsets? pad;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius ?? 10.6.r),
      child: Container(
        alignment: Alignment.center,
        height: height ?? 49.h,
        width: width ?? 291.w,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFFF6838)
              : const Color.fromARGB(255, 250, 250, 250),
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
                child: SizedBox(width: 8.w),
              ),
              Text(
                txt,
                style: TextStyle(
                  fontSize: fntSize ?? 20.sp,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
