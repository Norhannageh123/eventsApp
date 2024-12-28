import 'package:evently_app/UI/tabs/tabs_widgets/custom_elevated_button.dart';
import 'package:evently_app/UI/tabs/tabs_widgets/custom_text_field.dart';
import 'package:evently_app/utls/app_colo.dart';
import 'package:evently_app/utls/app_images.dart';
import 'package:evently_app/utls/app_routes.dart';
import 'package:evently_app/utls/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    Color borderColor=Theme.of(context).brightness==Brightness.dark?AppColor.babyBlueColor:AppColor.greyColor;

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register,style:Theme.of(context).brightness==Brightness.dark?AppStyle.blue16bold:AppStyle.black16Bold),
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
                AppImages.logo,
                height: height * 0.2,
              ),
               SizedBox(
                height: height * 0.02,
              ),
              CustomTextField(
                style: Theme.of(context).brightness==Brightness.dark?AppStyle.white16Medium:AppStyle.grey16Medium,
                borderColor: borderColor,
                hintText: AppLocalizations.of(context)!.name,
                prefixIcon: Theme.of(context).brightness==Brightness.dark?Image.asset(AppImages.userIconDark):Image.asset(AppImages.userIconLight),
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
              CustomTextField(
                style: Theme.of(context).brightness==Brightness.dark?AppStyle.white16Medium:AppStyle.grey16Medium,
                borderColor: borderColor,
                hintText: AppLocalizations.of(context)!.password,
                prefixIcon: Theme.of(context).brightness==Brightness.dark?Image.asset(AppImages.passwordIconDark):Image.asset(AppImages.passwordIconLight),
                suffixIcon: Theme.of(context).brightness==Brightness.dark?Image.asset(AppImages.eyeIconDark):Image.asset(AppImages.eyeIconLight),
                obscureText: true,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextField(
                style: Theme.of(context).brightness==Brightness.dark?AppStyle.white16Medium:AppStyle.grey16Medium,
                borderColor: borderColor,
                hintText: AppLocalizations.of(context)!.re_password,
                prefixIcon: Theme.of(context).brightness==Brightness.dark?Image.asset(AppImages.passwordIconDark):Image.asset(AppImages.passwordIconLight),
                suffixIcon: Theme.of(context).brightness==Brightness.dark?Image.asset(AppImages.eyeIconDark):Image.asset(AppImages.eyeIconLight),
                obscureText: true,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomElevatedButton(
                text: AppLocalizations.of(context)!.create_account,
                textStyle: AppStyle.white20Medium,
                onClickedButton: (){
                  //will change
                  Navigator.of(context).pushNamed(AppRouting.routeHome);
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(AppRouting.routeLogin);
                },
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context)!.already_have_account,
                        style: Theme.of(context).brightness==Brightness.dark?AppStyle.white16Medium:AppStyle.black16Medium,
                      ),
                      TextSpan(
                        text: AppLocalizations.of(context)!.login,
                        style: AppStyle.blue16Medium.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColor.babyBlueColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Center(
                child: Container(
                  width: width*0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: AppColor.babyBlueColor,
                      width: 2,
                    )
                  ),
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AppImages.americaIcon),
                      Image.asset(AppImages.egyptIcon),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
