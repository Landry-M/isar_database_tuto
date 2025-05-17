import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isar_tuto/article.dart';
import 'package:isar_tuto/isar_services.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  late Future<Isar> isarData;

  Future<void> getInstaceOfIsar() async {
    isarData = IsarServices().initIsar();
  }

  @override
  void initState() {
    super.initState();
    getInstaceOfIsar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Isar>(
          future: isarData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              final myArticles = snapshot.data!;
              return FutureBuilder<List<Article>>(
                  future: myArticles.articles.where().findAll(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(snapshot.data![index].title ?? ''),
                            subtitle:
                                Text(snapshot.data![index].description ?? ''),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text("No data  "),
                      );
                    }
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final art = Article();
          art.title = "Landry NG";
          art.description = "Abonnes-toi";

          final isar = await isarData;
          await isar.writeTxn(() async {
            await isar.articles.put(art);
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
