import 'package:covid19_app/data_source.dart';
import 'package:covid19_app/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => FAQpage()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('FAQS' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white),),
                Icon(Icons.arrow_forward , color: Colors.white,),

                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch('https://www.fda.gov/emergency-preparedness-and-response/coronavirus-disease-2019-covid-19/donate-covid-19-plasma');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('DONATE' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white),),
                  Icon(Icons.arrow_forward , color: Colors.white,),

                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch('https://www.fda.gov/emergency-preparedness-and-response/coronavirus-disease-2019-covid-19/donate-covid-19-plasma');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('MYTH BUSTERS' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white),),
                  Icon(Icons.arrow_forward , color: Colors.white,),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

