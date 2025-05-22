import 'package:flutter/material.dart';
import 'package:gobidder/widgets/theme.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  final List<String> categories = ['Watches', 'Shoes', 'Bags', 'Phones', 'Laptops','Watches', 'Shoes', 'Bags', 'Phones', 'Laptops'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected ? ThemeColor : Colors.grey[300],
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: isSelected ? ThemeColor : Colors.transparent,
                ),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
