import 'dart:io';

import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveHelper {
  static late Box _userBox;
  static String userBox = 'userBox';
  static const String kName = 'name';
  static const String kImage = 'image';

  static Future<void> init() async {
    await Hive.initFlutter();
    _userBox = await Hive.openBox(userBox);
  }

  static Future<void> cacheData(String key, dynamic value) async {
    await _userBox.put(key, value);
  }

  static dynamic getData(String key) {
    return _userBox.get(key);
  }

  static Future<void> cacheUserData({
    required String name,
    required String imagePath,
  }) async {
    String permanentImagePath = imagePath;

    if (imagePath.isNotEmpty) {
      final File pickedFile = File(imagePath);

      if (await pickedFile.exists()) {
        final appDir = await path_provider.getApplicationDocumentsDirectory();

        final fileName = path.basename(imagePath);

        final File savedImage = await pickedFile.copy(
          '${appDir.path}/$fileName',
        );

        permanentImagePath = savedImage.path;
      }
    }
    await cacheData(kName, name);
    await cacheData(kImage, permanentImagePath);
  }
}
