class Userdata {
  String password;
  String email;
  String phone;
  String name;
  String uid;
  String image;
  Userdata({
   required this.uid,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.image,
  });

  factory Userdata.fromJson(Map<String, dynamic> json) {
    return Userdata(
      email: json['email'],
      name: json['name'],
      uid:  json['uid'],
      password : json['password'],
      phone : json ['phone'],
      image : json ['image'],

    );
  }
}
