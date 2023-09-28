import 'package:news_app/models/news_model/news_model.dart';
import 'package:news_app/repository/news_repository/news_repository.dart';

import '../../../../view/view_barrel_file.dart';

class HomeController with ChangeNotifier {
  final _repo = NewsRepository();
  late TabController controller;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  setTabIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  List<String> tabText = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology',
  ];

  String _selectedTapOption = 'business';
  String get selectedTapOption => _selectedTapOption;

  setSelectedTabOption(String value) {
    _selectedTapOption = value;
    notifyListeners();
  }

  // headlines breaking news
  ApiResponse<NewsModel> headlines = ApiResponse.loading();
  setHeadlines(ApiResponse<NewsModel> response) {
    headlines = response;
    notifyListeners();
  }

  // headlines bussiness news
  ApiResponse<NewsModel> bussiness = ApiResponse.loading();
  setBussiness(ApiResponse<NewsModel> response) {
    bussiness = response;
    notifyListeners();
  }

  // headlines entertainment news
  ApiResponse<NewsModel> entertainment = ApiResponse.loading();
  setEntertainment(ApiResponse<NewsModel> response) {
    entertainment = response;
    notifyListeners();
  }

  // headlines general news
  ApiResponse<NewsModel> general = ApiResponse.loading();
  setGeneral(ApiResponse<NewsModel> response) {
    general = response;
    notifyListeners();
  }

  // headlines health news
  ApiResponse<NewsModel> health = ApiResponse.loading();
  setHealth(ApiResponse<NewsModel> response) {
    health = response;
    notifyListeners();
  }

  // headlines science news
  ApiResponse<NewsModel> science = ApiResponse.loading();
  setScience(ApiResponse<NewsModel> response) {
    science = response;
    notifyListeners();
  }

  // headlines sports news
  ApiResponse<NewsModel> sports = ApiResponse.loading();
  setSports(ApiResponse<NewsModel> response) {
    sports = response;
    notifyListeners();
  }

  // headlines technology news
  ApiResponse<NewsModel> technology = ApiResponse.loading();
  setTechnology(ApiResponse<NewsModel> response) {
    technology = response;
    notifyListeners();
  }

  // A func to get the Headlines from api by source parameter
  void getHeadlinesApi() {
    _repo.getHeadlinesDataApi('bbc-news').then((value) {
      setHeadlines(ApiResponse<NewsModel>.completed(value));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setHeadlines(ApiResponse.error(error.toString()));
    });
  }

  // A func to get the Headlines bussiness news from api by category parameter
  void getBussinessHeadlinesApi() {
    _repo.specificCategoryTopHeadlineApi('business').then((value) {
      setBussiness(ApiResponse<NewsModel>.completed(value));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setBussiness(ApiResponse.error(error.toString()));
    });
  }

  // A func to get the Headlines entertainment news from api by category parameter
  void getEntertainmentHeadlinesApi() {
    _repo.specificCategoryTopHeadlineApi('entertainment').then((value) {
      setEntertainment(ApiResponse<NewsModel>.completed(value));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setEntertainment(ApiResponse.error(error.toString()));
    });
  }

  // A func to get the Headlines general news from api by category parameter
  void getGeneralHeadlinesApi() {
    _repo.specificCategoryTopHeadlineApi('general').then((value) {
      setGeneral(ApiResponse<NewsModel>.completed(value));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setGeneral(ApiResponse.error(error.toString()));
    });
  }

  // A func to get the Headlines health news from api by category parameter
  void getHealthHeadlinesApi() {
    _repo.specificCategoryTopHeadlineApi('health').then((value) {
      setHealth(ApiResponse<NewsModel>.completed(value));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setHealth(ApiResponse.error(error.toString()));
    });
  }

  // A func to get the Headlines science news from api by category parameter
  void getScienceHeadlinesApi() {
    _repo.specificCategoryTopHeadlineApi('science').then((value) {
      setScience(ApiResponse<NewsModel>.completed(value));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setScience(ApiResponse.error(error.toString()));
    });
  }

  // A func to get the Headlines sports news from api by category parameter
  void getSportsHeadlinesApi() {
    _repo.specificCategoryTopHeadlineApi('sports').then((value) {
      setSports(ApiResponse<NewsModel>.completed(value));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setSports(ApiResponse.error(error.toString()));
    });
  }

  // A func to get the Headlines technology news from api by category parameter
  void getTechnologyHeadlinesApi() {
    _repo.specificCategoryTopHeadlineApi('technology').then((value) {
      setTechnology(ApiResponse<NewsModel>.completed(value));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setTechnology(ApiResponse.error(error.toString()));
    });
  }
}
