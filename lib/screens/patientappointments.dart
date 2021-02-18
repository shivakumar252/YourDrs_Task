import 'dart:convert';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import '../components/patientsearch.dart';
import '../common/colors.dart';

class FlightDetailsScreen extends StatefulWidget {
  @override
  _FlightDetailsScreenState createState() => _FlightDetailsScreenState();
}

class _FlightDetailsScreenState extends State<FlightDetailsScreen> {
  // final String url = "assets/appointmentList.json";
  List<dynamic> allData = [];
  List<dynamic> appointmentData = [];
  Map<String, dynamic> appointment;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    this.getjsondata();
  }

  //getJsondata from json file
  Future<String> getjsondata() async {
    String jsonData = await DefaultAssetBundle.of(context)
        .loadString("assets/appointmentList.json");
    final jsonResult = json.decode(jsonData);
    // print(jsonResult)
    allData = jsonResult;
    appointmentData = allData;
    setState(() {});
  }

//filter method  for selected date
  getSelectedDateAppointments() {
    appointmentData = allData.where((element) {
      print(element);
      Map<String, dynamic> appItem = element;
      return appItem['appointmentDate'] == _selectedValue.toString();
    }).toList();
    setState(() {});
  }

//Date Picker Controller related code
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(),
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: CustomizedColors.themeColor,
        title: ListTile(
          leading: CircleAvatar(
            radius: 18,
            child: ClipOval(
              child: Image.network(
                  "https://image.freepik.com/free-vector/doctor-icon-avatar-white_136162-58.jpg"),
            ),
          ),
          title: Text(
            "Welcome Dr.sciliaris",
            style: TextStyle(
                color: CustomizedColors.whitecolor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          trailing: Icon(
            Icons.segment,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        //color: Colors.black,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.10,
              color: CustomizedColors.themeColor,
            ),
            Positioned(
              top: MediaQuery.of(context).size.width * 0.10,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.90,
                child: Column(
                  children: <Widget>[
                    PatientSerach(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.grey[100],
                      child: DatePicker(
                        DateTime.now(),
                        width: 50,
                        height: 80,
                        controller: _controller,
                        initialSelectedDate: DateTime.now(),
                        selectionColor: CustomizedColors.themeColor,
                        selectedTextColor: CustomizedColors.whitecolor,
                        // inactiveDates: [
                        //   DateTime.now().add(Duration(days: 2)),
                        //   DateTime.now().add(Duration(days: 3)),
                        // ],
                        onDateChange: (date) {
                          // New date selected

                          setState(() {
                            _selectedValue = date;
                            getSelectedDateAppointments();
                          });
                          print(_selectedValue);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Stack(
                children: <Widget>[
                  SafeArea(
                    bottom: false,
                    child: Stack(
                      children: <Widget>[
                        DraggableScrollableSheet(
                          maxChildSize: .8,
                          initialChildSize: .6,
                          minChildSize: .6,
                          builder: (context, scrollController) {
                            return Container(
                              height: 100,
                              padding: EdgeInsets.only(
                                  left: 19,
                                  right: 19,
                                  top:
                                      16), //symmetric(horizontal: 19, vertical: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                                color: CustomizedColors.whitecolor,
                              ),
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                controller: scrollController,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "HEMA 54-DEAN (4)",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0),
                                        )
                                      ],
                                    ),
                                    appointmentData != null &&
                                            appointmentData.isNotEmpty
                                        ? ListView.separated(
                                            separatorBuilder:
                                                (context, index) => Divider(
                                              color: CustomizedColors.title,
                                            ),
                                            shrinkWrap: true,
                                            itemCount: appointmentData.length,
                                            itemBuilder: (context, index) {
                                              Map<String, dynamic> item =
                                                  appointmentData[index];
                                              return ListTile(
                                                contentPadding:
                                                    EdgeInsets.all(0),
                                                leading: Icon(
                                                  Icons.bookmark,
                                                  color: Colors.green,
                                                ),
                                                title: Text(item["location"]),
                                                subtitle: Text(
                                                    item["providerName"] +
                                                        "\n" +
                                                        item["status"]),
                                                trailing: Column(
                                                  children: [
                                                    Text(item[
                                                        "appointmentTime"]),
                                                    Spacer(),
                                                    RichText(
                                                      text: TextSpan(
                                                        text: '• ',
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 14),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: 'Dictation' +
                                                                "" +
                                                                "" +
                                                                item[
                                                                    "dictationStatus"],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                          )
                                        : Container(
                                            child: Text(
                                            "No Appointments",
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                color: CustomizedColors
                                                    .noAppointment),
                                          )),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomizedColors.themeColor,
        tooltip: 'Increment',
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
