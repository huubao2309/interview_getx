import 'package:flutter/material.dart';
import 'package:interview_getx/modules/home/home.dart';

import 'package:get/get.dart';

class MainTab extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Obx(
      //   () => RefreshIndicator(
      //     onRefresh: () => controller.loadUsers(),
      //     child: _buildGridView(),
      //   ),
      // ),
      body: Container(),
    );
  }

// Widget _buildGridView() {
//   return StaggeredGridView.countBuilder(
//     crossAxisCount: 4,
//     itemCount: data!.length,
//     itemBuilder: (context, index) => Container(
//       color: ColorConstants.lightGray,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Text('${data![index].lastName} ${data![index].firstName}'),
//           CachedNetworkImage(
//             fit: BoxFit.fill,
//             imageUrl: data![index].avatar ?? 'https://reqres.in/img/faces/1-image.jpg',
//             placeholder: (context, url) => const Image(
//               image: AssetImage('assets/images/icon_success.png'),
//             ),
//             errorWidget: (context, url, error) => const Icon(Icons.error),
//           ),
//           Text('${data![index].email}'),
//         ],
//       ),
//     ),
//     staggeredTileBuilder: (index) => StaggeredTile.count(2, index.isEven ? 3 : 2),
//     mainAxisSpacing: 4,
//     crossAxisSpacing: 4,
//   );
// }
}
