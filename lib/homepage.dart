import 'dart:convert';
import 'package:coronadetails/pages/regional.dart';
import 'package:coronadetails/panels/nepal.dart';
import 'package:coronadetails/panels/worldwide.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'pages/developerpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map nepalData;
  fetchNepalData() async {
    http.Response response =
        await http.get("https://disease.sh/v2/countries/nepal");
    setState(() {
      nepalData = jsonDecode(response.body);
    });
  }

  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get("https://disease.sh/v2/all");
    setState(() {
      worldData = jsonDecode(response.body);
    });
  }
  List countryData;


  @override
  void initState() {
    fetchNepalData();
    fetchWorldWideData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Center(child: Text("COVID-19 Tracker",style: TextStyle(
          fontSize: 25.0,
          fontFamily: 'Pacific'
        ),)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 150,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Color(0xFF1B1B32),
              child: Image.asset("images/nepal.png"),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "NEPAL🇳🇵",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CountryPage();
                          },
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Regional",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            nepalData == null
                ? CircularProgressIndicator()
                : NepalPanel(
                    nepalData: nepalData,
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "WORLDWIDE🌎",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ),
            worldData == null
                ? CircularProgressIndicator()
                : WorldWidePanel(
                    worldData: worldData,
                  ),
            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DeveloperPage();
                    },
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Contact Developer",
                    style: TextStyle(
                      fontFamily: "Pacific",
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
