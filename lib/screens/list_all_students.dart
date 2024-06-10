import 'package:flutter/material.dart';
import 'package:grad_project_last_v/componentes/student_component.dart';
import 'package:grad_project_last_v/screens/splash_screen.dart';
import 'package:grad_project_last_v/services/get_student_status.dart';
import 'package:grad_project_last_v/services/test_new_login_logic.dart';
var index1 =0;
class ListAllStudents extends StatefulWidget {
  const ListAllStudents({Key? key}) : super(key: key);

  @override
  State<ListAllStudents> createState() => _ListAllStudentsState();
}

class _ListAllStudentsState extends State<ListAllStudents> {
  @override
  void initState() {


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
      ),
      body: ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          index1=index;
          // Use FutureBuilder to fetch the student status asynchronously
          return FutureBuilder<String>(
            future: GetStudentStatus.getStatus(
              studentList[index]['ID'], // Pass the student ID
              LoginServiceAfterTesting.parentData['data']
                  ['token'], // Pass the token
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Display a loading indicator while fetching data
                return const ListTile(
                  title: Text('Loading...'),
                );
              } else if (snapshot.hasError) {
                // Display an error message if fetching fails
                return ListTile(
                  title: Text('Error: ${snapshot.error}'),
                );
              } else {
                // Display the student data once fetched successfully
                return StudentView(
                  '${studentList[index]['Student Image']}',
                  '${studentList[index]['class']}',
                  '${studentList[index]['grade']}',
                  '${studentList[index]['Student_Name']}',
                  snapshot.data ??
                      'Not Found', // Display the fetched status or 'Not Found'
                  '${studentList[index]['ID']}',
                );
              }
            },
          );
        },
      ),
    );
  }
}

// class ListAllStudents extends StatefulWidget {
//   const ListAllStudents({Key? key}) : super(key: key);
//
//   @override
//   State<ListAllStudents> createState() => _ListAllStudentsState();
// }
//
// class _ListAllStudentsState extends State<ListAllStudents> {
//
//  @override
//   void initState() {
//
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return
//       ListView.builder(
//       itemBuilder: (context, index) {
//         (
//             GetStudentStatus.getStatus(studentList[index]['ID'],
//             LoginServiceAfterTesting.parentData['data']['token']));
//
//         return StudentView(
//             //  'assets/images/student image.png',
//
//             // '${studentMap['data'][index]['class']}',
//             // '${studentMap['data'][index]['grade']}',
//             // '${studentMap['data'][index]['Student_Name']}',
//             // 'on home',
//             // '${studentMap['data'][index]['ID']}'
//             '${studentList[index]['Student Image']}',
//             '${studentList[index]['class']}',
//             '${studentList[index]['grade']}',
//             '${studentList[index]['Student_Name']}',
//             '',
//             '${studentList[index]['ID']}');
//       },
//       itemCount: studentList.length,
//     );
//   }
// }
