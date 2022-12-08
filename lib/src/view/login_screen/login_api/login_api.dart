import 'package:flutter/cupertino.dart';
import '../../../../utilities/api/api_manager.dart';
import '../../../../utilities/api/api_utils.dart';

Future<dynamic> loginApi({required BuildContext context, dynamic data}) {
  Map<String, dynamic> jsonMap = {
    "data": data,
  };
  print(jsonMap);
  var res = Api().httpApi(context,
      apiType: ApiType.POST, apiName: ApiUtils.googleLogin, body: jsonMap);
  return res;
}
