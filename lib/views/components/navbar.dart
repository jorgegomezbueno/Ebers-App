import 'package:ebers_app/views/screens/main/posts.dart';
import 'package:ebers_app/views/screens/main/reviews.dart';
import 'package:ebers_app/views/screens/main/search.dart';
import 'package:flutter/material.dart';


//screens
import '../screens/main/posts.dart';
import '../screens/main/reviews.dart';
import '../screens/main/search.dart';
import '../screens/main/catalog.dart';
import '../screens/main/profile.dart';

class NavBar extends StatefulWidget{

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar>{
  PageController _pageController = PageController(initialPage: 0,);

  int currentIndex=0;
  
  Widget posts = Posts();
  Widget reviews = Reviews();
  Widget search = Search();
  Widget catalog = Catalog();
  Widget profile = Profile();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        onTap: (value){
          currentIndex=value;
          _pageController.jumpToPage(value);
          setState((){});
        },
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label:"X",
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label:"Y",
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label:">",
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label:"A",
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.dangerous),
            label:"B",
          ),
        ]),
      
      body:PageView(
        controller: _pageController,
        onPageChanged: (newpage){
          setState(() {
            currentIndex = newpage;
          });
        },
        children: [
          Posts(),
          Reviews(),
          Search(),
          Catalog(),
          Profile()
        ],
      )
    );
  }
}
