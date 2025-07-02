import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'movie_controller.dart';
import 'movie_tile.dart';
import 'movie_details_page.dart';
import 'package:untitled1/core/Widget/shared_main_button.dart';
 // ← استيراد الزر المشترك

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MovieController controller = Get.put(MovieController());

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.movies.isEmpty) {
          return Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/Progress.jpg',
                width: 25,
                height: 24,
                fit: BoxFit.cover,
              ),
            ),
          );
        }

        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20).copyWith(top: 44),
          children: [
            Row(
              children: [
                SharedIconButton(
                  icon: Icons.arrow_back,
                  onPressed: () => Navigator.pop(context),
                ),
                Expanded(
                  child: Center(
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/Alps.jpg',
                        width: 94,
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SharedIconButton(
                  icon: Icons.notifications_none,
                  onPressed: () {},
                ),
              ],
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Add New Movie - 4 of 6',
                          style: TextStyle(fontSize: 10, color: Color(0xff565656), fontFamily: 'DM Sans'),
                        ),
                        const SizedBox(height: 1),
                        const Text(
                          'movie photo',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'DM Sans'),
                        ),
                      ],
                    ),
                  ),
                ),
                SharedMainButton(
                  label: 'Save',
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              color: Colors.transparent,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Row(
                      children: [
                        Transform.rotate(
                          angle: 3.1416,
                          child: Icon(Icons.wb_incandescent, size: 20, color: Color(0xFFFEBC41)),
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Tips on uploading photos',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12, fontFamily: 'DM Sans'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 34, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
              Text('image_tip_1'.tr),
                        SizedBox(height: 4),
              Text('image_tip_2'.tr),
                        SizedBox(height: 4),
              Text('image_tip_3'.tr),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 0,
              childAspectRatio: 1.1,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: controller.movies.asMap().entries.map((entry) {
                int index = entry.key;
                var movie = entry.value;

                Widget tile = MovieTile(
                  movie: movie,
                  onTap: () => Get.to(() => MovieDetailsPage(movie: movie)),
                );

                if (index == 0) {
                  return Stack(
                    children: [
                      tile,
                      Positioned(
                        top: 9,
                        left: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(500),
                          child: Image.asset(
                            'assets/cover.jpg',
                            width: 61,
                            height: 24,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return tile;
              }).toList(),
            ),
            SizedBox(height: 10),
            Divider(color: Color(0xFFE5E7E9)),
            Container(
              width: 343,
              height: 336,
              margin: EdgeInsets.only(bottom: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10),
                  Container(
                    width: 343,
                    height: 37,
                    padding: EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Additional photos',
                          style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            height: 1.0,
                            color: Color(0xFF565656),
                            letterSpacing: 0,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Highlights some specific features such as Child seat, GPS, etc.',
                          style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            height: 14 / 12,
                            letterSpacing: 0,
                            color: Color(0xFF939393),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 344,
                    height: 279,
                    child: Padding(
                      padding: EdgeInsets.only(right: 0, bottom: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                child: Image.asset(
                                  'assets/detcar.jpg',
                                  width: 166,
                                  height: 126,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 42),
                              ClipRRect(
                                child: Image.asset(
                                  'assets/downcar.jpg',
                                  width: 166,
                                  height: 126,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 27),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/uplpho.jpg',
                              width: 167,
                              height: 126,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 393,
              height: 98,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Text(
                        'Saved',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff13B97D), fontFamily: 'DM Sans'),
                      ),
                      Text(
                        '04:51 PM',
                        style: TextStyle(fontSize: 14, color: Color(0xFF747474), fontFamily: 'DM Sans', fontWeight: FontWeight.w400),
                      ),
                    ],
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
        );
      }),
    );
  }
}
