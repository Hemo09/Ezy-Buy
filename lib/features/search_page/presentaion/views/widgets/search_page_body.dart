import 'package:ezy_buy/features/search_page/presentaion/views/widgets/grid_view_search_items.dart';
import 'package:ezy_buy/features/search_page/presentaion/views/widgets/text_field_search.dart';
import 'package:flutter/material.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key, this.category});
  final String? category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const TextFieldSearch(),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            child: GridViewSearchItems(
          category: category,
        )),
      ],
    );
  }
}
