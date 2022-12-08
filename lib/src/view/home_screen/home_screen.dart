import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../utilities/asset/asset_utils.dart';
import '../../../../utilities/routes/routes.dart';
import '../../../utilities/color/color_utils.dart';
import '../../../utilities/font/font_utils.dart';
import '../../../utilities/loading_utils.dart';
import '../../widget/other/app_bar.dart';
import '../category/CategoryClass.dart';
import 'home_provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final ScrollController scrollController = ScrollController();

List imageLizst = [
  AssetUtils.image1,
  AssetUtils.image2,
];

int i = 1;


// var dateTime = DateTime.now();
var dateTime = DateTime.now().hour;
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<HomeProvider>(context, listen: false);
      provider.dateAndTime();
    });
    print("📅📅📅📅📅⏲️⏲️⏲️⏲️⏲️${DateTime.now()}📅📅📅📅📅⏲️⏲️⏲️⏲️⏲️");
    print("⏳⏳⏳⏳⏳⏳⏳⏳⏳⏳⏳⏳⏳${dateTime}⏳⏳⏳⏳⏳⏳⏳⏳⏳⏳⏳⏳⏳");

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<HomeProvider>(context, listen: false);
      //   provider.homeProvider(context: context);
      provider.home('http://192.168.0.121:8001/api/categories-list', context);
      // provider.review();
    });
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<HomeProvider>(context, listen: false);
      //   provider.homeProvider(context: context);
      provider.post('http://192.168.0.121:8001/api/post-list', context);
    });
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        i++;
        setState(() {});
        //  provider.post('http://192.168.0.121:8001/api/post-list', context);
        print('=============$i=========');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<HomeProvider>(builder: (context, provider, _) {
        return Scaffold(
          appBar: CustomAppBar(
              size: MediaQuery.of(context).size,
              // text: "Hello,Good Morning",
              text: provider.currentMassage,
              // text: dateAndTime(),
              actions: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RoutesUtils.settingScreen);
                    },
                    child: Image.asset(
                      AssetUtils.setting,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ]),
          body: provider.postListData!.isNotEmpty
              ? Column(
                  children: [
                    // top catagary view
                    provider.categoriesData!.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              right: 12,
                              top: 12,
                            ),
                            child: SizedBox(
                              height: 90,
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: provider.categoriesData!.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                          RoutesUtils.categoryScreen,
                                          arguments: Categorys(
                                            names:
                                                "${provider.categoriesData![index].name}",
                                            categoryName:
                                                "${provider.categoriesData![index].categoryName}",
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(8),
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: const Color(0xff8CC270),
                                                width: 2,
                                              ),
                                              color: Colors.white,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(2),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                height: 60,
                                                width: 60,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xffD2E7C7),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(12),
                                                  ),
                                                ),
                                                // child: CachedNetworkImage(
                                                //   imageUrl:
                                                //       "${provider.categoriesData![index].imageUrl}",
                                                //   fit: BoxFit.cover,
                                                // ),
                                                child: SvgPicture.network(
                                                  "${provider.categoriesData![index].imageUrl}",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          )
                        : const showShimmer(),
                    // divider image
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(AssetUtils.divider),
                    ),
                    //post list
                    provider.postListData!.isNotEmpty
                        ? Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                              ),
                              child: Scrollbar(
                                controller: scrollController,
                                child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: provider.postListData!.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        // onTap: () {
                                        //   Navigator.of(context).pushNamed(
                                        //     RoutesUtils.detailScreen,
                                        //     arguments: Detail(
                                        //       description:
                                        //           "${provider.postListData![index].description}",
                                        //       title:
                                        //           "${provider.postListData![index].title}",
                                        //       image:
                                        //           "${provider.postListData![index].image}",
                                        //     ),
                                        //   );
                                        // },
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 280,
                                                width: double.infinity,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(15),
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(15),
                                                      ),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            "${provider.postListData![index].image}",
                                                        height: 280,
                                                        width: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    // Column(
                                                    //   crossAxisAlignment:
                                                    //       CrossAxisAlignment
                                                    //           .start,
                                                    //   children: [
                                                    //     Padding(
                                                    //       padding:
                                                    //           const EdgeInsets
                                                    //               .symmetric(
                                                    //         horizontal: 8,
                                                    //         vertical: 8,
                                                    //       ),
                                                    //       child: Row(
                                                    //         crossAxisAlignment:
                                                    //             CrossAxisAlignment
                                                    //                 .start,
                                                    //         children: [
                                                    //           Expanded(
                                                    //             child:
                                                    //                 // provider.postListData!
                                                    //                 //         .isNotEmpty
                                                    //                 provider
                                                    //                         .postListData![index]
                                                    //                         .tag!
                                                    //                         .isNotEmpty
                                                    //                     ? Wrap(
                                                    //                         children: provider.postListData![index].tag!
                                                    //                             .map(
                                                    //                               (i) => Padding(
                                                    //                                 padding: const EdgeInsets.all(2.0),
                                                    //                                 child: BlurryContainer(
                                                    //                                   blur: 5,
                                                    //                                   height: 30,
                                                    //                                   elevation: 0,
                                                    //                                   color: Colors.white.withOpacity(0.3),
                                                    //                                   // padding: const EdgeInsets.all(8),
                                                    //                                   borderRadius: const BorderRadius.all(
                                                    //                                     Radius.circular(10),
                                                    //                                   ),
                                                    //                                   child: Text(
                                                    //                                     i.toUpperCase(),
                                                    //                                     style: FontUtils.h8(
                                                    //                                       fontColor: ColorUtils.themeColor.oxffFFFFFF,
                                                    //                                       fontWeight: FWT.semiBold,
                                                    //                                     ),
                                                    //                                   ),
                                                    //                                 ),
                                                    //                               ),
                                                    //                             )
                                                    //                             .toList(),
                                                    //                       )
                                                    //                     : const SizedBox(),
                                                    //           ),
                                                    //           Padding(
                                                    //             padding:
                                                    //                 const EdgeInsets
                                                    //                     .all(3),
                                                    //             child:
                                                    //                 BlurryContainer(
                                                    //               blur: 5,
                                                    //               width: 30,
                                                    //               height: 30,
                                                    //               elevation: 0,
                                                    //               color: Colors
                                                    //                   .white
                                                    //                   .withOpacity(
                                                    //                 0.3,
                                                    //               ),
                                                    //               // color: Colors.transparent,
                                                    //               padding:
                                                    //                   const EdgeInsets
                                                    //                       .all(8),
                                                    //               borderRadius:
                                                    //                   const BorderRadius
                                                    //                       .all(
                                                    //                 Radius
                                                    //                     .circular(
                                                    //                         5),
                                                    //               ),
                                                    //               child:
                                                    //                   GestureDetector(
                                                    //                 onTap: () {
                                                    //                   Navigator.of(
                                                    //                           context)
                                                    //                       .pushNamed(
                                                    //                           RoutesUtils.loginScreen);
                                                    //                 },
                                                    //                 child: Image
                                                    //                     .asset(
                                                    //                   AssetUtils
                                                    //                       .heart,
                                                    //                 ),
                                                    //               ),
                                                    //             ),
                                                    //           ),
                                                    //         ],
                                                    //       ),
                                                    //     ),
                                                    //   ],
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pushNamed(
                                                  RoutesUtils.detailScreen,
                                                  arguments: Detail(
                                                    description:
                                                        "${provider.postListData![index].description}",
                                                    title:
                                                        "${provider.postListData![index].title}",
                                                    image:
                                                        "${provider.postListData![index].image}",
                                                    tag:
                                                        provider.postListData![index].tag,
                                                  ),
                                                );
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 280,
                                                  width: double.infinity,
                                                  decoration:
                                                      const BoxDecoration(
                                                    gradient: LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        Colors.transparent,
                                                        Colors.transparent,
                                                        Colors.transparent,
                                                        Colors.transparent,
                                                        Colors.black87,
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(15),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              horizontal: 8,
                                                              vertical: 8,
                                                            ),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      // provider.postListData!
                                                                      //         .isNotEmpty
                                                                      provider
                                                                              .postListData![index]
                                                                              .tag!
                                                                              .isNotEmpty
                                                                          ? Wrap(
                                                                              children: provider.postListData![index].tag!
                                                                                  .map(
                                                                                    (i) => Padding(
                                                                                      padding: const EdgeInsets.all(2.0),
                                                                                      child: BlurryContainer(
                                                                                        blur: 5,
                                                                                        height: 30,
                                                                                        elevation: 0,
                                                                                        color: Colors.white.withOpacity(0.3),
                                                                                        // padding: const EdgeInsets.all(8),
                                                                                        borderRadius: const BorderRadius.all(
                                                                                          Radius.circular(10),
                                                                                        ),
                                                                                        child: Text(
                                                                                          i.toUpperCase(),
                                                                                          style: FontUtils.h8(
                                                                                            fontColor: ColorUtils.themeColor.oxffFFFFFF,
                                                                                            fontWeight: FWT.semiBold,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                  .toList(),
                                                                            )
                                                                          : const SizedBox(),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(3),
                                                                  child:
                                                                      BlurryContainer(
                                                                    blur: 5,
                                                                    width: 30,
                                                                    height: 30,
                                                                    elevation:
                                                                        0,
                                                                    color: Colors
                                                                        .white
                                                                        .withOpacity(
                                                                      0.3,
                                                                    ),
                                                                    // color: Colors.transparent,
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(8),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .all(
                                                                      Radius
                                                                          .circular(
                                                                              5),
                                                                    ),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        // Image
                                                                        //     .asset(
                                                                        //   AssetUtils
                                                                        //       .like,
                                                                        //   color:
                                                                        //       Colors.red,
                                                                        // );
                                                                        // if (user ==
                                                                        //     login) {
                                                                        //   // save
                                                                        // } else {
                                                                        Navigator.of(context)
                                                                            .pushNamed(RoutesUtils.loginScreen);
                                                                        // }
                                                                      },
                                                                      child: Image
                                                                          .asset(
                                                                        AssetUtils
                                                                            .heart,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            "${provider.postListData![index].title}",
                                                            style:
                                                                FontUtils.h14(
                                                              fontColor: ColorUtils
                                                                  .themeColor
                                                                  .oxffFFFFFF,
                                                              fontWeight:
                                                                  FWT.medium,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          )
                        : const showShimmer(),
                  ],
                )
              : const Visibility(
                  child: showShimmer(),
                ),
        );
      }),
    );
  }
}
