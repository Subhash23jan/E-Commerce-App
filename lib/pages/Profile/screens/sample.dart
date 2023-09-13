
import 'package:amazon_clone_flutter/products/screens/all_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../Screens/AuthPages/sign_in.dart';
import '../../../main.dart';
import '../../../provider/user_provider.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<UserProvider>(context).user.email.isEmpty? const SignInPage():const HomePage();
  }
}
