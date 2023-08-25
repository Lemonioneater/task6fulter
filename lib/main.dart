import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3ahmed_faisal/Blocobservers.dart';
import 'package:task3ahmed_faisal/Cubit/Shop/shop_cubit.dart';
import 'package:task3ahmed_faisal/Pages/Login.dart';
import 'package:task3ahmed_faisal/Pages/Myhomepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

int y = 0;



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    BlocProvider(
        create: (context) => ShopCubit()..getData(),
        child: const MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent,
          )
        ),
        debugShowCheckedModeBanner: false,
        home: user == null ?  Loginpage() : const Myhomepage());
  }
}
