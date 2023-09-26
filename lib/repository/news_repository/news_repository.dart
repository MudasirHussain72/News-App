import 'package:news_app/data/remote/network/network_api_services.dart';
import 'package:news_app/models/all_news_model/all_news_model.dart';
import 'package:news_app/models/hesdlines_model/headlines_model.dart';
import 'package:news_app/view/view_barrel_file.dart';

class NewsRepository {
  final _apiService = NetworkApiServices();
  Future<AllNewsModel> getEverythingDataApi(
    String category,
    String fromDate,
    String toDate,
  ) async {
    String url =
        'https://newsapi.org/v2/everything?q=$category&from=2023-09-25&to=2023-09-25&sortBy=popularity&apiKey=8a5ec37e26f845dcb4c2b78463734448';
    AllNewsModel response = await _apiService.getApi(url);
    return response;
  }

  Future<HeadlinesModel> getHeadlinesDataApi(String sources) async {
    //https://newsapi.org/v2/top-headlines?category=technology&apiKey=8029e0bfc23e485ea6dae9b2d8e75d61
    String url =
        'https://newsapi.org/v2/top-headlines?sources=$sources&apiKey=8029e0bfc23e485ea6dae9b2d8e75d61';
    final jsonResponse = await _apiService.getApi(url);
    if (kDebugMode) {
      print('JSON Response: $jsonResponse');
    } // Debugging line
    HeadlinesModel response = HeadlinesModel.fromJson(jsonResponse);
    return response;
  }

  Future<HeadlinesModel> specificCategoryTopHeadlineApi(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?category=$category&apiKey=8029e0bfc23e485ea6dae9b2d8e75d61';
    // String url =
    //     'https://newsapi.org/v2/top-headlines?sources=$sources&apiKey=8029e0bfc23e485ea6dae9b2d8e75d61';
    final jsonResponse = await _apiService.getApi(url);
    if (kDebugMode) {
      print('JSON Response: $jsonResponse');
    } // Debugging line
    HeadlinesModel response = HeadlinesModel.fromJson(jsonResponse);
    return response;
  }
}
