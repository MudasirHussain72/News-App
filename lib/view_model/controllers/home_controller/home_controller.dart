import 'package:news_app/models/hesdlines_model/headlines_model.dart';
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
  ApiResponse<HeadlinesModel> headlines = ApiResponse.loading();
  setHeadlines(ApiResponse<HeadlinesModel> response) {
    headlines = response;
    notifyListeners();
  }

  // headlines bussiness news
  ApiResponse<HeadlinesModel> bussiness = ApiResponse.loading();
  setBussiness(ApiResponse<HeadlinesModel> response) {
    bussiness = response;
    notifyListeners();
  }

  // headlines entertainment news
  ApiResponse<HeadlinesModel> entertainment = ApiResponse.loading();
  setEntertainment(ApiResponse<HeadlinesModel> response) {
    entertainment = response;
    notifyListeners();
  }

  // headlines general news
  ApiResponse<HeadlinesModel> general = ApiResponse.loading();
  setGeneral(ApiResponse<HeadlinesModel> response) {
    general = response;
    notifyListeners();
  }

  // headlines health news
  ApiResponse<HeadlinesModel> health = ApiResponse.loading();
  setHealth(ApiResponse<HeadlinesModel> response) {
    health = response;
    notifyListeners();
  }

  // headlines science news
  ApiResponse<HeadlinesModel> science = ApiResponse.loading();
  setScience(ApiResponse<HeadlinesModel> response) {
    science = response;
    notifyListeners();
  }

  // headlines sports news
  ApiResponse<HeadlinesModel> sports = ApiResponse.loading();
  setSports(ApiResponse<HeadlinesModel> response) {
    sports = response;
    notifyListeners();
  }

  // headlines technology news
  ApiResponse<HeadlinesModel> technology = ApiResponse.loading();
  setTechnology(ApiResponse<HeadlinesModel> response) {
    technology = response;
    notifyListeners();
  }

  // A func to get the Headlines from api by source parameter
  void getHeadlinesApi() {
    _repo.getHeadlinesDataApi('bbc-news').then((value) {
      setHeadlines(ApiResponse<HeadlinesModel>.completed(value));
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
      setBussiness(ApiResponse<HeadlinesModel>.completed(value));
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
      setEntertainment(ApiResponse<HeadlinesModel>.completed(value));
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
      setGeneral(ApiResponse<HeadlinesModel>.completed(value));
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
      setHealth(ApiResponse<HeadlinesModel>.completed(value));
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
      setScience(ApiResponse<HeadlinesModel>.completed(value));
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
      setSports(ApiResponse<HeadlinesModel>.completed(value));
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
      setTechnology(ApiResponse<HeadlinesModel>.completed(value));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setTechnology(ApiResponse.error(error.toString()));
    });
  }
}
