import 'package:flutter/material.dart';

BottomNavigationBar bottomNavigationBar() {
  return BottomNavigationBar(
    currentIndex: 0,
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(
        icon: Image.asset("assets/images/Tab 6.png"),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Image.asset("assets/images/Tab 2.png"),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Image.asset("assets/images/Tab 3.png"),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Image.asset("assets/images/Tab 5.png"),
        label: "",
      ),
    ],
    onTap: (index) {},
  );
}
