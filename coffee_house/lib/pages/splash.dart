import 'package:coffee_house/data/bd_helper.dart';
import 'package:coffee_house/data/shared_pref_helper.dart';
import 'package:coffee_house/pages/home_page.dart';
import 'package:coffee_house/pages/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    super.initState();
    loadData();
  }

  Future<void> loadData() async{
    bool isLogged = await SharedPrefHerlper().getUser();
    await Future.delayed(const Duration(seconds: 5));
    if(isLogged == true){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context){
              return const HomePage();
            }
        ),
      );
    }else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context){
              return const LoginPage();
            }
        ),
      );
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF10397B),
      body: Center(
        child: Image.network( 'https://upload.wikimedia.org/wikipedia/commons/9/99/Logo-hurb-branca-bg-azul.jpg'),
      ),
    );
  }
}

