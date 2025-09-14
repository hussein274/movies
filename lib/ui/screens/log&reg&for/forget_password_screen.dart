import 'package:flutter/material.dart';
import 'package:movies/ui/widget/custom_elevated_button.dart';
import '../../../generated/assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';
import '../../widget/custom_text_form_field.dart';

class ForgetPassScreen extends StatelessWidget {
   ForgetPassScreen({super.key});
TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: buildAppBar(context),
      body: Column(children: [
        Image.asset(Assets.imagesForgotpassword),
        buildEmail(),
        SizedBox(height: 20,),
        buildButtonVerity()
      ],

      ),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color: AppColors.yellow,)),
      title:
           Text("Forget Password",style: AppTextStyle.smallText.
           copyWith(color: AppColors.yellow),
    ));
  }

  buildEmail() {
    return CustomTextFormField(
      controller:emailController,


      prefixIcon: Image.asset(Assets.iconsVector),
      hintText: "Email",
      validator: (value) {
        if (value!.isEmpty) {
          return "Email is required";
        }
        return null;
      },
    );
  }

  buildButtonVerity() {
    return CustomElevatedButton(onPressed: (){},
        child: Text("Verity Email",style: AppTextStyle.RobotoW400_20,));
  }
}


