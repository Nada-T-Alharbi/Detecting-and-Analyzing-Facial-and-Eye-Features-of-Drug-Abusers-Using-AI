import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'upload.dart';

import 'package:camera/camera.dart';
import 'takepic.dart';

class UserSelectionPage extends StatefulWidget {
  const UserSelectionPage({super.key});

  @override
  _UserSelectionPageState createState() => _UserSelectionPageState();
}

class _UserSelectionPageState extends State<UserSelectionPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 74, 127, 101),
            Color.fromARGB(255, 19, 90, 69),
            Color.fromARGB(255, 18, 60, 94),
          ],
        ),
      ),
      child: Scaffold(
          appBar: AppBar(
            title: const Text(' '),
            // Make the app bar transparent
            elevation: 0, // Remove shadow
          ),
          body: Stack(children: [
            Positioned.fill(
              child: Image.asset(
                'images/bb.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 74, 127, 101),
                      Color.fromARGB(255, 19, 90, 69),
                      Color.fromARGB(255, 18, 60, 94),
                    ], // background color
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: BoxBorder.lerp(null, null, 4),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        const Color.fromARGB(255, 101, 96, 96)
                                            .withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(60),
                              child: Column(children: [
                                const Text(
                                  "Detect by:",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 9, 32, 79),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                SizedBox(height: 20),
                                Column(
                                  children: [
                                    RadioListTile<int>(
                                      title: Row(
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye,
                                            color:
                                                Color.fromARGB(255, 71, 69, 69),
                                            size: 24,
                                          ),
                                          SizedBox(width: 16),
                                          Text('Eye',
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 10, 9, 9))),
                                        ],
                                      ),
                                      value: 0,
                                      groupValue: _selectedIndex,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedIndex = value!;
                                        });
                                      },
                                      activeColor:
                                          const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    RadioListTile<int>(
                                      title: Row(
                                        children: [
                                          Icon(
                                            Icons.face,
                                            color:
                                                Color.fromARGB(255, 71, 69, 69),
                                            size: 24,
                                          ),
                                          SizedBox(width: 16),
                                          Text('Face',
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 10, 9, 9))),
                                        ],
                                      ),
                                      value: 1,
                                      groupValue: _selectedIndex,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedIndex = value!;
                                        });
                                      },
                                      activeColor:
                                          const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),

                                ElevatedButton(
                                    onPressed: () {
                                      if (_selectedIndex == 0) {
                                        // Perform eye detection operation here
                                        print('Eye detection selected');
                                      } else if (_selectedIndex == 1) {
                                        // Perform face detection operation here
                                        print('Face detection selected');
                                      }
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                 UploadPage(selectedIndex: _selectedIndex,)),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor:
                                            Color.fromARGB(255, 18, 90, 68),
                                        backgroundColor:
                                            Color.fromARGB(255, 253, 253, 253),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )),
                                    child: const Text('Upload photo')),

                                const SizedBox(height: 20),

                                // Camera Button
                                ElevatedButton(
                                    onPressed: () async {
                                      if (_selectedIndex == 0) {
                                        // Perform eye detection operation here
                                        print('Eye detection selected');
                                      } else if (_selectedIndex == 1) {
                                        // Perform face detection operation here
                                        print('Face detection selected');
                                      }
                                      await availableCameras().then((cameras) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TakePictureScreen(
                                                      camera: cameras.first)),
                                        );
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor:
                                            Color.fromARGB(255, 19, 90, 68),
                                        backgroundColor:
                                            Color.fromARGB(255, 253, 254, 255),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )),
                                    child: const Text('Take photo')),
                              ])))
                    ]))
          ])),
    );
  }
}
