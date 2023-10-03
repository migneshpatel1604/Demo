// @dart=2.9
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hdfc_ls/APIServices/ApiServices.dart';
import 'package:hdfc_ls/DashBoard/DrawerScreen.dart';
import 'package:hdfc_ls/Home/Pending_Application.dart';
import 'package:hdfc_ls/StyleScreen/StyleScreen.dart';

class Dashboard_List extends StatefulWidget {
  const Dashboard_List({Key key}) : super(key: key);

  @override
  State<Dashboard_List> createState() => _Dashboard_ListState();
}

class _Dashboard_ListState extends State<Dashboard_List>
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
      tokenId,
      pendingCount = "",
      reassignCount = "",
      submitCount = "";
  var dashboardListCountRes;
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
    dashboardListCountApi();
    print("user_email " + useremail.toString());
    print("email " + email.toString());
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
    // getSharedPrefs();
  }

  // Future<void> getSharedPrefs() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   id = prefs.getString("id");
  //   first_name = prefs.getString("firstname");
  //   useremail = prefs.getString("useremail");
  //   email = prefs.getString("email");
  //   mobilenumber = prefs.getString("mobilenumber");
  //   roleid = prefs.getString("roleid");
  //   status = prefs.getString("status");
  //   tokenId = prefs.getString("tokenId");
  //
  //   print("user_email :"+useremail);
  //   print("id :"+id);
  //   print("first_name :"+first_name);
  //   print("mobile_number :"+mobilenumber);
  //   print("role_id :"+roleid);
  //
  // }

  @override
  void dispose() {
    _drawerSlideController.dispose();
    super.dispose();
  }

  void openDrawer() {
    _drawerSlideController.forward();
  }

  void closeDrawer() {
    _drawerSlideController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: ColorName.white,
        centerTitle: true,
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
        title: Text(
          'Dashboard',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorName.black45),
        ),
        iconTheme: IconThemeData(color: ColorName.black, size: 30),
      ),
      drawer: DrawerScreen(),
      body: isLoader == false
          ? Align(
              alignment: Alignment.center,
              child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: ColorName.logoOrangecolor,
                    backgroundColor: ColorName.buttoncolor,
                  )))
          : Container(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, top: 18.0),
                child: Column(
                  children: [
                    Card(
                      color: ColorName.white,
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10.0),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Pending_Application()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: ColorName.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  offset: Offset(2, 4),
                                  color: ColorName.gray3,
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Pending Application",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: ColorName.black,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: ColorName.buttoncolor,
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 5,
                                        offset: Offset(2, 4),
                                        color: ColorName.gray3,
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Text(pendingCount,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: ColorName.black,
                                          fontWeight: FontWeight.w600)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: ColorName.white,
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10.0),
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: ColorName.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  offset: Offset(2, 4),
                                  color: ColorName.gray3,
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Reassign Application",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: ColorName.black,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: ColorName.buttoncolor,
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 5,
                                        offset: Offset(2, 4),
                                        color: ColorName.gray3,
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Text(reassignCount,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: ColorName.black,
                                          fontWeight: FontWeight.w600)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: ColorName.white,
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10.0),
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: ColorName.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  offset: Offset(2, 4),
                                  color: ColorName.gray3,
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Submitted",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: ColorName.black,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: ColorName.buttoncolor,
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 5,
                                        offset: Offset(2, 4),
                                        color: ColorName.gray3,
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Text(submitCount,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: ColorName.black,
                                          fontWeight: FontWeight.w600)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> dashboardListCountApi() async {
    Map<String, Object> jsonparam = Map();

    setState(() {
      jsonparam = {
        "email": email,
      };
    });

    print(jsonparam);
    ApiService apiService = new ApiService();
    apiService.callDashboardCountApi(jsonparam, tokenId).then((value) => {
          setState(() {
            print("Dashboard List Responce : " + value.toString());
            dashboardListCountRes = value;
            if (dashboardListCountRes['status'] == "success") {
              pendingCount =
                  dashboardListCountRes['List']['pendingCount'].toString();
              reassignCount =
                  dashboardListCountRes['List']['reassignCount'].toString();
              submitCount =
                  dashboardListCountRes['List']['submitCount'].toString();
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
