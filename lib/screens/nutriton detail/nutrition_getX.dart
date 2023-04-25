// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:get/get.dart';
// import 'package:my_app/model/nutrition/nutrition_controller.dart';
// import 'package:my_app/model/nutrition/nutrition_getConnect.dart';

// class NutritionGetX extends GetView<NutritionControllerGetX> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Cities')),
//       body: controller.obx(
//         (state) => Html(data: state!.detail),
//         onLoading: Center(child: CircularProgressIndicator()),
//         onError: (error) => Center(
//           child: Text(
//             'Error: $error',
//             style: TextStyle(fontSize: 18),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NutritionBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut(() => NutritionProvider());
//     Get.put(NutritionControllerGetX(nutritionProvider: Get.find()));
//   }
// }
