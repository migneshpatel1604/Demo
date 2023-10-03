// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hdfc_ls/DashBoard/Dashboard_List.dart';
import 'package:hdfc_ls/LoginScreen/Login_Screen.dart';
import 'package:hdfc_ls/StyleScreen/StyleScreen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> with SingleTickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController _drawerSlideController;
  String id, firstname, useremail="", email, mobilenumber, roleid, status, tokenId;

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

    print("user_email "+useremail.toString());
    print("id "+id.toString());
    print("first_name "+firstname.toString());
    print("mobile_number "+mobilenumber.toString());
    print("role_id "+roleid.toString());

    _drawerSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 10),
    );
    // TODO: implement initState
    super.initState();
  }

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
    return WillPopScope(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Drawer(
          width: MediaQuery.of(context).size.width / 1.5,
          shape: OutlineInputBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: ColorName.white,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 190,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              // image: DecorationImage(image: AssetImage('assets/Logo/circleicon.png'),alignment:Alignment.centerLeft/2),
                              color: ColorName.buttoncolor,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage('assets/Logo/circleicon.png'),alignment:Alignment.centerLeft/2),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset("assets/Logo/logo.png",
                                        height: 80, width: 80),
                                  ),
                                ),
                                Text(useremail.toString(),textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.w600,color: ColorName.black,fontSize: 15),)
                              ],
                            )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:30.0),
                          child: ListTile(
                            leading: Image.asset("assets/DrawerIcon/Home_Icon.png",color: ColorName.black,filterQuality: FilterQuality.high,width: 35),
                            minLeadingWidth: 5,

                            title: const Text('Dashboard',style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontFamily: 'Metropolis',
                                fontWeight: FontWeight.w600
                            ),),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Dashboard_List()));
                            },
                          ),
                        ),
                        ListTile(
                          leading: Image.asset("assets/Menu_Icon/Pening_App.png",color: ColorName.black,filterQuality: FilterQuality.high,width: 30),
                          minLeadingWidth: 5,

                          title: const Text('Pending Application',style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: 'Metropolis',
                              fontWeight: FontWeight.w600
                          ),),
                          onTap: () {

                          },
                        ),
                        ListTile(
                          leading: Image.asset("assets/Menu_Icon/Reassign_App.png",color: ColorName.black,width: 30,filterQuality: FilterQuality.high),
                          minLeadingWidth: 5,

                          title: const Text('Reassign Application',style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: 'Metropolis',
                              fontWeight: FontWeight.w600
                          ),),
                          onTap: () {

                          },
                        ),
                        ListTile(
                          leading: Image.asset("assets/Menu_Icon/Submitted_Icon.png",color: ColorName.black,),
                          minLeadingWidth: 5,
                          title: const Text('Submitted',style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: 'DancingScript',
                              fontWeight: FontWeight.w600
                          ),),
                          onTap: () {

                          },
                        ),

                        ListTile(
                          leading: Image.asset("assets/DrawerIcon/LogOut.png", width: 25,color: ColorName.black,),
                          minLeadingWidth: 5,

                          title: const Text('Log Out',style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: 'Metropolis',
                              fontWeight: FontWeight.w600
                          ),),
                          onTap: () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _LogoutPopDialog(context),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }

  Widget _LogoutPopDialog(BuildContext context) {
    return new AlertDialog(
      title: Container(
        width: MediaQuery.of(context).size.width,
        child: const Text(
          'Confirmation',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      content: Text("Are you sure you want to logout?"),
      actions: [
        TextButton(onPressed: (){Navigator.of(context).pop();},
            child: Text("No", style: TextStyle(color: Colors.blue),)),
        TextButton(
            onPressed: () async {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context)=> Login_Screen()));
            },
            child: Text("Yes",style: TextStyle(color: Colors.blue),)),
      ],
    );
  }
}
