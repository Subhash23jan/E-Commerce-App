import 'package:amazon_clone_flutter/Screens/AuthPages/sign_in.dart';
import 'package:amazon_clone_flutter/services/auth_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isHidden = true;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authService = AuthService();
  void signUpUser() {
    if (kDebugMode) {
      print('it went');
    }
    authService.signUpUser(
        context: context,
        name: nameController.text,
        email: emailController.text.toLowerCase(),
        password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      backgroundColor: Colors.cyan,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsM6J-2vnHdJrBAgIWG0F3LvFbWDwWGFO-OA&usqp=CAU"), // Replace with your image path
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 55,
                  margin: const EdgeInsets.only(
                      left: 25, right: 25, bottom: 5, top: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.cyan),
                  child: TextFormField(
                    controller: nameController,
                    style: const TextStyle(color: Colors.white, fontSize: 21),
                    decoration: InputDecoration(
                      hintText: 'enter your name',
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.person),
                      hintStyle: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 18,
                      ),
                    ),
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (
                      value,
                    ) {},
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 55,
                  margin: const EdgeInsets.only(left: 25, right: 25, bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.cyan),
                  child: TextFormField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.white, fontSize: 21),
                    decoration: InputDecoration(
                      hintText: 'enter your email',
                      prefixIcon: Icon(Icons.email),
                      prefixIconColor: Colors.black54,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          color: Theme.of(context).hintColor, fontSize: 18),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (
                      value,
                    ) {},
                  ),
                ),
                Container(
                  height: 55,
                  margin: const EdgeInsets.only(
                      left: 25, right: 25, bottom: 5, top: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.cyan),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: isHidden,
                    style: const TextStyle(color: Colors.white, fontSize: 21),
                    decoration: InputDecoration(
                      hintText: 'enter your password',
                      prefixIcon: const Icon(Icons.fingerprint),
                      prefixIconColor: Colors.black54,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          color: Theme.of(context).hintColor, fontSize: 18),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (
                      value,
                    ) {},
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    return signUpUser();
                  },
                  child: Container(
                    width: 200,
                    alignment: Alignment.center,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        gradient: const LinearGradient(
                          tileMode: TileMode.clamp,
                          colors: [
                            Colors.red,
                            Colors.blue,
                            Colors.green,
                            Colors.white,
                            Colors.purpleAccent
                          ], // Define your gradient colors
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                        )),
                    child: const Text(
                      "create account",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account !?  ",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    ),
                    InkWell(
                        onTap: () {
                          if (kDebugMode) {
                            print("clicked");
                          }
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignInPage(),
                          ));
                        },
                        child: Text(
                          "click here",
                          style: GoogleFonts.aBeeZee(
                              fontSize: 19,
                              color: Colors.red,
                              fontWeight: FontWeight.w700),
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
