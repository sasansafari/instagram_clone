import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tec/extensions/space_xy_extension.dart';
import 'package:tec/res/colors.dart';
import 'package:tec/widgets/app_text_feild.dart';

// ignore: must_be_immutable
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              _searchBar(size),
              5.0.spaceY,
              _tagBar(size),
              5.0.spaceY,
              _gridView(size)
            ],
          ),
        ),
      ),
    );
  }

  _searchBar(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.08,
      padding: const EdgeInsets.all(12),
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
          5.0.spaceX,
          const Icon(Icons.center_focus_weak_outlined)
        ],
      ),
    );
  }

  _tagBar(Size size) {
    List fakeHeaders = [
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),

      child: ListView.builder(
        // padEnds: false,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: fakeHeaders.length,
        // controller: PageController(viewportFraction: 0.2),
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Center(
                child: Text(
                  fakeHeaders[index],
                  // maxLines: 1,
                  // overflow: TextOverflow.visible,
                  style: const TextStyle(
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
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                ((context, index) {
                  return ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(0)),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('assets/images/item$index.png'),
                    ),
                  );
                }),
                childCount: 20,
              ),
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                repeatPattern: QuiltedGridRepeatPattern.same,
                pattern: [
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(2, 2),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 1),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
