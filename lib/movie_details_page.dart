import 'package:flutter/material.dart';
import 'movie.dart';
import 'dart:math';
import 'package:untitled1/core/Widget/shared_main_button.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SharedIconButton(
                    icon: Icons.arrow_back,
                    onPressed: () => Navigator.pop(context),
                  ),
                  ClipRRect(
                    child: Image.asset(
                      'assets/Alps.jpg',
                      width: 94,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SharedIconButton(
                    icon: Icons.notifications_none,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/Progress.jpg',
                      width: 25,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Add New Movie - 4 of 6',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff565656),
                            fontFamily: 'DM Sans',
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                          'movie photo',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'DM Sans',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SharedMainButton(
                    label: 'Save',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Container(
                  width: 240,
                  height: 260,
                  child: Stack(
                    children: [
                      Container(
                        width: 240,
                        height: 164,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'There are no damages with this car',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              height: 1.0,
                              letterSpacing: 0.0,
                              color: Color(0xff565656),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        child: Center(
                          child: Container(
                            width: 117.45,
                            height: 130,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 61.27,
                        top: 41.81,
                        child: Container(
                          width: 105.82,
                          height: 88.18,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/car.jpg'),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 27.46,
                        left: 136.97,
                        child: Transform.rotate(
                          angle: pi / 4,
                          child: Image.asset(
                            'assets/Vector.jpg',
                            width: 38.83,
                            height: 20.21,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 147,
                            height: 46,
                            child: SharedMainButton(
                              label: 'Add new Damage',
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0D000000),
                    offset: Offset(0, -2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 87,
                    height: 27,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/Progress1.jpg',
                            width: 27,
                            height: 27,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'saving',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xffFFBA55),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 58,
                    child: SharedMainButton(
                      label: 'Next 4/6',
                      icon: Icons.arrow_forward,
                      type: ButtonType.icon,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
