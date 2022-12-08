import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../utilities/loading_utils.dart';
import '../api/language_api.dart';
import '../language_response/language_response.dart';

class LanguageProvider extends ChangeNotifier {
  bool _iscircular = false;

  bool get iscircular => _iscircular;
  set iscircular(bool circular) {
    _iscircular = circular;
    notifyListeners();
  }

  getLanguage({required BuildContext context}) async {
    try {
      var response = await languageApi(
        context: context,
      );
      LanguageResponse languageResponse =
          LanguageResponse.fromJson(jsonDecode(response));
      print(LanguageResponse.fromJson(jsonDecode(response)));
    } catch (e) {
      print(e);
    }
  }

  List<Datum>? data = [];
  getRequest(String url, BuildContext context) async {
    showLoadingDialog(context);
    print('$url');
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    print('REPLY=====>$reply');
    httpClient.close();
    LanguageResponse res = LanguageResponse.fromJson(jsonDecode(reply));
    print(res.data!.length.toString());
    // dynamic addData =
    data!.addAll(res.data!);
    print("|||||||||||||||||||||||${res.data!}|||||||||||||||||||||||");

    // Map<String, dynamic> map = json.decode(reply);
    // return map;
    notifyListeners();
    hideLoadingDialog(context);
  }
}
