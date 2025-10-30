import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:movie/ui/widgets/movie_list.dart';
import 'package:movie/ui/widgets/movie_list_popular.dart';
import 'package:movie/ui/widgets/movie_list_top.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    
    List<Container> cards = [
      Container(
        alignment: Alignment.center,
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage( 
            'assets/images/kucing.jpg',
          ),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage( 
            'assets/images/great.jpg',
          ),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage( 
            'assets/images/dark.jpg', 
          ),
        ),
      )
    ];
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 80,
              color: const Color.fromARGB(255, 3, 3, 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Now Playing',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),
            ),
            Container(
              height: 300,
              color: const Color.fromARGB(255, 3, 3, 3),
              child: CardSwiper(
                cardsCount: cards.length,
                cardBuilder: (context, index, percentThresholdX, percentThresholdY) => cards[index],
              ),
            ),
            MovieList(),
            MovieListPopular(),
            MovieListTop()
          ],
        ),
      ),
    );
  }
}
