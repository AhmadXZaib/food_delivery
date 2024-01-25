import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/core/db_helper/db_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    DBHelper().getData();
  }

  @override
  Widget build(BuildContext context) {
    log('message');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Name:${DBHelper().name}'),
          Text('Email:${DBHelper().email}'),
          Text('Password:${DBHelper().password}'),
          ElevatedButton(
            onPressed: () async {
              await DBHelper().logOut(context);
            },
            child: const Text('logout'),
          ),
        ],
      ),
    );
  }
}
