
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3ahmed_faisal/Cubit/Shop/shop_state.dart';
import '../Cubit/Shop/shop_cubit.dart';
import '../Data/List_displayers/Product_display2.dart';
import '../Data/Styles/textstyles.dart';
import 'Login.dart';

Future<bool> logout() async{
  try {
    await FirebaseAuth.instance.signOut();
    return true;
  } catch (error) {
    print(error.toString());
    return false;
  }
}


class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: const Color(0xffFFFFFF),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xffFFFFFF),
            foregroundColor: const Color(0xff252837),
            actions: [
              const SizedBox(width: 10,),
              IconButton(
                onPressed: () async {
                  await logout().then((value){
                    if(value)
                    {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context){
                            return  Loginpage();
                          }
                          )
                      );
                    }
                  });
                }, icon: const Icon(Icons.logout),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 0,
                  top: 15,
                  bottom: 0,
                ),
                child:  const Text(
                  'New Products',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      color: Color(0xff252837),
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Expanded(child: SizedBox()),
              Container(
                margin:
                const EdgeInsets.only(left: 0, right: 20, top: 15, bottom: 0),
                child:  const Text(
                  'See all',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18,
                      color: Color(0xff6F6F6F),
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          body: BlocConsumer<ShopCubit,ShopState>(
              listener: (context, state) {
                if (state is Erorr) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text('Service temporally unavailable'),
                      );
                    },
                  );
                  print('Service temporally unavailable');
                }
              },
              builder: (context, state){
                if( state is Loading) {
                  return const Center(child: CircularProgressIndicator(),);
                }
                else if (state is Done || context.read<ShopCubit>().products.isNotEmpty){
                  return SafeArea(
                    child: Column(
                      children: [
                         Padding(
                           padding: const EdgeInsets.only(
                             left: 16,
                             right: 16,
                             top: 5,
                             bottom: 5,
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Welcome to\nEGYDYNAMIC',
                              style: title,
                              ),
                              Image.asset('assets/img.png')

                            ],
                        ),
                         ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: context.read<ShopCubit>().products.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Display2(
                                product: context.read<ShopCubit>().products[index],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );}
                else{
                  const Center(
                    child: Text('Error'),

                  );
                }
                return const SizedBox();
              }
          ),
      );
  }
}
