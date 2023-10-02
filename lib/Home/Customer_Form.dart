// @dart=2.9
import 'package:flutter/material.dart';
import 'package:hdfc_ls/Home/Pending_Application.dart';
import 'package:hdfc_ls/StyleScreen/StyleScreen.dart';

class Customer_Form extends StatefulWidget {
  const Customer_Form({Key key}) : super(key: key);

  @override
  State<Customer_Form> createState() => _Customer_FormState();
}

class _Customer_FormState extends State<Customer_Form> {

  final NoOfDependentsCon = new TextEditingController();
  final NoOfFamilyCon = new TextEditingController();
  final NoOfEarningCon = new TextEditingController();
  final YearsAtResidenceCon = new TextEditingController();
  final YearsAtCityCon = new TextEditingController();
  final DescriptionController = new TextEditingController();
  final ResidenceStatusCon = new TextEditingController();
  final AssetsvisiHomeCon = new TextEditingController();
  final OtherSpecifyCon = new TextEditingController();
  final PermanentController = new TextEditingController();
  final ContactNameController = new TextEditingController();
  final TelephoneController = new TextEditingController();
  final RentperMonthContro = new TextEditingController();
  final AreaSqFeetContro = new TextEditingController();
  final VerifiedfromContro = new TextEditingController();
  final AssetPurposeContro = new TextEditingController();
  final AssetToBeUsedByContro = new TextEditingController();
  final LandMarkContro = new TextEditingController();
  final EaseOfLocateaddressContro = new TextEditingController();
  final TypeToResidenceContro = new TextEditingController();
  final LocalityOfResidenceContro = new TextEditingController();
  final AreaOfResidenceContro = new TextEditingController();
  final ResidenceController = new TextEditingController();
  final AssetSeenAtResiContro = new TextEditingController();
  final CommentOnInteriorContro = new TextEditingController();
  final CommentOnExteriorContro = new TextEditingController();
  final NameOfThePersonContro = new TextEditingController();
  final NegativeFeedbackContro = new TextEditingController();
  final CPVRefiredController = new TextEditingController();
  final VerificationIndepCon = new TextEditingController();
  final ConfirmedInformationCon = new TextEditingController();
  final ReferenceContactNoCon = new TextEditingController();
  final ReferenceSecretaryNoNameCon = new TextEditingController();
  final VerifierNameSignatureCon = new TextEditingController();
  final CPVRejectedController = new TextEditingController();
  final VerifierCommentController = new TextEditingController();




