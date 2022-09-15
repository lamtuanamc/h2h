import 'package:example_hack2hire/res/colors.dart';
import 'package:example_hack2hire/res/gaps.dart';
import 'package:example_hack2hire/res/size.dart';
import 'package:flutter/material.dart';

class ShowCard extends StatelessWidget {
  const ShowCard(
      {Key? key,
      required this.urlImage,
      required this.name,
      required this.startDate,
      required this.onTap})
      : super(key: key);
  final String urlImage;
  final String name;
  final String startDate;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: AppColors.gray6, width: 0.2))),
        padding: const EdgeInsets.only(top: 26, bottom: 26),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              urlImage,
              height: 75,
            ),
          ),
          AppGaps.hGap12,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: AppSize.fontSp18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                AppGaps.vGap8,
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white, width: 0.1)),
                  child: Text(
                    startDate,
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
