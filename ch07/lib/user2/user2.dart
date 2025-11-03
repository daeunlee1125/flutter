

class User2 {
  String userid;
  String address;
  int age;
  String name;

  User2({required this.userid, required this.address, required this.age, required this.name});

  factory User2.fromJson(Map<String, dynamic> json){
    return User2(
        userid: json['userid'],
        address: json['address'],
        age: json['age'],
        name: json['name']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "userid": userid,
      "address": address,
      "age": age,
      "name": name
    };
  }
}