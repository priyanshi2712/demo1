import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../login_api/login_api.dart';
import '../login_response/login_response.dart';

class LoginProvider extends ChangeNotifier {
  homeProvider({required BuildContext context}) async {
    try {
      var res = await loginApi(context: context);

      GoogleLoginResponse categoriesResponse =
          GoogleLoginResponse.fromJson(jsonDecode(res));
      print(GoogleLoginResponse.fromJson(jsonDecode(res)));
    } catch (e) {
      print(e);
    }
  }

  // List<Data>? data = [];
  // home(String url, BuildContext context) async {
  //   const showShimmer();
  //   print('$url');
  //   HttpClient httpClient = HttpClient();
  //   HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
  //   request.headers.set('content-type', 'application/json');

  //   HttpClientResponse response = await request.close();
  //   String reply = await response.transform(utf8.decoder).join();
  //   print('REPLY=====>$reply');

  //   httpClient.close();
  //   GoogleLoginResponse categoriesRes =
  //       GoogleLoginResponse.fromJson(jsonDecode(reply));
  //   // Map<String, dynamic> map = json.decode(reply);
  //   // return map;
  //   print(categoriesRes.data!.length.toString());

  //   data!.addAll(GoogleLoginResponse.data!);
  //   print("//////////////////////${categoriesRes.data!}//////////////////////");
  //   notifyListeners();
  //   // hideLoadingDialog(context);
  // }

  // register({
  //   required BuildContext context,
  //   required dynamic data,
  // }) async {
  //   final navigator = Navigator.of(context);
  //   try {
  //     var response = await loginApi(context: context, data: data);
  //     GoogleLoginResponse googleLoginResponse =
  //         GoogleLoginResponse.fromJson(jsonDecode(response));
  //     navigator.pop();
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
