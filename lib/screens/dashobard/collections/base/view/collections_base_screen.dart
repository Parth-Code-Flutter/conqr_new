import 'package:conqr_new/constants/color_constants.dart';
import 'package:conqr_new/constants/image_constants.dart';
import 'package:conqr_new/constants/localization.dart';
import 'package:conqr_new/screens/dashobard/collections/base/controller/collections_base_controller.dart';
import 'package:conqr_new/utils/text_styles.dart';
import 'package:conqr_new/widgets/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CollectionsBaseScreen extends GetView<CollectionsBaseController> {
  const CollectionsBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorWhite,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              searchTextField(context),
              collectionsListView(context),
            ],
          ),
        ),
      ),
    );
  }

  searchTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Material(
        elevation: 20.0,
        shadowColor: kColorBlack.withOpacity(.25),
        child: commonTextField(
          textFieldBorderColor: kColorWhite,
          controller: controller.searchCollectionController,
          hintText: AppLocal.kSearch.getString(context),
          hintTextStyle: TextStyles.kPrimaryRegularPoppins(fontSize: TextStyles.k16FontSize, colors: kColorGrey),
          preFixIcon: Padding(
            padding: const EdgeInsets.only(left: 18, top: 16, bottom: 16, right: 8),
            child: SvgPicture.asset(kSearchIcon),
          ),
        ),
      ),
    );
  }

  collectionsListView(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // controller.navigateToCollectionsDetailsScreen();
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Material(
                  elevation: 5.0,
                  shadowColor: kColorBlack.withOpacity(.25),
                  child: Container(
                    // margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(border: Border.all(color: index == 0 ? kColorBlack : kColorWhite, width: .5), borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      tileColor: kColorWhite,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: EdgeInsets.all(20),
                      leading: SvgPicture.asset(kHowToWinFriendIcon),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'How to win friends',
                              style: TextStyles.kPrimaryRegularPoppins(fontWeight: FontWeight.w500, colors: kColorNavyBlue, fontSize: TextStyles.k16FontSize),
                            ),
                            Text(
                              '12 scroll',
                              style: TextStyles.kPrimaryRegularPoppins(fontWeight: FontWeight.w500, colors: kColorGrey, fontSize: TextStyles.k16FontSize),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
