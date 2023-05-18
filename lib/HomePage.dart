import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool brandMallOn = false;

  List<Widget> gridItems = [];
  List<Widget> circularRowItems01Widget = [];
  List<Widget> circularRowItems02Widget = [];

  Map gridItemsRaw = {
    "https://www.pny.com/productimages/18034E33-3192-46E5-9D8B-AE2201131440/images/PNY-CS2140-SSD-M.2-NVME-fr.png":
        "Internal SSD",
    "https://cdn.shopify.com/s/files/1/0057/8938/4802/products/8a80ebca-13b6-4329-b8dd-e2e152bdcf6b.png?v=1625046023":
        "Wired Earphoes",
    "https://www.lenovo.com/medias/GY50Z18984-01-500x400.png?context=bWFzdGVyfHJvb3R8MTE1NzA3fGltYWdlL3BuZ3xoMDIvaGFmLzExMDY4NzEzMDA5MTgyLnBuZ3xhZjY0YTQyNTEzNzBmNGIyMjcyZDlhOTEyNWUwYzllMDBkNTg4OTAyNzkzMDI1YWUwMWY0NTg5NTM3YzI3OWY3":
        "Wireless Mouse",
    "https://www.pngmart.com/files/7/Mobile-Cover-PNG-Photos.png":
        "Back Covers",
    "https://5.imimg.com/data5/AY/XB/RW/SELLER-104356294/2-removebg-preview-1000x1000.png":
        "Wrist Watches",
    "https://oasis.opstatics.com/content/dam/oasis/page/2021/9-series/spec-image/9/Arcticsky_9.png":
        "Mobiles",
    "https://cdn.shopify.com/s/files/1/0137/0292/2286/products/1_8666a620-bffb-4c44-bbd0-4b6369297e7e.png?v=1645260550":
        "Smart Watches"
  };

  List<Widget> carouselItems = [
    "assets/images/b1.jpeg",
    "assets/images/b2.jpeg",
    "assets/images/b3.jpeg",
    "assets/images/b4.jpeg",
    "assets/images/b5.jpeg",
    "assets/images/b6.jpeg",
    "assets/images/b7.jpeg",
    "assets/images/b8.jpeg",
  ].map((e) => Image.asset(e)).toList();

  Map circularRowItems01 = {
    "https://www.transparentpng.com/thumb/special-offer/special-offer-tag-png-pictures-4.png":
        "Offer Zone",
    "https://www.pngmart.com/files/1/Mens-Fashion-PNG-File.png":
        "Men's\nFashion",
    "https://freepngimg.com/thumb/categories/578.png": "Woman's\nFAshion",
    "https://www.pngall.com/wp-content/uploads/1/Electronic.png":
        " Electronics",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyjILiA2GtrjomLBkqsRlT0RDIKEc3LOys7Q&usqp=CAU":
        "Home"
  };

  Map circularRowItems02 = {
    "https://www.pngall.com/wp-content/uploads/2016/06/Makeup-Kit-Products-PNG-Image.png":
        "Beauty",
    "https://freepngimg.com/save/54021-grocery-images-png-free-photo/800x460":
        "Food & More",
    "https://www.pngall.com/wp-content/uploads/5/Toy-PNG-Image-File.png":
        "Toys & Baby",
    "https://www.pngmart.com/files/15/Apple-iPhone-12-PNG-Picture.png":
        "Mobiles",
    "https://www.pngmart.com/files/7/Home-Appliance-PNG-File.png": "Appliances"
  };

  @override
  void initState() {
    // TODO: implement initState
    gridItemsRaw.forEach((image, iamgeText) {
      gridItems.add(Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.contain))),
            Text(iamgeText)
          ],
        ),
      ));
    });

    circularRowItems01.forEach((image, iamgeText) {
      circularRowItems01Widget.add(Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      Card(
        child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.contain))),
      ),
      Text(iamgeText)
          ],
        ));
    });

    circularRowItems02.forEach((image, iamgeText) {
      circularRowItems02Widget.add(Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      Card(
        child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.contain))),
      ),
      Text(iamgeText)
          ],
        ));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: Image.asset("assets/images/flip_logo.png"),
            title: Text(
              "Flipkart",
              style: GoogleFonts.kanit(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF107BD5)),
            ),
          ),
          SliverFillRemaining(
            child: CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  leading: Switch(
                    value: brandMallOn,
                    onChanged: (bool value) {
                      setState(() {
                        brandMallOn = value;
                      });
                    },
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "Search for products",
                            prefixIcon: Icon(CupertinoIcons.search),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(CupertinoIcons.mic),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(CupertinoIcons.camera),
                                ],
                              ),
                            ),
                            filled: true,
                            fillColor: CupertinoColors.extraLightBackgroundGray,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                    ),
                  ),
                ),
                SliverFillRemaining(
                    child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    CarouselSlider(
                        items: carouselItems,
                        options: CarouselOptions(
                          height: 150,
                          disableCenter: true,
                          enlargeCenterPage: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 2),
                          initialPage: 3,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Recetly Viewed Stores",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      width: 50,
                      child: GridView.count(
                          crossAxisCount: 1,
                          scrollDirection: Axis.horizontal,
                          children: gridItems),
                    ),
                    Row(
                      children: circularRowItems01Widget,
                    ),
                    Row(
                      children: circularRowItems02Widget,
                    )
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
