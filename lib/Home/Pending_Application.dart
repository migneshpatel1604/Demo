// @dart=2.9
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hdfc_ls/APIServices/ApiServices.dart';
import 'package:hdfc_ls/DashBoard/Dashboard_List.dart';
import 'package:hdfc_ls/DashBoard/DrawerScreen.dart';
import 'package:hdfc_ls/Home/Customer_Form.dart';
import 'package:hdfc_ls/StyleScreen/StyleScreen.dart';

class Pending_Application extends StatefulWidget {
  const Pending_Application({Key key}) : super(key: key);

  @override
  State<Pending_Application> createState() => _Pending_ApplicationState();
}

class _Pending_ApplicationState extends State<Pending_Application>
    with SingleTickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController _drawerSlideController;
  String id,
      firstname,
      useremail = "",
      email,
      mobilenumber,
      roleid,
      status,
      tokenId;

  @override
  void initState() {
    id = GetStorage().read("user_id").toString();
    useremail = GetStorage().read("user_email").toString();
    firstname = GetStorage().read("first_name").toString();
    email = GetStorage().read("email_id").toString();
    mobilenumber = GetStorage().read("mobile_no").toString();
    roleid = GetStorage().read("role_id").toString();
    tokenId = GetStorage().read("tokenId").toString();
    status = GetStorage().read("user_status").toString();

    print("user_email " + useremail.toString());
    print("id " + id.toString());
    print("first_name " + firstname.toString());
    print("mobile_number " + mobilenumber.toString());
    print("role_id " + roleid.toString());

    _drawerSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 10),
    );

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        moveTolastScreen();
        return false;
      },
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: ColorName.buttoncolor,
            leading: AnimatedBuilder(
                animation: _drawerSlideController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(-_drawerSlideController.value * 250, 0),
                    child: IconButton(
                        onPressed: () {
                          scaffoldKey.currentState.openDrawer();
                        },
                        icon: Image.asset(
                          'assets/menu_icon.png',
                          fit: BoxFit.cover,
                        )),
                  );
                }),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Dashboard_List();
                        },
                      ));
                    },
                    icon: Image.asset("assets/DrawerIcon/home_house.png"),
                    color: Colors.white),
              ),
            ],
            title: Text("Pending Application",
                style: TextStyle(
                    fontSize: 18,
                    color: ColorName.black,
                    fontWeight: FontWeight.w600)),
            bottom: TabBar(
              labelColor: ColorName.white,
              unselectedLabelColor: Colors.black,
              padding: EdgeInsets.only(left: 15, right: 15),
              physics: ScrollPhysics(),
              indicator: BoxDecoration(
                  color: ColorName.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              tabs: <Widget>[
                Tab(
                  child: Text('Pending List',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ),
                Tab(
                  child: Text('Run List',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
          drawer: DrawerScreen(),
          body: TabBarView(
            children: <Widget>[
              PendingList(),
              RunList(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget PendingList() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 18.0),
  //     child: Column(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.all(10.0),
  //           child: InkWell(
  //             borderRadius: BorderRadius.circular(20),
  //             onTap: () {
  //               Navigator.of(context).push(
  //                   MaterialPageRoute(builder: (context) => Customer_Form()));
  //             },
  //             child: Container(
  //               decoration: BoxDecoration(
  //                   color: ColorName.white,
  //                   borderRadius: BorderRadius.circular(20.0),
  //                   boxShadow: [
  //                     BoxShadow(
  //                       blurRadius: 5,
  //                       offset: Offset(2, 4),
  //                       color: ColorName.gray3,
  //                     ),
  //                   ]),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Container(
  //                     width: MediaQuery.of(context).size.width,
  //                     decoration: BoxDecoration(
  //                         border: Border(
  //                             bottom: BorderSide(
  //                                 width: 1, color: ColorName.gray2))),
  //                     alignment: Alignment.centerLeft,
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(
  //                           top: 8.0, bottom: 8.0, left: 12.0),
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text(
  //                             "Customer Name",
  //                             style: TextStyle(color: ColorName.gray3),
  //                           ),
  //                           SizedBox(
  //                             height: 3,
  //                           ),
  //                           Text(
  //                             "Desai Rajesh Ramsurat",
  //                             style: TextStyle(color: ColorName.black),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     width: MediaQuery.of(context).size.width,
  //                     decoration: BoxDecoration(
  //                         border: Border(
  //                             bottom: BorderSide(
  //                                 width: 1, color: ColorName.gray2))),
  //                     alignment: Alignment.centerLeft,
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(
  //                           top: 8.0, bottom: 8.0, left: 12.0),
  //                       child: Row(
  //                         children: [
  //                           Expanded(
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text(
  //                                   "Product",
  //                                   style: TextStyle(color: ColorName.gray3),
  //                                 ),
  //                                 SizedBox(
  //                                   height: 3,
  //                                 ),
  //                                 Text(
  //                                   "XYZ",
  //                                   style: TextStyle(color: ColorName.black),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           Expanded(
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text(
  //                                   "Amount",
  //                                   style: TextStyle(color: ColorName.gray3),
  //                                 ),
  //                                 SizedBox(
  //                                   height: 3,
  //                                 ),
  //                                 Text(
  //                                   "12,000",
  //                                   style: TextStyle(color: ColorName.black),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   // Container(
  //                   //   width: MediaQuery.of(context).size.width,
  //                   //   decoration: BoxDecoration(
  //                   //       border: Border(
  //                   //           bottom:
  //                   //           BorderSide(width: 1, color: ColorName.gray2))),
  //                   //   alignment: Alignment.centerLeft,
  //                   //   child: Padding(
  //                   //     padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 12.0),
  //                   //     child:
  //                   //   ),
  //                   // ),
  //                   Container(
  //                     width: MediaQuery.of(context).size.width,
  //                     decoration: BoxDecoration(
  //                         border: Border(
  //                             bottom: BorderSide(
  //                                 width: 1, color: ColorName.gray2))),
  //                     alignment: Alignment.centerLeft,
  //                     child: Padding(
  //                         padding: const EdgeInsets.only(
  //                             top: 8.0, bottom: 8.0, left: 12.0),
  //                         child: Row(
  //                           children: [
  //                             Expanded(
  //                               flex: 2,
  //                               child: Column(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   Text(
  //                                     "Application No.",
  //                                     style: TextStyle(color: ColorName.gray3),
  //                                   ),
  //                                   SizedBox(
  //                                     height: 3,
  //                                   ),
  //                                   Text(
  //                                     "RACC-KGC2240449-88712650",
  //                                     style: TextStyle(color: ColorName.black),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                             Expanded(
  //                               child: Column(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   Text(
  //                                     "Proposal No.",
  //                                     style: TextStyle(color: ColorName.gray3),
  //                                   ),
  //                                   SizedBox(
  //                                     height: 3,
  //                                   ),
  //                                   Text(
  //                                     "GEA2HD12",
  //                                     style: TextStyle(color: ColorName.black),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                           ],
  //                         )),
  //                   ),
  //                   Container(
  //                     width: MediaQuery.of(context).size.width,
  //                     decoration: BoxDecoration(
  //                         border: Border(
  //                             bottom: BorderSide(
  //                                 width: 1, color: ColorName.gray2))),
  //                     alignment: Alignment.centerLeft,
  //                     child: Padding(
  //                         padding: const EdgeInsets.only(
  //                             top: 8.0, bottom: 8.0, left: 12.0),
  //                         child: Row(
  //                           children: [
  //                             Expanded(
  //                               flex: 2,
  //                               child: Column(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   Text(
  //                                     "Scheme",
  //                                     style: TextStyle(color: ColorName.gray3),
  //                                   ),
  //                                   SizedBox(
  //                                     height: 3,
  //                                   ),
  //                                   Text(
  //                                     "Regular",
  //                                     style: TextStyle(color: ColorName.black),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                             Expanded(
  //                               child: Column(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   Text(
  //                                     "Tenure",
  //                                     style: TextStyle(color: ColorName.gray3),
  //                                   ),
  //                                   SizedBox(
  //                                     height: 3,
  //                                   ),
  //                                   Text(
  //                                     "ABC",
  //                                     style: TextStyle(color: ColorName.black),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                           ],
  //                         )),
  //                   ),
  //                   Container(
  //                     width: MediaQuery.of(context).size.width,
  //                     decoration: BoxDecoration(
  //                         border: Border(
  //                             bottom: BorderSide(
  //                                 width: 1, color: ColorName.gray2))),
  //                     alignment: Alignment.centerLeft,
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(
  //                           top: 8.0, bottom: 8.0, left: 12.0),
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text(
  //                             "Residental Address Line1",
  //                             style: TextStyle(color: ColorName.gray3),
  //                           ),
  //                           SizedBox(
  //                             height: 3,
  //                           ),
  //                           Text(
  //                             "XXXXXXXXXXXXXXX",
  //                             style: TextStyle(color: ColorName.black),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     width: MediaQuery.of(context).size.width,
  //                     decoration: BoxDecoration(
  //                         border: Border(
  //                             bottom: BorderSide(
  //                                 width: 1, color: ColorName.gray2))),
  //                     alignment: Alignment.centerLeft,
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(
  //                           top: 8.0, bottom: 8.0, left: 12.0),
  //                       child: Row(
  //                         children: [
  //                           Expanded(
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text(
  //                                   "Residental Address Line2",
  //                                   style: TextStyle(color: ColorName.gray3),
  //                                 ),
  //                                 SizedBox(
  //                                   height: 3,
  //                                 ),
  //                                 Text(
  //                                   "XXXXXXXXXXXXXXX",
  //                                   style: TextStyle(color: ColorName.black),
  //                                 ),
  //                               ],
  //                             ),
  //                             flex: 2,
  //                           ),
  //                           Expanded(
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text(
  //                                   "Landmark",
  //                                   style: TextStyle(color: ColorName.gray3),
  //                                 ),
  //                                 SizedBox(
  //                                   height: 3,
  //                                 ),
  //                                 Text(
  //                                   "Bopal",
  //                                   style: TextStyle(color: ColorName.black),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   // Container(
  //                   //   width: MediaQuery.of(context).size.width,
  //                   //
  //                   //   alignment: Alignment.centerLeft,
  //                   //   child: Padding(
  //                   //     padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 12.0),
  //                   //     child:
  //                   //   ),
  //                   // ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  void moveTolastScreen() {
    // Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Dashboard_List()));
  }
}

class PendingList extends StatefulWidget {
  const PendingList({Key key}) : super(key: key);

  @override
  State<PendingList> createState() => _PendingListState();
}

class _PendingListState extends State<PendingList> {
  // final _listpendingkey = GlobalKey<_PendingListState>();
  List<String> data = ["aa", "bb", "cc"];
  String id,
      firstname,
      useremail = "",
      email,
      mobilenumber,
      roleid,
      status,
      tokenId;
  var pendingAppListRes;
  List peningAppList = [];
  bool isLoader = false;

  @override
  void initState() {
    id = GetStorage().read("user_id").toString();
    useremail = GetStorage().read("user_email").toString();
    firstname = GetStorage().read("first_name").toString();
    email = GetStorage().read("email_id").toString();
    mobilenumber = GetStorage().read("mobile_no").toString();
    roleid = GetStorage().read("role_id").toString();
    tokenId = GetStorage().read("tokenId").toString();
    status = GetStorage().read("user_status").toString();
    PeningAppListApi();
    print("user_email " + useremail.toString());
    print("id " + id.toString());
    print("first_name " + firstname.toString());
    print("mobile_number " + mobilenumber.toString());
    print("role_id " + roleid.toString());
    // TODO: implement initState
    super.initState();
  }

  void _removeItem(int index) {
    setState(() {
      data.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoader == false
        ? Align(
            alignment: Alignment.center,
            child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(strokeWidth: 3,color: ColorName.logoOrangecolor,backgroundColor: ColorName.buttoncolor,)))
        : Padding(
            padding: const EdgeInsets.all(15.0),
            child: ReorderableListView.builder(
              itemCount: peningAppList.length,
              onReorder: (int oldIndex, int newIndex) {

              },
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key('$index${peningAppList[index]}'),
                  direction: DismissDirection.startToEnd,
                  movementDuration: Duration(seconds: 1),
                  onDismissed: (direction) {
                    // _removeItem(index);
                  },
                  background: Container(
                    color: Colors.red,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Customer_Form()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorName.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                offset: Offset(2, 4),
                                color: ColorName.gray3,
                              ),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: ColorName.gray2))),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0, left: 12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Customer Name",
                                      style: TextStyle(color: ColorName.gray3),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      peningAppList[index]['strContactName'].toString(),
                                      style: TextStyle(color: ColorName.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: ColorName.gray2))),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0, left: 12.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Product",
                                            style: TextStyle(
                                                color: ColorName.gray3),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            peningAppList[index]['strProduct'].toString(),
                                            style: TextStyle(
                                                color: ColorName.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Amount",
                                            style: TextStyle(
                                                color: ColorName.gray3),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            peningAppList[index]['iAmount'].toString(),
                                            style: TextStyle(
                                                color: ColorName.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: ColorName.gray2))),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8.0, left: 12.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Application No.",
                                              style: TextStyle(
                                                  color: ColorName.gray3),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              peningAppList[index]['ApplicationId'].toString(),
                                              style: TextStyle(
                                                  color: ColorName.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Proposal No.",
                                              style: TextStyle(
                                                  color: ColorName.gray3),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              peningAppList[index]['strProposalNo'].toString(),
                                              style: TextStyle(
                                                  color: ColorName.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: ColorName.gray2))),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8.0, left: 12.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Scheme",
                                              style: TextStyle(
                                                  color: ColorName.gray3),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              peningAppList[index]['Scheme'].toString(),
                                              style: TextStyle(
                                                  color: ColorName.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tenure",
                                              style: TextStyle(
                                                  color: ColorName.gray3),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              peningAppList[index]['strTenure'].toString(),
                                              style: TextStyle(
                                                  color: ColorName.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: ColorName.gray2))),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0, left: 12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Residental Address",
                                      style: TextStyle(color: ColorName.gray3),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      peningAppList[index]['strResidentialAddress'].toString(),
                                      style: TextStyle(color: ColorName.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0, left: 12.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Address",
                                            style: TextStyle(
                                                color: ColorName.gray3),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            peningAppList[index]['strAddress'].toString(),
                                            style: TextStyle(
                                                color: ColorName.black),
                                          ),
                                        ],
                                      ),
                                      flex: 2,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Landmark",
                                            style: TextStyle(
                                                color: ColorName.gray3),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            peningAppList[index]['strLandmark'].toString(),
                                            style: TextStyle(
                                                color: ColorName.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container(
                            //   width: MediaQuery.of(context).size.width,
                            //
                            //   alignment: Alignment.centerLeft,
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 12.0),
                            //     child:
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              // children: [
              //   for (int index = 0; index < data.length; index++)
              //
              // ],
            ),
          );
  }

  Future<void> PeningAppListApi() async {
    Map<String, Object> jsonparam = Map();

    setState(() {
      jsonparam = {
        "email": email,
      };
    });

    print(jsonparam);
    ApiService apiService = new ApiService();
    apiService.callPeningListApi(jsonparam, tokenId).then((value) => {
          setState(() {
            print("Pening List Responce : " + value.toString());
            pendingAppListRes = value;
            if (pendingAppListRes['status'] == "success") {
              peningAppList = pendingAppListRes['List'];
              isLoader = true;
            } else {
              isLoader = true;
              Fluttertoast.showToast(
                  msg: "No Data Found",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: ColorName.black,
                  textColor: ColorName.white,
                  fontSize: 16.0);
            }
          }),
        });
  }
}

class RunList extends StatefulWidget {
  const RunList({Key key}) : super(key: key);

  @override
  State<RunList> createState() => _RunListState();
}

class _RunListState extends State<RunList> {
  // final _listKey = GlobalKey<_RunListState>();

  List<String> data = ["ab", "cd", "ef"];

  @override
  void initState() {
    super.initState();
    loadListOrder();
  }

  Future<void> loadListOrder() async {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Expanded(
            child: ReorderableListView.builder(
              itemCount: data.length,

              onReorder: (int oldIndex, int newIndex) {
                _reorderItems(oldIndex, newIndex);
              },
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key('$index${data[index]}'),
                  direction: DismissDirection.endToStart,
                  // crossAxisEndOffset: 5,
                  // resizeDuration: Duration(seconds: 5),
                  // behavior: HitTestBehavior.translucent,

                  // movementDuration: Duration(seconds: 1),
                  onDismissed: (direction) {
                    _removeItem(index);
                  },
                  background: Container(
                    color: Colors.red,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  secondaryBackground: Container(
                    color: Colors.red,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Customer_Form()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorName.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                offset: Offset(2, 4),
                                color: ColorName.gray3,
                              ),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: ColorName.gray2))),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0, left: 12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Customer Name",
                                      style: TextStyle(color: ColorName.gray3),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Desai Rajesh Ramsurat",
                                      style: TextStyle(color: ColorName.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: ColorName.gray2))),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0, left: 12.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Product",
                                            style: TextStyle(
                                                color: ColorName.gray3),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "XYZ",
                                            style: TextStyle(
                                                color: ColorName.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Amount",
                                            style: TextStyle(
                                                color: ColorName.gray3),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "12,000",
                                            style: TextStyle(
                                                color: ColorName.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: ColorName.gray2))),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8.0, left: 12.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Application No.",
                                              style: TextStyle(
                                                  color: ColorName.gray3),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              "RACC-KGC2240449-88712650",
                                              style: TextStyle(
                                                  color: ColorName.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Proposal No.",
                                              style: TextStyle(
                                                  color: ColorName.gray3),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              "GEA2HD12",
                                              style: TextStyle(
                                                  color: ColorName.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: ColorName.gray2))),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8.0, left: 12.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Scheme",
                                              style: TextStyle(
                                                  color: ColorName.gray3),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              "Regular",
                                              style: TextStyle(
                                                  color: ColorName.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tenure",
                                              style: TextStyle(
                                                  color: ColorName.gray3),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              "ABC",
                                              style: TextStyle(
                                                  color: ColorName.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: ColorName.gray2))),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0, left: 12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Residental Address Line1",
                                      style: TextStyle(color: ColorName.gray3),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "XXXXXXXXXXXXXXX",
                                      style: TextStyle(color: ColorName.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0, left: 12.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Residental Address Line2",
                                            style: TextStyle(
                                                color: ColorName.gray3),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "XXXXXXXXXXXXXXX",
                                            style: TextStyle(
                                                color: ColorName.black),
                                          ),
                                        ],
                                      ),
                                      flex: 2,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Landmark",
                                            style: TextStyle(
                                                color: ColorName.gray3),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "Bopal",
                                            style: TextStyle(
                                                color: ColorName.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container(
                            //   width: MediaQuery.of(context).size.width,
                            //
                            //   alignment: Alignment.centerLeft,
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 12.0),
                            //     child:
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              // children: [
              //   for (int index = 0; index < data.length; index++)
              //
              // ],
            ),
          ),
        ],
      ),
    );
  }

  void _removeItem(int index) {
    setState(() {
      data.removeAt(index);
    });
  }

  void _reorderItems(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
        print("Helllooo :" + newIndex.toString());
      }
      print("Helllooo :" + newIndex.toString());
      final item = data.removeAt(oldIndex);
      data.insert(newIndex, item);
      saveListOrder(); // Save the updated list order after reordering
    });
  }

  void saveListOrder() async {}
}
