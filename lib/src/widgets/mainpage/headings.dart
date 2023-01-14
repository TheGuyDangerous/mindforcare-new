import 'package:flutter/material.dart';

class Titletext extends StatelessWidget {
  const Titletext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.04,
          left: MediaQuery.of(context).size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome, Caretaker!", //TODO: implement dynamic name
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.065),
          ),
        ],
      ),
    );
  }
}

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              right: 16,
              left: 16,
              bottom: 4,
            ),
            child: Row(
              children: [
                Text(
                  "Services",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.065),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
