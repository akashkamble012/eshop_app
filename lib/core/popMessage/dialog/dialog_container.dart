import 'package:flutter/material.dart';

import '../../../common/app_text_styles.dart';
import '../../Helper/styles.dart';
import '../../theme/app_color.dart';
import '../../widget/custom_text_button.dart';

class DialogContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? cancelButtonName;
  final String? okButtonName;
  final bool? network;
  final Function()? cancelButton;
  final Function()? okButton;
  const DialogContainer(
      {Key? key,
      required this.title,
      required this.subTitle,
      this.cancelButton,
      this.okButton,
      this.network,
      this.cancelButtonName,
      this.okButtonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: Styles.edgeInsetsAll10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle.alertTitleStyle,
            ),
            Styles.sizedBoxH10,
            Text(subTitle, textAlign: TextAlign.center, style: AppTextStyle.alertSubtitleStyle),
            Styles.sizedBoxH20,
            if (network != null && network!)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextButton(
                    onPressed: okButton,
                    buttonName: okButtonName ?? ' Ok ',
                  ),
                ],
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Styles.sizedBoxW20,
                  CustomTextButton(
                    buttonName: cancelButtonName ?? 'Cancel',
                    textColor: AppColor.white,
                    size: const Size(60, 40),
                    radius: 4,
                    backgroundColor: AppColor.primaryColor,
                    onPressed: cancelButton,
                  ),
                  Styles.sizedBoxW20,
                  CustomTextButton(
                    buttonName: okButtonName ?? 'Ok',
                    textColor: AppColor.white,
                    size: const Size(60, 40),
                    radius: 4,
                    backgroundColor: AppColor.alertButtonColor,
                    onPressed: okButton,
                  ),
                  Styles.sizedBoxW20,
                ],
              ),
          ],
        ),
      ),
    );
  }
}
