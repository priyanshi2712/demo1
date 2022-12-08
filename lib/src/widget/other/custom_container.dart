import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:demo/src/view/home_screen/home_response/post_list_response.dart';
import 'package:flutter/material.dart';
import '../../../utilities/asset/asset_utils.dart';

class PostViewWidget extends StatelessWidget {
  final PostListDatum? categoryDetailData;
  const PostViewWidget({
    super.key,
    this.categoryDetailData,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(5),
            height: 280,
            width: double.infinity,
            // color: Colors.red,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  "${categoryDetailData!.image}",
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: categoryDetailData!.tag!.isNotEmpty
                          ? Wrap(
                              children: categoryDetailData!.tag!
                                  .map(
                                    (i) => Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: BlurryContainer(
                                        blur: 5,
                                        height: 30,
                                        elevation: 0,
                                        color: Colors.white.withOpacity(0.3),
                                        padding: const EdgeInsets.all(8),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        child: Text(
                                          i,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            )
                          : const SizedBox(),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.all(10),
                    //   padding: const EdgeInsets.all(5),
                    //   height: 30,
                    //   width: 30,
                    //   decoration: BoxDecoration(
                    //     color:
                    //         Colors.white.withOpacity(0.3),
                    //     borderRadius:
                    //         const BorderRadius.all(
                    //       Radius.circular(10),
                    //     ),
                    //   ),
                    //   child: Image.asset(AssetUtils.heart),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: BlurryContainer(
                        blur: 5,
                        width: 30,
                        height: 30,
                        elevation: 0,
                        color: Colors.white.withOpacity(0.3),
                        // color: Colors.transparent,
                        padding: const EdgeInsets.all(8),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                        child: Image.asset(AssetUtils.heart),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
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
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry .',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
