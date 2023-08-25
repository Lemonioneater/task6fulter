import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task3ahmed_faisal/Cubit/Login_and_Signup/accounts_cubit.dart';
import 'package:task3ahmed_faisal/Cubit/Login_and_Signup/accounts_state.dart';
import 'package:task3ahmed_faisal/Pages/Myhomepage.dart';
import 'package:task3ahmed_faisal/Pages/Signup.dart';

import '../Data/Styles/textstyles.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController name = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountsCubit>(
      create: (context) => AccountsCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffFFFFFF),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
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
                height: MediaQuery.of(context).size.height * 0.05,
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
                        child: Center(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter your Email',
                              hintStyle: hintext,
                            ),
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000),
                            ),
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
                          child: Center(
                            child:
                                StatefulBuilder(builder: (context, setState) {
                              return TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your Password',
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
                                    color: Color(0xff0000000)),
                                controller: password,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password must not be empty';
                                  } else if (value.length < 8) {
                                    return 'Password is min 9 chars';
                                  }
                                  return null;
                                },
                                obscureText: isPassword,
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              BlocConsumer<AccountsCubit, AccountsState>(
                listener: (context, state) {
                  if (state is Loginerror) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error.toString()),
                      ),
                    );
                  } else if (state is Logindone) {
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
                        context
                            .read<AccountsCubit>()
                            .loginpage(email.text, password.text);
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
                          'Login',
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(children: [
                  Expanded(
                    child: Divider(
                      thickness: 2.5,
                      color: Color(0xffE8ECF4),
                    ),
                  ),
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
                    thickness: 2.5,
                    color: Color(0xffE8ECF4),
                  )),
                ]),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SvgPicture.asset('assets/svgs/facebook.svg'),
                    ),
                    Expanded(
                      child: SvgPicture.asset('assets/svgs/Google.svg'),
                    ),
                    Expanded(
                      child: SvgPicture.asset('assets/svgs/Apple.svg'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.185),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don’t have an account? ',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Color(0xff1E232C),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Signuppage();
                      }));
                    },
                    child: const Text('Register Now',
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Color(0xffF14336),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
