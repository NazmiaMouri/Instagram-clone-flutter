import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppbar({super.key});
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchField = TextEditingController();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
            controller: searchField,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(9),
              filled: true,
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              fillColor: Colors.grey[300],
              prefixIcon: Icon(
                Icons.search_outlined,
              ),
            )),
      ),
    );
  }
}
