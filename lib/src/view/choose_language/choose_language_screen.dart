import 'package:demo/src/view/choose_language/provider/language_provider.dart';
import 'package:demo/src/widget/other/custom_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../../utilities/api/local_cache_keys.dart';
import '../../../utilities/api/shared_preferences.dart';
import '../../../utilities/font/font_utils.dart';
import '../../../utilities/routes/routes.dart';
import '../../widget/other/app_bar.dart';
import '../../widget/other/elevated_button.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

String? setData;

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  String? languageName = '';
  @override
  void initState() {
    getDefaultLanguage();
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<LanguageProvider>(context, listen: false);

      //   provider.getLanguage(context: context);
      provider.getRequest(
          'http://192.168.0.121:8001/api/language-list', context);
    });
  }

  // print(reply);
  List languageModel = [];
  getDefaultLanguage() async {
    String? defaultLanguage = SharedPreferencesUtils.preferences!
        .getString(LocalCacheKeys.applicationUserLanguage);
    // languageNameList.where(
    //   (element) {
    //     if (element.languageName.toLowerCase() ==
    //         defaultLanguage.toString().toLowerCase()) {
    //       element.isChecked == true;
    //       return true;
    //     } else {
    //       return false;
    //     }
    //   }
    // );

    // Provider.((element) {
    //   if (element.languageName.toLowerCase() ==
    //       defaultLanguage.toString().toLowerCase()) {
    //     element.isChecked == true;
    //     return true;
    //   } else {
    //     return false;
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<LanguageProvider>(
          builder: (context, LanguageProvider provider, _) {
        return Scaffold(
          appBar: CustomAppBar(
            leading: Row(
              children: const [
                CustomBack(),
              ],
            ),
            size: MediaQuery.of(context).size,
            text: "Choose Your Language",
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            // child: Stack(
            // children: [
            child: Column(
              children: [
                provider.data!.isNotEmpty
                    ? Expanded(
                        child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: provider.data!.length,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 2.5,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                height: 58,
                                width: MediaQuery.of(context).size.width,
                                // ignore: sort_child_properties_last
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            // languageNameList[index]
                                            //     .languageName,
                                            "${provider.data![index].name}",

                                            style: FontUtils.h18(
                                              fontWeight: FWT.regular,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              // languageNameList[index]
                                              //     .languageNameInEng,
                                              "${provider.data![index].name}",
                                              // style: TextStyle(height: 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        height: 20,
                                        width: 20,
                                        // decoration: BoxDecoration(
                                        //     gradient: LinearGradient(
                                        //   begin: Alignment.topLeft,
                                        //   end: Alignment(10, 3),
                                        //   colors: <Color>[
                                        //     Color(0xff8CC270),
                                        //     Color(0xffC6E0B8),
                                        //   ],
                                        //  ),
                                        // ),
                                        child: Checkbox(
                                          value:
                                              provider.data![index].isChecked,
                                          activeColor: const Color(0xff8CC270),
                                          checkColor: Colors.black,
                                          onChanged: (value) async {
                                            languageName =
                                                provider.data![index].name;
                                            for (int i = 0;
                                                i < provider.data!.length;
                                                i++) {
                                              provider.data![i].isChecked =
                                                  false;
                                            }
                                            setState(() {
                                              provider.data![index].isChecked =
                                                  !provider
                                                      .data![index].isChecked!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff8CC270), width: 2),
                                  color: const Color(0xffC6E0B8),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              );
                              // return Container(
                              //   height: 100,
                              //   width: 100,
                              //   color: Colors.amber,
                              //   // child: Text(provider.data),
                              // );
                            }),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 60,
                )
                // : Text(provider.data.toString()),
              ],
            ),
            // Visibility(
            //   visible: provider.iscircular,
            //   child: const Center(
            //     child: CircularProgressIndicator(
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            //   ],
            // ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomElevatedButton(
              text: "Continue",
              buttonColor: const Color(0xff5C0B0F),
              buttonHeight: 50,
              buttonWidth: MediaQuery.of(context).size.width,
              containerOnTap: () async {
                print("*******************${languageName}*******************");
                final navigator = Navigator.of(context);
                if (languageName != null && languageName!.isNotEmpty) {
                  await SharedPreferencesUtils.preferences!.setString(
                      LocalCacheKeys.applicationUserLanguage, languageName!);

                  // navigator.pushReplacementNamed(RoutesUtils.homeScreen);
                  navigator.pop();
                } else {
                  print("select language");
                  Fluttertoast.showToast(
                    msg: "Select Language",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
            ),
          ),
        );
      }),
    );
  }
}

// if (value == true) {
//   Navigator.of(context)
//       .pushReplacementNamed(
//           RoutesUtils.homeScreen);
// } else {
//   print("select language");
// }

//logout
// SharedPreferencesUtils.preferences!.clear();


// FutureBuilder(builder: (context, AsyncSnapshot snapshot) {
//   if (snapshot.hasError) {
//     return Center(
//       child: Text("ERROR : ${snapshot.error}"),
//     );
//   } else if (snapshot.hasData) {
//     List<LanguageResponse> data = snapshot.data;
//     return ListView.builder(
//         itemCount: data.length,
//         itemBuilder: (context, index) {
//           return Container(
//               // LanguageResponse.fromJson(json);
//               );
//         });
//   } else {
//     return const Center(
//       child: CircularProgressIndicator(),
//     );
//   }
// })
