import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/network/model/response/user_data/register_response.dart';
import 'package:movies/ui/screens/cubit/get_profile_cubit/get_profi_state.dart';
import 'package:movies/ui/screens/home/profile_tab/profile.dart';
import 'package:movies/ui/utils/app_text_style.dart';
import 'package:movies/ui/widget/custom_container.dart';
import 'package:movies/ui/widget/custom_elevated_button.dart';
import '../../../../di/di.dart';
import '../../../../generated/assets.dart';
import '../../../utils/app_colors.dart';
import '../../../widget/build_show_toast.dart';
import '../../cubit/get_profile_cubit/get_profile_cubit.dart';
import '../../cubit/update_profile_cubit/update_profile_cubit.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final UpdateProfileCubit updateProfileCubit = getIt();

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
  GetProfileCubit getProfileCubit = getIt();
  UserData? profileData;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.yellow,
          ),
        ),
        title: Text(
          "Pick avatar",
          style: TextStyle(
              color: AppColors.yellow,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            BlocBuilder<GetProfileCubit, GetProfileState>(
              builder: (context, state) {
                if (state.loginApi.isLoading) {
                  return const Center(
                      child: CircularProgressIndicator(color: Colors.white));
                } else if (state.loginApi.hasData) {
                  profileData = state.loginApi.getData.data;
                  return buildProfile(profileData!);
                }
                return Container();
              },
            ),
            Spacer(),
            SizedBox(height: 20.h),
            CustomElevatedButton(
              onPressed: () {
                if (profileData != null) openBottomSheet(profileData!);
              },
              child: Text(
                "Update data",
                style: AppTextStyle.RobotoW400_20,
              ),
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }

  buildProfile(UserData profile) {
    return Column(
      children: [
        Image.asset(
          avatars[profile.avaterId],
          height: 150.h,
          width: 150.w,
          fit: BoxFit.fill,
        ),
        SizedBox(height: 20.h),
        CustomContainer(icon: Assets.iconsUser, text: profile.name),
        SizedBox(height: 20.h),
        CustomContainer(icon: Assets.iconsCall, text: profile.phone),
      ],
    );
  }


  void openBottomSheet(UserData profile) {
    int selectedAvatar = profile.avaterId;

    showModalBottomSheet(
      backgroundColor: AppColors.gray,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.5,
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: avatars.length,
                itemBuilder: (context, index) {
                  bool isSelected = index == selectedAvatar;
                  return InkWell(
                    onTap: () async {
                      setState(() {
                        selectedAvatar = index;
                      });
                      buildShowToast("Avatar updated successfully",Colors.green);

                      await updateProfileCubit.updateProfile(
                          profile.email, selectedAvatar);
                      getProfileCubit.updataAvatar(selectedAvatar);
                      await getProfileCubit.getProfile();



                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => Profile())).then((value) {
                            getProfileCubit.getProfile();
                          },);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.yellow : Colors.transparent,
                        border: Border.all(
                          color: AppColors.yellow,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Image.asset(
                          avatars[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}