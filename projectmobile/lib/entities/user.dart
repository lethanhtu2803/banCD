class User{
  int? id;
  String? username;
  String? password;
  String? fullName;
  int? status;
  String? securityCode;
  String? email;

  User({this.id, this.username, this.password, this.fullName, this.status,
    this.securityCode, this.email});

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      "username": username,
      "password": password,
      "id": id,
      "email": email,
      "fullName": fullName,
      "status": status,
      "securityCode": securityCode,
    };
  }

  User.fromMap(Map<String, dynamic> map){
    id = map["id"];
    username = map["username"];
    password = map["password"];
    email = map["email"];
    fullName = map["fullName"];
    status = map["status"];
    securityCode = map["securityCode"];
  }


}