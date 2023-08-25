
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'accounts_state.dart';

class AccountsCubit extends Cubit<AccountsState> {
  AccountsCubit() : super(AccountsInitial());

  Future<void> loginpage(
      String email,
      String password,
      ) async {
    try {
      emit(Loginbar());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        if (value.user != null) {
          emit(Logindone());
        }
      });
    } catch (error) {
      emit(Loginerror(error.toString()));
    }
  }



  Future<void> signup({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    try {
      emit(Signupdone());
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        if (value.user != null) {
          uploadData(
              email: email,
              password: password,
              phone: phone,
              name: name,
              uid: value.user!.uid)
              .then((value) {
            if (value) {
              emit(Signupdone());
            } else {
              emit(Signuperror('saving data error'));
            }
          });
        }
      });
    } catch (error) {
      emit(Signuperror(error.toString()));
    }
  }

  Future<bool> uploadData({
    required String email,
    required String password,
    required String phone,
    required String name,
    required String uid,
  }) async {
    try {
      FirebaseFirestore.instance.collection('user').doc(uid).set({
        'name': name,
        'email': email,
        'phone': phone,
        'uid': uid,
        'password': password,
        'image': '',
      }, SetOptions(merge: true));
      return true;
    } catch (erorr) {
      return false;
    }
  }
}
