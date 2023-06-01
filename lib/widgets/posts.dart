import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../res/colors.dart';

class Posts extends StatefulWidget {
  final List<String> imagesUrl;
  const Posts({
    required this.imagesUrl,
    Key? key,
  }) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  int _selectedPost = 0;

  @override
  Widget build(BuildContext context) {
    final int _postsLength = widget.imagesUrl.length;
    final Size _deviceSize = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          width: _deviceSize.width,
          height: _deviceSize.width,
          child: Stack(
            children: [
              if (widget.imagesUrl.isNotEmpty)
                PageView.builder(
                  itemCount: _postsLength,
                  itemBuilder: (context, index) {
                    return Image.asset(widget.imagesUrl[index]);
                  },
                  onPageChanged: (value) {
                    setState(() {
                      _selectedPost = value;
                    });
                  },
                ),
              if (widget.imagesUrl.isEmpty)
                Container(
                  width: _deviceSize.width,
                  height: _deviceSize.width,
                  color: Colors.grey.withOpacity(.4),
                  child: const Center(
                    child: Icon(
                      Icons.hide_image_outlined,
                      size: 70,
                      color: Colors.grey,
                    ),
                  ),
                ),
              if (_postsLength > 1)
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    height: 26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: MyColors.postsCounter,
                    ),
                    child: Center(
                      child: Text(
                        '${_selectedPost + 1}/$_postsLength',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          height: 48,
          child: Stack(
            children: [
              if (_postsLength > 1)
                Positioned(
                  top: 21,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    height: 6,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 4),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: _postsLength,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: index == _selectedPost
                                ? MyColors.selectedPostPointer
                                : MyColors.disablePostPointer,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              Positioned(
                top: 13.5,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/like.svg',
                              height: 21,
                              width: 24,
                            ),
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/comment.svg',
                              height: 23,
                              width: 22,
                            ),
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/messenger.svg',
                              height: 20,
                              width: 23,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/icons/save.svg',
                          height: 24,
                          width: 21,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
