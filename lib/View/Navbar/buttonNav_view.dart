import 'package:flutter/material.dart';
import '../Componen/button_nav_model.dart';
import '../Componen/button_paint_dashboard_model.dart';
import '../Dasboard/dashboard_view.dart';
import '../Kalender/kalaender_view.dart';
import '../Profile/profile_view.dart';
import '../Webview/webview_view.dart';

class ButtonNavbar extends StatefulWidget {
  const ButtonNavbar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ButtonNavbarState createState() => _ButtonNavbarState();
}

class _ButtonNavbarState extends State<ButtonNavbar> {
  int _selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 56;

    const primaryColor = Colors.orange;
    const secondaryColor = Colors.black54;
    const backgroundColor = Color(0xFFF7F7F7);

    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, height + 6),
            painter: ButtonPaint(backgroundColor: backgroundColor),
          ),
          Center(
            heightFactor: 0.6,
            child: FloatingActionButton(
              backgroundColor: primaryColor,
              elevation: 0.1,
              onPressed: () {
                setState(() {
                  _selectedButtonIndex = 4;
                });
              },
              child: const Icon(Icons.settings_outlined),
            ),
          ),
          SizedBox(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonIcon(
                  text: "Home",
                  icon: Icons.home_outlined,
                  selected: _selectedButtonIndex == 0,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CatalogScreen()));
                    setState(() {
                      _selectedButtonIndex = 0;
                    });
                  },
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                ButtonIcon(
                  text: "Kamera",
                  icon: Icons.camera_alt_outlined,
                  selected: _selectedButtonIndex == 1,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const GitHub()));
                    setState(() {
                      _selectedButtonIndex = 1;
                    });
                  },
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                const SizedBox(width: 56),
                ButtonIcon(
                  text: "Calendar",
                  icon: Icons.date_range_outlined,
                  selected: _selectedButtonIndex == 2,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HolidayListPage()));
                    setState(() {
                      _selectedButtonIndex = 2;
                    });
                  },
                  selectedColor: primaryColor,
                  defaultColor: secondaryColor,
                ),
                ButtonIcon(
                  text: "Profile",
                  icon: Icons.account_circle_outlined,
                  selected: _selectedButtonIndex == 3,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                    setState(() {
                      _selectedButtonIndex = 3;
                    });
                  },
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
