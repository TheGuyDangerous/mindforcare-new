import 'package:flutter/material.dart';

class Final extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final image, classes;
  @override
  State<Final> createState() => _FinalState();

  const Final({super.key, this.image, this.classes});
}

class _FinalState extends State<Final> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Object Detection Output"),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.memory(widget.image),
            ),
            Row(
              children: [
                const Text(
                  "Classes:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child: Column(
                  children: List.generate(widget.classes.length,
                      (index) => Text(widget.classes[index])),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
