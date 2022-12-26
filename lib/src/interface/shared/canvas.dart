import 'package:awesonestyle/awesonestyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Canvas extends StatelessWidget {
  final String image;
  final int votePlus;
  final void Function()? onTapVotePlus;
  final int voteNegative;
  final void Function()? onTapVoteNegative;
  final bool delete;
  final void Function()? onDelete;

  const Canvas(
      {required this.image,
      required this.votePlus,
      this.onTapVotePlus,
      required this.voteNegative,
      this.onTapVoteNegative,
      this.delete = false,
      this.onDelete,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AwsAniWidget(
      animation: AwsAnimationDo.zoomIn,
      child: Container(
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          padding: const EdgeInsets.all(0),
          height: AwsScreenSize.height(70),
          width: AwsScreenSize.width(90),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(114, 162, 240, 94),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: AwsScreenSize.height(60),
                margin: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                      return child;
                    },
                    loadingBuilder: ((context, child, loadingProgress) {
                      if (loadingProgress != null) {
                        return Image.asset(
                          'assets/loading.gif',
                          fit: BoxFit.cover,
                        );
                      }
                      return child;
                    }),
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/errorImage.gif',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(114, 162, 240, 94),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black.withOpacity(.2)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CupertinoButton(
                            padding: const EdgeInsets.only(right: 0, left: 5),
                            onPressed: onTapVotePlus,
                            child: Row(
                              children: [
                                Text(
                                  votePlus.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(width: 2),
                                const Icon(
                                  Icons.mood,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          CupertinoButton(
                            padding: const EdgeInsets.only(left: 2),
                            onPressed: onTapVoteNegative,
                            child: Row(
                              children: [
                                Text(
                                  voteNegative.toString(),
                                  style: const TextStyle(color: Colors.red),
                                ),
                                const SizedBox(width: 2),
                                const Icon(
                                  Icons.mood_bad,
                                  color: Colors.red,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (delete) ...[
                      CupertinoButton(
                          onPressed: () => onDelete?.call(),
                          child: const Icon(
                            FontAwesomeIcons.xmark,
                            color: Colors.white,
                          )),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
