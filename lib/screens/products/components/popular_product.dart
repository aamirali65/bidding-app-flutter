import 'package:flutter/material.dart';
import 'package:gobidder/screens/products/productDetail.dart';
import 'package:gobidder/widgets/customText.dart';
import 'package:gobidder/widgets/theme.dart';

class PopularProduct extends StatefulWidget {
  const PopularProduct({super.key});

  @override
  State<PopularProduct> createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {
  final List<Map<String, String>> products = [
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
      "name": "Cartier Cantos",
      "image": "https://m.media-amazon.com/images/I/712GPUC20oS._AC_SL1000_.jpg",
      "price": "\$80",
      "time": "3h 45m left"
    },
  ];

  @override
  Widget build(BuildContext context) {
    int half = (products.length / 2).ceil();
    List<Map<String, String>> firstRow = products.sublist(0, half);
    List<Map<String, String>> secondRow = products.sublist(half);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              text: "Popular Auctions",
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            MyText(
              text: "See All",
              color: Colors.grey.shade600,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            )
          ],
        ),
        const SizedBox(height: 16),

        // First scrollable row
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: firstRow.map((product) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: buildProductCard(context, product),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget buildProductCard(BuildContext context, Map<String, String> product) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => productDetail()),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
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
                        vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ThemeColor,
                    ),
                    child: MyText(
                      text: "BID",
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        text: "${product["price"]!} - ",
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
