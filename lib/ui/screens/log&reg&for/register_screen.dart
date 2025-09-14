import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/utils/app_colors.dart';
import 'package:movies/ui/utils/app_routes.dart';
import 'package:movies/ui/utils/app_text_style.dart';
import 'package:movies/ui/widget/custom_elevated_button.dart';
import 'package:movies/ui/widget/custom_text_form_field.dart';
import '../../../di/di.dart';
import '../../../generated/assets.dart';
import '../../widget/build_show_toast.dart';
import '../cubit/register_cubit/register_cubit.dart';
import '../cubit/register_cubit/register_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool obscurePass1 = true;
  bool obscurePass2 = true;

  List<String> avatars = [
    Assets.imagesGamer1,
    Assets.imagesGamer2,
    Assets.imagesGamer3,
    Assets.imagesGamer4,
    Assets.imagesGamer5,
    Assets.imagesGamer6png,
    Assets.imagesGamer7,
    Assets.imagesGamer8,
    Assets.imagesGamer9,
  ];
  int currentPage = 0;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  RegisterCubit registerCubit = getIt();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      bloc: registerCubit,
      listener: (context, state) {
        if(state.registerApi.isLoading){
        buildShowToast("Loading",AppColors.yellow);
        }else if(state.registerApi.hasData){
          Navigator.push(context, AppRoutes.loginScreen);
        }else if(state.registerApi.isError){
          final error=state.registerApi.error.error.toString();

          buildShowToast(error,AppColors.red);
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.black,
          body: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.only(
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom),
            child: Form(
              key: globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildAppBar(),
                  buildAvatar(),
                  SizedBox(height: 8),
                  Text("Avatar", style: AppTextStyle.smallText),
                  SizedBox(height: 10),
                  buildNameTextForm(),
                  SizedBox(height: 20),
                  buildEmail(),
                  SizedBox(height: 20),
                  buildPassword(),
                  SizedBox(height: 20),
                  buildConfirmPassword(),
                  SizedBox(height: 20),
                  buildPhoneNumber(),
                  SizedBox(height: 20),
                  buildButtonCreate(),
                  SizedBox(height: 20),
                  buildTextRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.black,
      leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: AppColors.yellow)),
      title: InkWell(
          onTap: () {
            Navigator.push(context, AppRoutes.loginScreen);
          },
          child: Text("Register",
              style: AppTextStyle.smallText.copyWith(color: AppColors.yellow))),
    );
  }

  buildNameTextForm() {
    return CustomTextFormField(
        prefixIcon:
        Image.asset(Assets.iconsName2, height: 37, width: 37),
        controller: nameController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your name';
          } else {
            return null;
          }
        },
        hintText: "Name");
  }

  buildEmail() {
    return CustomTextFormField(
        prefixIcon: Image.asset(Assets.iconsVector, height: 37, width: 37),
        controller: emailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }

          final emailRegex =
          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          if (!emailRegex.hasMatch(value)) {
            return 'Please enter a valid email address';
          }

          return null;
        },
        hintText: "Email");
  }

  buildPassword() {
    return CustomTextFormField(
      obscure: obscurePass1,
      suffixIcon: InkWell(
        onTap: () {
          setState(() {
            obscurePass1 = !obscurePass1;
          });
        },
        child: obscurePass1
            ? Icon(Icons.visibility_off, color: AppColors.white)
            : Icon(Icons.visibility, color: AppColors.white),
      ),
      prefixIcon: Image.asset(Assets.iconsClose, height: 37, width: 37),
      controller: passwordController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }

        final passwordRegex = RegExp(r'^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[^A-Za-z\d])[A-Za-z\d\S]{8,}$',
        );

        if (!passwordRegex.hasMatch(value)) {
          return 'Password must be at least 8 characters\n'
              '• One uppercase letter\n'
              '• One lowercase letter\n'
              '• One number\n'
              '• One special character (@\$!%*?&)';
        }

        return null;
      },
      hintText: "Password",
    );
  }

  buildConfirmPassword() {
    return CustomTextFormField(
      obscure: obscurePass2,
      suffixIcon: InkWell(
        onTap: () {
          setState(() {
            obscurePass2 = !obscurePass2;
          });
        },
        child: obscurePass2
            ? Icon(Icons.visibility_off, color: AppColors.white)
            : Icon(Icons.visibility, color: AppColors.white),
      ),
      prefixIcon: Image.asset(Assets.iconsClose, height: 37, width: 37),
      controller: confirmPassController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        } else if (value != passwordController.text) {
          return 'Passwords do not match';
        } else {
          return null;
        }
      },
      hintText: "Confirm Password",
    );
  }

  buildPhoneNumber() {
    return CustomTextFormField(
        prefixIcon: Image.asset(Assets.iconsCall, height: 37, width: 37),
        controller: phoneController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your phone number';
          } else if (value
              .trim()
              .length != 11) {
            return 'Phone number must be 11 digits';
          } else if (int.tryParse(value.trim()) == null) {
            return 'Enter numbers only';
          } else {
            return null;
          }
        },
        hintText: "Phone Number");
  }

  buildButtonCreate() {
    return CustomElevatedButton(
      onPressed: () {
        if (globalKey.currentState!.validate()) {
          registerCubit.register(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
            phone: phoneController.text.toString(),
            avatarId: currentPage,
            confirmPassword: confirmPassController.text,
          );
        }
      },
      child: Text("Create Account", style: AppTextStyle.RobotoW400_20),
    );
  }

  buildTextRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already Have Account ?", style: AppTextStyle.semiSmallText),
        InkWell(
            onTap: () {
              Navigator.push(context, AppRoutes.loginScreen);
            },
            child: Text(" Login",
                style: AppTextStyle.semiSmallText
                    .copyWith(color: AppColors.yellow))),
      ],
    );
  }

  buildAvatar() {
    return SizedBox(
      height: 161,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 161,
          enlargeCenterPage: true,
          autoPlay: false,
          aspectRatio: 2.0,
          viewportFraction: 0.33,
          enableInfiniteScroll: true,
          onPageChanged: (index, reason) {
            setState(() {
              currentPage = index;
            });
          },
        ),
        items: avatars.map((imagePath) {
          int index = avatars.indexOf(imagePath);
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentPage = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CircleAvatar(
                    radius: currentPage == index ? 80.0 : 47.5,
                    backgroundImage: AssetImage(imagePath),
                    backgroundColor: currentPage == index
                        ? Colors.yellow.withOpacity(0.3)
                        : null,
                    child: ClipOval(
                      child: Image(
                        image: AssetImage(imagePath),
                        fit: BoxFit.contain,
                        width: currentPage == index ? 158.0 : 94.0,
                        height: currentPage == index ? 161.0 : 94.0,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}