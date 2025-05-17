import 'package:isar/isar.dart';
part 'article.g.dart';

@collection
class Article {
  Id id = Isar.autoIncrement;
  String? title;
  String? description;
 
}
