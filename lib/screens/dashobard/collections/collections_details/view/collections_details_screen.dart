import 'package:conqr_new/constants/color_constants.dart';
import 'package:conqr_new/constants/image_constants.dart';
import 'package:conqr_new/screens/dashobard/collections/collections_details/controller/collections_details_controller.dart';
import 'package:conqr_new/utils/text_styles.dart';
import 'package:conqr_new/widgets/colletions_details_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CollectionsDetailsScreen extends GetView<CollectionsDetailsController> {
  const CollectionsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColorWhite,
          title: Obx(() {
            return Text(
              // controller.collectionDetailsData.value.description ?? '',
              controller.list[controller.currentCollectionIndex].description ??
                  '',
              style: TextStyles.kPrimaryRegularPoppins(
                  fontWeight: FontWeight.w500,
                  colors: kColorNavyBlue,
                  fontSize: TextStyles.k16FontSize),
            );
          }),
        ),
        backgroundColor: kColorBackground,
        body: Obx(() {
          return controller.resultsList.isEmpty
              ? Text('')
              : CollectionsDetailsListView(
            // lessonsDataList: controller.lessonData.value.result ?? [],
            lessonsDataList: controller.resultsList,
            callBack: (p0) {
              // if(controller.lessonData.value.result?.length == (p0+1)){
              if (controller.resultsList.length == (p0 + 1)) {
                print('true');
                controller.updateCollectionsList();
              }
              print(p0);
            },
          );
        }),
      ),
    );
  }
}
