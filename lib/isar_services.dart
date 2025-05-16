import "package:flutter/material.dart";
import "package:isar/isar.dart";
import "package:isar_tuto/article.dart";
import "package:path_provider/path_provider.dart";

class IsarServices {
  Future<Isar> initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    final _isar = await Isar.open(
      [ArticleSchema],
      directory: dir.path,
    );

    return _isar;
  }
}
