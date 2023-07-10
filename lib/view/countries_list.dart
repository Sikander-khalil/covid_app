import 'package:covid_app/Service/states_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'detail_screen.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    StatesService statesService = StatesService();
    return Scaffold(


      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      ),
      body: Column(

        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(

              controller: searchController,
              onChanged: (value){
                setState(() {

                });

              },
              decoration: InputDecoration(

                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Search with Country Name',
                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(50.0),

                )

              ),

            ),
          ),
          Expanded(child: FutureBuilder(

            future: statesService.fetcCountriesRecords(),

            builder: (context, AsyncSnapshot<List<dynamic>> snapshot){

              if(!snapshot.hasData){

                return CircularProgressIndicator();

              }else{
                return ListView.builder(

                  itemCount: snapshot.data!.length,

                    itemBuilder: (context, index){

                    String name = snapshot.data![index]['country'];

                    if(searchController.text.isEmpty){

                      return Shimmer.fromColors(

                        baseColor: Colors.grey.shade700,
                        highlightColor: Colors.grey.shade100,
                        child: Column(

                          children: [

                            GestureDetector(
                              onTap: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(
                                  name:  snapshot.data![index]['country'],
                                  image: snapshot.data![index]['countryInfo']['flag'],
                                  totalCases: snapshot.data![index]['cases'],
                                  critical: snapshot.data![index]['critical'],
                                  active: snapshot.data![index]['active'],
                                  todayRecovered: snapshot.data![index]['todayRecovered'],
                                  test: snapshot.data![index]['tests'],
                                  totalDeath: snapshot.data![index]['deaths'],
                                  totalRecovered: snapshot.data![index]['recovered'],


                                )));

                      },
                              child: ListTile(


                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(snapshot.data![index]['cases'].toString()),
                                leading: Image(

                                  height: 50,
                                  width: 50,

                                  image: NetworkImage(

                                      snapshot.data![index]['countryInfo']['flag']

                                  ),

                                ),
                              ),
                            )




                          ],
                        ),
                      );

                    }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){

                      return Shimmer.fromColors(

                        baseColor: Colors.grey.shade700,
                        highlightColor: Colors.grey.shade100,
                        child: Column(

                          children: [

                            InkWell(

                              onTap : (){

                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(
                                  name:  snapshot.data![index]['country'],
                                  image: snapshot.data![index]['countryInfo']['flag'],
                                  totalCases: snapshot.data![index]['cases'],
                                  critical: snapshot.data![index]['critical'],
                                  active: snapshot.data![index]['active'],
                                  todayRecovered: snapshot.data![index]['todayRecovered'],
                                  test: snapshot.data![index]['tests'],
                                  totalDeath: snapshot.data![index]['deaths'],
                                  totalRecovered: snapshot.data![index]['recovered'],


                                )));


                      },
                              child: ListTile(


                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(snapshot.data![index]['cases'].toString()),
                                leading: Image(

                                  height: 50,
                                  width: 50,

                                  image: NetworkImage(

                                      snapshot.data![index]['countryInfo']['flag']

                                  ),

                                ),
                              ),
                            )




                          ],
                        ),
                      );




                    }else{

                      return Container();


                    }







                });

              }





            },
          ))

        ],
      ),







    );
  }
}
