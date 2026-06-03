import 'package:first_flutter_app/Team_Lead_New_task/loginPage.dart';
import 'package:flutter/material.dart';

class LoginSplashScreenMain extends StatefulWidget {
  const LoginSplashScreenMain({super.key});

  @override
  State<LoginSplashScreenMain> createState() => _LoginSplashScreenMainState();
}

class _LoginSplashScreenMainState extends State<LoginSplashScreenMain> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/images/splash.png"),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Food Recipes",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
