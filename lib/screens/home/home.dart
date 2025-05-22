import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gobidder/screens/products/components/hot_product.dart';
import 'package:gobidder/screens/products/components/popular_product.dart';
import 'package:gobidder/screens/products/components/recommend_product.dart';
import 'package:gobidder/screens/search/search.dart';
import 'package:gobidder/widgets/category.dart';
import 'package:gobidder/widgets/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(), // Home
    SearchPage(), // Search
    Placeholder(child: Center(child: Text("Wishlist Page"))),
    Placeholder(child: Center(child: Text("Cart Page"))),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GoBidder",
          style: TextStyle(color: ThemeColor, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: Icon(FontAwesomeIcons.user),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.white,
      //   currentIndex: _selectedIndex,
      //   onTap: _onTabTapped,
      //   selectedItemColor: ThemeColor,
      //   unselectedItemColor: Colors.grey,
      //   type: BottomNavigationBarType.fixed,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: ""),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.bar_chart_outlined, size: 30),
      //       label: "",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_cart_outlined, size: 30),
      //       label: "",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person_outline_outlined, size: 30),
      //       label: "",
      //     ),
      //   ],
      // ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          spacing: 10,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SearchPage()),
                );
              },
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Find the best auctions",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Icon(Icons.search_outlined),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            CategorySelector(),
            RecommendProduct(),
            PopularProduct(),
            HotProduct(),
          ],
        ),
      ),
    );
  }
}
