import 'package:amazon_clone_flutter/Screens/AuthPages/sign_up.dart';
import 'package:amazon_clone_flutter/main.dart';
import 'package:amazon_clone_flutter/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final authSerice = AuthService();
  bool isHidden = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Container(
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: NetworkImage(
          //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsM6J-2vnHdJrBAgIWG0F3LvFbWDwWGFO-OA&usqp=CAU"), // Replace with your image path
          //       fit: BoxFit.cover, // Adjust the fit as needed
          //     ),
          //   ),
          // ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.sizeOf(context).width*0.7,
                  margin: const EdgeInsets.only(left: 25, right: 25, bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.cyan),
                  child: TextFormField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    decoration: const InputDecoration(
                      hintText: 'enter your email',
                      prefixIcon: Icon(Icons.email),
                      prefixIconColor: Colors.black54,
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.black54, fontSize: 18),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (
                      value,
                    ) {},
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.sizeOf(context).width*0.7,
                  margin: const EdgeInsets.only(
                      left: 25, right: 25, bottom: 5, top: 25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.cyan),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: isHidden,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                      hintText: 'enter your password',
                      prefixIcon: const Icon(Icons.fingerprint),
                      prefixIconColor: Colors.black54,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isHidden = !isHidden;
                            });
                          },
                          icon: Icon(
                            isHidden ? Icons.visibility_off : Icons.visibility,
                            color: Colors.white,
                          )),
                      border: InputBorder.none,
                      hintStyle:
                          const TextStyle(color: Colors.black54, fontSize: 18),
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
                  onTap: () => authSerice.signInUser(
                      context: context,
                      email: emailController.text.toLowerCase(),
                      password: passwordController.text),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width*0.3,
                    alignment: Alignment.center,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        gradient: const LinearGradient(
                          tileMode: TileMode.clamp,
                          colors: [
                            Colors.red,
                            Colors.blue,
                            Colors.green,
                            Colors.white
                          ], // Define your gradient colors
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 18,
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
                      "Don't you have an account !?  ",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
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
