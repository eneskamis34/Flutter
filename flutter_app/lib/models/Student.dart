class Student {
  int id;
  String firstName;
  String lastName;
  int grade;
  String _status;
  String photoLink;

  Student.WithId(int id,String firstName,String lastName,int grade){
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.photoLink = "https://cdn.pixabay.com/photo/2018/06/27/07/45/student-3500990_960_720.jpg";
  }

  Student(String firstName,String lastName,int grade){
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.photoLink = "https://cdn.pixabay.com/photo/2018/06/27/07/45/student-3500990_960_720.jpg";
  }

  String get getFirstName{
    return "OGR - "+this.firstName;
  }

  void set setFirstName(String value) {
    this.firstName = firstName;
  }

  String get getStatus{
    String message = "";
     if (this.grade >= 50) {
       message = "Geçti";
    } else if (this.grade >= 40 && this.grade <= 49) {
       message = "Bütünlemeye Kaldı";
    } else {
       message = "Kaldı";
    }
    return message;
  }
}
