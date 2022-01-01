import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final Map<String, dynamic> userData;
  final String method;
  HomeView({required this.userData, required this.method});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$method"),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Log out"),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('${userData['picture']['data']['url']}'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text("${userData['name']}"),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text("${userData['email'] ?? 'No Email'}"),
          )
        ],
      ),
    );
  }
}
