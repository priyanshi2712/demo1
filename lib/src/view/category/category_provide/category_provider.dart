import 'dart:convert';
import 'dart:io';
import 'package:demo/src/view/category/category_api/category_api.dart';
import 'package:demo/src/view/category/category_response/category_response.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier {
  categoryList({required BuildContext context}) async {
    try {
      var response = await categoryApi(context: context, name: "");
      CategoryResponse categoryResponse =
          CategoryResponse.fromJson(jsonDecode(response));

      print(CategoryResponse.fromJson(jsonDecode(response)));
    } catch (e) {
      print(e);
    }
  }

  List<CategoryDatum>? CategoryDetailData = [];
  category(String url, BuildContext context) async {
    // showLoadingDialog(context);

    print('$url');
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    print('REPLY=====>$reply');
    httpClient.close();
    CategoryResponse categoryRes = CategoryResponse.fromJson(jsonDecode(reply));

    print(categoryRes.data!.data!.length.toString());

    CategoryDetailData!.clear();

    CategoryDetailData!.addAll(categoryRes.data!.data!);

    print(
        "#########################${categoryRes.data!}#########################");
    print(
        "|||||||||||||||||||||||${CategoryDetailData}|||||||||||||||||||||||");

    notifyListeners();

    // hideLoadingDialog(context);
    // hideLoadingShimmer(context);
  }
}
