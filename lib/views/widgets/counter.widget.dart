import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indexed/indexed.dart';

class CounterWidget extends ConsumerStatefulWidget {
  const CounterWidget({super.key});

  @override
  ConsumerState<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends ConsumerState<CounterWidget> {
  @override
  Widget build(BuildContext context) {
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
                        print('Removed');
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
                      child: const Text(
                        '2',
                        style: TextStyle(
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
                        print('Added');
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
