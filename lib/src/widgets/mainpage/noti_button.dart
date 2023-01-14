import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          bottom: MediaQuery.of(context).size.width * 0.01),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.055,
        child: ElevatedButton.icon(
            onPressed: null,
            icon: const Icon(
              Iconsax.notification,
              color: Colors.white,
            ),
            label: Text(
              "Send urgent notice to patient",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.background,
              backgroundColor: Theme.of(context).colorScheme.onBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            )),
      ),
    );
  }
}
