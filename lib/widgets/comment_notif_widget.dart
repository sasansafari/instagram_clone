import 'package:flutter/material.dart';

class CommentNotifWidget extends StatefulWidget {
  CommentNotifWidget(
      {required this.commentedUserImg,
        required this.commentedUserUsername,
        required this.userUsername,
        required this.imageUrl,
        required this.commentedUserStory,
        required this.commentTime,
        required this.commentText,
        required this.commentLiked,
        Key? key})
      : super(key: key);

  String commentedUserImg;
  String commentedUserUsername;

  // mentioned user username
  String userUsername;
  String imageUrl;
  bool commentedUserStory = false;
  int commentTime;
  String commentText;
  bool commentLiked = false;

  @override
  State<CommentNotifWidget> createState() => _CommentNotifWidgetState();
}

class _CommentNotifWidgetState extends State<CommentNotifWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      width: MediaQuery.of(context).size.width,
      height: 90,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                // the user that commented image
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      if (widget.commentedUserStory == true) {
                        // show story
                      } else {
                        // Navigate to user profile Screen
                      }
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: widget.commentedUserStory == true
                                ? const LinearGradient(
                              colors: [
                                Color(0xffa60f93),
                                Color(0xffd91a46),
                                Color(0xfffbaa47),
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            )
                                : null,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.white),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: Image.network(
                                widget.commentedUserImg,
                                fit: BoxFit.cover,
                                width: 44,
                                height: 44,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 6,
                  child: SizedBox(
                    child: RichText(
                      maxLines: 2,
                      // softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                        children: [
                          TextSpan(
                            // commentedUserUsername
                            text: '${widget.commentedUserUsername} ',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const TextSpan(
                            text: 'mentioned you in comment: ',
                            style: TextStyle(color: Colors.black),
                          ),
                          // userUsername
                          TextSpan(
                            text: '${widget.userUsername} ',
                            style: const TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(
                            text: widget.commentText,
                            style: const TextStyle(
                              color: Colors.black,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  '\n${widget.commentTime}\d',
                  style: const TextStyle(color: Colors.grey),
                ),
                const Spacer(),
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    height: 44,
                    width: 44,
                    // imageUrl
                    child: Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: SizedBox(
              height: 30,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.commentLiked = !widget.commentLiked;
                      });
                    },
                    child: Icon(
                      widget.commentLiked
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: widget.commentLiked ? Colors.red : Colors.grey,
                      size: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Reply',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




