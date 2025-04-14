import 'package:flutter/material.dart';
import 'package:gp2/instruction2.dart';
// Ensure this import is correct

class InstructionPage extends StatelessWidget {
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
                      'images/aaa.png',
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
                                'This app will help you to detect drug user \n',
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
                                              Instrection2Page()),
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
