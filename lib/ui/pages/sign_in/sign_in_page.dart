import 'package:air_plane/cubit/auth_cubit.dart';
import 'package:air_plane/shared/theme.dart';
import 'package:air_plane/ui/widgets/custom_button.dart';
import 'package:air_plane/ui/widgets/custom_textformfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');

// NOTE: title
  Widget title() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Text(
        "Sign in with your \nexisting account",
        style: blackTextStyle.copyWith(
          fontWeight: semiBold,
          fontSize: 24,
        ),
      ),
    );
  }

  // NOTE: input section
  Widget inputSection(BuildContext context) {
    // email
    Widget email() {
      return CustomTextFormField(
        textInputType: TextInputType.emailAddress,
        controller: _emailController,
        title: "Email Address",
        hintText: "Fill your email Address",
        margin: EdgeInsets.only(bottom: 20),
      );
    }

    // password
    Widget password() {
      return CustomTextFormField(
        controller: _passwordController,
        title: "Password",
        hintText: "Fill your password",
        margin: EdgeInsets.only(bottom: 20),
        obscureText: true,
      );
    }

    Widget getStartedButton() {
      return Center(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kPrimaryColor,
                  content: Text("login successfully!"),
                ),
              );
              Navigator.pushNamedAndRemoveUntil(
                  context, "/main", (route) => false);
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
              title: "Sign In",
              onPressed: () {
                context.read<AuthCubit>().signIn(
                      email: _emailController.text,
                      password: _passwordController.text,
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
          email(),
          password(),
          getStartedButton(),
        ],
      ),
    );
  }

  Widget signUp() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        top: 20,
        bottom: 73,
      ),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, "/signup");
        },
        child: Text(
          "Don't have an account? Sign Up",
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
                signUp(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
