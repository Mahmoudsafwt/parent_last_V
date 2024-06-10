import 'package:flutter/material.dart';
import 'package:grad_project_last_v/componentes/announcement_component.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(padding: EdgeInsets.all(10),itemBuilder: (context,index){
      return AnnouncementComponent('your kid will be arrive soon'
          );
    },itemCount: 3,);
  }
}
