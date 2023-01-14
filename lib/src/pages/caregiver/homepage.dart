import 'package:flutter/material.dart';

import '../../widgets/mainpage/carousels.dart';
import '../../widgets/mainpage/headings.dart';
import '../../widgets/mainpage/icons.dart';
import '../../widgets/mainpage/noti_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const Color(0xff424242),
        centerTitle: true,
        elevation: 0,
        actions: [
          const Icon(Icons.account_box_rounded),
          SizedBox(width: MediaQuery.of(context).size.width * 0.04),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: const [
                Titletext(),
              ],
            ),
            const NotificationButton(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Carouselslider(),
            const Services(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const HomeScreenIcons(),
          ],
        ),
      ),
    );
  }
}
