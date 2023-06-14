import 'package:flutter/material.dart';

class CustomWidget extends StatefulWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  bool _showFirstWidget = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 3),
              child: Profile_Wiget(),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 50),
              child: Username_widget(),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _showFirstWidget = !_showFirstWidget;
                });
              },
              child: _showFirstWidget
                  ? const Blue_Follow_Widget()
                  : const Following_widget(),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class Profile_Wiget extends StatelessWidget {
  Profile_Wiget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 30,
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class Blue_Follow_Widget extends StatelessWidget {
  const Blue_Follow_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 28,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.only(left: 20, top: 5),
      child: Text(
        'Follow',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class Username_widget extends StatelessWidget {
  const Username_widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          maxLines: 2,
          overflow:
              TextOverflow.ellipsis, // TextOverflow.clip // TextOverflow.fade
          text: TextSpan(
            text: 'a.mohamad_am ',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(text: '''Started
following you.''', style: TextStyle(fontWeight: FontWeight.normal)),
              TextSpan(
                  text: ' now', style: TextStyle(fontWeight: FontWeight.w200)),
            ],
          ),
        )
      ],
    );
  }
}

// ignore: camel_case_types
class Following_widget extends StatelessWidget {
  const Following_widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 90,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 0.2,
            ),
          ),
          padding: EdgeInsets.only(left: 10, top: 5),
          child: Text(
            'Following',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
