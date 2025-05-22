import 'package:flutter/material.dart';
import 'package:gobidder/widgets/category.dart';
import 'package:gobidder/widgets/customText.dart';
import 'package:gobidder/widgets/theme.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';
  String sortBy = 'None';
  bool showFilters = false; // Flag to toggle visibility of filter options

  List<Map<String, String>> products = [
    {
      "name": "Cartier Cantos",
      "image": "https://m.media-amazon.com/images/I/712GPUC20oS._AC_SL1000_.jpg",
      "price": "\$80",
      "time": "3h 45m left"
    },  {
      "name": "Rolex Datejust",
      "image": "https://i0.wp.com/studio56.pk/wp-content/uploads/2024/01/YIKAZE-Retro-Men-s-Watches-Classic-Luxury-Business-Quartz-Watch-Fashion-Big-Dial-Leather-Strap-Date.webp?fit=800%2C800&ssl=1",
      "price": "\$300",
      "time": "1h 15m left"
    },
    {
      "name": "Rolex's Watch",
      "image": "https://www.arzaan.pk/cdn/shop/products/76501931161466977_900x.jpg?v=1688590834",
      "price": "\$90",
      "time": "4h 10m left"
    },
    {
      "name": "Richert Millie",
      "image": "https://www.horusstraps.com/cdn/shop/articles/287307476_1453285801777126_842872283748307799_n.jpg?v=1710827368",
      "price": "\$300",
      "time": "1h 15m left"
    },
    {
      "name": "Rolex's Watch",
      "image": "https://www.arzaan.pk/cdn/shop/products/76501931161466977_900x.jpg?v=1688590834",
      "price": "\$90",
      "time": "4h 10m left"
    },
  ];

  List<Map<String, String>> get filteredProducts {
    List<Map<String, String>> results =
        products
            .where(
              (p) => p['name']!.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();

    if (sortBy == 'Price: Low to High') {
      results.sort(
        (a, b) => int.parse(a['price']!).compareTo(int.parse(b['price']!)),
      );
    } else if (sortBy == 'Price: High to Low') {
      results.sort(
        (a, b) => int.parse(b['price']!).compareTo(int.parse(a['price']!)),
      );
    } else if (sortBy == 'Time: Ending Soonest') {
      results.sort(
        (a, b) => a['time']!.compareTo(b['time']!),
      ); // basic string compare
    }

    return results;
  }

  void toggleFilters() {
    setState(() {
      showFilters = !showFilters; // Toggle the visibility of the filter options
    });
  }

  Widget buildProductCard(Map<String, String> product) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 20,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  product["image"]!,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ThemeColor,
                  ),
                  child: const MyText(
                    text: "BID",
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: MyText(
                    text: product["name"]!,
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text: "\$${product["price"]!} - ",
                      color: Colors.grey[700]!,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                    MyText(
                      text: product["time"]!,
                      color: ThemeColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        centerTitle: true,
        title: MyText(
          text: "Search",
          color: ThemeColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            spacing: 15,
            children: [
              TextFormField(
                autofocus: true,
                onChanged: (val) => setState(() => query = val),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Find the best auctions",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.search_outlined),
                  suffixIcon: IconButton(
                    onPressed: toggleFilters,
                    icon: Icon(Icons.filter_list_outlined),
                  ),
                ),
              ),
              CategorySelector(),

              // Toggle Filters
              if (showFilters)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButton<String>(
                        value: sortBy == 'None' ? null : sortBy,
                        hint: const Text("Sort By"),
                        items: [
                          DropdownMenuItem(
                            value: 'Price: Low to High',
                            child: Text('Price: Low to High'),
                          ),
                          DropdownMenuItem(
                            value: 'Price: High to Low',
                            child: Text('Price: High to Low'),
                          ),
                          DropdownMenuItem(
                            value: 'Time: Ending Soonest',
                            child: Text('Time: Ending Soonest'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            sortBy = value ?? 'None';
                          });
                        },
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            sortBy = 'None';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                          decoration: BoxDecoration(
                            color: ThemeColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: MyText(
                            text: "Reset",
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   style: ButtonStyle(
                      //     backgroundColor: MaterialStateProperty.all(ThemeColor),
                      //     foregroundColor: MaterialStateProperty.all(Colors.white),
                      //   ),
                      //   onPressed: () {
                      //     setState(() {
                      //       sortBy = 'None';
                      //     });
                      //   },
                      //   child: const Text("Reset"),
                      // )
                    ],
                  ),
                ),
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: filteredProducts.map(buildProductCard).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
