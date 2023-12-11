import 'package:country_picker/country_picker.dart';
import 'package:doodle/common/utils/constants.dart';
import 'package:doodle/common/widgets/appstyle.dart';
import 'package:doodle/common/widgets/custome_textfeild.dart';
import 'package:doodle/common/widgets/cutome_otn_button.dart';
import 'package:doodle/common/widgets/height_spacer.dart';
import 'package:doodle/common/widgets/reusable_text.dart';
import 'package:doodle/features/auth/pages/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final TextEditingController phone = TextEditingController();

  Country? selectedCountry = Country(
    countryCode: 'eth',
    phoneCode: '251',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Ethiopia",
    example: "911234567",
    displayName: "Ethiopia (ኢትዮጵያ)",
    displayNameNoCountryCode: "Ethiopia (ኢትዮጵያ)",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListView(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Image.asset(
                'assets/images/todo.png',
                width: 300,
              )),
          const HeightSpacer(height: 20),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16.w),
            child: ReusableText(
                text: 'Please enter your phone number',
                style: appstyle(17, AppConstants.appLight, FontWeight.w500)),
          ),
          const HeightSpacer(height: 20),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: CustomeTextFiled(
                controller: phone,
                prefixIcon: Container(
                  padding: EdgeInsets.all(14),
                  child: GestureDetector(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        countryListTheme: CountryListThemeData(
                          flagSize: 25,
                          backgroundColor: AppConstants.appLight,
                          bottomSheetHeight: AppConstants.appHeight * 0.6,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppConstants.appRadius),
                              topRight:
                                  Radius.circular(AppConstants.appRadius)),
                        ),
                        showPhoneCode: true,
                        onSelect: (code) {
                          setState(() {
                            selectedCountry = code;
                          });
                        },
                      );
                    },
                    child: ReusableText(
                        text:
                            "${selectedCountry!.flagEmoji}+${selectedCountry!.phoneCode}",
                        style: appstyle(
                            18, AppConstants.appGrayLight, FontWeight.bold)),
                  ),
                ),
                keyBoardtype: TextInputType.phone,
                hintText: "Enter your phone number",
                hintStyle:
                    appstyle(16, AppConstants.appGrayLight, FontWeight.w500)),
          ),
          const HeightSpacer(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomOtnButton(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: ((context) => Otp())));
                },
                width: AppConstants.appWidth * 0.9,
                height: AppConstants.appHeight * 0.07,
                colors: AppConstants.appDark,
                color2: AppConstants.appLight,
                text: "Send Code"),
          )
        ],
      ),
    )));
  }
}
