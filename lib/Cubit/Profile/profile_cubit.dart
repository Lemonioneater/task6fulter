import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task3ahmed_faisal/Cubit/Profile/profile_state.dart';

import '../../Data/Datamodels/Userdatamodel.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Userdata? userdata;
  Future<void> getuserdata()
  async {
    try {
      emit(UDatabar());
      String? uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userb =
      await FirebaseFirestore.instance.collection('user').doc(uid).get();
      userdata = Userdata(
        name: userb['name'],
        password: userb['password'],
        phone: userb['phone'],
        email: userb['email'],
        uid: userb['uid'],
        image: userb['image'],
      );
      emit(UDatadone());
    } catch (error) {
      print(error.toString());
      emit(UDataerror(error.toString()));
    }
  }

  ImagePicker profilepic = ImagePicker();
  File? img;
  Future<void> fetchimage()  async {
    final XFile? image =
    await profilepic.pickImage(source: ImageSource.gallery);
    if (image != null) {
      img = File(image.path);
      uploadimge(File(image.path));
      emit(Pickimg());
    } else {
      print('no image');
    }
  }


  Future<void> uploadimge(File image) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      final ref = FirebaseStorage.instance
          .ref()
          .child('userimages')
          .child('${DateTime.now()}.jpg');
      await ref.putFile(File(image.path));
      String? url;
      url = await ref.getDownloadURL();
      await FirebaseFirestore.instance.collection('user').doc(uid).update(
        {
          'image': url,
        },
      );
    } catch (error) {}
  }
}
