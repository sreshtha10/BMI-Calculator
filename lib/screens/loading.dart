import 'package:bmi_calculator_flutter/constants/app_constants.dart';
import 'package:bmi_calculator_flutter/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  Future<void> delaySplash() async{
    await Future.delayed(const Duration(seconds: 1), (){});
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => const Home()), (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    delaySplash();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: SpinKitSpinningLines(color: accentColor, size: 50.0,)
      ),
    );
  }
}

