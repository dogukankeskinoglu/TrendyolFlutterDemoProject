import 'package:demo/account/account_page.dart';
import 'package:demo/cart/ui/cart_page.dart';
import 'package:demo/favorite/favorite_page.dart';
import 'package:demo/home/home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: updateCurrentNavigationBar,
        children: const [
          HomePage(),
          FavoritePage(),
          CartPage(),
          AccountPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.amber[800],
        onTap: updatePage,
      ),
    );
  }

  updatePage(int currentIndex) {
    setState(() {
      _currentIndex = currentIndex;
      pageController.jumpToPage(currentIndex);
    });
  }

  updateCurrentNavigationBar(int currentIndex) {
    setState(() {
      _currentIndex = currentIndex;
    });
  }
}
