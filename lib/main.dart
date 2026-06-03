import 'package:firebase_core/firebase_core.dart';
import 'package:first_flutter_app/Team_Lead_New_task/SplashScreen/loginSplashScreen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// void main()  {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => CounterProvider(),
//       child: const MyApp(),
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
      ),
      // home: const LoginPage(),
      // home: RangeSliderCode(),
      // home: MainPages(),
      // home: ClipRReactClass(),
      // home: animatedopacity(),
      // home: MainScreen(),
      home: const LoginSplashScreenMain(),
      // home: const sharedPref(),
      // home: const Counter(),
      // home: TodoApp(),
    );
  }
}
