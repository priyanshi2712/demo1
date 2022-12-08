import 'package:flutter/cupertino.dart';
import '../../../../utilities/api/api_manager.dart';
import '../../../../utilities/api/api_utils.dart';

Future<dynamic> languageApi({
  required BuildContext context,
}) async {
  var response = await Api().httpApi(
    context,
    apiType: ApiType.GET,
    apiName: ApiUtils.languageList,
  );
  return response;
}
