import 'package:covid19_app/widgets/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;
  final Function press;
  final Map historyData;

  const InfoCard({Key key, this.title, this.effectedNum, this.iconColor, this.press, this.historyData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          margin: EdgeInsets.all(5),
          color: Colors.black26,
          child: GestureDetector(
            onTap: press,
            child: Container(
              width: (MediaQuery.of(context).size.width / 2) - 10,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: iconColor.withOpacity(0.12),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              'assets/running.svg',
                              height: 12,
                              width: 12,
                              color: iconColor,
                            ),
                          ),
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),

                            child: RichText(

                              text: TextSpan(

                                  style: TextStyle(color: Color(0xFF1E2432)),
                                  children: [

                                    TextSpan(
                                        text: '${effectedNum.toString()}\n',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: 'people',
                                        style: TextStyle(fontSize: 10, height: 2)),
                                  ]
                              ),
                            ),
                          ),
                          Expanded(
                            child: LineChartWidget(historyData: historyData, title: this.title,),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
