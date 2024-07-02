import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sushi/domain/models/brand.model.dart';
import 'package:sushi/repo/provider/cart.items.provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Cart'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final cartItems = ref.watch(cartProvider);

          if (cartItems.isEmpty) {
            return const Center(
              child: Text('Your cart is empty'),
            );
          }

          final groupedItems = _groupCartItems(cartItems);

          return ListView.builder(
            itemCount: groupedItems.length,
            itemBuilder: (context, index) {
              final item = groupedItems[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.network(item.image,
                          width: 60, height: 60, fit: BoxFit.cover),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item.description ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Quantity: ${item.quantity}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  List<CartItem> _groupCartItems(List<Item> cartItems) {
    final Map<String, CartItem> itemMap = {};

    for (var item in cartItems) {
      if (itemMap.containsKey(item.id)) {
        itemMap[item.id]!.quantity += 1;
        itemMap[item.id]!.price += item.price;
      } else {
        itemMap[item.id!] = CartItem(
          id: item.id!,
          image: item.image,
          name: item.name,
          description: item.description,
          price: item.price,
          quantity: 1,
        );
      }
    }

    return itemMap.values.toList();
  }
}

class CartItem {
  final String id;
  final String image;
  final String name;
  final String? description;
  double price;
  int quantity;

  CartItem({
    required this.id,
    required this.image,
    required this.name,
    this.description,
    required this.price,
    required this.quantity,
  });
}
