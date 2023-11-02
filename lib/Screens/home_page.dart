import 'package:demo_api/Controller/api_controller.dart';
import 'package:demo_api/Screens/second_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = Get.put(ApiController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(()=>controller.apimodel.value.appCenter != null ? ListView.separated(
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Get.to(SecondPage(datalist: controller.apimodel.value.appCenter![index].subCategory!));
              },
              child: Container(
                height: 15.h,
                width: 95.w,
                alignment: Alignment.center,
                color: Colors.black12,
                  child:  Text(controller.apimodel.value.appCenter![index].name!,style: TextStyle(fontSize: 30),)
              ),
            );
          },
          separatorBuilder: (context,index){
            return Divider(
              height: 30,
            );
          },
          itemCount:controller.apimodel.value.appCenter!.length,) : CircularProgressIndicator())
    );
  }
}

