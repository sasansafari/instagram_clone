import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';

class MultiLike extends StatelessWidget {
  const MultiLike({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    List<Image> imageProfiles = [
      Assets.icons.userMultiLike1.image(width: 50, height: 50),
      Assets.icons.userMultiLike1.image(width: 50, height: 50)
    ];
    List<String> textProlfilesName = ["Hossein_110", "ali"];
    Image imagePost = Assets.icons.imagePostMultiLike.image();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: MultiLikeWidget(
        imageProfiles: imageProfiles,
        textProlfilesName: textProlfilesName,
        imagePost: imagePost,
        likeCount: 50,
      )),
    );
  }
}

class MultiLikeWidget extends StatelessWidget {
  List<Image> imageProfiles;
  List<String> textProlfilesName;
  Image imagePost;
  int likeCount;

  MultiLikeWidget(
      {Key? key,
      required this.imageProfiles,
      required this.textProlfilesName,
      required this.imagePost,
      required this.likeCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: Stack(
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: imageProfiles[0],
                      ),
                    ),
                    Positioned(
                        left: 15,
                        top: 15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: imageProfiles[1],
                        )),
                  ],
                ),
              ),
              Expanded(
                  child: SizedBox(
                width: double.infinity,
                height: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: textProlfilesName.join(","),
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          children: [
                            const TextSpan(
                                text: " and ",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black)),
                            TextSpan(
                                text: " ${likeCount.toString()} others ",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))
                          ]),
                    ),
                    RichText(
                      text: const TextSpan(
                          text: "Liked your photo ",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          children: [
                            TextSpan(
                                text: " 3h",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey)),
                          ]),
                    ),
                  ],
                ),
              )),
              SizedBox(
                width: 85,
                height: 70,
                child: imagePost,
              )
            ],
          )
        ],
      ),
    );
  }
}
