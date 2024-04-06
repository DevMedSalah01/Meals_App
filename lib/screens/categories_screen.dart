import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(20),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                catData.color,
                catData.title,
                catData.id,
              ),
            ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 4 / 3, // 300 height / 400 width
          crossAxisSpacing: 20,
          mainAxisSpacing: 30,
        ),
    );
  }
}
