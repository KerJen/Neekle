import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

abstract class FilesService {
  Future<String> uploadFile(File file);
}

@LazySingleton(as: FilesService)
class FilesServiceImpl extends FilesService {
  final FirebaseStorage storage;

  FilesServiceImpl({
    required this.storage,
  });

  @override
  Future<String> uploadFile(File file) async {
    final fileRef = '/images/${const Uuid().v4()}';
    final ref = storage.ref().child(fileRef);
    await ref.putFile(file);

    return await ref.getDownloadURL();
  }
}
