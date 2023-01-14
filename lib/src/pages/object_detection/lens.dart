import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:file_picker/file_picker.dart';

import 'final.dart';

class objdetect extends StatefulWidget {
  const objdetect({super.key});

  @override
  State<objdetect> createState() => _objdetectState();
}

class _objdetectState extends State<objdetect> {
  bool _loading = false;
  File? _image;
  final picker = ImagePicker();

  _showDialog(title, text) {
    log("$text");
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 5), () {
            // Navigator.of(context).pop(true);
          });
          return AlertDialog(
            title: Text(title),
            content: Text("$text"),
            actions: [
              TextButton(
                onPressed: () {
                  int count = 0;
                  Navigator.of(context).popUntil((_) => count++ >= 2);
                },
                child: const Text('Ok'),
              )
            ],
          );
        });
  }

  send(File file) async {
    log("$file");
    // var api = Uri.parse("http://localhost:8000/object_detection/");
    // try {
    //   var response = await http.post(api, body: {"url": url});
    //   if (response.statusCode == 201) {
    //     final body = json.decode(response.body);
    //   }
    // } catch (error) {
    //   log("$error");
    // }
    // For getting processed data
    var dio = Dio();
    late Response<dynamic> response;
    log('Dio object created');
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(file.path),
    });
    log('Forma Data Built: ${formData.files}');
    String url = "http://34.134.0.212:8000/object_detection/";
    log('Uploading Data and waiting for response.....');
    try {
      response = await dio
          .post(url,
          data: formData,
          options: Options(method: 'POST', responseType: ResponseType.json))
          .onError((error, stackTrace) => _showDialog("Error", error));

      final parsedJson = jsonDecode(response.toString());
      FormData formData1 = FormData.fromMap({
        "name": parsedJson["image name"],
      });
      log('Forma Data Built: ${formData1.files}');
      String url1 = "http://34.134.0.212:8000/object_detection/getImage/";
      log('Uploading Data and waiting for response.....');
      response = await dio
          .post(url1,
          data: formData1,
          options:
          Options(method: 'POST', responseType: ResponseType.bytes))
          .onError((error, stackTrace) => _showDialog("Error", error));
      final imageData = Uint8List.fromList(response.data);
      setState(() {
        _loading = false;
      });
      if (mounted) {
        var classes = parsedJson["class"];
        classes = classes.toSet().toList();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Final(
                image: imageData,
                classes: classes,
              )),
        );
      }
    } catch (e) {
      log("$e");
      setState(() {
        _loading = false;
      });
    }
    // log("Image Name: ${parsedJson["image name"]}");
    // log("Class Names: ${parsedJson["class"]}");
    // log("${parsedJson["class"].runtimeType}");

    // For getting the image
  }

  pickImage() async {
    // ignore: deprecated_member_use
    var image = await picker.getImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
      log(image.path);
    });
    log("Calling Classify Function");
    send(_image!);
  }

  pickGalleryImage() async {
    late File image;
    FilePickerResult? result =
    await FilePicker.platform.pickFiles(allowCompression: false);

    if (result != null) {
      image = File(result.files.single.path!);
    }
    // ignore: deprecated_member_use
    // var image = await picker.getImage(source: ImageSource.gallery);
    // if (image == null) return null;

    // setState(() {
    //   _image = File(image.path);
    // });
    setState(() {
      _loading = true;
    });
    log("Calling Classify Function");
    send(image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff424242),
        title: const Text(
          'Object Detection',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xff303030),
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 70),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: const Color(0xFF494949),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: pickImage,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 200,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 17),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[600],
                              borderRadius: BorderRadius.circular(15)),
                          child: const Text(
                            'Take A Photo',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: pickGalleryImage,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 200,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 17),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[600],
                              borderRadius: BorderRadius.circular(15)),
                          child: const Text(
                            'Pick From Gallery',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (_loading)
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Color(0xff303030),),
                  child: const Center(child: CircularProgressIndicator()),
                )
            ],
          ),
        ),
      ),
    );
  }
}
