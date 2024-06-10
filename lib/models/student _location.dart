class Student {
  final int id;
  final String name;

  Student({required this.id, required this.name});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['ID'],
      name: json['Student_Name'],
    );
  }

  Map<String, dynamic> toJson() => {
    'ID': id,
    'Student_Name': name,
  };
}