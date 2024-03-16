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
          title: Text(
            controller.collectionDetailsData.value.description ?? '',
            style: TextStyles.kPrimaryRegularPoppins(
                fontWeight: FontWeight.w500,
                colors: kColorNavyBlue,
                fontSize: TextStyles.k16FontSize),
          ),
        ),
        backgroundColor: kColorBackground,
        body: Obx(
          () {
            return collectionsDetailsListView(context,
                lessonsDataList: controller.lessonData.value.result ?? []);
          },
        ),
      ),
    );
  }
}
