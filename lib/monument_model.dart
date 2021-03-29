

import 'dart:convert';
import 'package:http/http.dart' as http;

class MonumentModel {

  String name;
  String imageUrl;
  String about;

  MonumentModel({this.name, this.imageUrl, this.about});

  factory MonumentModel.fromMap(Map<String, dynamic> json){

    return MonumentModel(
      name: json['name'],
      imageUrl: json['imageUrl'],
      about: json['about'],
    );
  }
}


//Decoding Data

List<MonumentModel> decodeMonument(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<MonumentModel>((json) => MonumentModel.fromMap(json))
      .toList();
}


// Fetching JsonData

Future<List<MonumentModel>> fetchMonument() async {
  final response = await http.get(
      'https://script.googleusercontent.com/macros/echo?user_content_key=n7G8uc8Q-GxU_EXQ8EfISi2BpRrlkx8FGWxpjrE3puO2PWPTRQ2TBV40sLxezeXieuBpyw_0MvVoqSVmztFYOnidnhXs9i5Km5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnGeIODiePOJMYWGO8hl44KuRmVGhetdo2JMRZu8l42rtFXNL6tcwO-vRXu-jhLXGdNfPu9keP42h1JfSg22EYzfPkI8N5fn36g&lib=Mb66jmR5YkY6ZU8Oh6fka-rY1gpVLdV37'
  );
  if(response.statusCode == 200) {
    return decodeMonument(response.body);
  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}

