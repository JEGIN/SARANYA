





import '../global/app_urls.dart';

class APIServices {
  



  Future<LoginModel> loginBusiness(jsonData) async {
    print('Function start');
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return LoginModel.withError(
        status: false,
        message: 'No Internet Connection.',
      );
    }
    // dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      print(APIConstants.baseUrl + APIConstants.login);
      final response = await Dio().post(
        APIConstants.baseUrl + APIConstants.login,
        data: jsonData,
      );
      print(response.statusCode);
      print(response.statusMessage);
      print(response.data);
      print('Function end');
      if (response.statusCode == 200) {
        return LoginModel.fromJson(response.data);
      } else {
        return LoginModel.withError(
          status: false,
          message: 'No data Found',
        );
      }
    } catch (e) {
      print(e);
      return LoginModel.withError(
        status: false,
        message: 'Something went wrong',
      );
    }
  }
}