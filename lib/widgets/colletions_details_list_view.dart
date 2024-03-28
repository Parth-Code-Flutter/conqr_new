import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:conqr_new/constants/color_constants.dart';
import 'package:conqr_new/constants/image_constants.dart';
import 'package:conqr_new/screens/dashobard/home/base/model/lesson_res_model.dart';
import 'package:conqr_new/utils/aler_message_utils.dart';
import 'package:conqr_new/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class CollectionsDetailsListView extends StatefulWidget {
  const CollectionsDetailsListView(
      {super.key,
      required this.lessonsDataList,
      this.controller,
      required this.callBack});

  final List<Result>? lessonsDataList;
  final SwiperController? controller;
  final Function(int) callBack;

  @override
  State<CollectionsDetailsListView> createState() =>
      _CollectionsDetailsListViewState();
}

class _CollectionsDetailsListViewState
    extends State<CollectionsDetailsListView> {
  ScreenshotController screenshotController = ScreenshotController();
  File appIconFile = File('');
  bool isShowLoader = false;

  Future<void> imageToFile() async {
    var bytes = await rootBundle.load('lib/assets/icons/app_logo.png');
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/app_icon.png');
    await file.writeAsBytes(
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
    appIconFile = file;
  }

  @override
  void initState() {
    imageToFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Swiper(
        itemCount: (widget.lessonsDataList ?? []).length,
        scrollDirection: Axis.vertical,
        layout: SwiperLayout.STACK,
        itemWidth: Get.width,
        itemHeight: Get.height,
        axisDirection: AxisDirection.down,
        loop: false,
        controller: widget.controller,
        onIndexChanged: (value) {
          widget.callBack(value);
        },
        itemBuilder: (context, index) {
          var data = widget.lessonsDataList?[index];
          return Padding(
            // padding: const EdgeInsets.only(bottom: 26),
            padding: EdgeInsets.symmetric(
                vertical: data?.isQuote == true ? 52 : 26, horizontal: 16),
            child: Container(
              // elevation: 5.0,
              // shadowColor: kColorBlack.withOpacity(.25),
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: kColorWhite,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(88, 126, 157, 0.1),
                    blurRadius: 16,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 26, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AlertMessageUtils().showProgressDialog();

                        ///Capture and saving to a file
                        screenshotController
                            .captureFromWidget(shareContentWidget(data),
                                delay: const Duration(seconds: 1))
                            .then((value) async {
                          var image = value;

                          final dir = await getApplicationDocumentsDirectory();
                          final imagePath =
                              await File('${dir.path}/captured.png').create();
                          await imagePath.writeAsBytes(image);

                          AlertMessageUtils().hideProgressDialog();

                          ///Share
                          await Share.shareXFiles([XFile(imagePath.path)]);
                        });
                        // Share.shareXFiles(
                        //   [
                        //     XFile(
                        //       appIconFile.path,
                        //     ),
                        //   ],
                        //   text: data?.description ?? '',
                        //   subject: data?.title ?? '',
                        // );
                      },
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 6, right: 4),
                          child: SvgPicture.asset(kShareIcon, height: 15),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          if (data?.isQuote == true) SvgPicture.asset(quoteBG),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data?.title ?? '',
                                maxLines: 2,
                                style: TextStyles.kPrimaryBoldRobotoSlab(
                                    fontSize: TextStyles.k20FontSize),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                (data?.description ?? '').split('-').first,
                                style: TextStyles.kPrimaryRegularRobotoSlab(
                                  fontSize: TextStyles.k16FontSize,
                                ).copyWith(overflow: TextOverflow.ellipsis),
                                maxLines: 16,
                                textAlign: data?.isQuote == true
                                    ? TextAlign.center
                                    : TextAlign.start,
                              ),
                              if (data?.isQuote == true) SizedBox(height: 55),
                              if (data?.isQuote == true)
                                Text(
                                  (data?.description ?? '').split('-').last,
                                  style: TextStyles.kPrimaryRegularRobotoSlab(
                                      fontSize: TextStyles.k16FontSize,
                                      fontWeight: FontWeight.w500,
                                      colors: kColor1B57A6),
                                ),
                              SizedBox(height: 30),
                              if (data?.isQuote == false)
                                Visibility(
                                  visible: data?.referenceUrl != null &&
                                      (data?.referenceUrl ?? '').isNotEmpty,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Source Link : ${data?.referenceUrl ?? ''}',
                                      style: TextStyles
                                          .kPrimaryRegularRobotoSlabWithUnderLine(
                                              fontSize: TextStyles.k16FontSize,
                                              colors: kColor1B57A6),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget shareContentWidget(data) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(
          vertical: data?.isQuote == true ? 52 : 26, horizontal: 16),
      decoration: BoxDecoration(
        color: kColorWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(88, 126, 157, 0.1),
            blurRadius: 16,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        // padding: const EdgeInsets.only(bottom: 26),
        padding: EdgeInsets.symmetric(
            vertical: data?.isQuote == true ? 52 : 26, horizontal: 16),
        child: Container(
          // elevation: 5.0,
          // shadowColor: kColorBlack.withOpacity(.25),
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: kColorWhite,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(88, 126, 157, 0.1),
                blurRadius: 16,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 26, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      if (data?.isQuote == true) SvgPicture.asset(quoteBG),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data?.title ?? '',
                            maxLines: 2,
                            style: TextStyles.kPrimaryBoldRobotoSlab(
                                fontSize: TextStyles.k20FontSize),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            (data?.description ?? '').split('-').first,
                            style: TextStyles.kPrimaryRegularRobotoSlab(
                              fontSize: TextStyles.k16FontSize,
                            ).copyWith(overflow: TextOverflow.ellipsis),
                            maxLines: 16,
                            textAlign: data?.isQuote == true
                                ? TextAlign.center
                                : TextAlign.start,
                          ),
                          if (data?.isQuote == true) SizedBox(height: 55),
                          if (data?.isQuote == true)
                            Text(
                              (data?.description ?? '').split('-').last,
                              style: TextStyles.kPrimaryRegularRobotoSlab(
                                  fontSize: TextStyles.k16FontSize,
                                  fontWeight: FontWeight.w500,
                                  colors: kColor1B57A6),
                            ),
                          // SizedBox(height: 30),
                          if (data?.isQuote == false)
                            Visibility(
                              visible: data?.referenceUrl != null &&
                                  (data?.referenceUrl ?? '').isNotEmpty,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Source Link : ${data?.referenceUrl ?? ''}',
                                  style: TextStyles
                                      .kPrimaryRegularRobotoSlabWithUnderLine(
                                          fontSize: TextStyles.k16FontSize,
                                          colors: kColor1B57A6),
                                ),
                              ),
                            ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                kAppIconPNG,
                                height: 20,
                                width: 150,
                              ),
                              Container(
                                height: 20,
                                width: 150,
                                color: kColorWhite.withOpacity(.7),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// collectionsDetailsListView(BuildContext context,
//     {List<Result>? lessonsDataList, SwiperController? controller}) {
//   return
// }

oldWidget() {
  return ListView.builder(
    itemCount: 10,
    padding: EdgeInsets.only(top: 20, bottom: 26, left: 15, right: 15),
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 26),
        child: Material(
          elevation: 5.0,
          shadowColor: kColorBlack.withOpacity(.25),
          color: kColorWhite,
          child: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 26, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Title of  Lesson',
                      style: TextStyles.kPrimaryBoldRobotoSlab(
                          fontSize: TextStyles.k20FontSize),
                    ),
                    SvgPicture.asset(kShareIcon),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.',
                  style: TextStyles.kPrimaryRegularRobotoSlab(
                      fontSize: TextStyles.k16FontSize),
                ),
                SizedBox(height: 18),
                Text(
                  'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there.',
                  style: TextStyles.kPrimaryRegularRobotoSlab(
                      fontSize: TextStyles.k16FontSize),
                ),
                SizedBox(height: 30),
                Text(
                  'Source Link : www.Lessionstory.com',
                  style: TextStyles.kPrimaryRegularRobotoSlabWithUnderLine(
                      fontSize: TextStyles.k16FontSize, colors: kColor1B57A6),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
