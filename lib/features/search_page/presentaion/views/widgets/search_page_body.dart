import 'package:ezy_buy/features/search_page/presentaion/views/widgets/grid_view_search_items.dart';
import 'package:ezy_buy/features/search_page/presentaion/views/widgets/text_field_search.dart';
import 'package:flutter/material.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 10,
        ),
        TextFieldSearch(),
        SizedBox(
          height: 20,
        ),
        Expanded(child: GridViewSearchItems()),
      ],
    );
  }
}
