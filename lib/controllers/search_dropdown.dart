import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/items_data_fetch_provider.dart';

class SearchableDropdown extends StatefulWidget {
  const SearchableDropdown({Key? key}) : super(key: key);

  @override
  _SearchableDropdownState createState() => _SearchableDropdownState();
}

class _SearchableDropdownState extends State<SearchableDropdown> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<ItemsDataProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                'Select Category',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: dataProvider.category
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ))
                  .toList(),
              value: dataProvider.selectedCategory,
              onChanged: (value) {
                setState(() {
                  dataProvider.selectedCategory = value;
                });
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                height: 57.0,
                width: 400.0,
              ),
              dropdownStyleData: const DropdownStyleData(
                maxHeight: 200.0,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40.0,
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: _searchController,
                searchInnerWidgetHeight: 50.0,
                searchInnerWidget: Container(
                  height: 57.0,
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 4.0,
                    right: 8.0,
                    left: 8.0,
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: _searchController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 8.0,
                      ),
                      hintText: 'Search for Category...',
                      hintStyle: const TextStyle(fontSize: 12.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return item.value.toString().contains(searchValue);
                },
              ),
              //This to clear the search value when you close the menu
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  _searchController.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
