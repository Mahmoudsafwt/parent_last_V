class Student {
 final String name;
 final String studentClass;
 final String grade;
 final int id;
  Student(
      {required this.studentClass,
      required this.name,
      required this.grade,
      required this.id});
  factory Student.fromJason(dynamic jasonData) {
    return Student(
      id: jasonData["data"][0]["ID"],
        studentClass: jasonData["data"][0]["class"],
        name: jasonData["data"][0]["Student_Name"],
        grade: jasonData["data"][0]["grade"],
       );
  }
}
// {
// "status": 200,
// "message": "Children for this Parent",
// "data": [
// {
// "ID": 72987,
// "Student_Name": "Ali",
// "grade": "four",
// "class": "A",
// "Student Image": "L3RtcC9waHBZSEo2S1E="
// },
// {
// "ID": 76838,
// "Student_Name": "Ahmed",
// "grade": "five",
// "class": "A",
// "Student Image": "L3RtcC9waHByYVNPWGw="
// }
// ]
// }
