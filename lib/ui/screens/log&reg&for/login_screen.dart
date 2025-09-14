import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/utils/app_routes.dart';
import 'package:movies/ui/widget/build_show_toast.dart';

import '../../../di/di.dart';
import '../../../generated/assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_form_field.dart';
import '../cubit/login_cubit/login_cubit.dart';
import '../cubit/login_cubit/login_state.dart';


class LoginScreen extends StatefulWidget {
const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginCubit loginCubit=getIt();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool obscureText=true;

GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit,LoginState>(
      bloc: loginCubit,
      listener: (context, state) {
        if(state.loginApi.hasData){
          Navigator.push(context, AppRoutes.homeScreen);

        } else if(state.loginApi.isLoading){
          buildShowToast("Loading...",AppColors.yellow);

        }
        else if(state.loginApi.isError){
          buildShowToast("please enter valid email and password",AppColors.red);

        }
      },
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image.asset(Assets.imagesLogo),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                  buildEmailField(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  buildPasswordField(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, AppRoutes.forgetPassScreen);
                      },
                      child: Text("Forgot Password?",style: AppTextStyle.semiSmallText.
                      copyWith(color: AppColors.yellow,)),
                    ),
              
                  ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                   buildLoginButton(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    buildTextRow(),
                    SizedBox(height: 30,),
                    Row(children: [Expanded(child:
                    Divider(color: AppColors.yellow,indent: 90,endIndent: 20,
                    )),Text("or",style: AppTextStyle.smallText.copyWith(color: AppColors.yellow,))
                     ,Expanded(child: Divider(color: AppColors.yellow,
                        endIndent: 90,indent: 20,))],),
                    SizedBox(height: 30,),
                    buildGoogleButton(),
              
                ]
              
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildEmailField() {
    return CustomTextFormField(
      controller:emailController,


      prefixIcon: Image.asset(Assets.iconsVector),
      hintText: "Email",
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }

          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          if (!emailRegex.hasMatch(value)) {
            return 'Please enter a valid email address';
          }

          return null;
        }

    );
  }

  buildPasswordField() {
    return CustomTextFormField(
      controller:passwordController,
      obscure:obscureText ,
      suffixIcon: InkWell(
        onTap: () {
          obscureText=!obscureText;
          setState(() {

          });
        },
        child:obscureText==false?
        Icon(Icons.visibility,color: AppColors.white,):
        Icon(Icons.visibility_off,color: AppColors.white,),
      ),
      prefixIcon: Image.asset(Assets.iconsClose),
      hintText: "Password",
      validator: (value) {
        if (value!.isEmpty) {
          return "Password is required";
        }
        return null;
      },
    );
  }

  buildLoginButton() {
    return CustomElevatedButton(onPressed: (){
      formKey.currentState!.validate();
      loginCubit.login(emailController.text, passwordController.text);
    },
        child: Text("Login",style: AppTextStyle.RobotoW400_20,),);
  }

  buildTextRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Don’t Have Account ? ",
        style: AppTextStyle.semiSmallText.copyWith(color: AppColors.white,),),
        InkWell(
          onTap: (){
            Navigator.push(context, AppRoutes.registerScreen);
          },
          child: Text(" Create One",style:
          AppTextStyle.semiSmallText.copyWith(
              color: AppColors.yellow,fontWeight: FontWeight.bold)),
        )],);
  }

  buildGoogleButton() {
    return CustomElevatedButton(onPressed: (){},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image.asset(Assets.iconsGoogle,width: 26,height: 26,),
          SizedBox(width: 10,),
            Text("Login With Google",style: AppTextStyle.smallText.copyWith(color: AppColors.black,),)

          ],
        ),);
  }
}
