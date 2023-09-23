import 'package:news_app/data/remote/network/network_api_services.dart';
import 'package:news_app/res/app_url/app_urls.dart';

class VerifyAccountRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> verifyAccountApi(var data) async {
    dynamic response =
        await _apiService.postApi(data, AppUrl.sendVerificationCode);
    return response;
  }
}
