import 'package:flutter/material.dart';

import '../../Dasboard/componen/kursus_dashboard_view.dart';

class KategoriCourse extends StatefulWidget {
  final Category category;
  final Function(bool) onPressed;
  const KategoriCourse(
      {required this.category, required this.onPressed, Key? key})
      : super(key: key);

  @override
  State<KategoriCourse> createState() => _KategoriCourseState();
}

class _KategoriCourseState extends State<KategoriCourse> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: widget.category.isSelected ? Colors.white : Colors.transparent,
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {
          widget.onPressed(true);
        },
        child: Text(
          widget.category.title,
          style: TextStyle(
              color: widget.category.isSelected ? Colors.black : Colors.grey),
        ),
      ),
    );
  }
}
