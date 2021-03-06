import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countriesData;

  fetchCountriesData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countriesData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCountriesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('countries status'),
      ),
      body: countriesData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: countriesData == null ? 0 : countriesData.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 130,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey[100],
                        offset: Offset(0, 10),
                        blurRadius: 10),
                  ]),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              countriesData[index]['country'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Image.network(
                              countriesData[index]['countryInfo']['flag'],
                              height: 40,
                              width: 50,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('CONFIRMED ' + countriesData[index]['cases'].toString() , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.red),),
                            Text('ACTIVE ' + countriesData[index]['active'].toString() , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.blue)),
                            Text('RECOVERED ' + countriesData[index]['recovered'].toString() ,style: TextStyle(fontWeight: FontWeight.bold , color: Colors.green) ),
                            Text('DEATHS ' + countriesData[index]['deaths'].toString() , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.grey[800])),
                          ],
                        ),
                      ))
                    ],
                  ),
                );

              }
              ),
    );
  }
}
