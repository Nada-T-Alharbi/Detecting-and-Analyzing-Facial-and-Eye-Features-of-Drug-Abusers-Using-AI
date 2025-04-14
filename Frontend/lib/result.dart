import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gp2/api_service.dart';


Future<Map<String, dynamic>> fetchData(File? image, int selectedIndex) async {
  ApiService api = ApiService();
  final response = await api.detectObjects(image!, selectedIndex);
  return response;
}

class DrugUserPage extends StatelessWidget {
  final File? image;
  final int selectedIndex;
  const DrugUserPage({Key? key, this.image, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Make the AppBar background transparent
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color(0xFF5d83c2),
                Color(0xff375e7a),
                Color(0xff30487c),
              ],
            ),
          ),
        ),

        title: const Text(' '),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Code to log out the user
            },
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: fetchData(image, selectedIndex),
          builder: (BuildContext context,
              AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // Assuming the data is a Map with a 'title' key
              // You can adjust this part based on the actual structure of your data
              return Text(
                '${snapshot.data}',
                style: TextStyle(fontSize: 16),
              );
            }
          },
        ),
      ),
    );
  }
}
