import 'package:demo/utilities/api/api.dart';
import 'package:flutter/cupertino.dart';

Future<dynamic> categoryApi(
    {required BuildContext context, required String name}) {
  var response =
      Api().httpApi(context, apiType: ApiType.GET, apiName: ApiUtils.foodList);
  return response;
}
