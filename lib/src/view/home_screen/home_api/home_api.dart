import 'package:flutter/cupertino.dart';
import '../../../../utilities/api/api_manager.dart';
import '../../../../utilities/api/api_utils.dart';

Future<dynamic> homeApi({required BuildContext context}) {
  var res = Api().httpApi(
    context,
    apiType: ApiType.GET,
    apiName: ApiUtils.categoriesList,
  );
  return res;
}

Future<dynamic> postApi({required BuildContext context}) {
  var res = Api().httpApi(
    context,
    apiType: ApiType.GET,
    apiName: ApiUtils.postList,
  );
  return res;
}
