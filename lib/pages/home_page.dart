// import 'dart:js';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:stuntingapp/auth.dart';
// import 'package:flutter/material.dart';
// import 'package:stuntingapp/pages/about.dart';
// import 'package:stuntingapp/pages/add.dart';
// import 'package:stuntingapp/pages/chatbot.dart';
// import 'package:stuntingapp/pages/login_register_page.dart';
// import 'package:stuntingapp/pages/news.dart';

// class HomePage extends StatelessWidget {
//   HomePage({Key? key}) : super(key: key);

//   final User? user = Auth().currentUser;

//   Future<void> signOut() async {
//     await Auth().signOut();
//     // Navigator.of(context as BuildContext).push(
//     //   MaterialPageRoute(
//     //     builder: (context) => const LoginPage(),
//     //   ),
//     // );
//   }

//   Widget _title() {
//     return const Text(
//       'STUNTING APP',
//       textAlign: TextAlign.center,
//     );
//   }

//   Widget _nama() {
//     return Text(
//       "Hi, Selamat Datang",
//       style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
//     );
//   }

//   Widget _userUid() {
//     return Text(user?.email ?? 'User email');
//   }

//   Widget _signOutButton() {
//     return ElevatedButton(
//       onPressed: signOut,
//       child: const Text('Sign Out'),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: new Center(
//           child: _title(),
//         ),
//         leading: IconButton(
//           onPressed: () {},
//           icon: Icon(Icons.home),
//         ),
//         automaticallyImplyLeading: false,
//         actions: <Widget>[
//           Padding(
//               padding: EdgeInsets.only(right: 20.0),
//               child: GestureDetector(
//                 onTap: () {
//                   showDialog(
//                     context: context,
//                     builder: (ctx) => AlertDialog(
//                       title: const Text("Logout"),
//                       content: const Text("Apakah anda yakin akan keluar?"),
//                       actions: <Widget>[
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(ctx).pop();
//                           },
//                           child: Container(
//                             color: Color.fromARGB(255, 255, 255, 255),
//                             padding: const EdgeInsets.all(14),
//                             child: const Text("Tidak"),
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: signOut,
//                           child: Container(
//                             color: Color.fromARGB(255, 255, 255, 255),
//                             padding: const EdgeInsets.all(14),
//                             child: const Text("Ya"),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 child: Icon(Icons.login),
//               )),
//         ],
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(20),
//         child: GridView.count(
//           crossAxisCount: 2,
//           children: <Widget>[
//             _nama(),
//             _userUid(),
//             Card(
//               margin: const EdgeInsets.all(8),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (context) => Chat()));
//                 },
//                 splashColor: Colors.blue,
//                 child: Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: const <Widget>[
//                       Icon(
//                         Icons.mark_chat_unread_rounded,
//                         size: 70,
//                         color: Colors.red,
//                       ),
//                       Text("Konsultasi", style: TextStyle(fontSize: 17.0)),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Card(
//               margin: const EdgeInsets.all(8),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => InsertData()));
//                 },
//                 splashColor: Colors.blue,
//                 child: Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: const <Widget>[
//                       Icon(
//                         Icons.local_hospital_rounded,
//                         size: 70,
//                         color: Colors.red,
//                       ),
//                       Text("Diagnosis", style: TextStyle(fontSize: 17.0)),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Card(
//               margin: const EdgeInsets.all(8),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => NewsPage()));
//                 },
//                 splashColor: Colors.blue,
//                 child: Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: const <Widget>[
//                       Icon(
//                         Icons.newspaper_rounded,
//                         size: 70,
//                         color: Colors.red,
//                       ),
//                       Text("Berita", style: TextStyle(fontSize: 17.0)),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Card(
//               margin: const EdgeInsets.all(8),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => tentang()));
//                 },
//                 splashColor: Colors.blue,
//                 child: Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: const <Widget>[
//                       Icon(
//                         Icons.bookmark,
//                         size: 70,
//                         color: Colors.red,
//                       ),
//                       Text("Tentang", style: TextStyle(fontSize: 17.0)),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
