import 'package:flutter/material.dart';

class FeatureIcons extends StatelessWidget {
  final IconData newicon;
  final String text;
  final Widget page;

  const FeatureIcons({
    super.key,
    required this.newicon,
    required this.text,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
      Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
          return page;
          },));
          },
          child: ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                bottom: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Icon(
                newicon,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(text),
      ],
    );
  }
}
