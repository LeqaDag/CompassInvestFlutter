// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:compassinvest/api/backend_api.dart';
import 'package:compassinvest/views/pages/auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'models/setting.dart';
import 'views/pages/loader/page_loader.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Setting settingData = Setting();
  int? closeApp;

  Future<void> getCloseApplication() async {
    String url = settingClose;
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);

    setState(() {
      closeApp = responseData['data'][0];
    });
    print(closeApp);
  }

  @override
  void initState() {
    super.initState();
    getCloseApplication();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:
            closeApp == 1 ? PageLoader(closeApp: 1) : PageLoader(closeApp: 0));
  }
}

class AfterConfirmation extends StatelessWidget {
  const AfterConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: <String>[
//     'profile',
//   ],
// );

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);

//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   late GoogleSignInAccount _currentUser;
//   late String _message;

//   @override
//   void initState() {
//     super.initState();
//     _googleSignIn.onCurrentUserChanged.listen((account) {
//       setState(() {
//         _currentUser = account!;
//         _currentUser.authentication.then((value) {
//           print("Custom Log:" + value.accessToken!);
//           _login("google", value.accessToken!);
//         });
//       });
//     });
//   }

//   void _login(String provider, String token) async {
//     var dio = Dio();
//     Map data = Map();
//     data["access_token"] = token;
//     data["provider"] = provider;
//     try {
//       Response response = await dio.post("http://192.168.1.143:8000/api/login",
//           data: data, onSendProgress: (count, total) {
//         print("Count:" + count.toString());
//       });
//       print(response.data);
//     } on DioError catch (e) {
//       print(e.response);
//     }
//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Social Login Example"),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             backgroundImage: NetworkImage(
//                 "https://www.xda-developers.com/files/2018/02/Flutter-Framework-Feature-Image-Red.png"),
//             minRadius: MediaQuery.of(context).size.width / 4,
//           ),
//           SizedBox(
//             height: 280,
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//             child: MaterialButton(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0)),
//               padding: EdgeInsets.all(10.0),
//               onPressed: () => _googleSignIn.signIn(),
//               color: Colors.white,
//               elevation: 5,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     backgroundImage: NetworkImage(
//                         "https://storage.googleapis.com/gd-wagtail-prod-assets/original_images/evolving_google_identity_videoposter_006.jpg"),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: Text("Login with Google    "),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//             child: MaterialButton(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0)),
//               padding: EdgeInsets.all(10.0),
//               onPressed: (){},
//               color: Colors.white,
//               elevation: 5,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     backgroundImage: NetworkImage(
//                         "https://i.pinimg.com/originals/1b/99/43/1b9943ad6de248c23a430fa07b0ec5bd.png"),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: Text("Login with Facebook"),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
