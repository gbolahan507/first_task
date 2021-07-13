import 'package:flutter/material.dart';
import 'package:task/core/model/country_model.dart';
import 'package:task/ui/container/empty.dart';
import 'package:task/ui/container/location.dart';
import 'package:task/widgets/custom_icon.dart';
import 'package:task/widgets/export.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchcontroller = new TextEditingController();

  bool _isSearching;
  String _searchText = "";
  List searchresult = new List();
  int press = 0;

  int _tab = 0;

  _HomeScreenState() {
    _searchcontroller.addListener(() {
      if (_searchcontroller.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _searchcontroller.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.colorWhite,
        appBar: AppBar(
          backgroundColor: Styles.colorWhite,
          toolbarHeight: 120,
          leadingWidth: 0.0,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                    child: CustomTextField(
                  height: 40,
                  maxLines: 1,
                  obscure: false,
                  controller: _searchcontroller,
                  onChanged: searchOperation,
                  image: InkWell(
                    onTap: () => _searchcontroller.clear(),
                    child: CustomIcon(
                      icon: Icons.cancel,
                      color: Styles.colorGrey,
                    ),
                  ),
                  prefixIcon: CustomIcon(
                    icon: Icons.search,
                    color: Styles.colorGrey,
                  ),
                  hintText: 'Search',
                )),
              ),
              horizontalSpaceSmall,
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Styles.colorGrey),
                    borderRadius: BorderRadius.circular(8)),
                child: CustomIcon(
                    color: Styles.red, icon: Icons.filter_alt_outlined),
              )
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Styles.colorGreyLight),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _tab = 0;
                          });
                        },
                        child: Container(
                          height: 40,
                          decoration: _tab == 0
                              ? BoxDecoration(
                                  border: Border.all(color: Styles.colorGrey),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Styles.colorWhite)
                              : null,
                          child: Align(
                            alignment: Alignment.center,
                            child: CustomText(
                              'Startup',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: _tab == 0 ? Colors.cyan : Styles.colorGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _tab = 1;
                          });
                        },
                        child: Container(
                          height: 40,
                          decoration: _tab == 1
                              ? BoxDecoration(
                                  border: Border.all(color: Styles.colorGrey),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Styles.colorWhite)
                              : null,
                          child: Align(
                            alignment: Alignment.center,
                            child: CustomText(
                              'Tags',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: _tab == 1 ? Colors.cyan : Styles.colorGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: _tab == 0
            ? _searchcontroller.text.isEmpty
                ? Empty()
                : Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: new ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: searchresult.length,
                      itemBuilder: (BuildContext context, int index) {
                        Country listData = searchresult[index];
                        return new Location(
                          country: listData,
                          countryName: listData.countryName,
                          stateName: listData.stateName,
                        );
                      },
                    ),
                  )
            : Padding(
                padding: const EdgeInsets.only(top: 20),
                child: new ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: country.length,
                  itemBuilder: (BuildContext context, int index) {
                    Country listData = country[index];
                    return new Location(
                      country: listData,
                      countryName: listData.countryName,
                      stateName: listData.stateName,
                    );
                  },
                ),
              ));
  }

  void searchOperation(String searchText) {
    searchresult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < country.length; i++) {
        Country data = country[i];
        if (data.countryName.toLowerCase().contains(searchText.toLowerCase())) {
          searchresult.add(data);
        }
      }
    }
  }
}


