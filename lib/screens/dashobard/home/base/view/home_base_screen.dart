import 'package:conqr_new/constants/image_constants.dart';
import 'package:conqr_new/screens/dashobard/home/base/controller/home_base_controller.dart';
import 'package:conqr_new/widgets/colletions_details_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeBaseScreen extends GetView<HomeBaseController> {
  const HomeBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () {
            return controller.isApiCalling.value
                ? SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18, top: 38),
                        child: Image.asset(kAppIconPNG, height: 25),
                      ),
                      SizedBox(height: 10),
                      Obx(
                        () {
                          return Expanded(
                            child:
                            CollectionsDetailsListView(
                              lessonsDataList:
                                  controller.lessonData.value.result,
                              callBack: (p0) {},

                            ),
                          );
                        },
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
