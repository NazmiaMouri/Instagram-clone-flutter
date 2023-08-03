import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                controller: searchField,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(9),
                  filled: true,
                  enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  fillColor: Colors.grey[300],
                  prefixIcon: Icon(
                    Icons.search_outlined,
                  ),
                )),
          ),
        
          GridView.custom(
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
              (context, index) => Container(),
            ),
          )
        ],
      ),
    );
  }
}
