import 'dart:convert';
import 'dart:io';
import 'package:demo/src/view/notifications/notification_api/notification_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../notification_response/notification_response.dart';

class NotificationProvider extends ChangeNotifier {
  notificationProvider({required BuildContext context}) async {
    try {
      var response = await notificationApi(context: context, data: "");
      NotificationResponse notificationResponse =
          NotificationResponse.fromJson(jsonDecode(response));
      print(NotificationResponse.fromJson(jsonDecode(response)));
    } catch (e) {
      print(e);
    }
  }

  List<NotificationDatum>? notificationData = [];

  notification(String url, BuildContext context) async {
    print('$url');
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    print('REPLY=====>$reply');
    httpClient.close();
    NotificationResponse notificationRes =
        NotificationResponse.fromJson(jsonDecode(reply));

    print(notificationRes.data!.length.toString());

    notificationData!.clear();

    notificationData!.addAll(notificationRes.data!);

    print(
        "%%%%%%%%%%%%%%%%%%%%%%%%%%${notificationRes.data!}%%%%%%%%%%%%%%%%%%%%%%%%%%");
    print(
        "??????????????????????????${notificationData}??????????????????????????");

    notifyListeners();
  }
}
