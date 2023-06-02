import 'package:flutter/material.dart';
import 'package:tec/res/colors.dart';
import 'package:tec/screens/constants/app_text_feild.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// ignore: must_be_immutable
class ExploreScreen extends StatefulWidget {
    ExploreScreen({Key? key}) : super(key: key);

  static const aState = 0;
  static const bState = 1;
  static const cState = 2;

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List widgetsIndexList = [ExploreScreen.aState];
  int counter = ExploreScreen.aState;

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
        child: Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [

          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.teal,
            child: const Center(
              child: Text("ExploreScreen")),
          ),

          currentWidget(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: widgetsIndexList.last> widgetsIndexList.first,
                child: ElevatedButton(onPressed:() {
                  setState(() {
                    widgetsIndexList.remove(counter);
                  });
                  counter--;
              
                }, child: const Text("Back")),
              ),
              Visibility(
                visible: widgetsIndexList.last<2,
                child: ElevatedButton(onPressed: (() {
              
                  counter++;
                  setState(() {
                    widgetsIndexList.add(counter);
                  });
                  
                }), child: const Text("Next")),
              ),
            ],
          )


        ],
      ),
    ));
  }


  Widget currentWidget(){
    routeToC(){
      setState(() {
      widgetsIndexList.add(ExploreScreen.cState);

      });
    }

    Widget widget = A(onTap: routeToC,);
    switch (widgetsIndexList.last) {
      case ExploreScreen.aState:
          widget =   A(onTap: routeToC,);
        break;
      case ExploreScreen.bState:
          widget = const B();
        break;
      case ExploreScreen.cState:
          widget = const C();
        break;
      default:
    }
  return widget;
  }


}



class A extends StatelessWidget {
  void Function() onTap;
  A({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.green,
        height: 300,
        width: MediaQuery.of(context).size.width*.5,
        child: const Text("A",style: TextStyle(fontSize: 30),),
      ),
    );
  }
}

class B extends StatelessWidget {
  const B({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 300,
      width: MediaQuery.of(context).size.width*.5,
      child: const Text("B",style: TextStyle(fontSize: 30),),

    );
  }
}

class C extends StatelessWidget {
  const C({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            _searchBar(size),
            SizedBox(height: 5),
            _tagBar(size),
            SizedBox(
              height: 5,
            ),
            _gridView(size)
          ],
        ),
      ))
    );
  }

  _searchBar(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.08,
      padding: EdgeInsets.all(12),
      // color: Colors.green,
      child: Row(
        children: [
          Expanded(
            child: AppTextField(
              hintText: 'Search',
              controller: TextEditingController(),
              filled: true,
              filledColor: MyColors.textfieldFillColor,
              prefixIcon: Icons.search,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(Icons.center_focus_weak_outlined)
        ],
      ),
    );
  }

  _tagBar(Size size) {
    List _fakeHeaders = [
      'IGTV',
      'Shop',
      'Style',
      'Sports',
      'Auto',
      'Programming',
      'Study',
      'LifeStyle',
      'Coding',
      'Flutter',
      'Developer'
    ];
    return Container(
      width: size.width,
      height: size.height * 0.06,
      // color: Colors.green,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),

      child: ListView.builder(
        // padEnds: false,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: _fakeHeaders.length,
        // controller: PageController(viewportFraction: 0.2),
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Center(
                child: Text(
                  _fakeHeaders[index],
                  // maxLines: 1,
                  // overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  _gridView(Size size) {
    return Expanded(
      child: Container(
        // color: Colors.amber,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(left: 10, right: 10),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(((context, index) {
                  return Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset('assets/images/item$index.png'),
                      ),
                    ),
                  );
                }), childCount: 20),
                gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    repeatPattern: QuiltedGridRepeatPattern.same,
                    pattern: [
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(2, 2),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
