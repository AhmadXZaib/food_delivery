import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/core/db_helper/db_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dbHelper = DBHelper();
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await dbHelper.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    log('message');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Name:${dbHelper.name}'),
          Text('Email:${dbHelper.email}'),
          Text('Password:${dbHelper.password}'),
          ElevatedButton(
            onPressed: () async {
              // await dbHelper.logOut(context);

              ClassName first = ClassName(data: 'data', name: ' name');
              ClassName second = ClassName(data: 'data', name: ' name');

              print(first == second);
            },
            child: const Text('logout'),
          ),
        ],
      ),
    );
  }
}

class ClassName {
  String name;
  String data;
  ClassName({required this.data, required this.name});
}
