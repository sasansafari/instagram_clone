import 'package:flutter/material.dart';

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
    return Container(
      color: Colors.yellow,
      height: 300,
      width: MediaQuery.of(context).size.width*.5,
      child: const Text("C",style: TextStyle(fontSize: 30),),
    );
  }
}