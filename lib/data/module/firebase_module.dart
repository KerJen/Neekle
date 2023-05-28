import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

import '../../core/firebase_options.dart';

@module
abstract class FirebaseModule {
  @preResolve
  Future<FirebaseApp> get firebaseApp => Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  FirebaseFirestore get firebaseStore => FirebaseFirestore.instance;

  FirebaseFunctions get functions => FirebaseFunctions.instance;

  FirebaseStorage get storage => FirebaseStorage.instance;
}
