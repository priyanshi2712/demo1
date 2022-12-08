import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

showLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            ),
          ),
        );
      });
}

// Widget showShimmer(BuildContext context) {
//   return ListView.builder(
//     itemCount: 10,
//     itemBuilder: (context, index) {
//       return Shimmer.fromColors(
//         baseColor: Colors.grey.shade300,
//         highlightColor: Colors.white.withOpacity(0.1),
//         child: Container(
//           margin: const EdgeInsets.all(10),
//           height: 280,
//           width: MediaQuery.of(context).size.width,
//           decoration: const BoxDecoration(
//             color: Colors.grey,
//             borderRadius: BorderRadius.all(
//               Radius.circular(15),
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }

hideLoadingShimmer(BuildContext context) {
  Navigator.pop(context);
}

hideLoadingDialog(BuildContext context) {
  Navigator.pop(context);
}

class showShimmer extends StatefulWidget {
  const showShimmer({super.key});

  @override
  State<showShimmer> createState() => _showShimmerState();
}

class _showShimmerState extends State<showShimmer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.white.withOpacity(0.1),
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 280,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
        );
      },
    );
  }
}
