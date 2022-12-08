import 'dart:convert';
import 'dart:io';
import 'package:demo/src/view/home_screen/home_response/post_list_response.dart';
import 'package:demo/src/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import '../../../../utilities/loading_utils.dart';
import '../home_api/home_api.dart';
import '../home_response/categories_response.dart';

enum Availability { loading, available, unavailable }

class HomeProvider extends ChangeNotifier {
  int _size = 0;
  int get size => _size;
  set size(int value) {
    _size = value;
    notifyListeners();
  }

  String _currentMassage = "Have a grate day";
  String get currentMassage => _currentMassage;
  set currentMassage(String value) {
    _currentMassage = value;
    notifyListeners();
  }

  dateAndTime() {
    if (dateTime >= 4 && dateTime <= 11) {
      currentMassage = "Good Morning";
      print("⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰Good Morning⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰");
    } else if (dateTime >= 11 && dateTime <= 13) {
      currentMassage = "Good Noon";
      
      print("⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰Good Noon⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰");
    } else if (dateTime >= 13 && dateTime <= 16) {
      currentMassage = "Good Afternoon";
      
      print("⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰Good Afternoon⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰");
    } else if (dateTime >= 16 && dateTime <= 19) {
      currentMassage = "Good Evening";
      
      print("⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰Good Evening⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰");
    } else if (dateTime >= 19 && dateTime <= 24) {
      currentMassage = "Good Night";
      
      print("⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰Good Night⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰");
    } else {
      currentMassage = "Have a great day";
      
      print("⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰Have a great day⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰⏰");
    }
  }

  homeProvider({required BuildContext context}) async {
    try {
      var res = await homeApi(context: context);

      CategoriesResponse categoriesResponse =
          CategoriesResponse.fromJson(jsonDecode(res));
      print(CategoriesResponse.fromJson(jsonDecode(res)));
    } catch (e) {
      print(e);
    }
  }

  List<CategoriesDatum>? categoriesData = [];
  home(String url, BuildContext context) async {
    // showLoadingDialog(context);
    const showShimmer();
    print('$url');
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    print('REPLY=====>$reply');

    httpClient.close();
    CategoriesResponse categoriesRes =
        CategoriesResponse.fromJson(jsonDecode(reply));
    // Map<String, dynamic> map = json.decode(reply);
    // return map;
    print(categoriesRes.data!.length.toString());

    categoriesData!.addAll(categoriesRes.data!);
    print("//////////////////////${categoriesRes.data!}//////////////////////");
    notifyListeners();
    // hideLoadingDialog(context);
  }

  postList({required BuildContext context}) async {
    try {
      var res = await postApi(context: context);

      PostListResponse categoriesResponse =
          PostListResponse.fromJson(jsonDecode(res));
      print(CategoriesResponse.fromJson(jsonDecode(res)));
    } catch (e) {
      print(e);
    }
  }

  review() async {
    final InAppReview inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
    Availability _availability = Availability.loading;

    inAppReview.openStoreListing(
      appStoreId: '...',
      microsoftStoreId: '...',
    );
  }

  List<PostListDatum>? postListData = [];
  post(String url, BuildContext context) async {
    // showLoadingDialog(context);
    // const showShimmer();
    print('$url');
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    HttpClientResponse response = await request.close();
    String postReply = await response.transform(utf8.decoder).join();
    print('POSTREPLY=====>$postReply');

    httpClient.close();
    PostListResponse postListRes =
        PostListResponse.fromJson(jsonDecode(postReply));

    print(postListRes.data!.data!.length.toString());

    postListData!.addAll(postListRes.data!.data!);
    print(
        "*********************${postListRes.data!.data!.toList()}*********************");
    notifyListeners();
    // hideLoadingDialog(context);
  }

  // String _name = "Good morning";
  // String get name => _name;
  // set name(String value) {
  //   _name = value;
  //   notifyListeners();
  // }

  // abc() {
  //   // size = 80;
  //   name = 'Good afternoon';
  //   notifyListeners();
  // }
}
