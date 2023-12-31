import 'package:conqr_new/constants/color_constants.dart';
import 'package:conqr_new/constants/image_constants.dart';
import 'package:conqr_new/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

collectionsDetailsListView(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18),
    child: ListView.builder(
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
                        style: TextStyles.kPrimaryBoldRobotoSlab(fontSize: TextStyles.k20FontSize),
                      ),
                      SvgPicture.asset(kShareIcon),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.',
                    style: TextStyles.kPrimaryRegularRobotoSlab(fontSize: TextStyles.k16FontSize),
                  ),
                  SizedBox(height: 18),
                  Text(
                    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there.',
                    style: TextStyles.kPrimaryRegularRobotoSlab(fontSize: TextStyles.k16FontSize),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Source Link : www.Lessionstory.com',
                    style: TextStyles.kPrimaryRegularRobotoSlabWithUnderLine(fontSize: TextStyles.k16FontSize, colors: kColor1B57A6),
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
