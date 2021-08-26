
import 'package:chatapp/widgets/category_selector.dart';
import 'package:chatapp/widgets/favourite_contacts.dart';
import 'package:chatapp/widgets/recent_chats.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          iconSize: 30.0,
          onPressed: () {  },

        ),
        centerTitle: true,
        elevation: 0.0,
        title: const Text(
          'Chat',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
            )
          ,),
        actions: [
            IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            iconSize: 30.0,
            onPressed: () {  },


          ),
        ]
        ,),
      body: Column(
        children: [
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                )
              ),
              child: Column(
                children: [
                  FavouriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
