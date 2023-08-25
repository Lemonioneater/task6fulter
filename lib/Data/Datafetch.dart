import 'dart:convert' as convert;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;


import 'Datamodels/Productmodel.dart';
import 'Datamodels/Userdatamodel.dart';
List<ProductItem> bought = [];

 class DataSource {
  static Future<List<ProductItem>> getData() async {
    final response =
    await http.get(Uri.parse('https://dummyjson.com/products'));
    List<ProductItem> productsList = [];

    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      for (var item in jsonResponse['products']) {
        productsList.add(ProductItem.fromJson(item));
      }
    }
    return productsList;
  }

  static List<ProductItem> products = [];
  static bool isLoading = true;
  static bool profile = true;

  static Future<Userdata?> getuserdata()async {

    try{
      String? uid = FirebaseAuth.instance.currentUser!.uid;
      Userdata? user;
       DocumentSnapshot userb = await FirebaseFirestore.instance.collection('user').doc(uid).get();
       user = Userdata(
             name: userb['name'],
             password: userb['password'],
             phone: userb['phone'],
             email: userb['email'],
             uid: userb['uid'],
             image: userb['uid'],

       );
      return user;
    } catch(error){
      print(error.toString());
      return null;
    }
  }
  static Userdata? userdata;
}
