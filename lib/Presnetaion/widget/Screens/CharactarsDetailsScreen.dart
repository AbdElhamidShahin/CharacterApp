import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/business_logic/cubit/state/bloc/cubit.dart';
import 'package:project_bloc/business_logic/cubit/state/bloc/state.dart';
import 'package:project_bloc/constance/my-colors.dart';
import 'package:project_bloc/data/models/repostry/api/Carcters.dart';

import 'DesplayCararcterRendomEmpty.dart';
import 'buildSliverAppBar.dart';

class CharactarsDetailsScreen extends StatelessWidget {
  final Caracter caracter;
  CharactarsDetailsScreen({super.key, required this.caracter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors.myGray,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(caracter),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    characterInfo("Name : ", "${caracter.name}"),
                    buildDivider(320),

                    characterInfo("Status : ", "${caracter.status}"),
                    buildDivider(310),

                    characterInfo(
                      "Location : ",
                      "${caracter.location?['name']}",
                    ),
                    buildDivider(295),

                    characterInfo("Species : ", "${caracter.species}"),
                    buildDivider(300),

                    characterInfo("Episodes : ", "${caracter.episode?.length}"),
                    buildDivider(290),

                    characterInfo('Actor/Actress : ', "${caracter.name}"),
                    buildDivider(255),
                  ],
                ),
              ),
              SizedBox(height: 100),

              BlocBuilder<CaractersCubit, CaractersState>(
                builder: (context, state) {
                  return DesplayCararcterRendomEmpty(caracter);
                },
              ),
              SizedBox(height: 500),
            ]),
          ),
        ],
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: myColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: myColors.myWhite, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      endIndent: endIndent,

      color: myColors.myYello,

      height: 30,
      thickness: 3,
    );
  }
}
