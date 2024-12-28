import 'package:evently_app/UI/tabs/tabs_widgets/custom_elevated_button.dart';
import 'package:evently_app/UI/tabs/tabs_widgets/custom_text_field.dart';
import 'package:evently_app/utls/app_colo.dart';
import 'package:evently_app/utls/app_images.dart';
import 'package:evently_app/utls/app_routes.dart';
import 'package:evently_app/utls/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    Color borderColor=Theme.of(context).brightness==Brightness.dark?AppColor.babyBlueColor:AppColor.greyColor;

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                height: height * 0.28,
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
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(AppRouting.routeForgetPassword);
                },
                child: Text(
                  AppLocalizations.of(context)!.forget_password,
                  style: AppStyle.blue16bold.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColor.babyBlueColor,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomElevatedButton(
                text: AppLocalizations.of(context)!.login,
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
                  Navigator.of(context).pushNamed(AppRouting.routeRegister);
                },
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context)!.doNotHaveAccount,
                        style: Theme.of(context).brightness==Brightness.dark?AppStyle.white16Medium:AppStyle.black16Medium,
                      ),
                      TextSpan(
                        text: AppLocalizations.of(context)!.create_account,
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
               Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: AppColor.babyBlueColor,
                      thickness: 2, 
                      endIndent: 20, 
                      indent: 20, 
                    ),
                  ),
                  Text(AppLocalizations.of(context)!.or,style: AppStyle.blue16bold,),
                  const Expanded(
                    child: Divider(
                      color: AppColor.babyBlueColor,
                      thickness: 2, 
                      endIndent: 20, 
                      indent: 20, 
                    ),
                  ),
                ],
              ),
               SizedBox(
                height: height * 0.02,
              ),
             CustomElevatedButton(
                onClickedButton: (){
                  //task
                },
                
                 text: AppLocalizations.of(context)!.login_with_google,
                 textStyle: AppStyle.blue20bold,
                 prefixIcon: Image.asset(AppImages.googleIcon),
                 bgColor: Theme.of(context).brightness==Brightness.dark?AppColor.primaryDark:AppColor.whiteColor,
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
