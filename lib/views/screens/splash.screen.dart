import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sushi/views/screens/home.screen.dart';
import 'package:sushi/views/widgets/button.widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (context) => const LoginScreen()));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: sized_box_for_whitespace
      body: Container(
        height: 1000,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/chicken.jpg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Color.fromARGB(137, 0, 0, 0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Positioned(
                top: 120,
                right: 0,
                left: 0,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/logo1.png',
                        width: 80,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Want do you want on dinner',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 400,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 120,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      width: 300,
                      child: Text(
                        'Enjoy delicious meals right 😋now',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Button(
                      txt: "Sign In",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      width: 320.w,
                      radius: 20,
                      color: const Color(0xFFFF6838),
                      fntColor: Colors.white,
                      fntSize: 25.sp,
                      fontWeight: FontWeight.w600,
                      height: 55.h,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
