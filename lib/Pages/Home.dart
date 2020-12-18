import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pin_finder/Components/DesignComponents.dart';
import 'package:pin_finder/HelperPages/CustomMessages.dart';
import 'package:pin_finder/Models/searchPinModel.dart';
import 'package:pin_finder/Services/searchPinApi.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  Future getAllPostalData;
  String searchVal = '';
  Future<AllOffices> getPostalData() async {
    String resString = await getLocationList(searchController.text);
    switch (resString) {
      case ErrorMessage.invReq:
        return null;
        break;
      case ErrorMessage.servError:
        return null;
        break;
      default:
        var convString = json.decode(resString)[0];
        AllOffices postalList = AllOffices.fromJson(convString['PostOffice']);
        return postalList;
    }
  }

  void searchPin() {
    if (searchController.text.length == 6)
      setState(() {
        searchVal = searchController.text;
      });
    else
      setState(() {
        searchVal = '';
      });
  }

  @override
  void initState() {
    super.initState();
    searchController.text = '';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 60),
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              child: Column(
                children: [
                  searchVal != ""
                      ? FutureBuilder(
                          future: getPostalData(),
                          builder: (ctxt, snap) {
                            switch (snap.connectionState) {
                              case ConnectionState.waiting:
                                return Center(
                                    child: CircularProgressIndicator());
                              default:
                                if (snap.hasError)
                                  return Center(
                                      child: Text('Error: ${snap.error}'));
                                else if (snap.data == null) {
                                  return Center(
                                      child: Text('Error: No Data Available'));
                                } else {
                                  var item = snap.data.officeList;
                                  return ListView.separated(
                                    physics: ScrollPhysics(),
                                    shrinkWrap: true,
                                    separatorBuilder: (_, j) => Divider(
                                      height: 1.0,
                                      color: Colors.black,
                                    ),
                                    itemCount: item.length,
                                    itemBuilder: (ctxt, i) {
                                      return Container(
                                        height: 40,
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(item[i].name),
                                        ),
                                      );
                                    },
                                  );
                                }
                            }
                          },
                        )
                      : Center(
                          child: Text('No searches yet'),
                        ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: searchController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Search PIN",
                isDense: true,
                prefixIcon: Icon(
                  Icons.search,
                ),
                border: getBorder(),
                focusedBorder: getBorder(),
                enabledBorder: getBorder(),
              ),
              onChanged: (value) {
                searchPin();
              },
            ),
          ),
        ],
      ),
    );
  }
}
