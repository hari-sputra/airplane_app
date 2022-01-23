import 'dart:io';

import 'package:air_plane/cubit/auth_cubit.dart';
import 'package:air_plane/shared/theme.dart';
import 'package:air_plane/ui/widgets/custom_button.dart';
import 'package:air_plane/ui/widgets/textformfield_profile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController hobbyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // take photo
    void takePhoto(ImageSource source) async {
      final pickedFile = await _picker.pickImage(source: source);

      setState(() {
        _imageFile = pickedFile;
      });
    }

    // Note: Bottom sheet
    Widget bottomSheetPhoto() {
      return Container(
        height: 120,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Text(
              "Choose Profile Photo",
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    takePhoto(ImageSource.camera);
                  },
                  child: SizedBox(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.camera,
                          size: 32,
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Camera",
                          style: blackTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    takePhoto(ImageSource.gallery);
                  },
                  child: SizedBox(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.image,
                          size: 32,
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Gallery",
                          style: blackTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    // Note: Circle avatar
    Widget circleAvatar() {
      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            context: context,
            builder: ((builder) => bottomSheetPhoto()),
          );
        },
        child: Container(
          margin: EdgeInsets.only(top: 40, bottom: 40),
          child: Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: _imageFile == null
                  ? AssetImage("assets/images/image_profile.png")
                  : FileImage(File(_imageFile!.path)) as ImageProvider,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: kPrimaryColor,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    // Note: email, name, hobby
    Widget textFormFieldProfile() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            emailController.text = state.user.email;
            nameController.text = state.user.name;
            hobbyController.text = state.user.hobby;
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: defaultMargin,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                color: kWhiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormFieldProfile(
                    title: "Email",
                    hintText: "Email",
                    readOnly: true,
                    margin: EdgeInsets.only(bottom: 20),
                    controller: emailController,
                  ),
                  TextFormFieldProfile(
                    title: "Full Name",
                    hintText: "Full Name",
                    textInputType: TextInputType.name,
                    margin: EdgeInsets.only(bottom: 20),
                    controller: nameController,
                  ),
                  TextFormFieldProfile(
                    title: "Hobby",
                    hintText: "Hobby",
                    margin: EdgeInsets.only(bottom: 10),
                    controller: hobbyController,
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Reset Password?",
                        style: purpleTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      );
    }

    Widget updateButton() {
      return Center(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kPrimaryColor,
                  content: Text("Update data successfully!"),
                ),
              );
            } else if (state is AuthFailed) {
              print(state.error);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kPinkColor,
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomButton(
              title: "Update",
              width: 220,
              onPressed: () {
                // context.read<AuthCubit>().updateCurrentUser(
                //       nameController.text,
                //       emailController.text,
                //       hobbyController.text,
                //     );
              },
            );
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBgColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              circleAvatar(),
              textFormFieldProfile(),
              updateButton(),
            ],
          ),
        ),
      ),
    );
  }
}
