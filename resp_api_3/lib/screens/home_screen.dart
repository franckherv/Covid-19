import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resp_api_3/components/carousel_sliver_data_found.dart';
import 'package:resp_api_3/controller/home_controller.dart';
import '../components/carousel_slide.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeController>(
        builder: (_c) {
         if(_c.isLoading)
                if(_c.carouselData.length>0)
                  return CarouselSliderDataFound(_c.carouselData);
                else
                  return CarouselLoading();
              else
                if(_c.carouselData.length>0)
                  return CarouselSliderDataFound(_c.carouselData);
                else
                  return Container();
        },
      )),
    );
  }
}
