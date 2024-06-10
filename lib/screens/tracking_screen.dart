import 'package:flutter/material.dart';
import 'package:grad_project_last_v/screens/splash_screen.dart';
import 'package:grad_project_last_v/services/get_location.dart';

import '../services/get_student_status.dart';
import '../services/test_new_login_logic.dart';
import 'map_screen.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key? key}) : super(key: key);
  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {

  List<String>_names=[];

  List<int>_IDs=[];
  @override
  void initState() {
    fetchNamesAndIDs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          const Text('Select Your Kid :',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 200,
            decoration:  BoxDecoration(color: const Color(0xff0D63A7),borderRadius:BorderRadius.circular(12)),
            //width: 200,
            child: DropdownButton<String>(iconEnabledColor: Colors.white,iconSize: 28,
              items: _names.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),

              onChanged: (name) async{
              late int index;
              for(int i=0;i<_names.length;i++){
                if(name==_names[i]){
                  index=i;
                }
              }
              String status = await GetStudentStatus.getStatus(_IDs[index],
                  LoginServiceAfterTesting.parentData['data']['token']);
              if (status == 'On Bus') {
                await GetLocation.getStudentLocation(
                    LoginServiceAfterTesting.parentData['data']['token'],
                   _IDs[index]);
                //print('3333333333333   $studentId  ####################');
                Navigator.pushNamed(context, MapScreen.routeName);
              } else {
                location.clear();
                Navigator.pushNamed(context, MapScreen.routeName);
              }
              },
            ),
          ),
        ],
      ),
    );
  }

  void fetchNamesAndIDs(){
    for(int i=0;i<studentList.length;i++){
      _names.add(studentList[i]['Student_Name']);
      _IDs.add(studentList[i]['ID']);
    }
  }
}
