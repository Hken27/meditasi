import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Kursus/componen/kategori_kursus_view.dart';

class Category {
  final String title;
  bool isSelected;
  Category(this.title, this.isSelected);
}

List<Category> categoryList = [
  Category("Latest", false),
  Category("Popular", true),
  Category("Free", false),
  Category("Premium", false),
];

class HorizontalCategoriesView extends StatefulWidget {
  const HorizontalCategoriesView({Key? key}) : super(key: key);

  @override
  State<HorizontalCategoriesView> createState() =>
      _HorizontalCategoriesViewState();
}

class _HorizontalCategoriesViewState extends State<HorizontalCategoriesView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return KategoriCourse(
            category: categoryList[index],
            onPressed: (b) {
              for (var category in categoryList) {
                category.isSelected = false;
              }
              setState(() {
                categoryList[index].isSelected = true;
              });
            },
          );
        },
      ),
    );
  }
}

// class CategoryCard extends StatefulWidget {
//   final Category category;
//   final Function(bool) onPressed;

//   const CategoryCard(
//       {required this.category, required this.onPressed, Key? key})
//       : super(key: key);

//   @override
//   State<CategoryCard> createState() => _CategoryCardState();
// }

// class _CategoryCardState extends State<CategoryCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(5.0),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5.0),
//           color:
//               widget.category.isSelected ? Colors.white : Colors.transparent),
//       child: TextButton(
//           style: ButtonStyle(
//             overlayColor: MaterialStateProperty.all(Colors.transparent),
//           ),
//           onPressed: () {
//             widget.onPressed(true);
//           },
//           child: Text(widget.category.title,
//               style: TextStyle(
//                   color: widget.category.isSelected
//                       ? Colors.black
//                       : Colors.grey))),
//     );
//   }
// }
