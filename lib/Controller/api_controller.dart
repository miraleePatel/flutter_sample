
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:demo_api/Models/api_model.dart';
import 'package:get/get.dart';

class ApiController extends GetxController{
  final apimodel = ApiModel().obs;
  
  getData() async{
    var response = await http.get(Uri.parse('http://vasundharaapps.com/artwork_apps/api/AdvertiseNewApplications/17/com.latest.status.message.text.jokes.funny'));

    if(response.statusCode==200){
      var data = jsonDecode(response.body);
      apimodel.value = ApiModel.fromJson(data);
    }
  }
}