import 'package:flutter/material.dart';
import 'package:mindforcare/src/pages/chatbot/chatbot.dart';
import 'package:mindforcare/src/pages/caregiver/homepage.dart';
import 'package:mindforcare/src/pages/object_detection/lens.dart';

class bottomnavbar extends StatefulWidget {
  const bottomnavbar({Key? key}) : super(key: key);

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  int index = 0;

  final screens = const [
    HomePage(),
    ChatScreen(),
    objdetect(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          //*color of the selected icon
          indicatorColor: Colors.transparent,
          elevation: 0,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          backgroundColor: const Color(0xff4f4f4f),
          selectedIndex: index,
          onDestinationSelected: (index) {
            setState(() {
              this.index = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.chat),
              selectedIcon: Icon(Icons.chat,color: Color(0xa3ffffff),),
              label: 'Chat',
            ),
            NavigationDestination(
              icon: Icon(Icons.local_hospital_sharp),
              selectedIcon: Icon(Icons.local_hospital_sharp,color: Color(0xa3ffffff)),
              label: 'HealthBot',
            ),
            NavigationDestination(
              icon: Icon(Icons.center_focus_weak_outlined),
              selectedIcon: Icon(Icons.center_focus_weak_outlined,color: Color(0xa3ffffff)),
              label: 'Lens',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              selectedIcon: Icon(Icons.person,color: Color(0xa3ffffff)),
              label: 'Me',
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: index,
        children: screens,
      ),
      //screens[index],
    );
  }
}
