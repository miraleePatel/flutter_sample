import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:launch_review/launch_review.dart';
import 'package:sizer/sizer.dart';
import '../Models/api_model.dart';

class SecondPage extends StatefulWidget {
  List<SubCategory> datalist;
  SecondPage({Key? key, required this.datalist}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: widget.datalist.length,
            itemBuilder: (context, index) {
          return Container(
            height: 16.h,
            width: 97.w,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.green,
                      blurRadius: 12,
                      spreadRadius: 10,
                      offset: Offset(0.2, 1.0))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 14.h,
                  width: 14.h,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                   child: Image.network(widget.datalist[index].icon!),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 30.w,
                      child: Text(widget.datalist[index].name!,
                      maxLines: 2),
                    ),
                    RatingBar.builder(
                        itemBuilder: (context,_)=>Icon(
                          Icons.star,
                          color: Colors.black45,
                        ),
                        maxRating: 5,
                        itemCount: 5,
                        itemSize: 22,
                        allowHalfRating: true,
                        initialRating: double.parse(widget.datalist[index].star!),
                        onRatingUpdate:(rating){
                          print(rating);
                        } ),
                    Text(widget.datalist[index].installedRange!)
                  ],
                ),
                Container(
                  height: 4.h,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)
                    ),
                  child:MaterialButton(
                    onPressed: (){
                      LaunchReview.launch(androidAppId: widget.datalist![index].appLink!);
                    },
                    child: Text("Download"),
                  )
                ),
              ],
            ),
          );
        }));
  }
}
