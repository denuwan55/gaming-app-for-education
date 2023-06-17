import 'package:flutter/material.dart';
import 'package:quiz_app/Puzzle/Presentation/Flutter%20%20Pluzzle/pluzzle_page.dart';
import 'package:quiz_app/Puzzle/Presentation/Home%20Page/Widgets/custome_text.dart';
import 'package:quiz_app/Puzzle/puzzle_main.dart';

class AssetImageSection extends StatelessWidget {
  const AssetImageSection({
    Key? key,
    required this.images,
    required this.title,
  }) : super(key: key);

  final List images;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: 210,
      child: Center(
        child: SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              for (var image in images)
                InkWell(
                  onTap: () {
                    pageNavigation(
                      context,
                      PluzzlePage(
                        imageWidget: image,
                        heroTage: image.toString(),
                      ),
                    );
                  },
                  child: Container(
                    height: 150,
                    width: 70,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Hero(
                      tag: image.toString(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: image,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
