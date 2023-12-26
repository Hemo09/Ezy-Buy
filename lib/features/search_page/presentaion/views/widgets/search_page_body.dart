import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class SearchPageBody extends StatefulWidget {
  const SearchPageBody({super.key});

  @override
  State<SearchPageBody> createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends State<SearchPageBody> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              filled: true,
              prefixIcon: const Icon(IconlyLight.search),
              suffixIcon: InkWell(
                  onTap: () {
                    searchController.clear();
                    FocusScope.of(context).unfocus();
                  },
                  child: const Icon(
                    Icons.clear,
                    color: Colors.red,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
