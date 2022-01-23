import 'package:air_plane/cubit/auth_cubit.dart';
import 'package:air_plane/shared/theme.dart';
import 'package:air_plane/ui/widgets/custom_button.dart';
import 'package:air_plane/ui/widgets/custom_textformfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController(text: '');
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');
  final TextEditingController _hobbyController =
      TextEditingController(text: '');

// NOTE: title
  Widget title() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Text(
        "Join us and get\nyour next journey",
        style: blackTextStyle.copyWith(
          fontWeight: semiBold,
          fontSize: 24,
        ),
      ),
    );
  }

  // NOTE: input section
  Widget inputSection(BuildContext context) {
// full name
    Widget fullName() {
      return CustomTextFormField(
        textInputType: TextInputType.name,
        controller: _nameController,
        title: "Full Name",
        hintText: "Fill your full name",
        margin: EdgeInsets.only(bottom: 20),
      );
      ;
    }

    // email
    Widget email() {
      return CustomTextFormField(
        controller: _emailController,
        textInputType: TextInputType.emailAddress,
        title: "Email Address",
        hintText: "Fill your email Address",
        margin: EdgeInsets.only(bottom: 20),
      );
      ;
    }

    Widget password() {
      return CustomTextFormField(
        controller: _passwordController,
        title: "Password",
        hintText: "Fill your password",
        margin: EdgeInsets.only(bottom: 20),
        obscureText: true,
      );
    }

    Widget hobby() {
      return CustomTextFormField(
        controller: _hobbyController,
        title: "Hobby",
        hintText: "Fill your hobby",
        margin: EdgeInsets.only(bottom: 30),
      );
      ;
    }

    Widget getStartedButton() {
      return Center(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kPrimaryColor,
                  content: Text("successful registration!"),
                ),
              );
              Navigator.pushNamedAndRemoveUntil(
                  context, "/bonus", (route) => false);
            } else if (state is AuthFailed) {
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
              title: "Sign Up ",
              onPressed: () {
                context.read<AuthCubit>().signUp(
                      name: _nameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                      hobby: _hobbyController.text,
                    );
              },
            );
          },
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius),
        color: kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          fullName(),
          email(),
          password(),
          hobby(),
          getStartedButton(),
        ],
      ),
    );
  }

  Widget signIn() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        top: 20,
        bottom: 73,
      ),
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          "Have an account? Sign In",
          style: greyTextStyle.copyWith(
            fontWeight: light,
            fontSize: 16,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title(),
                inputSection(context),
                signIn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
