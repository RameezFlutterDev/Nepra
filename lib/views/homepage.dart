// import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:nepraproj/views/hydro.dart';
// import 'package:page_transition/page_transition.dart';

// import '../auth/auth_service.dart';
// import 'login.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//               onPressed: () {
//                 final _auth = AuthService();
//                 _auth.SignOutUser();
//                 Navigator.pushReplacement(
//                     context,
//                     PageTransition(
//                         type: PageTransitionType.fade, child: Login()));
//               },
//               icon: Icon(Icons.logout)),
//           title: Text(
//             "NEPRA",
//             style: GoogleFonts.poppins(),
//           ),
//           centerTitle: true,
//         ),
//         body: ContainedTabBarView(
//           tabs: [
//             Text('First'),
//             Text('Second'),
//             Text('Second'),
//             Text('Second'),
//           ],
//           tabBarProperties: TabBarProperties(
//               width: 300,
//               height: 32,
//               background: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.blue.shade200,
//                   borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.4),
//                       spreadRadius: 0.5,
//                       blurRadius: 2,
//                       offset: Offset(1, -1),
//                     ),
//                   ],
//                 ),
//               ),
//               position: TabBarPosition.top,
//               alignment: TabBarAlignment.center,
//               indicatorColor: Colors.black,
//               labelColor: Colors.white,
//               unselectedLabelColor: Colors.grey[400],
//               indicator: BoxDecoration(color: Colors.blue),
//               indicatorSize: TabBarIndicatorSize.tab),
//           views: [
//             Hydro(),
//             Container(color: Colors.green),
//             Container(color: Colors.green),
//             Container(color: Colors.green),
//           ],
//         ));
//   }
// }
