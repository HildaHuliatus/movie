import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie/ui/widgets/movie_list.dart';
import 'package:movie/ui/widgets/movie_list_popular.dart';
import 'package:movie/ui/widgets/movie_list_top.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  
  final List<String> imagePaths = [
    'assets/images/kucing.jpg',
    'assets/images/great.jpg',
    'assets/images/great.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            Container(
              height: 80,
              color: Colors.black,
              alignment: Alignment.center,
              child: const Text(
                'Now Playing',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index, realIndex) {
                      final imagePath = imagePaths[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 300,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 0.9,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imagePaths.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => setState(() {
                          _currentIndex = entry.key;
                        }),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: _currentIndex == entry.key ? 12.0 : 8.0,
                          height: _currentIndex == entry.key ? 12.0 : 8.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == entry.key
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            
            const MovieList(),
            const MovieListPopular(),
            const MovieListTop(),
          ],
        ),
      ),
    );
  }
}
