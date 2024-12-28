import 'package:evently_app/UI/tabs/tabs_widgets/custom_elevated_button.dart';
import 'package:evently_app/UI/tabs/tabs_widgets/custom_text_field.dart';
import 'package:evently_app/utls/app_colo.dart';
import 'package:evently_app/utls/app_images.dart';
import 'package:evently_app/utls/app_routes.dart';
import 'package:evently_app/utls/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    Color borderColor=Theme.of(context).brightness==Brightness.dark?AppColor.babyBlueColor:AppColor.greyColor;

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.forget_password2,style:Theme.of(context).brightness==Brightness.dark?AppStyle.blue16bold:AppStyle.black16Bold),
        centerTitle: true, 
        backgroundColor: Theme.of(context).brightness==Brightness.dark?AppColor.primaryDark:AppColor.whiteColor,
        iconTheme: Theme.of(context).brightness==Brightness.dark?const IconThemeData(color:AppColor.babyBlueColor):IconThemeData(color:AppColor.blackColor),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppImages.forgetpasswordLight,
                height: height * 0.35,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextField(
                style: Theme.of(context).brightness==Brightness.dark?AppStyle.white16Medium:AppStyle.grey16Medium,
                borderColor: borderColor,
                hintText: AppLocalizations.of(context)!.email,
                prefixIcon: Theme.of(context).brightness==Brightness.dark?Image.asset(AppImages.emailIconDark):Image.asset(AppImages.emailIconLight),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomElevatedButton(
                text: AppLocalizations.of(context)!.reset_password,
                textStyle: AppStyle.white20Medium,
                onClickedButton: (){
                  //will change
                  Navigator.of(context).pushReplacementNamed(AppRouting.routeLogin);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
