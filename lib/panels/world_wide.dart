import 'package:covid19_app/widgets/info_card.dart';
import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {

   Map worldWide;
   Map historyData;

   WorldWidePanel({this.worldWide, this.historyData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
       shrinkWrap: true,
       physics: NeverScrollableScrollPhysics(),
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2
      ),
      children: [
        InfoCard(
          title: 'CONFIRMED',
          effectedNum: worldWide['cases'],
          iconColor: Colors.red[100],
          press: (){},
          historyData: historyData,
        ),
        InfoCard(
          iconColor: Colors.blue[100],
          effectedNum: worldWide['active'],
          title: 'ACTIVE',
          press: (){},
          historyData: historyData,
        ),
        InfoCard(
          iconColor: Colors.green[100],
          effectedNum: worldWide['recovered'],
          title: 'RECOVERD',
          press: (){},
          historyData: historyData,
        ),
        InfoCard(
          iconColor: Colors.grey[400],
          effectedNum: worldWide['deaths'],
          title: 'DEATH',
          press: (){},
          historyData: historyData,
        ),
      ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {

  final Color cardColor;
  final Color textColor;
  final String count;
  final String title;

  const StatusPanel({Key key, this.cardColor, this.textColor, this.count, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Container(
     margin: EdgeInsets.all(6),
     height: 80,
     width: width/2,
     color: cardColor,
     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title ,
          style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16 , color: textColor),),
        Text(count ,
          style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16 , color: textColor),),
      ],
     ),
    );
  }
}

