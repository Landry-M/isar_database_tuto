// import 'package:flutter/material.dart';
// import 'package:isar/isar.dart';
// import 'package:isar_tuto/article.dart';
// import 'package:isar_tuto/isar_services.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Future<Isar> isarData;

//   Future<void> init() async {
//     isarData = IsarServices().initIsar();
//   }

//   @override
//   void initState() {
//     super.initState();
//     init();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<Isar>(
//         future: isarData,
//         builder: (context, isarSnapshot) {
//           if (isarSnapshot.connectionState == ConnectionState.done &&
//               isarSnapshot.hasData) {
//             final isar = isarSnapshot.data!;
//             return FutureBuilder<List<Article>>(
//               future: isar.articles.where().findAll(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(snapshot.data![index].title ?? ''),
//                         subtitle: Text(snapshot.data![index].description ?? ''),
//                       );
//                     },
//                   );
//                 } else {
//                   return const Center(
//                     child: Text("No data  "),
//                   );
//                 }
//               },
//             );
//           } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           isarData.then((value) {
//             value.writeTxn(() async {
//               final article = Article();
//               article.title = "Landrrryy";
//               article.description = "Abonnes-toi par ici";
//               await value.articles.put(article);
//               setState(() {});
//             });
//           });
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
