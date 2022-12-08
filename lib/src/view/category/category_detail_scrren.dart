import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/src/view/category/CategoryClass.dart';
import 'package:demo/src/view/home_screen/home_screen.dart';
import 'package:demo/utilities/font/font_utils.dart';
import 'package:demo/utilities/loading_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '../../../../utilities/asset/asset_utils.dart';
import '../../../../utilities/routes/routes.dart';
import '../../../utilities/color/color_utils.dart';
import '../../widget/other/app_bar.dart';
import '../../widget/other/custom_back.dart';
import 'category_provide/category_provider.dart';

class CategoryScreen extends StatefulWidget {
  final Categorys categorys;
  final Categorys categoryName;
  const CategoryScreen({
    Key? key,
    required this.categorys,
    required this.categoryName,
  }) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String? names;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<CategoryProvider>(context, listen: false);
      provider.CategoryDetailData!.clear();
      setState(() {});
      provider.category(
          'http://192.168.0.121:8001/api/${widget.categorys.categoryName}',
          context);
      // provider.foodList('http://192.168.0.121:8001/api/categories-list', context);
    });
    // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    // if (widget.categorys.selectedIndex != null) {
    //   selectedIndex = widget.categorys.selectedIndex;
    // }
    if (widget.categorys.names != null) {
      names = widget.categorys.names;
    }
    // print("==============$selectedIndex=================");
    print("==============$names=================");

    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // String data = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Consumer<CategoryProvider>(builder: (context, provider, _) {
        return Scaffold(
          appBar: CustomAppBar(
            size: MediaQuery.of(context).size,
            // text: "${selectedIndex}",
            text: "${names}",
            centerTitleValue: true,
            leading: Row(
              children: const [
                CustomBack(),
              ],
            ),
          ),
          body: provider.CategoryDetailData!.isNotEmpty
              ? Column(
                  children: [
                    //post list
                    provider.CategoryDetailData!.isNotEmpty
                        ? Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                                top: 10,
                              ),
                              child: Scrollbar(
                                controller: scrollController,
                                child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount:
                                        provider.CategoryDetailData!.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                            RoutesUtils.detailScreen,
                                            arguments: Detail(
                                              description:
                                                  "${provider.CategoryDetailData![index].description}",
                                              title:
                                                  "${provider.CategoryDetailData![index].title}",
                                              image:
                                                  "${provider.CategoryDetailData![index].image}",
                                              tag: provider
                                                  .CategoryDetailData![index]
                                                  .tag,
                                            ),
                                          );
                                        },
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
                                                            "${provider.CategoryDetailData![index].image}",
                                                        height: 280,
                                                        width: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
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
                                                                  vertical: 8),
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
                                                                            .CategoryDetailData![index]
                                                                            .tag!
                                                                            .isNotEmpty
                                                                        ? Wrap(
                                                                            children: provider.CategoryDetailData![index].tag!
                                                                                .map(
                                                                                  (i) => Padding(
                                                                                    padding: const EdgeInsets.all(2.0),
                                                                                    child: BlurryContainer(
                                                                                      blur: 5,
                                                                                      height: 30,
                                                                                      elevation: 0,
                                                                                      color: Colors.white.withOpacity(0.3),
                                                                                      // color: Colors.transparent,
                                                                                      padding: const EdgeInsets.all(8),
                                                                                      borderRadius: const BorderRadius.all(
                                                                                        Radius.circular(10),
                                                                                      ),
                                                                                      child: Text(
                                                                                        i,
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
                                                                  elevation: 0,
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.3),
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
                                                                  child: Image.asset(
                                                                      AssetUtils
                                                                          .heart),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 280,
                                                width: double.infinity,
                                                decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
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
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "${provider.CategoryDetailData![index].title}",
                                                      style: FontUtils.h14(
                                                        fontColor: ColorUtils
                                                            .themeColor
                                                            .oxffFFFFFF,
                                                        fontWeight: FWT.medium,
                                                      ),
                                                    ),
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
