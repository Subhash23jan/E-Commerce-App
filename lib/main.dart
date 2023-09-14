import 'package:amazon_clone_flutter/pages/Profile/screens/profile.dart';
import 'package:amazon_clone_flutter/pages/Cart/screens/cart_page.dart';
import 'package:amazon_clone_flutter/pages/homeScreen/screens/home_screen_page.dart';
import 'package:amazon_clone_flutter/pages/Profile/screens/sample.dart';
import 'package:amazon_clone_flutter/provider/user_provider.dart';
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
        home:const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pagecontroller;
  int _pageIndex=0;
  @override
  Widget build(BuildContext context) {
    _pagecontroller=PageController();
    return Scaffold(
      body: PageView(
        allowImplicitScrolling: true,
        controller: _pagecontroller,
        children: const [
          HomepageScreen(),
          UserProfile(),
          CartPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:Colors.black,
        onTap: (value) {
          setState(() {
            _pageIndex=value;
            _pagecontroller.jumpToPage(value);
          });
        },
          iconSize: 28,
          items: [
            BottomNavigationBarItem(icon:Icon(Icons.home,color:_pageIndex==0?Colors.blue:Colors.white,),label: '',),
            BottomNavigationBarItem(icon:Icon(Icons.person_outline_outlined,color:_pageIndex==1?Colors.blue:Colors.white,),label: ''),
            BottomNavigationBarItem(icon:Icon(Icons.shopping_cart,color:_pageIndex==2?Colors.blue:Colors.white,),label: '')
          ]),
    );
  }
}


