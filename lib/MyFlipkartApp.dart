import 'package:flipkart_ui_clone/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFlipkartApp extends StatefulWidget {
  const MyFlipkartApp({Key? key}) : super(key: key);

  @override
  State<MyFlipkartApp> createState() => _MyFlipkartAppState();
}

class _MyFlipkartAppState extends State<MyFlipkartApp>
    with SingleTickerProviderStateMixin {
  static int currentPage = 0;

  // List<Tab> TabBarIcons = [
  //   Tab(
  //       icon: Icon(
  //         Icons.home_outlined,
  //         color: currentPage == 0 ? Colors.blue : Colors.grey,
  //         size: 20,
  //       ),
  //       text: "Home"),
  //   Tab(
  //       icon: Icon(Icons.apps_outage_outlined,
  //           color: currentPage == 1 ? Colors.blue : Colors.grey, size: 20),
  //       text: "Categories"),
  //   Tab(
  //       icon: Icon(
  //         Icons.notifications_none,
  //         size: 20,
  //         color: currentPage == 2 ? Colors.blue : Colors.grey,
  //       ),
  //       text: "Notifications"),
  //   Tab(
  //       icon: Icon(
  //         Icons.account_circle_outlined,
  //         size: 20,
  //         color: currentPage == 3 ? Colors.blue : Colors.grey,
  //       ),
  //       text: "Account"),
  //   Tab(
  //       icon: Icon(
  //         Icons.shopping_cart_outlined,
  //         size: 20,
  //         color: currentPage == 4 ? Colors.blue : Colors.grey,
  //       ),
  //       text: "Cart"),
  // ];

  List<Widget> TabViewPages = [
    HomePage(),
    Center(
      child: Text("Categories"),
    ),
    Center(
      child: Text("Notifications"),
    ),
    Center(
      child: Text("Account"),
    ),
    Center(
      child: Text("Cart"),
    ),
  ];

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: TabViewPages.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: TabViewPages,
        controller: tabController,
      ),
      bottomNavigationBar: Material(
        child: TabBar(
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: UnderlineTabIndicator(),
          labelColor: Colors.blue,
          labelStyle: TextStyle(fontSize: 12),
          automaticIndicatorColorAdjustment: true,
          isScrollable: true,
          tabs: [
            Tab(
                icon: Icon(
                  Icons.home_outlined,
                  color: currentPage == 0 ? Colors.blue : Colors.grey,
                  size: 20,
                ),
                text: "Home"),
            Tab(
                icon: Icon(Icons.apps,
                    color: currentPage == 1 ? Colors.blue : Colors.grey,
                    size: 20),
                text: "Categories"),
            Tab(
                icon: Icon(
                  Icons.notifications_none,
                  size: 20,
                  color: currentPage == 2 ? Colors.blue : Colors.grey,
                ),
                text: "Notifications"),
            Tab(
                icon: Icon(
                  Icons.account_circle_outlined,
                  size: 20,
                  color: currentPage == 3 ? Colors.blue : Colors.grey,
                ),
                text: "Account"),
            Tab(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 20,
                  color: currentPage == 4 ? Colors.blue : Colors.grey,
                ),
                text: "Cart"),
          ],
          controller: tabController,
          onTap: (pageChange) {
            setState(() {
              currentPage = pageChange;
            });
            // print(currentPage);
          },
        ),
      ),
    );
  }
}
