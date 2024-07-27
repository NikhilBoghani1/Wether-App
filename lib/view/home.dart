import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_wether/const/constants.dart';
import 'package:new_wether/model/WetherData.dart';
import 'package:new_wether/service/api_service.dart';
import 'package:new_wether/view/wether_details.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late WetherData wetherInfo;

  @override
  void initState() {
    super.initState();
    myWeather();
  }

  Future<void> myWeather() async {
    try {
      WetherData wetherData = await wetherService().fetchWether();
      setState(() {
        wetherInfo = wetherData;
      });
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Constants myConstants = Constants();

    Size size = MediaQuery.of(context).size;

    String formattedDate = DateFormat(' d, MMMM , yyyy').format(
      DateTime.now(),
    );

    String formattedTime = DateFormat('hh : mm : ss a').format(
      DateTime.now(),
    );

    return Scaffold(
      backgroundColor: myConstants.secondaryColor.withOpacity(0.8),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
           Container(
             height: 750,
             child: PageView(
               children: [
                 WetherDetails(
                   formattedDate: formattedDate,
                   formattedTime: formattedTime,
                   wether: wetherInfo,
                 ),
                 WetherDetails(
                   formattedDate: formattedDate,
                   formattedTime: formattedTime,
                   wether: wetherInfo,
                 ),
               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}
