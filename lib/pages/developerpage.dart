import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperPage extends StatefulWidget {
  static String id = "forget_pass";
  @override
  _DeveloperPageState createState() => _DeveloperPageState();
}

class _DeveloperPageState extends State<DeveloperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(40),
            child: Image.asset('images/dipesh.png'),
          ),
          Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Name: Dipesh Khanal",style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Pacific'
                  ),),
                  Text("Address: Kathmandu, Nepal",style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Pacific'
                  ),),
                  Text("Email: dkhanal112@gmail.com",style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Pacific'
                  ),),
                  Text("Contact: 9810560652",style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Pacific'
                  ),),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      launch("https://www.linkedin.com/in/dkhanal112/");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "LinkedIn",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      launch("https://www.facebook.com/dkhanal112 ");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF4267B2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Facebook",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                  )
                ],
              )
//
//
//              Text(
//                "You need to increase your memory power."
//                "Memory strength is just like muscular strength. The more you use it, the stronger it gets.",
//                style: TextStyle(
//                  fontFamily: "Pacific",
//                  fontSize: 30.0,
//                  fontWeight: FontWeight.w900,
//                  fontStyle: FontStyle.italic,
//                ),
//              ),
            ),
          ),
        ],
      ),
    );
  }
}
