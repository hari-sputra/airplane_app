
import 'package:air_plane/cubit/auth_cubit.dart';
import 'package:air_plane/cubit/destinations_cubit.dart';
import 'package:air_plane/shared/theme.dart';
import 'package:air_plane/ui/widgets/custom_card_popular_destination.dart';
import 'package:air_plane/ui/widgets/custom_list_tile_new_destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/destinations_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationsCubit>().fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // header
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Howdy,\n${state.user.name}",
                          style: blackTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Where to fly today?",
                          style: greyTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/profile',
                          arguments: state.user.id);
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        "assets/images/image_profile.png",
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    // Note: Popular Destination
    Widget popularDestination(List<DestinationsModel> destinations) {
      return SizedBox(
        height: 343,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              children: destinations.map((DestinationsModel destinations) {
                return CustomCardPopularDestination(destinations);
              }).toList(),
            ),
          ],
        ),
      );
    }

    // Note: New Destination
    Widget newDestination(List<DestinationsModel> destinations) {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          right: defaultMargin,
          left: defaultMargin,
          bottom: 96,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New This Year",
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 16),
            Column(
              children: destinations.map((DestinationsModel destinations) {
                return CustomListTileNewDestination(destinations);
              }).toList(),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBgColor,
      body: BlocConsumer<DestinationsCubit, DestinationsState>(
        listener: (context, state) {
          if (state is DestinationsFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kPinkColor,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is DestinationsSuccess) {
            return SafeArea(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(),
                    popularDestination(state.destinations),
                    newDestination(state.destinations),
                  ],
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
