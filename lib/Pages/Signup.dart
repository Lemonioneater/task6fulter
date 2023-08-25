import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task3ahmed_faisal/Cubit/Login_and_Signup/accounts_cubit.dart';
import 'package:task3ahmed_faisal/Cubit/Login_and_Signup/accounts_state.dart';
import 'package:task3ahmed_faisal/Pages/Login.dart';
import 'package:task3ahmed_faisal/Pages/Myhomepage.dart';

import '../Data/Styles/textstyles.dart';

class Signuppage extends StatelessWidget {
   Signuppage({super.key});

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController password2 = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController phone = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPassword = true;

  bool isPassowrdConfirm = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountsCubit>(
      create: (context) => AccountsCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xffF6F7F8),
        resizeToAvoidBottomInset: false,
        body: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Loginpage();
                        }));
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 2,
                            color: const Color(0xffDADADA),
                          ),
                        ),
                        child: const Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.0125),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Welcome Back! Glad to see you again',
                        style: title,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 10,
                  right: 10,
                  left: 10,
                ),
                height: MediaQuery.of(context).size.height * 0.075,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffDADADA),
                  border: Border.all(
                    width: 2,
                    color: const Color(0xffDADADA),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: TextFormField(
                            decoration:  InputDecoration(
                              hintText: 'Full name',
                              hintStyle: hintext
                            ),
                            style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000)),
                            controller: name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Name must not be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 10,
                  right: 10,
                  left: 10,
                ),
                height: MediaQuery.of(context).size.height * 0.075,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffDADADA),
                  border: Border.all(
                    width: 2,
                    color: const Color(0xffDADADA),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: TextFormField(
                            decoration:  InputDecoration(
                              hintText: 'Email',
                              hintStyle: hintext,
                            ),
                            style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000)),
                            controller: email,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email must not be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 10,
                  right: 10,
                  left: 10,
                ),
                height: MediaQuery.of(context).size.height * 0.075,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffDADADA),
                  border: Border.all(
                    width: 2,
                    color: const Color(0xffDADADA),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: StatefulBuilder(
                              builder: (context, setState) {
                            return TextFormField(
                              obscureText: isPassword,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: hintext,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPassword = !isPassword;
                                    });
                                  },
                                  icon: Icon(isPassword
                                      ? Icons.remove_red_eye
                                      : Icons.remove_red_eye_outlined),
                                ),
                              ),
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff000000)),
                              controller: password,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password must not be empty';
                                } else if (value.length < 9) {
                                  return 'Password is min 9 chars';
                                }
                                return null;
                              },
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 10,
                  right: 10,
                  left: 10,
                ),
                height: MediaQuery.of(context).size.height * 0.075,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffDADADA),
                  border: Border.all(
                    width: 2,
                    color: const Color(0xffDADADA),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: StatefulBuilder(
                            builder: (context, setState) {
                              return TextFormField(
                                obscureText: isPassowrdConfirm,
                                decoration: InputDecoration(
                                  hintText: 'Enter your Password',
                                  hintStyle: hintext,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState((){
                                        isPassowrdConfirm = !isPassowrdConfirm;
                                      });
                                    },
                                    icon: Icon(isPassowrdConfirm
                                        ? Icons.remove_red_eye
                                        : Icons.remove_red_eye_outlined),
                                  ),
                                ),
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000)),
                                controller: password2,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password must not be empty';
                                  } else if (value.length < 9) {
                                    return 'Password is min 9 chars';
                                  } else if (password2.text != password.text) {
                                    return 'Passwords must be the the same';
                                  }
                                  return null;
                                },
                              );
                            }
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 10,
                  right: 10,
                  left: 10,
                ),
                height: MediaQuery.of(context).size.height * 0.075,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffDADADA),
                  border: Border.all(
                    width: 2,
                    color: const Color(0xffDADADA),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: TextFormField(
                            decoration:  InputDecoration(
                              hintText: 'Phone',
                              hintStyle: hintext,
                            ),
                            style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000)),
                            controller: phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Number must not be empty';
                              } else if (value.length != 11) {
                                return 'Number is not 11 digits';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              BlocConsumer<AccountsCubit, AccountsState>(
                listener: (context, state) {
                  if (state is Signuperror) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.error)));
                  } else if (state is Signupdone) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const Myhomepage();
                    }));
                  }
                },
                builder: (context, state) {
                  return InkWell(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        await context.read<AccountsCubit>().signup(
                              email: email.text,
                              password: password.text,
                              name: name.text,
                              phone: phone.text,
                            );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 10,
                        right: 10,
                        left: 10,
                      ),
                      height: MediaQuery.of(context).size.height * 0.075,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: const Color(0xff300046),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 25,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(children: [
                  Expanded(
                      child: Divider(
                    color: Color(0xffE8ECF4),
                  )),
                  Text(
                    "Or login with",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Urbanist',
                      color: Color(0xff6A707C),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    color: Color(0xffE8ECF4),
                  )),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Center(
                          child: SvgPicture.asset('assets/svgs/facebook.svg')),
                    ),
                    Expanded(
                      child: SvgPicture.asset('assets/svgs/Google.svg'),
                    ),
                    Expanded(
                      child: Center(
                          child: SvgPicture.asset('assets/svgs/Apple.svg')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
