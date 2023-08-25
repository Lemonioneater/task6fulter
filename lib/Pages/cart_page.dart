import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3ahmed_faisal/Cubit/Shop/shop_cubit.dart';
import 'package:task3ahmed_faisal/Cubit/Shop/shop_state.dart';
import '../Data/List_displayers/Cart_displayer.dart';
import '../main.dart';
import 'Login.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xffFFFFFF),
            foregroundColor: const Color(0xff252837),
            actions: [
              IconButton(
                onPressed: () async {
                  await logout().then((value) {
                    if (value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return Loginpage();
                      }));
                    }
                  });
                },
                icon: const Icon(Icons.logout),
              ),
              const Expanded(child: SizedBox()),
              const Center(
                child: Text(
                  'Cart',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      color: Color(0xff252837),
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Expanded(child: SizedBox()),
              Visibility(
                visible: false,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.logout),
                ),
              ),
            ],
          ),
          backgroundColor: const Color(0xffFFFFFF),
          body: y == 0
              ? const Center(
                  child: Text(
                  'Add items to cart to be displayed',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ))
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                            itemCount:
                                context.read<ShopCubit>().products.length,
                            itemBuilder: (context, index) {
                              if (context
                                      .read<ShopCubit>()
                                      .products[index]
                                      .count ==
                                  0) {
                                return const SizedBox();
                              }
                              return Cartdisp(
                                product2:
                                    context.read<ShopCubit>().products[index],
                              );
                            },
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(
                              right: 0,
                              top: 10,
                              bottom: 10,
                              left: 5,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: BlocBuilder<ShopCubit, ShopState>(
                                    builder: (context, state) {
                                      context.read<ShopCubit>().refresh();
                                      return Text(
                                        'Total : \$${y.toString()}',
                                        style: const TextStyle(
                                          fontSize: 24,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.08),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
