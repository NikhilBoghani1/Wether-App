import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_wether/model/WetherData.dart';

import '../const/constants.dart';

class WetherDetails extends StatefulWidget {
  final WetherData wether;
  final String formattedDate;
  final String formattedTime;

  const WetherDetails({
    Key? key,
    required this.wether,
    required this.formattedDate,
    required this.formattedTime,
  }) : super(key: key);

  @override
  State<WetherDetails> createState() => _WetherDetailsState();
}

class _WetherDetailsState extends State<WetherDetails> {
  @override
  Widget build(BuildContext context) {
    Constants myConstants = Constants();

    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.formattedDate,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: myConstants.PoppinsSB,
                  fontSize: 18,
                ),
              ),
              Text(
                widget.formattedTime,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: myConstants.PoppinsSB,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 80),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${widget.wether.name}",
              style: TextStyle(
                color: Colors.white,
                fontFamily: myConstants.PoppinsSB,
                fontSize: 26,
              ),
            ),
            Text(
              " , India",
              style: TextStyle(
                color: Colors.white,
                fontFamily: myConstants.PoppinsSB,
              ),
            )
          ],
        ),
        SizedBox(height: 40),
        Image.asset(
          width: 150,
          height: 150,
          "assets/images/cloudy.png",
        ),
        SizedBox(height: 30),
        Text(
          "${widget.wether.main?.temp} °C",
          style: TextStyle(
            color: Colors.white,
            fontFamily: myConstants.RobotoM,
            fontSize: 26,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "${widget.wether.weather?[0].main}",
          style: TextStyle(
            color: Colors.white,
            fontFamily: myConstants.PoppinsSB,
          ),
        ),
        SizedBox(height: 10),
        /* Text(
          widget.formattedDate,
          style: TextStyle(
            color: Colors.white,
            fontFamily: myConstants.RobotoM,
          ),
        ),
        Text(
          widget.formattedTime,
          style: TextStyle(
            color: Colors.white,
            fontFamily: myConstants.RobotoM,
          ),
        ),*/
        SizedBox(height: 30),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: 330,
          height: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: myConstants.secondaryColor.withOpacity(0.5),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          CupertinoIcons.wind,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${widget.wether.wind!.speed} km/h",
                          style: TextStyle(
                            fontFamily: myConstants.PoppinsSB,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Wind",
                          style: TextStyle(
                            fontFamily: myConstants.PoppinsSB,
                          ),
                        )
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.black,
                    indent: 25,
                    endIndent: 25,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          CupertinoIcons.light_max,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${widget.wether.main!.tempMax} °C",
                          style: TextStyle(
                            fontFamily: myConstants.PoppinsSB,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Max",
                          style: TextStyle(
                            fontFamily: myConstants.PoppinsSB,
                          ),
                        )
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.black,
                    indent: 25,
                    endIndent: 25,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          CupertinoIcons.light_min,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${widget.wether.main!.tempMin} °C",
                          style: TextStyle(
                            fontFamily: myConstants.PoppinsSB,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Min",
                          style: TextStyle(
                            fontFamily: myConstants.PoppinsSB,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                endIndent: 10,
                indent: 10,
                color: Colors.black,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          CupertinoIcons.drop_fill,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${widget.wether.main?.humidity} %",
                          style: TextStyle(
                            fontFamily: myConstants.PoppinsSB,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Humidity",
                          style: TextStyle(
                            fontFamily: myConstants.PoppinsSB,
                          ),
                        )
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.black,
                    indent: 25,
                    endIndent: 25,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          CupertinoIcons.wind_snow,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${widget.wether.main!.pressure} hPa",
                          style: TextStyle(
                            fontFamily: myConstants.PoppinsSB,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Pressure",
                          style: TextStyle(
                            fontFamily: myConstants.PoppinsSB,
                          ),
                        )
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.black,
                    indent: 25,
                    endIndent: 25,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          CupertinoIcons.chart_bar_alt_fill,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${widget.wether.main!.seaLevel} m",
                          style: TextStyle(
                            fontFamily: myConstants.PoppinsSB,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Sea-Level",
                          style: TextStyle(
                            fontFamily: myConstants.PoppinsSB,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
