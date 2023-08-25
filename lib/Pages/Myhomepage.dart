import 'package:flutter/material.dart';
import 'package:task3ahmed_faisal/Pages/cart_page.dart';
import 'package:task3ahmed_faisal/Pages/Products_page.dart';
import 'package:task3ahmed_faisal/Pages/Profile.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  int currentIndex = 0;

  void getPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> screens = [
    const Products(),
    const Cartpage(),
    const Profilepage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7F8),
      body: screens[currentIndex],
      bottomSheet: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(25),
          color: const Color(0xff300046)
        ),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            getPage(index);
          },
          items: const [
            BottomNavigationBarItem(icon:
            Icon(Icons.home_filled),
                label: 'home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_sharp),
              label: 'Profile',
            ),
          ],
          backgroundColor:   Colors.transparent,
          selectedItemColor: const Color(0xffFFFFFF),
          selectedLabelStyle: const TextStyle(
            fontSize: 15,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
            color: Color(0xffFFFFFF),
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 15,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
            color: Color(0xff8391A1),
          ),
          unselectedItemColor: const Color(0xff8391A1),
        ),
      ),
    );
  }
}
