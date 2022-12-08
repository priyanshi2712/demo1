import 'package:demo/utilities/api/api.dart';
import 'package:flutter/cupertino.dart';

notificationApi({required BuildContext context, required String data}) {
  var response = Api()
      .httpApi(context, apiType: ApiType.GET, apiName: ApiUtils.notification);
  return response;
}
