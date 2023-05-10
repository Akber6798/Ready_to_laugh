import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ready_to_laugh/controller/joke_controller.dart';
import 'package:ready_to_laugh/services/api_services.dart';
import 'package:ready_to_laugh/utils/app_colors.dart';
import 'package:ready_to_laugh/utils/app_style.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  var data = ApiServices().getJokes();
  @override
  Widget build(BuildContext context) {
    var jokeProvider = Provider.of<JokeController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldColor,
        elevation: 0,
        title: Text('Are you Ready to laugh!',
            style: AppStyle()
                .appTextStyle(50, AppColors.textColor, FontWeight.w600)),
        actions: [
          Image(
              height: 60.h,
              width: 60.w,
              image: const AssetImage("assets/icon/silly.png")),
          SizedBox(width: 25.w)
        ],
      ),
      body: FutureBuilder(
          future: ApiServices().getJokes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.scaffoldColor),
                  Positioned(
                      top: 35.h,
                      left: 20.w,
                      child: SizedBox(
                        height: 200.h,
                        width: 780.w,
                        child: Text(snapshot.data!.setup,
                            style: AppStyle().appTextStyle(
                                50, AppColors.textColor, FontWeight.w700)),
                      )),
                  Positioned(
                    bottom: 0.h,
                    child: Container(
                      height: 220.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          )),
                    ),
                  ),
                  Positioned(
                    top: 200.h,
                    left: 20.w,
                    child: SizedBox(
                      height: 200.h,
                      width: 780.w,
                      child: Text(snapshot.data!.punchline,
                          style: AppStyle().appTextStyle(
                              50, AppColors.scaffoldColor, FontWeight.w700)),
                    ),
                  ),
                  Positioned(
                      bottom: 10.h,
                      right: 20.w,
                      child: SizedBox(
                        height: 30.h,
                        width: 320.w,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: AppColors.scaffoldColor),
                            onPressed: () {
                              jokeProvider.changeJoke(data);
                            },
                            child: Text(
                              'Laugh more',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor),
                            )),
                      ))
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            }
          }),
    );
  }
}
