import 'package:flutter/material.dart';
import 'package:gobidder/screens/products/productDetail.dart';
import 'package:gobidder/widgets/customText.dart';
import 'package:gobidder/widgets/theme.dart';

class HotProduct extends StatefulWidget {
  const HotProduct({super.key});

  @override
  State<HotProduct> createState() => _HotProductState();
}

class _HotProductState extends State<HotProduct> {
  final List<Map<String, String>> products = [
    {
      "name": "Luxury Watch",
      "image": "https://www.arzaan.pk/cdn/shop/products/76501931161466977_900x.jpg?v=1688590834",
      "price": "\$120",
      "time": "2h 30m left"
    },
    {
      "name": "Smartphone",
      "image": "https://www.arzaan.pk/cdn/shop/products/76501931161466977_900x.jpg?v=1688590834",
      "price": "\$300",
      "time": "1h 15m left"
    },
    {
      "name": "Leather Bag",
      "image": "https://www.arzaan.pk/cdn/shop/products/76501931161466977_900x.jpg?v=1688590834",
      "price": "\$90",
      "time": "4h 10m left"
    },
    {
      "name": "Running Shoes",
      "image": "https://www.arzaan.pk/cdn/shop/products/76501931161466977_900x.jpg?v=1688590834",
      "price": "\$80",
      "time": "3h 45m left"
    },
    {
      "name": "Leather Bag",
      "image": "https://www.arzaan.pk/cdn/shop/products/76501931161466977_900x.jpg?v=1688590834",
      "price": "\$90",
      "time": "4h 10m left"
    },
    {
      "name": "Running Shoes",
      "image": "https://www.arzaan.pk/cdn/shop/products/76501931161466977_900x.jpg?v=1688590834",
      "price": "\$80",
      "time": "3h 45m left"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              text: "Hot Collection",
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: products.map((product) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => productDetail()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 20, // same width as 2-column GridView
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)),
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
                ),
              );
            }).toList(),
          ),
        ),

      ],
    );
  }
}
