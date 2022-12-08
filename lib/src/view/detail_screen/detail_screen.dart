import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:demo/src/view/category/CategoryClass.dart';
import 'package:demo/src/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../utilities/asset/asset_utils.dart';
import '../../../utilities/color/color_utils.dart';
import '../../../utilities/font/font_utils.dart';
import '../../../utilities/routes/routes.dart';
import '../../widget/other/elevated_button.dart';
import '../home_screen/home_provider/home_provider.dart';

class DetailScreen extends StatefulWidget {
  final Detail detail;

  const DetailScreen({
    Key? key,
    required this.detail,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

String? description;
String? title;
String? image;
List<String>? tag;

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.detail.description != null &&
        widget.detail.title != null &&
        widget.detail.image != null &&
        widget.detail.tag != null) {
      description = widget.detail.description;
      title = widget.detail.title;
      image = widget.detail.image;
      tag = widget.detail.tag;
      setState(() {});
    }
    print("*************************************");
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Consumer<HomeProvider>(builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomElevatedButton(
              text: "Share Facts",
              buttonColor: const Color(0xff5C0B0F),
              buttonHeight: 50,
              buttonWidth: MediaQuery.of(context).size.width,
              containerOnTap: () {
                Share.share('https://flutter.dev/');
              },
            ),
          ),
          // appBar: const CustomAppBar(),
          body: Stack(
            children: [
              Column(children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        // AssetUtils.image1,
                        "$image", fit: BoxFit.cover,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(5),
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Image.asset(
                              AssetUtils.back,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(RoutesUtils.loginScreen);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(5),
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Image.asset(AssetUtils.like),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
              DraggableScrollableSheet(
                  initialChildSize: 0.56,
                  minChildSize: 0.56,
                  maxChildSize: 0.90,
                  expand: true,
                  snap: true,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return ScrollConfiguration(
                      behavior: const MaterialScrollBehavior()
                          .copyWith(overscroll: false),
                      child: SingleChildScrollView(
                        // physics: const BouncingScrollPhysics(),
                        // physics: const AlwaysScrollableScrollPhysics(),
                        // physics: const ScrollPhysics(),
                        // physics: const AlwaysScrollableScrollPhysics(),
                        // physics: const ClampingScrollPhysics(),
                        controller: scrollController,
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "$title",
                                style: FontUtils.h18(
                                  fontColor: ColorUtils.themeColor.oxff2F3A4B,
                                  fontWeight: FWT.semiBold,
                                ),
                              ),
                              Text(
                                "$description",
                                style: FontUtils.h14(
                                  fontColor: ColorUtils.themeColor.oxff666666,
                                  fontWeight: FWT.medium,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Tags",
                                  style: FontUtils.h18(
                                    fontColor: ColorUtils.themeColor.oxff2F3A4B,
                                    fontWeight: FWT.bold,
                                  ),
                                ),
                              ),

                              // Text(
                              //   "$tag",
                              //   style: FontUtils.h14(
                              //     fontColor: ColorUtils.themeColor.oxff2F3A4B,
                              //     fontWeight: FWT.medium,
                              //   ),
                              // ),

                              // ListView.builder(
                              //     shrinkWrap: true,
                              //     itemCount: 1,
                              //     itemBuilder: (context, index) {
                              //       return Container(
                              //         padding: const EdgeInsets.all(5),
                              //         height: 33,
                              //         decoration: BoxDecoration(
                              //           color: ColorUtils.themeColor.oxfff5f9f3,
                              //           borderRadius: const BorderRadius.all(
                              //             Radius.circular(7),
                              //           ),
                              //           border: Border.all(
                              //               color:
                              //                   ColorUtils.themeColor.oxffD2E7C7,
                              //               width: 1),
                              //         ),
                              //         child: Text(
                              //           "$tag",
                              //           style: FontUtils.h14(
                              //             fontColor:
                              //                 ColorUtils.themeColor.oxff2F3A4B,
                              //             fontWeight: FWT.medium,
                              //           ),
                              //         ),
                              //       );
                              //     }),

                              ListView.builder(
                                  shrinkWrap: true,
                                  // itemCount: provider.postListData!.length,
                                  // itemCount: tag.[index].length,
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    return Expanded(
                                      child: tag!.isNotEmpty
                                          ? Wrap(
                                              children: tag!
                                                  .map(
                                                    (i) => Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2.0),
                                                      // child: BlurryContainer(
                                                      //   blur: 5,
                                                      //   height: 30,
                                                      //   elevation: 0,
                                                      //   color: Colors.amber
                                                      //       .withOpacity(0.3),
                                                      //   // padding: const EdgeInsets.all(8),
                                                      //   borderRadius:
                                                      //       const BorderRadius
                                                      //           .all(
                                                      //     Radius.circular(10),
                                                      //   ),
                                                      //   child: Text(
                                                      //     i.toUpperCase(),
                                                      //     // "$tag",
                                                      //     style: FontUtils.h8(
                                                      //       fontColor:
                                                      //           ColorUtils
                                                      //               .themeColor
                                                      //               .oxffFFFFFF,
                                                      //       fontWeight:
                                                      //           FWT.semiBold,
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        height: 33,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorUtils
                                                              .themeColor
                                                              .oxfff5f9f3,
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            Radius.circular(6),
                                                          ),
                                                          border: Border.all(
                                                              color: ColorUtils
                                                                  .themeColor
                                                                  .oxffD2E7C7,
                                                              width: 1),
                                                        ),
                                                        child: Text(
                                                          i.toUpperCase(),
                                                          style: FontUtils.h14(
                                                            fontColor:
                                                                ColorUtils
                                                                    .themeColor
                                                                    .oxff2F3A4B,
                                                            fontWeight:
                                                                FWT.medium,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            )
                                          : const SizedBox(),
                                    );
                                  }),
                              const SizedBox(
                                height: 60,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

              // SlidingUpPanel(
              //   padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              //   backdropColor: Colors.yellow,
              //   maxHeight: MediaQuery.of(context).size.height * 0.90,
              //   minHeight: MediaQuery.of(context).size.height * 0.56,
              //   color: Colors.white,
              //   borderRadius: const BorderRadius.only(
              //     topLeft: Radius.circular(50),
              //     topRight: Radius.circular(50),
              //   ),
              //   panel: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         "$title",
              //         style: const TextStyle(fontSize: 18),
              //       ),
              //       Text(
              //         "$description",
              //         style: const TextStyle(
              //           fontSize: 14,
              //           color: Color(0xff666666),
              //         ),
              //       ),
              //       const SizedBox(
              //         height: 60,
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        );
      }),
    );
  }
}

// modalBottomSheet() {
// showModalBottomSheet(
//   backgroundColor: Colors.transparent,
//   context: context,
//   builder: (BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(50),
//           topRight: Radius.circular(50),
//         ),
//       ),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               "$title",
//               style: const TextStyle(fontSize: 18),
//             ),
//             Text(
//               "$description",
//               style: const TextStyle(
//                 fontSize: 14,
//                 color: Color(0xff666666),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   },
// );
// showMaterialModalBottomSheet(
//   context: context,
//   builder: (context) => Container(
//     height: 300,
//     width: MediaQuery.of(context).size.width,
//     color: Colors.amber,
//   ),
// );
// }
