import 'package:flutter/material.dart';
import 'package:project_bloc/constance/my-colors.dart';
import 'package:project_bloc/data/models/repostry/api/Carcters.dart';

import '../../../constance/Strings.dart';

class CarctersItem extends StatelessWidget {
  CarctersItem({super.key, required this.allCaracters});
  final Caracter allCaracters;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 10),

      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            caractersDetailsScreen,
            arguments: allCaracters,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: myColors.myWhite,

            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Stack(
              children: [
                Container(
                  child:
                      (allCaracters.image != null &&
                          allCaracters.image!.isNotEmpty)
                      ? FadeInImage.assetNetwork(
                          placeholder: "assets/image/Loading.gif",
                          image: allCaracters.image!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        )
                      : Image.asset(
                          "assets/image/images (1).jpg",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                ),

                Positioned(
                  bottom: 0, // يخليه تحت
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    color: Colors.black.withOpacity(.5),
                    child: Text(
                      '${allCaracters.name}',
                      style: TextStyle(
                        color: myColors.myWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
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
}
