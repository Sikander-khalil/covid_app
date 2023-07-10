import 'dart:convert';


import 'package:covid_app/Service/Utilis/app_url.dart';
import 'package:http/http.dart' as http;

import '../Models/disease_models.dart';

class StatesService{

  Future<Models> fetchWorkStateRecords() async{

    final response = await http.get(Uri.parse(AppUrl.worldStatesApi)

    );
    if(response.statusCode == 200){

      var data = jsonDecode(response.body.toString());

      return Models.fromJson(data);



    }else{

      throw Exception('Error');
    }







  }
  Future<List<dynamic>> fetcCountriesRecords() async{

    var data;

    final response = await http.get(Uri.parse(AppUrl.countriesList)

    );
    if(response.statusCode == 200){

       data = jsonDecode(response.body.toString());

      return data;



    }else{

      throw Exception('Error');
    }







  }




}
