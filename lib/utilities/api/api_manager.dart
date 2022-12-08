import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo/utilities/api/local_cache_keys.dart';
import 'package:demo/utilities/api/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

enum ApiType { GET, POST }

class Api {
  Future<dynamic> httpApi(
    BuildContext context, {
    required ApiType apiType,
    required String apiName,
    Map<String, dynamic>? paramiter,
    Map<String, dynamic>? body,
  }) async {
    String? userToken = await SharedPreferencesUtils.getStringValue(
            LocalCacheKeys.applicationUserTokenKey) ??
        '';
    Map<String, String> header = {
      "Authorization": "Bearer $userToken",
      "accept": "application/json",
    };
    Map<String, String> had = {
      "content-type": "application/json",
    };
    List<String> listKey = [];
    List<String> listValues = [];
    String paramsString = "";

    if (paramiter != null) {
      paramiter.forEach((key, value) {
        listKey.add(key);
        listValues.add(value);
      });
      for (int i = 0; i <= listKey.length; i++) {
        if (i == 0) {
          paramsString = paramsString + "?";
        }
        paramsString = paramsString + listKey[i] + "=" + listValues[i];
        if (i != listKey.length) {
          paramsString = paramsString + "&";
        }
      }
    }
    print("-----------------------------------");
    print(apiName + paramsString);
    print("-----------------------------------");

    http.Response response;

    if (apiType == ApiType.POST) {
      response = await http.post(Uri.parse(apiName), body: body);
      print(response.body);
      return response.body;
    } else if (apiType == ApiType.GET) {
      response = await http.get(
        Uri.parse(apiName + paramsString),headers: had
      );
      print(response.body);
      print("-----------------------------------");
      return response.body;
    }

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      //mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      //wifi network.
    }
  }
}
