import 'package:flutter/material.dart';
import 'package:gobidder/widgets/customText.dart';
import 'package:gobidder/widgets/theme.dart';

class productDetail extends StatefulWidget {
  const productDetail({super.key});

  @override
  State<productDetail> createState() => _productDetailState();
}

class _productDetailState extends State<productDetail> {
  final List<Map<String, dynamic>> bids = [
    {
      "name": "John Doe",
      "amount": 230,
      "image": "https://www.perkosis.com/uploads/staffs/big/9.jpg",
      "direction": "up"
    },
    {
      "name": "Alice Smith",
      "amount": 220,
      "image": "https://www.perkosis.com/uploads/staffs/big/8.jpg",
      "direction": "down"
    },
    {
      "name": "Mark Evans",
      "amount": 240,
      "image": "https://www.perkosis.com/uploads/staffs/big/9.jpg",
    "direction": "down"
    },
    {
      "name": "Sophia Ray",
      "amount": 215,
      "image": "https://www.perkosis.com/uploads/staffs/big/8.jpg",
      "direction": "down"
    },
  ];

  final TextEditingController _bidController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Auction Detail",
          style: TextStyle(color: ThemeColor, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image
                    Container(
                      width: double.infinity,
                      height: screenHeight * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://www.arzaan.pk/cdn/shop/products/76501931161466977_900x.jpg?v=1688590834",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Title
                    MyText(
                      text: "Rolex 202 Men",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 15),

                    // Description
                    MyText(
                      text: "This is a detailed description of the auction product.",
                      fontSize: 18,
                      color: Colors.grey[700]!,
                      fontWeight: FontWeight.normal,
                    ),
                    const SizedBox(height: 15),

                    // Information Detail Header
                    MyText(
                      text: "Information Detail",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 10),

                    // Info Row 1
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Size", style: TextStyle(color: Colors.grey.shade700)),
                            const SizedBox(height: 4),
                            MyText(
                              text: "38",
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Author", style: TextStyle(color: Colors.grey.shade700)),
                            const SizedBox(height: 4),
                            MyText(
                              text: "Miss Angle",
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Info Row 2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Auction End", style: TextStyle(color: Colors.grey.shade700)),
                            const SizedBox(height: 4),
                            MyText(
                              text: "07h 25min",
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Price", style: TextStyle(color: Colors.grey.shade700)),
                            const SizedBox(height: 4),
                            MyText(
                              text: "\$200",
                              color: ThemeColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Highest Bids Card
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: "Highest Bids",
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(height: 16),

                            // Bids List
                            ...bids.map((bid) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundImage: NetworkImage(bid['image']),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            bid['name'],
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "Bid: \$${bid['amount']}",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (bid.containsKey('direction'))
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: bid['direction'] == 'up'
                                              ? ThemeColor
                                              : Colors.lightBlue.shade100,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          bid['direction'] == 'up'
                                              ? Icons.arrow_upward
                                              : Icons.arrow_downward,
                                          size: 18,
                                          color: bid['direction'] == 'up'
                                              ? Colors.white
                                              : ThemeColor,
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      /// Bottom Button
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyText(
                        text: "Place Your Bid",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _bidController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter bid amount",
                          prefixIcon: Icon(Icons.attach_money),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeColor
                            )
                          )
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Handle bid logic here
                          String bidValue = _bidController.text;
                          if (bidValue.isNotEmpty) {
                            Navigator.pop(context);
                            // Optionally clear the controller
                            _bidController.clear();
                            // You can also update state or show a Snackbar
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeColor,
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Submit Bid",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ThemeColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            "Place a Bid",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
