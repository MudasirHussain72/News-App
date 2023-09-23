import 'package:news_app/data/remote/network/network_api_services.dart';
import 'package:news_app/res/app_url/app_urls.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> loginApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.loginApi);
    return response;
  }
}
