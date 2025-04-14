import 'package:flutter/material.dart';
import 'package:gp2/instruction3.dart';

class Instrection2Page extends StatefulWidget {
  const Instrection2Page({super.key});

  @override
  _instrection2State createState() => _instrection2State();
}

class _instrection2State extends State<Instrection2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  // Background color
                ),
                child: Stack(children: [
                  Positioned(
                    top: -180,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'images/bbb.png',
                      fit: BoxFit.cover, // Maintain aspect ratio
                    ),
                  ),
                  Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        SizedBox(height: 10), // Move the text down by 10 steps
                        DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 17, // Increase font size
                              fontWeight: FontWeight.bold, // Make the text bold
                              color: Color.fromARGB(255, 21, 45, 92),
                            ),
                            child: Column(children: [
                              Text(
                                'First select the option what you want detect it \n',
                                textAlign: TextAlign
                                    .center, // Correctly align the text
                              ),
                              SizedBox(
                                  height: 1), // Space between text and button
                              ElevatedButton(
                                  onPressed: () {
                                    // Navigate to UserSelectionPage
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Instrection3Page()),
                                    );
                                  },
                                  child: Text('>'),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor:
                                        Color.fromARGB(255, 249, 247, 233),
                                    backgroundColor: Color.fromARGB(255, 19, 90,
                                        69), // Change the color of the text on the button
                                  ))
                            ]))
                      ]))
                ]))));
  }
}
