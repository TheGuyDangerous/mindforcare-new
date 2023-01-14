import 'package:flutter/material.dart';
import 'package:mindforcare/src/pages/Notes/screens/notes_page.dart';
import 'package:mindforcare/src/pages/caregiver/homepage.dart';

import '../../model/homepage/icon_model.dart';

class HomeScreenIcons extends StatelessWidget {
  const HomeScreenIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            FeatureIcons(
              newicon: Icons.location_on,
              text: 'Track',
              page: HomePage(),
            ),
            FeatureIcons(
              newicon: Icons.alarm,
              text: 'Reminder',
              page: HomePage(),
            ),
            FeatureIcons(
              newicon: Icons.calendar_today,
              text: 'Calender',
              page: HomePage(),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            FeatureIcons(
              newicon: Icons.note_add_sharp,
              text: 'Notes',
              page: NotesPage(),
            ),
            FeatureIcons(
              newicon: Icons.newspaper,
              text: 'News',
              page: HomePage(),
            ),
            FeatureIcons(
              newicon: Icons.chat_bubble_outline,
              text: 'Discuss',
              page: HomePage(),
            ),
          ],
        ),
      ],
    );
  }
}
