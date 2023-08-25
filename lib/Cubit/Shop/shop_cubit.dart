

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3ahmed_faisal/Cubit/Shop/shop_state.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../../Data/Datamodels/Productmodel.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());

  Future<void> getData() async {
    try {
      emit(Loading());
      final response =
      await http.get(Uri.parse('https://dummyjson.com/products'));

      if (response.statusCode == 200) {
        var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
        for (var item in jsonResponse['products']) {
          products.add(ProductItem.fromJson(item));
        }
      }
      emit(Done());
    } catch (error) {
      emit(Erorr());
      print(error.toString());
    }
  }

  List<ProductItem> products = [];

  void refresh()  {
    emit(Refresh());
  }

}