  List Person_Met = ["1", "2", "3"];
  List RelationApplicantList = ["A", "B", "C"];
  List Spouse = ["Yes", "No"];
  List CPVResult = ["Positive", "Negative"];
  var person_id, selectSpouse, selectCPVResult,RelationApplicantid;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        moveTolastScreen();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorName.buttoncolor,
          leading: IconButton(
            color: ColorName.black,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Pending_Application()));
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Form",
              style: TextStyle(
                  fontSize: 18,
                  color: ColorName.black,
                  fontWeight: FontWeight.w600)),
        ),
        body: Container(
          color: ColorName.white,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 10.0, left: 10.0, right: 10.0, top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: ColorName.graybox,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Customer Name',
                                    style: TextStyle(
                                        color: ColorName.gray, fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text('Desai Rajesh Ramsurat'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Product',
                                    style: TextStyle(
                                        color: ColorName.gray, fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text('XYZ'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Amount',
                                    style: TextStyle(
                                        color: ColorName.gray, fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text('12000'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Application No.',
                                    style: TextStyle(
                                        color: ColorName.gray, fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text('DZAS12578126'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Proposal No.',
                                    style: TextStyle(
                                        color: ColorName.gray, fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text('GEA2HD12'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Scheme',
                                    style: TextStyle(
                                        color: ColorName.gray, fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text('Regular'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tenure',
                                    style: TextStyle(
                                        color: ColorName.gray, fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text('ABCD'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Residental Address Line1',
                                    style: TextStyle(
                                        color: ColorName.gray, fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text('XXXXXXXXXXXXXXX'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Residental Address Line2',
                                    style: TextStyle(
                                        color: ColorName.gray, fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text('YYYYYYYYYYYYYYYYYY'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Landmark',
                                    style: TextStyle(
                                        color: ColorName.gray, fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text('Bopal'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Following are based on information obtained from applicant / colleagure /',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                  SizedBox(height: 3,),
                  Container(
                    // decoration: BoxDecoration(
                    //   color: ColorName.graybox,
                    //   borderRadius: BorderRadius.all(Radius.circular(20)),
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    // color: Colors.blueAccent.withOpacity(0.1),
                                    //   border: Border.all(width: 1),
                                    //   borderRadius: BorderRadius.all(Radius.circular(10))

                                  ),
                                  child: FormField<String>(
                                    builder: (FormFieldState<String> state) {
                                      return InputDecorator(
                                        decoration: InputDecoration(
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(10))),
                                          label: Text('Select Person Met'),
                                          isDense: true,
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            hint: Text("Select",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14)),
                                            value: person_id,
                                            iconDisabledColor: Colors.black45,
                                            iconEnabledColor: Colors.black45,
                                            isDense: true,
                                            onChanged: (newValue) {
                                              setState(() {
                                                person_id = newValue;
                                              });
                                              print("Person Id :- " + person_id);
                                            },
                                            items: Person_Met.map((list) {
                                              return DropdownMenuItem(
                                                child: Text(list),
                                                value: list.toString(),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    // color: Colors.blueAccent.withOpacity(0.1),
                                    //   border: Border.all(width: 1),
                                    //   borderRadius: BorderRadius.all(Radius.circular(10))

                                  ),
                                  child: FormField<String>(
                                    builder: (FormFieldState<String> state) {
                                      return InputDecorator(
                                        decoration: InputDecoration(
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(10))),
                                          label: Text('Relation with Applicant'),
                                          isDense: true,
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            hint: Text("Select",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14)),
                                            value: RelationApplicantid,
                                            iconDisabledColor: Colors.black45,
                                            iconEnabledColor: Colors.black45,
                                            isDense: true,
                                            onChanged: (newValue) {
                                              setState(() {
                                                RelationApplicantid = newValue;
                                              });
                                              print("Person Id :- " + RelationApplicantid);
                                            },
                                            items: RelationApplicantList.map((list) {
                                              return DropdownMenuItem(
                                                child: Text(list),
                                                value: list.toString(),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),


                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: NoOfDependentsCon,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  cursorColor: Colors.black,
                                  // validator: (String value) {
                                  //   if (value.isEmpty) {
                                  //     return "Please No of Dependents";
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: InputDecoration(
                                    filled: true,
                                    isDense: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(width: 1)),
                                    hintText: 'No of Dependents',
                                    label: Text('No of Dependents'),
                                    hintStyle: TextStyle(
                                        color: ColorName.gray,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: NoOfFamilyCon,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  cursorColor: Colors.black,
                                  // validator: (String value) {
                                  //   if (value.isEmpty) {
                                  //     return "Please No of Family";
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: InputDecoration(
                                    filled: true,
                                    isDense: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(width: 1)),
                                    hintText: 'No of Family',
                                    label: Text('No of Family'),
                                    hintStyle: TextStyle(
                                        color: ColorName.gray,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: NoOfEarningCon,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  cursorColor: Colors.black,
                                  // validator: (String value) {
                                  //   if (value.isEmpty) {
                                  //     return "Please No of earning";
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: InputDecoration(
                                    filled: true,
                                    isDense: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(width: 1)),
                                    hintText: 'No of earning',
                                    label: Text('No of earning'),
                                    hintStyle: TextStyle(
                                        color: ColorName.gray,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    // color: Colors.blueAccent.withOpacity(0.1),
                                    //   border: Border.all(width: 1),
                                    //   borderRadius: BorderRadius.all(Radius.circular(10))

                                  ),
                                  child: FormField<String>(
                                    builder: (FormFieldState<String> state) {
                                      return InputDecorator(
                                        decoration: InputDecoration(
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(10))),
                                          label: Text('Spouse'),
                                          isDense: true,
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            hint: Text("Select",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16)),
                                            value: selectSpouse,
                                            iconDisabledColor: Colors.black45,
                                            iconEnabledColor: Colors.black45,
                                            isDense: true,
                                            onChanged: (newValue) {
                                              setState(() {
                                                selectSpouse = newValue;
                                              });
                                              print("Person Id :- " + selectSpouse);
                                            },
                                            items: Spouse.map((list) {
                                              return DropdownMenuItem(
                                                child: Text(list),
                                                value: list.toString(),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: YearsAtResidenceCon,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  cursorColor: Colors.black,
                                  // validator: (String value) {
                                  //   if (value.isEmpty) {
                                  //     return "Please Years at Residence";
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: InputDecoration(
                                    filled: true,
                                    isDense: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(width: 1)),
                                    hintText: 'Years at Residence',
                                    label: Text('Years at Residence'),
                                    hintStyle: TextStyle(
                                        color: ColorName.gray,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: YearsAtCityCon,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  cursorColor: Colors.black,
                                  // validator: (String value) {
                                  //   if (value.isEmpty) {
                                  //     return "Please Years in City";
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: InputDecoration(
                                    filled: true,
                                    isDense: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(width: 1)),
                                    hintText: 'Years in City',
                                    label: Text('Years in City'),
                                    hintStyle: TextStyle(
                                        color: ColorName.gray,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: DescriptionController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            // validator: (String value) {
                            //   if (value.isEmpty) {
                            //     return "Please Enter Description";
                            //   }
                            //   return null;
                            // },
                            decoration: InputDecoration(
                              filled: true,
                              isDense: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(width: 1)),
                              hintText: 'Description',
                              label: Text('Description'),
                              hintStyle: TextStyle(
                                  color: ColorName.gray,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('Residence Status',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                  SizedBox(height: 3,),
                  TextFormField(
                    controller: ResidenceStatusCon,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Please Enter Residence Status";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1)),
                      hintText: 'Residence Status',
                      label: Text('Residence Status'),
                      hintStyle: TextStyle(
                          color: ColorName.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: AssetsvisiHomeCon,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Please Enter Visible at Home";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1)),
                      hintText: 'Assets Visible at Home',
                      label: Text('Assets Visible at Home'),
                      hintStyle: TextStyle(
                          color: ColorName.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: OtherSpecifyCon,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Please Others, Please Specify";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1)),
                      hintText: 'Others, Please Specify',
                      label: Text('Others, Please Specify'),
                      hintStyle: TextStyle(
                          color: ColorName.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('If residence is rented or company provided, Permanent Address, Contact Person & Telephone Numbers:',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                  SizedBox(height: 3,),
                  TextFormField(
                    controller: PermanentController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Please Enter Permanent";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1)),
                      hintText: 'Permanent',
                      label: Text('Permanent'),
                      hintStyle: TextStyle(
                          color: ColorName.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: ContactNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Please Enter Contact Name";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1)),
                      hintText: 'Contact Name',
                      label: Text('Contact Name'),
                      hintStyle: TextStyle(
                          color: ColorName.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: TelephoneController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Please Enter Telephone No.";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1)),
                      hintText: 'Telephone No.',
                      label: Text('Telephone No.'),
                      hintStyle: TextStyle(
                          color: ColorName.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: RentperMonthContro,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: Colors.black,
                          // validator: (String value) {
                          //   if (value.isEmpty) {
                          //     return "Please Enter Rent per Month";
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            // fillColor: ColorName.white,
                            border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 1)),
                            hintText: 'Rent per Month',
                            label: Text('Rent per Month'),
                            hintStyle: TextStyle(
                                color: ColorName.gray,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: TextFormField(
                          controller: AreaSqFeetContro,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: Colors.black,
                          // validator: (String value) {
                          //   if (value.isEmpty) {
                          //     return "Please Enter Area in Sq Feet";
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 1)),
                            hintText: 'Area in Sq Feet',
                            label: Text('Area in Sq Feet'),
                            hintStyle: TextStyle(
                                color: ColorName.gray,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: VerifiedfromContro,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Please Enter Verified from";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1)),
                      hintText: 'Verified from',
                      label: Text('Verified from'),
                      hintStyle: TextStyle(
                          color: ColorName.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('Asset Details / Purpose of Loan',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                  SizedBox(height: 3,),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: AssetPurposeContro,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: Colors.black,
                          // validator: (String value) {
                          //   if (value.isEmpty) {
                          //     return "Please Enter Asset/Purpose";
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 1)),
                            hintText: 'Asset/Purpose',
                            label: Text('Asset/Purpose'),
                            hintStyle: TextStyle(
                                color: ColorName.gray,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: TextFormField(
                          controller: AssetToBeUsedByContro,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: Colors.black,
                          // validator: (String value) {
                          //   if (value.isEmpty) {
                          //     return "Please Enter Asset to be used by";
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 1)),
                            hintText: 'Asset to be used by',
                            label: Text('Asset to be used by'),
                            hintStyle: TextStyle(
                                color: ColorName.gray,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: LandMarkContro,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Please Enter Land Mark";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1)),
                      hintText: 'Land Mark',
                      label: Text('Land Mark'),
                      hintStyle: TextStyle(
                          color: ColorName.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('The following is based on verifiers observation:',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                  SizedBox(height: 3,),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: EaseOfLocateaddressContro,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: Colors.black,
                          // validator: (String value) {
                          //   if (value.isEmpty) {
                          //     return "Please Enter Land Mark";
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 1)),
                            hintText: 'Ease of locate address',
                            label: Text('Ease of locate address'),
                            hintStyle: TextStyle(
                                color: ColorName.gray,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: TextFormField(
                          controller: TypeToResidenceContro,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: Colors.black,
                          // validator: (String value) {
                          //   if (value.isEmpty) {
                          //     return "Please Enter Type of Residence";
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 1)),
                            hintText: 'Type of Residence',
                            label: Text('Type of Residence'),
                            hintStyle: TextStyle(
                                color: ColorName.gray,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: LocalityOfResidenceContro,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: Colors.black,
                          // validator: (String value) {
                          //   if (value.isEmpty) {
                          //     return "Please Enter Locality of Residence";
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 1)),
                            hintText: 'Locality of Residence',
                            label: Text('Locality of Residence'),
                            hintStyle: TextStyle(
                                color: ColorName.gray,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: TextFormField(
                          controller: AreaOfResidenceContro,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: Colors.black,
                          // validator: (String value) {
                          //   if (value.isEmpty) {
                          //     return "Please Enter Area of Residence";
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 1)),
                            hintText: 'Area of Residence',
                            label: Text('Area of Residence'),
                            hintStyle: TextStyle(
                                color: ColorName.gray,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text('Residence',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                  SizedBox(height: 3,),
                  TextFormField(
                    controller: ResidenceController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Please Enter Residence";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1)),
                      hintText: 'Residence',
                      label: Text('Residence'),
                      hintStyle: TextStyle(
                          color: ColorName.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: AssetSeenAtResiContro,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Please Enter Residence";
                    //   }
                    //   return null;
                    // },
                    maxLines: 5,
                    minLines: 1,
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1)),
                      hintText: 'Asset seen at residence',
                      label: Text('Asset seen at residence'),
                      hintStyle: TextStyle(
                          color: ColorName.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: CommentOnInteriorContro,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: Colors.black,
                          // validator: (String value) {
                          //   if (value.isEmpty) {
                          //     return "Please Enter Residence";
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 1)),
                            hintText: 'Comment on Interior',
                            label: Text('Comment on Interior'),
                            hintStyle: TextStyle(
                                color: ColorName.gray,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: TextFormField(
                          controller: CommentOnExteriorContro,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: Colors.black,
                          // validator: (String value) {
                          //   if (value.isEmpty) {
                          //     return "Please Enter Residence";
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 1)),
                            hintText: 'Comment on exterior',
                            label: Text('Comment on exterior'),
                            hintStyle: TextStyle(
                                color: ColorName.gray,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                      ),


                    ],
                  ),
                  SizedBox(height: 10,),
                  Text('Reference Check need to be done with Neighbours',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                  SizedBox(height: 3,),
                  TextFormField(
                    controller: NameOfThePersonContro,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Please Enter Residence";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1)),
                      hintText: 'Name of the person',
                      label: Text('Name of the person'),
                      hintStyle: TextStyle(
                          color: ColorName.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 10,),

                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: NegativeFeedbackContro,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: Colors.black,
                          // validator: (String value) {
                          //   if (value.isEmpty) {
                          //     return "Please Enter Residence";
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 1)),
                            hintText: 'Negative feedback, if any',
                            label: Text('Negative feedback, if any'),
                            hintStyle: TextStyle(
                                color: ColorName.gray,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                label: Text('Application Details Confirmed'),
                                isDense: true,
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: Text("Select",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  value: selectSpouse,
                                  iconDisabledColor: Colors.black45,
                                  iconEnabledColor: Colors.black45,
                                  isDense: true,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectSpouse = newValue;
                                    });
                                    print("Person Id :- " + selectSpouse);
                                  },
                                  items: Spouse.map((list) {
                                    return DropdownMenuItem(
                                      child: Text(list),
                                      value: list.toString(),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text('If residence is locked during visit, CPV needed to be refired :'),
                  TextFormField(
                    controller: CPVRefiredController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Please Enter Residence";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1)),
                      hintText: 'Enter',
                      label: Text('Enter'),
                      hintStyle: TextStyle(
                          color: ColorName.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('2 VERIFICATION FROM INDEPENDENT SOURCES :'),
                  TextFormField(
                    controller: VerificationIndepCon,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Please Enter Residence";
                    //   }
                    //   return null;
                    // },
                    maxLines: 3,
                    minLines: 1,
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1)),
                      hintText: 'Enter Independent sources',
                      label: Text('Enter Independent sources'),
                      hintStyle: TextStyle(
                          color: ColorName.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('We confirmed the information from :'),
                  TextFormField(
                    controller: ConfirmedInformationCon,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Please Enter Residence";
                    //   }
                    //   return null;
                    // },
                    maxLines: 3,
                    minLines: 1,
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1)),
                      hintText: 'Enter',
                      label: Text('Enter'),
                      hintStyle: TextStyle(
                          color: ColorName.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('i) Reference from Thalathi or Gramsevak of village with contact number :'),
                  TextFormField(
                    controller: ReferenceContactNoCon,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Please Enter Residence";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1)),
                      hintText: 'Enter',
                      label: Text('Enter'),
                      hintStyle: TextStyle(
                          color: ColorName.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('ii) Reference from Secretary of Village Society with contact number & name of Society :'),
                  TextFormField(
                    controller: ReferenceSecretaryNoNameCon,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Please Enter Residence";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1)),
                      hintText: 'Enter',
                      label: Text('Enter'),
                      hintStyle: TextStyle(
                          color: ColorName.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 10,),
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          label: Text('CPV Result'),
                          isDense: true,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text("CPV Result",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            value: selectCPVResult,
                            iconDisabledColor: Colors.black45,
                            iconEnabledColor: Colors.black45,
                            isDense: true,
                            onChanged: (newValue) {
                              setState(() {
                                selectCPVResult = newValue;
                              });
                              print("select CPV Result :- " + selectCPVResult);
                            },
                            items: CPVResult.map((list) {
                              return DropdownMenuItem(
                                child: Text(list),
                                value: list.toString(),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: VerifierNameSignatureCon,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Please Enter Residence";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1)),
                      hintText: 'Verifier\'s Name & signature',
                      label: Text('Verifier\'s Name & signature'),
                      hintStyle: TextStyle(
                          color: ColorName.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: CPVRejectedController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Please Enter Residence";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1)),
                      hintText: 'CPV rejected for the following',
                      label: Text('CPV rejected for the following'),
                      hintStyle: TextStyle(
                          color: ColorName.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: VerifierCommentController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return "Please Enter Residence";
                    //   }
                    //   return null;
                    // },
                    maxLines: 5,
                    minLines: 1,
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1)),
                      hintText: 'Verifier\'s comments',
                      label: Text('Verifier\'s comments'),
                      hintStyle: TextStyle(
                          color: ColorName.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                    child: Center(
                      child: Material(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          borderRadius: (BorderRadius.circular(20)),
                          onTap: () {
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(builder: (context) => Dashboard_List()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 40),
                            decoration: new BoxDecoration(
                                borderRadius: (BorderRadius.circular(8)),
                                color: ColorName.buttoncolor,
                                boxShadow: [
                                  new BoxShadow(
                                      color: ColorName.gray3,
                                      blurRadius: 4.0,
                                      offset: Offset(1, 2)
                                  ),
                                ]),
                            child: Text(
                              'Submit',
                              style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
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
    );
  }

  void moveTolastScreen() {
    // Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Pending_Application()));
  }
}
