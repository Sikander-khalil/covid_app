import 'package:covid_app/Models/disease_models.dart';
import 'package:covid_app/Service/states_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import 'countries_list.dart';

class WorldStates extends StatefulWidget {
  const WorldStates({super.key});

  @override
  State<WorldStates> createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this)..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[

    const Color(0xff4285f4),
    const Color(0xff1aa260),
    const Color(0xffde5246),


  ];
  @override
  Widget build(BuildContext context) {

    StatesService statesService = StatesService();
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(29),
        child: SingleChildScrollView(

          child: Column(
            children: [

              FutureBuilder(
                  future: statesService.fetchWorkStateRecords(),
                  builder: (context, AsyncSnapshot<Models> snapshot){

                    if(!snapshot.hasData){

                      return SpinKitFadingCircle(


                          color: Colors.white,
                         size: 50,
                        controller: _controller,

                      );


                    }else{

                      return Column(

                        children: [

                          PieChart(dataMap: {

                            "Total" : double.parse(snapshot.data!.cases!.toString()),
                            "Recovered" : double.parse(snapshot.data!.recovered.toString()),
                            "Death" : double.parse(snapshot.data!.deaths.toString()),





                          },
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true
                            ),
                            chartRadius: MediaQuery.of(context).size.width / 3.2,
                            legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.left
                            ),
                            animationDuration: const Duration(milliseconds: 1200),
                            chartType: ChartType.ring,
                            colorList: colorList,

                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * .06),
                            child: Card(

                              child: Column(

                                children: [

                                  ResableWidget(title: 'Total', value: snapshot.data!.cases.toString()),
                                  ResableWidget(title: 'Recovered', value: snapshot.data!.recovered.toString()),
                                  ResableWidget(title: 'Death', value: snapshot.data!.deaths.toString()),
                                  ResableWidget(title: 'Critical', value: snapshot.data!.critical.toString()),
                                  ResableWidget(title: 'Active', value: snapshot.data!.active.toString()),
                                  ResableWidget(title: 'Today Death', value: snapshot.data!.todayDeaths.toString()),
                                  ResableWidget(title: 'Today Recovered', value: snapshot.data!.todayRecovered.toString()),

                                ],
                              ),
                            ),
                          ),
                          GestureDetector(

                            onTap: (){

                              Navigator.push(context, MaterialPageRoute(builder: (context) => CountriesList()));

                    },




                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)



                              ),
                              child: Center(
                                child: Text("Track Countries"),
                              ),
                            ),
                          ),

                        ],
                      );


                    }




              }),



            ],
          ),
        ),
      ),


    );
  }
}

class ResableWidget extends StatelessWidget {
  String title, value;
   ResableWidget({Key? key, required this.title, required this.value }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(title),
            Text(value),

            ],
          ),
          SizedBox(height: 5,),

          Divider(),
        ],
      ),
    );
  }
}

