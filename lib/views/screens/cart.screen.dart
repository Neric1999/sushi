import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sushi/repo/provider/cart.items.provider.dart';
import 'package:sushi/views/widgets/meal.detail.widget.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text('Cart'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final cartItems = ref.watch(cartProvider);

          if (cartItems.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/shopping-cart.png',
                    width: 300,
                    color: const Color(0xFFFF6838),
                  ),
                  SizedBox(height: 16.h),
                  const Text(
                    'Your cart is empty start shopping now.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems.keys.elementAt(index);
              final quantity = cartItems[item]!;
              final totalPrice = item.price * quantity;

              return Card(
                margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                color: Colors.white,
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => MealDetails(
                                item: item,
                                img: item.image,
                                ingredients: item.ingredients,
                                description: item.description ?? '',
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 120.h,
                          width: 120.w,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Image.network(item.image, fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              height: 40.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.r),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 0.3.w,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.remove,
                                      color: Color.fromARGB(255, 158, 155, 155),
                                    ),
                                  ),
                                  Text(
                                    quantity.toString(),
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.add,
                                      color: Color.fromARGB(255, 118, 115, 115),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 14.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '\$${totalPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: const Color(0xFFFF6838),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 40.h),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/images/trash.png',
                              width: 25.w,
                            ),
                          ),
                        ],
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
