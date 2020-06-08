import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class WorldWidePanel extends StatelessWidget {

  final Map worldData;

  const WorldWidePanel({Key key, this.worldData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,childAspectRatio: 2 ),
        children: <Widget>[
          StatusPanel(
            title: 'CONFIRMED',
            panelColor:Colors.red[200] ,
            textColor: Colors.red[900],
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE',
            panelColor:Colors.blue[300] ,
            textColor: Colors.blue[900],
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelColor:Colors.green[200] ,
            textColor: Colors.green[700],
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            title: 'DEATHS',
            panelColor:Colors.grey[300] ,
            textColor: Colors.grey[800],
            count: worldData['deaths'].toString(),
          ),

        ],
      ),
    );
  }
}
class StatusPanel extends StatelessWidget {
StatusPanel({this.panelColor, this.textColor, this.title , this.count});
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      height: 80,
      width: width/2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,style:
            TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          Text(count,style:
            TextStyle(
              color: textColor,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),),
        ],
      ),

    );
  }
}

