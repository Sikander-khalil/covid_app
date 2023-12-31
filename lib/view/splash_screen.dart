import 'dart:async';

import 'package:covid_app/view/word_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this)..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 5),
        () => Navigator.push(context, MaterialPageRoute(builder: (context) => WorldStates()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            AnimatedBuilder(animation: _controller,
                child: Container(

                  height: 50,
                  width: 200,
                  child: Center(
                    child: Image(image: AssetImage('assets/images/virus.png'),),
                  ),
                ),

                builder: (BuildContext context, Widget? child){

              return Transform.rotate(

                  angle: _controller.value * 2.0 * math.pi,

                child: child,
              );

            }),

            Align(
              alignment: Alignment.center,
              child: Text('Covid-19',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            )

          ],
        ),
      ),
    );
  }
}
