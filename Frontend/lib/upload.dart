import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'result.dart';

class UploadPage extends StatefulWidget {
  final int selectedIndex;

  const UploadPage({super.key, Key? customKey, required this.selectedIndex});

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final ImagePicker _picker = ImagePicker();
  File? _pickedImage; // Changed XFile to File
  Uint8List webImage = Uint8List(8);

  @override
  void initState() {
    super.initState();
  }

  Future<void> _takePhoto() async {
    if (!kIsWeb) {
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print("No image picked");
      }
    } else if (kIsWeb) {
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        print("No image picked");
      }
    } else {
      print("Something went wrong");
    }
  }

  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print("No image picked");
      }
    } else if (kIsWeb) {
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        print("No image picked");
      }
    } else {
      print("Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate back to the previous page when the back button is pressed
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Upload'),
          automaticallyImplyLeading: true, // Add a back button on the AppBar
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color.fromARGB(255, 74, 127, 101),
                Color.fromARGB(255, 19, 90, 69),
                Color.fromARGB(255, 19, 90, 69),
              ],
            ),
            // Set the background color to #5d83c2
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Welcome Text
              const Text(
                "Uploading...",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              const SizedBox(height: 10),
              // Subtitle Text
              const Text(
                "Upload image To Unmask Hidden Dangers",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 30),
              // Upload Button
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Upload Image'),
              ),
              const SizedBox(height: 30),

              // Uploaded Image
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 74, 127, 101),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _pickedImage != null
                    ? kIsWeb
                        ? Image.memory(webImage, fit: BoxFit.fill)
                        : Image.file(_pickedImage!, fit: BoxFit.fill)
                    : const CircularProgressIndicator(),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DrugUserPage(
                              image: _pickedImage,
                              selectedIndex: widget.selectedIndex)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 74, 127, 101),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  child: const Text('Next')),
            ],
          ),
        ),
      ),
    );
  }
}
