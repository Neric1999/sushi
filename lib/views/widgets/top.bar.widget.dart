// top_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    // Check initial liked status
    _isLiked = ref.read(likedItemsProvider).contains(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 52,
      left: 30,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 55,
              width: 55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: Colors.white,
              ),
              child: Image.asset(
                'assets/images/Vector (5).png',
                width: 12,
              ),
            ),
          ),
          const SizedBox(width: 244),
          InkWell(
            onTap: () {
              setState(() {
                _isLiked = !_isLiked;
              });
              if (_isLiked) {
                ref.read(likedItemsProvider.notifier).addItem(widget.item);
              } else {
                ref.read(likedItemsProvider.notifier).removeItem(widget.item);
              }
            },
            child: Container(
              height: 55,
              width: 55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: Colors.white,
              ),
              child: Image.asset(
                _isLiked
                    ? 'assets/images/heart (2).png'
                    : 'assets/images/heart (3).png',
                width: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
