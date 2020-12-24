import 'dart:convert';

import 'package:covid19_app/data_source.dart';
import 'package:covid19_app/main.dart';
import 'package:covid19_app/pages/country_page.dart';
import 'package:covid19_app/pages/faqs.dart';
import 'package:covid19_app/panels/info_panel.dart';
import 'package:covid19_app/panels/most_effected_countries.dart';
import 'package:covid19_app/panels/world_wide.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'localization/localization_methods.dart';
import 'model/language.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {

  Map worldData;

  fetchWorldWideData () async{
   http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countriesData;

  fetchCountriesData () async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countriesData = json.decode(response.body);
    });
  }

  Map historicalData;

  fetchHistoricalData () async{
    http.Response response = await http.get('//https://corona.lmao.ninja/v2/historical');
    setState(() {
      historicalData = json.decode(response.body);
    });
  }

@override
  void initState() {
    super.initState();
    fetchWorldWideData();
    fetchCountriesData();
    fetchHistoricalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(getTranslated(context, 'Covid19-Panel')),
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: DropdownButton(
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                  value: lang,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        lang.name,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        lang.flag,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )))
                  .toList(),
              onChanged: (Language lang) {
                _changeLanguage(lang);
              },
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(
                DataSource.quote,
                style: TextStyle(
                    color: Colors.orange[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   getTranslated(context, 'World Wide') ,
                   style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),
                 ),
                 GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => CountryPage()));
                   },
                   child: Container(
                     padding: EdgeInsets.all(10),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15),
                       color: primaryBlack
                     ),
                     color: primaryBlack,
                     child: Text(
                         getTranslated(context, 'Original'),
                       style: TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.bold),
                     ),
                   ),
                 ),
               ],
              ),
            ),
           worldData==null? CircularProgressIndicator(): WorldWidePanel(worldWide: worldData, historyData: historicalData,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                getTranslated(context, 'Most Affected Countries'),
                style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10,),
            countriesData==null? CircularProgressIndicator(): MostAffectedPanel(countryData : countriesData,),
            SizedBox(height: 5,),
            InfoPanel(),
            SizedBox(height: 10,),
            Text(getTranslated(context, 'We We Are Together In This')),
            SizedBox(height: 40,),

          ],
        ),
      ),
    );
  }

  void _changeLanguage(Language lang) async{
    Locale _temp = await setLocale(lang.languageCode);
     MyApp.setLocal(context, _temp);
  }

}


