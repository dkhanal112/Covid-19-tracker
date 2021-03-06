import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {

  List countryData;

  fetchCountryData() async {
    http.Response response =
    await http.get("https://disease.sh/v2/countries");
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(child: Text("Country Status",style: TextStyle(
          fontFamily: "Pacific",
          fontSize: 25.0,
        ),)),

      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: 130,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[100],
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  ),
                ]
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(countryData[index]["country"]),
                      Image.network(
                        countryData[index]['countryInfo']['flag'], height: 50,
                        width: 60,)
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("CONFIRMED:" + countryData[index]['cases']
                            .toString(), style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 18),),
                        Text("ACTIVE:" + countryData[index]['active']
                            .toString(), style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),),
                        Text("RECOVERED:" + countryData[index]['recovered']
                            .toString(), style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),),
                        Text("DEATH:" + countryData[index]['deaths'].toString(),
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),),
                      ],
                    ),
                  ),


                )
              ],
            ),
          );
        },
        itemCount: countryData == null ?0 : countryData.length,
      ),
    );
  }

}