import 'package:flutter/material.dart';

class AnnouncementComponent extends StatelessWidget {
 String announcementContent;
 AnnouncementComponent(this.announcementContent);
  @override
  Widget build(BuildContext context) {
    double width =MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xff1D9BFC))),
      child: Row(
        children: [
          Icon(Icons.waving_hand_sharp),
          SizedBox(
            width: width*0.02,
          ),
          Text(announcementContent)
        ],
      ),
    );
  }
}
