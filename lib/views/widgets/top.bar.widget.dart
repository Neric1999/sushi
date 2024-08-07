import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sushi/domain/models/brand.model.dart';
import 'package:sushi/repo/provider/liked.items.provider.dart';

class TopBar extends ConsumerStatefulWidget {
  const TopBar({
    super.key,
    required this.item,
  });
  final Item item;

  @override
  ConsumerState<TopBar> createState() => _TopBarState();
}

class _TopBarState extends ConsumerState<TopBar> {
  @override
  Widget build(BuildContext context) {
    // Watch the liked items provider to get real-time updates
    final likedItems = ref.watch(likedItemsProvider);
    final isLiked =
        likedItems.isNotEmpty && likedItems.any((i) => i.id == widget.item.id);
    print('Items are $likedItems and $isLiked');

    return Positioned(
      top: 52.h,
      left: 30.w,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 55.h,
              width: 55.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19.r),
                color: Colors.white,
              ),
              child: Image.asset(
                'assets/images/Vector (5).png',
                width: 12.w,
              ),
            ),
          ),
          SizedBox(width: 240.w),
          InkWell(
            onTap: () {
              setState(() {
                ref.read(likedItemsProvider.notifier).toggleItem(widget.item);
              });
            },
            child: Container(
              height: 55.h,
              width: 55.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19.r),
                color: Colors.white,
              ),
              child: Image.asset(
                isLiked
                    ? 'assets/images/heart (3).png'
                    : 'assets/images/heart (2).png',
                width: 24.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
