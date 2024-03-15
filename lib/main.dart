import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/core/network/api_service.dart';
import 'package:parking_app/core/requests/forget_password_request.dart';
import 'package:parking_app/core/requests/login_request.dart';
import 'package:parking_app/core/requests/register_request.dart';
import 'package:parking_app/core/utils/service_locator.dart';
import 'package:parking_app/features/auth/data/repos/auth_repo.dart';
import 'package:parking_app/features/auth/presentation/views/screens/login_screen.dart';
import 'package:parking_app/features/booking/presentation/views/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: HomeScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   void _incrementCounter() {
//     // CS5
//     // sl.get<BaseTestApi>().testFinger(endPoint: "token", data: {
//     //   "username": '2091',
//     //   "password": '123456',
//     //   "grant_type": "password",
//     //   "FireBaseId": "1",
//     //   "MobileType": '0',
//     //   // "MobileType": Platform.isAndroid ? "0" : "1",
//     //   "mobileid": '4a8b2ae5400a06d4',
//     //   "APType": "15",
//     // });
//
//     //
//     // sl.get<BaseAuthRepo>().register(RegisterRequest(  //SUCCESS
//     //       id: 20202020,
//     //       fullName: 'voltMahmoud',
//     //       userName: 'Mahmoud999',
//     //       email: 'm9@m.com',
//     //       address: 'maadi',
//     //       phoneNumber: '01091402996',
//     //       password: '12345678',
//     //       longitude: '30.951753987321',
//     //       latitude: '30.9517532136448',
//     //     ));
//
//     sl.get<BaseAuthRepo>().login(LoginRequest( //SUCCESS
//           userName: 'Mahmoud999',
//           password: '12345678',
//         ));
//
//     // sl.get<BaseAuthRepo>().forgerPassword(ForgotPasswordRequest(
//     //       //SUCCESS
//     //       email: 'm9@m.com',
//     //       newPassword: '12345678',
//     //     ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               'add',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
