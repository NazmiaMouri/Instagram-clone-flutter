import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone_flutter/screens/home/search/search_appBar.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late ScrollController gridViewController;
  bool _showAppBar = true;

  @override
  void initState() {
    super.initState();
    gridViewController = ScrollController();

    // Listen to scroll events and update the visibility of the app bar
    gridViewController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (gridViewController.position.userScrollDirection == ScrollDirection.reverse) {
      if (_showAppBar) {
        setState(() {
          _showAppBar = false;
        });
      }
    } else {
      if (!_showAppBar) {
        setState(() {
          _showAppBar = true;
        });
      }
    }
  }

  @override
  void dispose() {
    gridViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _showAppBar ? SearchAppbar() : null,
        extendBody: true,
        body: GridView.custom(
          controller: gridViewController,
          shrinkWrap: true,
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 2,
            repeatPattern: QuiltedGridRepeatPattern.inverted,
            pattern: [
              QuiltedGridTile(2, 2),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 2),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => Container(
              width: 100,
              height: 100,
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
}
