

import 'package:air_plane/cubit/auth_cubit.dart';
import 'package:air_plane/cubit/destinations_cubit.dart';
import 'package:air_plane/cubit/page_cubit.dart';
import 'package:air_plane/cubit/seat_cubit.dart';
import 'package:air_plane/cubit/transaction_cubit.dart';
import 'package:air_plane/ui/pages/bonus_saldo/bonus_saldo_page.dart';
import 'package:air_plane/ui/pages/checkout/succes_checkout._page.dart';
import 'package:air_plane/ui/pages/get_started/get_started_page.dart';
import 'package:air_plane/ui/pages/home/home_page.dart';
import 'package:air_plane/ui/pages/main/main_page.dart';
import 'package:air_plane/ui/pages/profile/profile_page.dart';
import 'package:air_plane/ui/pages/sign_in/sign_in_page.dart';
import 'package:air_plane/ui/pages/sign_up/sign_up_page.dart';
import 'package:air_plane/ui/pages/splash_screen/splash_screen_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationsCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreenPage(),
          '/get-started': (context) => GetStartedPage(),
          '/signup': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => BonusSaldoPage(),
          '/main': (context) => MainPage(),
          '/home': (context) => HomePage(),
          '/success-checkout': (context) => SuccesCheckoutPage(),
          '/profile': (context) => ProfilePage(),
        },
      ),
    );
  }
}
