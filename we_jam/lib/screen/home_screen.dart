import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_jam/utils/widget/drop_down_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dropDownValue;
  FocusNode dropdownFocusNode = new FocusNode();
  FocusNode searchFocusNode = new FocusNode();
  // bool showDialog = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        dropdownFocusNode.unfocus();
        searchFocusNode.unfocus();
        setState(() {
          DropdownWidget.dropDown = !DropdownWidget.dropDown;
        });
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Container(
                height: MediaQuery.of(context).size.height * 2.5 / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 15,
                            child: TextField(
                              focusNode: searchFocusNode,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  hintText: "Search",
                                  prefixIcon: Icon(Icons.search),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(50.0),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Text("All Jams which filtered"),
                                  )),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1)
                                ),
                                child: ListView.builder(
                                    padding: EdgeInsets.only(top: 8, bottom: 35),
                                    shrinkWrap: true,
                                    itemCount: 3,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if(index > 0) {
                                        return Padding(
                                          padding: const EdgeInsets.only(top: 8.0),
                                          child: Text((index + 1).toString()),
                                        );
                                      }
                                      return Text((index + 1).toString());
                                    }),
                              ),
                            ],
                          ),
                          // DropdownWidget(
                          //   focusNode: dropdownFocusNode,
                          //   itemsValue: [1, 2, 3],
                          //   label: "All Jams which filtered",
                          // ),
                        ),
                      ],
                    ),
                    // showDialog
                    //     ?

                        // : Container()
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton:
    // showDialog
    //         ? null
    //         :
    FloatingActionButton(
                tooltip: 'Increment',
                child: Icon(Icons.add),
                onPressed: () {
                  // setState(() {
                  //   showDialog = !showDialog;
                  // });
                  showDialog(context: context, builder: (BuildContext context) =>
                     Dialog(
                       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                       child: Padding(
                         padding: const EdgeInsets.only(top: 8.0),
                         child: Column(
                           mainAxisSize: MainAxisSize.min,
                             children: [
                               // InputDecorator(
                               //   decoration: InputDecoration(
                               //       contentPadding: EdgeInsets.only(
                               //           right: 10, left: 10, top: 10),
                               //       border: OutlineInputBorder(),
                               //       labelText: "Add new Jam dialog",
                               //       labelStyle: TextStyle(
                               //           color: Colors.grey.shade800)),
                               //   child:
                                 Padding(
                                   padding: const EdgeInsets.symmetric(
                                       vertical: 5, horizontal: 15),
                                   child: Container(
                                     width: double.infinity,
                                     child: Column(
                                       crossAxisAlignment:
                                       CrossAxisAlignment.start,
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.only(
                                               top: 10),
                                           child: Text("Jam name"),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(
                                               top: 10),
                                           child: SizedBox(
                                             height: 40,
                                             child: TextField(
                                               decoration: InputDecoration(
                                                   border:
                                                   OutlineInputBorder()),
                                             ),
                                           ),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(
                                               top: 10),
                                           child: Text("Drop the beat here"),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(
                                               top: 10),
                                           child: SizedBox(
                                             height: 40,
                                             child: TextField(
                                               decoration: InputDecoration(
                                                   border:
                                                   OutlineInputBorder()),
                                             ),
                                           ),
                                         ),
                                         Padding(
                                           padding:
                                           const EdgeInsets.symmetric(
                                               vertical: 15),
                                           child:
                                           // Row(
                                           //   mainAxisAlignment:
                                           //   MainAxisAlignment
                                           //       .spaceBetween,
                                           //   children: [
                                               // ElevatedButton(
                                               //     onPressed: () {
                                               //       setState(() {
                                               //         // showDialog =
                                               //         //     !showDialog;
                                               //       });
                                               //     },
                                               //     child: Text("Cancel")),
                                               Center(
                                                 child: ElevatedButton(
                                                     onPressed: () {},
                                                     child: Text("Create")),
                                               ),
                                             // ],
                                           // ),
                                         )
                                       ],
                                     ),
                                   ),
                                 ),
                               // )
                             ],
                           ),
                       ),
                     )
                  );
                },
              ),
      ),
    );
  }
}
