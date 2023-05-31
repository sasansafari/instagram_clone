import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tec/route/names.dart';
import 'package:tec/screens/mainscreen/post_screen.dart';
import '../../custom_widgets/Story_list.dart';
import '../../gen/assets.gen.dart';
import '../../models/stories_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stories = StoriesDatabase.stories;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.8,
          
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              StoryList(stories: stories),
              const Divider(
                color: Colors.black38,
              ),
              
            
            ],
          ),
        ),
      ),
    );
  }
}



// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("home - 0 stack",style: TextStyle( fontSize: 28),),

//             ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const PostScreen())), child: Text("next"))
//           ],
//         ),
//       ),
//     ));
//   }
// }