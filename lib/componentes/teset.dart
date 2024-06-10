import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return    Column(
      children: [
        Divider(
          color: Color(0xff636262),
          thickness: 1,
        ),
        Row(
          children: [
            ImageIcon(AssetImage('assets/images/attendance icon.png',),size: 35,),
            SizedBox(
              width: width*0.03,
            ),
            Text('Attendance',style: TextStyle(
                color: Color(0xff636262),fontSize: 18
            ),)
          ],
        ),
        Divider(
          color: Color(0xff636262),
          thickness: 1,
        ),
      ],
    );
  }
}
