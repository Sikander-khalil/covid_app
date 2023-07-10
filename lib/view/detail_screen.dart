import 'package:covid_app/view/word_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String name;
  String image;
  int totalCases, totalDeath, totalRecovered, active, critical,todayRecovered, test;
   DetailScreen({required this.name, required this.todayRecovered, required this.active, required this.critical,
   required this.image, required this.test, required this.totalCases, required this.totalDeath, required this.totalRecovered
   });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.name),
      ),


      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .067),
                child: Card(

                  child: Column(
                    children: [
                      ResableWidget(title: 'Cases', value: widget.totalCases.toString()),
                      ResableWidget(title: 'Recovered', value: widget.todayRecovered.toString()),
                      ResableWidget(title: 'Death', value: widget.totalDeath.toString()),
                      ResableWidget(title: 'Critical', value: widget.critical.toString()),
                      ResableWidget(title: 'Active', value: widget.active.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )

        ],


      ),

    );
  }
}
