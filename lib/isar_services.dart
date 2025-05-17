import 'package:isar/isar.dart';
import 'package:isar_tuto/article.dart';
import 'package:path_provider/path_provider.dart';

class IsarServices {
  static Isar? _isar;

  Future<Isar> initIsar() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      _isar = await Isar.open(
        [ArticleSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return _isar!;
  }
}
