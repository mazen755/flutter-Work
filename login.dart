// import 'package:flutter/material.dart';
// import 'signup.dart';
// import 'home.dart';
//
// void main() {
//   runApp(LoginPage());
// }
//
// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         body: Container(
//           padding: EdgeInsets.all(30),
//           child: Column(
//             children: [
//
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.favorite, color: Colors.pink, size: 40),
//                   SizedBox(height: 20),
//                   Text(
//                     "Welcome Back",
//                     style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     "log in to continue using our app",
//                     style: TextStyle(color: Colors.grey, fontSize: 16),
//                   ),
//                   SizedBox(height: 30),
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: "Email address",
//                       icon: Icon(Icons.email),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   TextField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//
//                       hintText: "Password",
//                       icon: Icon(Icons.lock),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                     ),
//                   ),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(
//                         "Forgot Password?",
//                         style: TextStyle(color: Colors.pink),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) =>  home()),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.pink,
//                       padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
//                     ),
//                     child: Text("sign in",
//                       style: TextStyle(color: Colors.white, fontSize: 20),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("Or continue with")
//                     ],
//                   ),
//                   SizedBox(height: 20),
//
//                   Row(
//                     children: [
//                       SizedBox(width: 50),
//
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//
//                         children: [
//
//                           OutlinedButton(onPressed: () {}, child:Container(
//                             width: 60,
//                             height: 50,
//                             child: Column(
//                                          children: [
//                                            ShaderMask(
//                                       shaderCallback: (Rect bounds) {
//                                               return LinearGradient(
//                                                 colors: [
//                                                   Colors.white,
//                                                   Colors.white,
//                                                    Colors.red,
//                                                    Colors.yellow,
//                                                    Colors.green,
//                                                     Colors.blue,
//                                                      Colors.white,
//                                                        Colors.white,
//
//                                                             ],
//                                                    begin: Alignment.topLeft,
//                                                  end: Alignment.bottomRight,
//                                                  ).createShader(bounds);
//                                      },
//                                   child: Icon(
//                                     Icons.g_mobiledata,
//                                     size: 30,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//
//                                 Text("Google"),
//                               ],
//                             ),
//                           )
//                           ),
//                         ],
//                       ),
//                       SizedBox(width: 20),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           OutlinedButton(
//                             onPressed: () {},
//                             child: Container(
//                               height: 50,
//                               child: Column(
//                                 children: [
//                                   Icon(Icons.facebook),
//                                   SizedBox(width: 10),
//                                   Text("Facebook"),
//                                 ],
//                               ),
//                             ),
//
//                           ),
//                         ],
//                       ),
//                     ],
//
//                   ),
//                   SizedBox(height: 20),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text("Don't have an account? "),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) =>  SignUpApp()),
//                           );
//                         },
//                         child: const Text(
//                           "Sign Up",
//                           style: TextStyle(
//                             color: Colors.pink,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//
//
//               // Container(
//               //     child: ElevatedButton(
//               //         onPressed: (){
//               //           Navigator.pop(context);
//               //         }
//               //         , child: Text("Log in")
//               //     )
//               //
//               // ) ,
//             ],
//
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'signup.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 40),

              Center(
                child: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 40,
                ),
              ),

              SizedBox(height: 30),

              Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 5),

              Text(
                "Sign in to continue your journey",
                style: TextStyle(color: Colors.grey),
              ),

              SizedBox(height: 30),


              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email address",
                  prefixIcon: Icon(Icons.email_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }

                  final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                  if (!emailRegex.hasMatch(value)) {
                    return "Enter a valid email";
                  }

                  return null;
                },
              ),

              SizedBox(height: 15),


              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock_outline),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }

                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }

                  return null;
                },
              ),

              SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.pink),
                ),
              ),

              SizedBox(height: 20),


              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [Colors.pink, Colors.purple],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => home()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Or continue with"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.g_mobiledata, color: Colors.red),
                      label: Text("Google"),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.facebook, color: Colors.blue),
                      label: Text("Facebook"),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpApp()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.pink),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}