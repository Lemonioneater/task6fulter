import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3ahmed_faisal/Cubit/Profile/profile_cubit.dart';
import 'package:task3ahmed_faisal/Pages/Login.dart';
import '../Cubit/Profile/profile_state.dart';
import '../main.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => ProfileCubit()..getuserdata(),
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body:
            BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
          if (state is UDatabar) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UDatadone ||
              context.read<ProfileCubit>().userdata != null) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Row(
                    children: [
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
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.height * 0.1,
                        backgroundImage: context
                                    .read<ProfileCubit>()
                                    .userdata!
                                    .image ==
                                ''
                            ? const NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmJvXw8ZBpDZpX5i8yPmy9SgP1SK5vXQKVUw&usqp=CAU')
                            : NetworkImage(
                                context.read<ProfileCubit>().userdata!.image),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xffF4F4F4),
                            border: Border.all(
                                width: 1, color: const Color(0xffFFFFF)),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                context.read<ProfileCubit>().fetchimage();
                              },
                              icon: const Icon(
                                Icons.camera_alt_outlined,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.075,
                      margin: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffDADADA),
                          border: Border.all(
                              width: 2, color: const Color(0xff000000))),
                      child: Center(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                'Username : ${context.read<ProfileCubit>().userdata!.name}',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Urbanist',
                                    color: Color(0xff000000)),
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                          ],
                        ),
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.075,
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffDADADA),
                          border: Border.all(
                              width: 2, color: const Color(0xff000000))),
                      child: Center(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                'Email : ${context.read<ProfileCubit>().userdata!.email}',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Urbanist',
                                    color: Color(0xff000000)),
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                          ],
                        ),
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.075,
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffDADADA),
                          border: Border.all(
                              width: 2, color: const Color(0xff000000))),
                      child: Center(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                'Phone : ${context.read<ProfileCubit>().userdata!.phone}',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Urbanist',
                                    color: Color(0xff000000)),
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                          ],
                        ),
                      )),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        }),
      ),
    );
  }
}
