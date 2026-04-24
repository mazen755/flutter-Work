import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Pagetow.dart';
import 'Pagethree.dart';
import 'Pagefor.dart';
import 'Pagefive.dart';
import 'Pagesex.dart';
import 'Pageseven.dart';

void main() {
  runApp(const MYscreen());
}

class MYscreen extends StatefulWidget {
  const MYscreen({super.key});

  @override
  State<MYscreen> createState() => _MYscreenState();
}

class _MYscreenState extends State<MYscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.markunread_mailbox), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: "More"),
          ],
        ),
        body: ListView(
          children: [
            const Text(
              "All Features",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.purpleAccent,
                          ),
                          child: const Icon(Icons.bookmark_add, size: 40),
                        ),
                      ),
                      const SizedBox(width: 10),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bookings",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "View and Manage all bookings",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),

                      Builder(
                        builder: (context) {
                          return IconButton(
                            icon: const Icon(Icons.next_plan, size: 40),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Pagetow()),
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                  //toww
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                            child: const Icon(Icons.face, size: 40),
                          ),
                        ),
                        const SizedBox(width: 10),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Complaints",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Handle User Complaints",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),

                        Builder(
                          builder: (context) {
                            return IconButton(
                              icon: const Icon(Icons.next_plan, size: 40),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Pagethree()),
                                );
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
//three
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepOrange,
                            ),
                            child: const Icon(Icons.earbuds, size: 40),
                          ),
                        ),
                        const SizedBox(width: 10),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Content",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Review Reported Complnits",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),

                        Builder(
                          builder: (context) {
                            return IconButton(
                              icon: const Icon(Icons.next_plan, size: 40),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Pagefor()),
                                );
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blueAccent,
                            ),
                            child: const Icon(Icons.label_important_outline, size: 40),
                          ),
                        ),
                        const SizedBox(width: 10),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Reportes",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "View charts and reports",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),

                        Builder(
                          builder: (context) {
                            return IconButton(
                              icon: const Icon(Icons.next_plan, size: 40),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Pagefive()),
                                );
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
//sex
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.greenAccent,
                            ),
                            child: const Icon(Icons.g_translate, size: 40),
                          ),
                        ),
                        const SizedBox(width: 10),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Accounts",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Monitor suspicious activity",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),

                        Builder(
                          builder: (context) {
                            return IconButton(
                              icon: const Icon(Icons.next_plan, size: 40),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Pagesex()),
                                );
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green,
                            ),
                            child: const Icon(Icons.import_contacts_rounded, size: 40),
                          ),
                        ),
                        const SizedBox(width: 10),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "System Montireng",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "check system and cards",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),

                        Builder(
                          builder: (context) {
                            return IconButton(
                              icon: const Icon(Icons.next_plan, size: 40),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Pageseven()),
                                );
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


  //             //tow
  //
  //             Padding(
  //               padding: const EdgeInsets.only(top: 30,left: 5),
  //               child: Column(
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.only(right: 130,bottom: 5),
  //                     child: Text(
  //                       "Complaints",
  //                       style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(right: 35),
  //                     child: Text(
  //                       "Handle User Complaints",
  //                       style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(left: 32),
  //               child: IconButton(
  //                 icon: Icon(Icons.next_plan, size: 40,color: Colors.black,),
  //                 onPressed: () {
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                         builder: (context) => Pagetow()),
  //                   );
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   ],
  // ),
  //                     //three
  //                     Stack(
  //                       children: [
  //                         Padding(
  //                           padding: const EdgeInsets.only(left: 5,right: 5,top: 50),
  //                           child: Container(
  //                             width: 450,
  //                             height: 130,
  //                             decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(20),
  //                                 color: Colors.white
  //                             ),
  //
  //                             child: Row(
  //                               children: [
  //
  //                                 Padding(
  //                                   padding: const EdgeInsets.only(left: 10),
  //                                   child: Container(
  //                                     width: 100,
  //                                     height: 100,
  //                                     decoration: BoxDecoration(
  //                                         borderRadius: BorderRadius.circular(10),
  //                                         color: Colors.deepOrange
  //                                     ),
  //                                     child: Icon(Icons.safety_check,size: 40,),
  //                                   ),
  //                                 ),
  //                                 Padding(
  //                                   padding: const EdgeInsets.only(top: 30,left: 10),
  //                                   child: Column(
  //                                     children: [
  //                                       Padding(
  //                                         padding: const EdgeInsets.only(right: 180,bottom: 5),
  //                                         child: Text(
  //                                           "Content",
  //                                           style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
  //                                         ),
  //                                       ),
  //                                       Padding(
  //                                         padding: const EdgeInsets.only(right: 30),
  //                                         child: Text(
  //                                           "Review Reported Complnits",
  //                                           style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 Padding(
  //                                   padding: const EdgeInsets.only(left: 20),
  //                                   child: Positioned(
  //                                       left: 220,
  //                                       top: 20,
  //                                       child: Icon(Icons.next_plan,size: 40,)
  //                                   ),
  //                                 )
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //for
  //
  // Stack(
  //   children: [
  //     Padding(
  //       padding: const EdgeInsets.only(left: 5,right: 5,top: 50),
  //       child: Container(
  //         width: 450,
  //         height: 130,
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(20),
  //             color: Colors.white
  //         ),
  //
  //         child: Row(
  //           children: [
  //
  //             Padding(
  //               padding: const EdgeInsets.only(left: 10),
  //               child: Container(
  //                 width: 100,
  //                 height: 100,
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(10),
  //                     color: Colors.blue
  //                 ),
  //                 child: Icon(Icons.two_k_plus_outlined,size: 40,),
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(top: 30,left: 10),
  //               child: Column(
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.only(right: 160,bottom: 5),
  //                     child: Text(
  //                       "Reportes",
  //                       style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(right: 50),
  //                     child: Text(
  //                       "View charts and reports",
  //                       style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(left: 30),
  //               child: Positioned(
  //                   left: 220,
  //                   top: 20,
  //                   child: Icon(Icons.next_plan,size: 40,)
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   ],
  // ),
  // //five
  //                   Stack(
  //                     children: [
  //                       Padding(
  //                         padding: const EdgeInsets.only(left: 5,right: 5,top: 50),
  //                         child: Container(
  //                           width: 450,
  //                           height: 130,
  //                           decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(20),
  //                               color: Colors.white
  //                           ),
  //
  //                           child: Row(
  //                             children: [
  //
  //                               Padding(
  //                                 padding: const EdgeInsets.only(left: 10),
  //                                 child: Container(
  //                                   width: 100,
  //                                   height: 100,
  //                                   decoration: BoxDecoration(
  //                                       borderRadius: BorderRadius.circular(10),
  //                                       color: Colors.lightGreen
  //                                   ),
  //                                   child: Icon(Icons.email,size: 40,),
  //                                 ),
  //                               ),
  //                               Padding(
  //                                 padding: const EdgeInsets.only(top: 30,left: 10),
  //                                 child: Column(
  //                                   children: [
  //                                     Padding(
  //                                       padding: const EdgeInsets.only(right: 160,bottom: 5),
  //                                       child: Text(
  //                                         "Accounts",
  //                                         style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
  //                                       ),
  //                                     ),
  //                                     Padding(
  //                                       padding: const EdgeInsets.only(right: 25),
  //                                       child: Text(
  //                                         "Monitor suspicious activity",
  //                                         style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ),
  //                               Padding(
  //                                 padding: const EdgeInsets.only(left: 28),
  //                                 child: Positioned(
  //                                     left: 220,
  //                                     top: 20,
  //                                     child: Icon(Icons.next_plan,size: 40,)
  //                                 ),
  //                               )
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //sex
  //
  //                 Stack(
  //                   children: [
  //
  //                     Padding(
  //                       padding: const EdgeInsets.only(left: 5,right: 5,top: 50),
  //                       child: Container(
  //                         width: 450,
  //                         height: 130,
  //                         decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(20),
  //                             color: Colors.white
  //                         ),
  //
  //                         child: Row(
  //                           children: [
  //
  //                             Padding(
  //                               padding: const EdgeInsets.only(left: 10),
  //                               child: Container(
  //                                 width: 100,
  //                                 height: 100,
  //                                 decoration: BoxDecoration(
  //                                     borderRadius: BorderRadius.circular(10),
  //                                     color: Colors.green
  //                                 ),
  //                                 child: Icon(Icons.bookmark_add,size: 40,),
  //                               ),
  //                             ),
  //                             Padding(
  //                               padding: const EdgeInsets.only(top: 30,left: 10),
  //                               child: Column(
  //                                 children: [
  //                                   Padding(
  //                                     padding: const EdgeInsets.only(right: 180,bottom: 5),
  //                                     child: Text(
  //                                       "System ",
  //                                       style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
  //                                     ),
  //                                   ),
  //                                   Padding(
  //                                     padding: const EdgeInsets.only(right: 75),
  //                                     child: Text(
  //                                       "View All system Montier",
  //                                       style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
  //                                     ),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                             IconButton(
  //                               icon: Icon(Icons.next_plan, size: 40),
  //                               onPressed: () {
  //                                 Navigator.push(
  //                                   context,
  //                                   MaterialPageRoute(builder: (context) => Pagetow()),
  // );
  // },
  // ),
  // ],
  // ),
  // ),
  // ),
  // ],
  // ),