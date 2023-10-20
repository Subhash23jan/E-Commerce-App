import 'package:amazon_clone_flutter/pages/Profile/screens/profile.dart';
import 'package:amazon_clone_flutter/pages/Cart/screens/cart_page.dart';
import 'package:amazon_clone_flutter/pages/more_bottom_sheet.dart';
import 'package:amazon_clone_flutter/pages/homeScreen/screens/home_screen_page.dart';
import 'package:amazon_clone_flutter/pages/Profile/screens/sample.dart';
import 'package:amazon_clone_flutter/pages/homeScreen/screens/product_screen.dart';
import 'package:amazon_clone_flutter/provider/user_provider.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (BuildContext context) {
        return UserProvider();
      },
      child: MaterialApp(
        theme: ThemeData(
          backgroundColor: Colors.cyan,
          primaryColor: Colors.white,
          platform: TargetPlatform.android,
          hintColor: Colors.white70,
        ),
        home:const Sample(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _pagecontroller;
  int _pageIndex=0;
  @override
  Widget build(BuildContext context) {
    _pagecontroller=PageController();
    return Scaffold(
      body: PageView(

        controller: _pagecontroller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          ProductPage(productId: "productId"),
          //HomepageScreen(),
          OptionalBottomSheet(),
          UserProfile(),
          CartPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:Colors.black,
        onTap: (value) {
          setState(() {
            _pageIndex=value;
            _pagecontroller.jumpToPage(value);
          });
        },
          iconSize: 28,
          items: [
            BottomNavigationBarItem(
              icon:Icon(CupertinoIcons.home,color:_pageIndex==0?Colors.blue:Colors.white,size: 23,),label:'',),
            BottomNavigationBarItem(icon:Icon(Icons.ads_click,color:_pageIndex==1?Colors.blue:Colors.white,size: 23,),label: ''),
            BottomNavigationBarItem(icon:Icon(CupertinoIcons.person,color:_pageIndex==2?Colors.blue:Colors.white,),label: ''),
            BottomNavigationBarItem(icon:Icon(CupertinoIcons.cart,color:_pageIndex==3?Colors.blue:Colors.white,),label: '',)
          ]),
    );
  }
}


