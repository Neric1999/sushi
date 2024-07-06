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
        title: const Text('Cart', style: TextStyle(color: Colors.black)),
        elevation: 0,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final cartItems = ref.watch(cartProvider);
          final cartNotifier = ref.read(cartProvider.notifier);

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
                    'Your cart is empty, start shopping now.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }

          double orderTotal = 0;
          cartItems.forEach((item, quantity) {
            orderTotal += item.price * quantity;
          });
          double deliveryFee = 5.00;
          double totalPrice = orderTotal + deliveryFee;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems.keys.elementAt(index);
                    final quantity = cartItems[item]!;
                    final itemTotalPrice = item.price * quantity;

                    return Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(50.r),
                          right: Radius.circular(10.r),
                        ),
                      ),
                      color: const Color.fromARGB(182, 241, 239, 239),
                      elevation: 5,
                      child: Row(
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
                              height: 100.h,
                              width: 100.w,
                              clipBehavior: Clip.hardEdge,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child:
                                  Image.network(item.image, fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    item.name,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  'x$quantity \$${itemTotalPrice.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    cartNotifier.addItem(item);
                                  },
                                  child: Image.asset(
                                    'assets/images/square.png',
                                    width: 20.w,
                                    color: const Color(0xFFFF6838),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  '$quantity',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                GestureDetector(
                                  onTap: () {
                                    cartNotifier.removeItem(item);
                                  },
                                  child: Image.asset(
                                    'assets/images/minus.png',
                                    width: 23.w,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order Total',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '\$${orderTotal.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '\$${deliveryFee.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Price',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '\$${totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20.r),
                      child: Container(
                        height: 60.h,
                        width: 300.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF6838),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          'Check Out',
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
