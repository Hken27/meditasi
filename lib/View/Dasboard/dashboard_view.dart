import 'package:flutter/material.dart';
import '../Componen/myTheme_dashboard.dart';
import '../Kursus/kursus_view.dart';
import '../Navbar/buttonNav_view.dart';
import 'componen/kursus_dashboard_view.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  double? screenWidth;

  @override
  Widget build(BuildContext context) {
    screenWidth ??= MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: MyTheme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.only(
          top: 30,
          left: 30,
          right: 30,
        ),
        children: [
          MyTheme.largeVerticalPadding,
          const Text(
            "Hi, Rendi!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text("Welcome to beauty salon"),
          SizedBox(
            height: screenWidth! / 1.7,
            child: Stack(alignment: Alignment.topCenter, children: [
              Column(
                children: [
                  const Spacer(flex: 1),
                  Expanded(
                      flex: 3,
                      child: Card(
                        color: MyTheme.catalogueCardColor,
                        child: Container(
                          width: double.infinity,
                        ),
                      ))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const Spacer(
                            flex: 1,
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 16.0, 16.0, 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const SizedBox(),
                                  const Expanded(
                                    child: FittedBox(
                                      alignment: Alignment.centerLeft,
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        // "Advance your \ncourses now",
                                        "Advance Yoga",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // GetxController.joinKursus()
                                    },
                                    child: const Text(
                                      "Join",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                  const Expanded(
                      flex: 3,
                      child: Image(
                          alignment: Alignment.topCenter,
                          image: AssetImage('assets/images/yoga.png')))
                ],
              )
            ]),
          ),
          MyTheme.mediumVerticalPadding,
          Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.search, color: MyTheme.grey),
                Text(
                  "Seach your courses",
                  style: TextStyle(color: MyTheme.grey),
                )
              ],
            ),
          )),
          const SizedBox(height: 5),
          MyTheme.mediumVerticalPadding,
          const HorizontalCategoriesView(),
          MyTheme.largeVerticalPadding,
          const Row(
            children: [
              Text("Popular courses",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Spacer(),
              Icon(Icons.tune)
            ],
          ),
          GridView.count(
            childAspectRatio: 0.75,
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              kartuKursus(
                  courseImage: const AssetImage('assets/images/tv.png'),
                  courseName: "How to become a YouTuber",
                  courseInfo: "Estimated 8 weeks",
                  coursePrice: "\$4.89"),
              kartuKursus(
                  courseImage: const AssetImage('assets/images/html.png'),
                  courseName: "Basic HTML for Dummies",
                  courseInfo: "Estimated 6 weeks",
                  coursePrice: "\$4.89"),
              kartuKursus(
                  courseImage:
                      const AssetImage('assets/images/cryptocurrency.png'),
                  courseName: "Introduction to Bitcoin",
                  courseInfo: "Estimated 11 weeks",
                  coursePrice: "\$6.49"),
              kartuKursus(
                  courseImage: const AssetImage('assets/images/globe.png'),
                  courseName: "The Internet of Things",
                  courseInfo: "Estimated 10 weeks",
                  coursePrice: "\$6.49"),
            ],
          )
        ],
      ),
      bottomNavigationBar: const ButtonNavbar(),
    );
  }

  Widget kartuKursus(
      {required AssetImage courseImage,
      required String courseName,
      required String courseInfo,
      required String coursePrice}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KursusView(
                courseName: courseName,
                courseImage: courseImage,
                courseInfo: courseInfo,
                coursePrice: coursePrice),
          ),
        );
      },
      child: Card(
          color: MyTheme.courseCardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: screenWidth! < 400 ? 3 : 5,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: courseImage,
                    ),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(courseName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(courseInfo,
                            style:
                                TextStyle(fontSize: 12, color: MyTheme.grey)),
                        MyTheme.smallVerticalPadding,
                        Text(
                          coursePrice,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}
