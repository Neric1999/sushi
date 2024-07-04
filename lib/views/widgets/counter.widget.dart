import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indexed/indexed.dart';
import 'package:sushi/domain/models/brand.model.dart';
import 'package:sushi/repo/provider/cart.items.provider.dart';

class CounterWidget extends ConsumerStatefulWidget {
  const CounterWidget({
    super.key,
    required this.item,
  });
  final Item item;

  @override
  ConsumerState<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends ConsumerState<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    final cartNotifier = ref.read(cartProvider.notifier);
    final itemCount = ref.watch(cartProvider).containsKey(widget.item)
        ? ref.watch(cartProvider)[widget.item]!
        : 0;

    return Indexer(
      children: [
        Positioned(
          top: 312,
          left: 128,
          child: Material(
            elevation: 20,
            shadowColor: const Color.fromARGB(255, 228, 103, 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19),
            ),
            child: Container(
              height: 70,
              width: 158,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: const Color.fromARGB(255, 238, 233, 233),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        cartNotifier.removeItem(widget.item);
                      },
                      child: const Icon(
                        Icons.remove,
                        size: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Container(
                      width: 56,
                      height: 56,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Text(
                        '$itemCount',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        cartNotifier.addItem(widget.item);
                      },
                      child: const Icon(
                        Icons.add,
                        size: 25,
                        color: Color(0xFFFF6838),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
