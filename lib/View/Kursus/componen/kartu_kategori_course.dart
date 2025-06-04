// import 'package:flutter/material.dart';
// import '../../style/myTheme_dashboard.dart';
// import '../screen/kursus_view.dart';

// Widget kartuKursus({
//   required AssetImage courseImage,
//   required String courseName,
//   required String courseInfo,
//   required String coursePrice}) {
//   return GestureDetector(
//     onTap: () {
//       Navigator.push(
//         context, 
//         MaterialPageRoute(
//           builder:
//           (context) => KursusView(courseName: courseName, courseImage: courseImage, courseInfo: courseInfo, coursePrice: coursePrice),
//           ),
//       );

//     },
//     child: Card(
//         color: MyTheme.courseCardColor,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 flex: screenWidth! < 400 ? 3 : 5,
//                 child: Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(8.0),
//                   child: Image(
//                     image: courseImage,
//                   ),
//                 ),
//               ),
//               Expanded(
//                   flex: 4,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           alignment: Alignment.centerLeft,
//                           child: Text(courseName,
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.bold)),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 4.0,
//                       ),
//                       Text(courseInfo,
//                           style: TextStyle(fontSize: 12, color: MyTheme.grey)),
//                       MyTheme.smallVerticalPadding,
//                       Text(
//                         coursePrice,
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ))
//             ],
//           ),
//         )),
//   );
// }
