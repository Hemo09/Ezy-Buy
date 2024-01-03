import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ezy_buy/core/helper/widgets/default_text_form.dart';
import 'package:ezy_buy/features/search_page/presentaion/views/widgets/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../home_page/data/models/product_model.dart';
import '../../../../home_page/presenation/view_model/product_provider.dart';

class SearchPageBody extends StatefulWidget {
  const SearchPageBody({
    super.key,
    this.category,
  });
  final String? category;

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

  List<ProductModel> searchList = [];

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final List<ProductModel> productsCategory = widget.category == null
        ? productProvider.getProduct
        : productProvider.findByCategory(widget.category!);

    return productsCategory.isEmpty
        ? const Center(
            child: Text("No product found"),
          )
        : StreamBuilder<List<ProductModel>>(
            stream: productProvider.fetchProductsStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                  ),
                );
              } else if (snapshot.data == null) {
                return const Center(
                  child: Text(
                    "No product has been added",
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    DefaultTextForm(
                      type: TextInputType.text,
                      hint: "search",
                      controller: searchController,
                      submit: (value) {
                        setState(() {
                          searchList = productProvider.searchQuery(
                              ctgList: productsCategory,
                              searchValue: searchController.text);
                        });
                      },
                      change: (value) {
                        setState(() {
                          searchList = productProvider.searchQuery(
                              ctgList: productsCategory,
                              searchValue: searchController.text);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (searchController.text.isNotEmpty &&
                        searchList.isEmpty) ...[
                      const Center(
                        child: Text(
                          "No Resutl Found",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                    Expanded(
                      child: DynamicHeightGridView(
                        physics: const BouncingScrollPhysics(),
                        builder: (context, index) {
                          return Center(
                            child: GridViewItem(
                                productId: searchController.text.isNotEmpty
                                    ? searchList[index].productId
                                    : productsCategory[index].productId),
                          );
                        },
                        itemCount: searchController.text.isNotEmpty
                            ? searchList.length
                            : productsCategory.length,
                        crossAxisCount: 2,
                      ),
                    ),
                  ],
                ),
              );
            });
  }
}
