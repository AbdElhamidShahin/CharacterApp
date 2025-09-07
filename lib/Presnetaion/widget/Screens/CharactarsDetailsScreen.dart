import 'package:flutter/material.dart';
import 'package:project_bloc/constance/my-colors.dart';
import 'package:project_bloc/data/models/repostry/api/Carcters.dart';

class CharactarsDetailsScreen extends StatelessWidget {
  final Caracter caracter;
  CharactarsDetailsScreen({super.key, required this.caracter});
  Widget buildSelverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: myColors.myGray,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          "${caracter.name}",
          style: TextStyle(color: myColors.myGray),
        ),
        background: Hero(
          tag: "${caracter.id}",
          child: Image.network("${caracter.image}", fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget CharacterInfo(String title, String value) {
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

  Widget BuildDivider(double endIndent) {
    return Divider(
      endIndent: endIndent,

      color: myColors.myYello,

      height: 30,
      thickness: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors.myGray,
      body: CustomScrollView(
        slivers: [
          buildSelverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    CharacterInfo("Name : ", "${caracter.name}"),
                    BuildDivider(320),

                    CharacterInfo("Status : ", "${caracter.status}"),
                    BuildDivider(310),

                    CharacterInfo(
                      "Location : ",
                      "${caracter.location?['name']}",
                    ),
                    BuildDivider(295),

                    CharacterInfo("Species : ", "${caracter.species}"),
                    BuildDivider(300),

                    CharacterInfo("Episodes : ", "${caracter.episode?.length}"),
                    BuildDivider(290),
                    SizedBox(
                      height: 300,
                    )
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
