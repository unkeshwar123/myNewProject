import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_assignment/ui/featuredDealScreen.dart';
import 'package:p_assignment/ui/popularDealScreen.dart';
import 'package:p_assignment/ui/topDealScreen.dart';
import 'package:p_assignment/util/connectivitycontroller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TabBar & Drawer Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
class MainPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final ConnectivityController connectivityController = Get.put(ConnectivityController());

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Deals',style: TextStyle(color: Colors.white),),
          bottom: TabBar(
            dividerColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.red,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(text: 'TOP',),
              Tab(text: 'POPULAR'),
              Tab(text: 'FEATURE'),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/paritycube_logo.jpeg",height: 70,width: 70,),
                      Text(
                        'Parity Cube',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'Flutter Assignment',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),
                    ],)
              ),
              ListTile(
                title: Text('TOP'),
                onTap: () {
                  // Navigate to Item 1 page
                },
              ),
              ListTile(
                title: Text('POPULAR'),
                onTap: () {
                  // Navigate to Item 2 page
                },
              ),
              ListTile(
                title: Text('FEATURED'),
                onTap: () {
                  // Navigate to Item 2 page
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TopDealsScreen(),
            PopularDealScreen(),
            FeaturedDealScreen(),
          ],
        ),
      ),
    );
  }
}
