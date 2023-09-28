// import 'package:hive/hive.dart';
// import 'package:news_app/models/news_model/news_model.dart';

// class HiveHelper {
//   static Future<void> saverecipe(NewsModel news) async {
//     Box<NewsModel> mybox = Hive.box('news');
//     mybox.add(news);
//     savedrecipes = getsavedrecipes();
//   }

//   static List<NewsModel> getsavedrecipes() {
//     Box<NewsModel> mybox = Hive.box('news');
//     return mybox.values.toList();
//   }

//   static void deleterecipe(NewsModel news, int index) async {
//     Box<NewsModel> mybox = Hive.box('news');
//     final newsToDelete = mybox.values.firstWhere((element) =>
//         element.articles![index].title.toString().toLowerCase() ==
//         news.articles![index].toString().toLowerCase());
//     await newsToDelete.delete();
//     savedrecipes = getsavedrecipes();
//   }

//   static deleteallrecipes(int index) async {
//     Box<NewsModel> mybox = Hive.box('news');
//     savedrecipes = [];
//     for (var element in allrecipes) {
//       element.articles![index].saved = false;
//     }
//     await mybox.clear();
//   }
// }
