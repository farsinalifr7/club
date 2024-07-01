import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:club/model/notification_model.dart';
//import 'package:club/model/notification_model.dart';
import 'package:club/pages/settings.dart';
import 'package:club/provider/club_provider.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Notification1 extends StatefulWidget {
  const Notification1({super.key});

  @override
  State<Notification1> createState() => _Notification1State();
}

class _Notification1State extends State<Notification1> {
  final TextEditingController _controllerTitle = TextEditingController();

  final TextEditingController _controllerDescription = TextEditingController();

  DateTime selectedDate = DateTime.now();
  DateTime _selectedDateTime = DateTime.now();

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (datePicked != null) {
      final TimeOfDay? timePicked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (timePicked != null) {
        setState(() {
          _selectedDateTime = DateTime(
            datePicked.year,
            datePicked.month,
            datePicked.day,
            timePicked.hour,
            timePicked.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.purple,
      Colors.deepPurple,
      Colors.indigo,
      Colors.blueGrey,
      Colors.teal,
      Colors.brown,
      Colors.indigo,
      Colors.purple,
      Colors.deepPurple,
      Colors.teal,
      Colors.blueGrey,
      Colors.brown,
    ];
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[200],
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Consumer<ClubProvider>(builder: (_, value, __) {
                    return AlertDialog(
                        title: const Text(
                          "Add Notification",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w400),
                        ),
                        content:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            controller: _controllerTitle,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Title",
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: _controllerDescription,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Description",
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              _selectDateTime(context);
                              // showDatePicker(
                              //   context: context,
                              //   initialDate: DateTime.now(),
                              //   firstDate: DateTime(2023, 1, 1),
                              //   lastDate: DateTime(2024, 12, 31),
                              // ).then((value) {
                              //   setState(() {
                              //     selectedDate = value!;
                              //   });
                              // });
                            },
                            child: Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.6))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 15),
                                child: Text(
                                  " ${formatDate(_selectedDateTime, [
                                        yyyy,
                                        '/',
                                        mm,
                                        '/',
                                        dd,
                                        " ",
                                        hh,
                                        ':',
                                        nn,
                                      ]).toString()}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black.withOpacity(0.7)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  clear();
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.amber,
                                  ),
                                  height: 35,
                                  width: 80,
                                  child: const Center(
                                      child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  )),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  scheduleNotification(NotifiModel(
                                      time: _selectedDateTime,
                                      title: _controllerTitle.text,
                                      description:
                                          _controllerDescription.text));
                                  value.addNotification(
                                    NotifiModel(
                                        time: _selectedDateTime,
                                        title: _controllerTitle.text,
                                        description:
                                            _controllerDescription.text),
                                  );
                                  clear();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                      "Notification added Successfully!",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.black,
                                    duration: Duration(seconds: 1),
                                  ));
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.lightBlue[900],
                                  ),
                                  height: 35,
                                  width: 80,
                                  child: const Center(
                                      child: Text(
                                    "Save",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ]));
                  });
                });
          },
          child: const Icon(
            Icons.add,
            size: 33,
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Notifications",
            style: GoogleFonts.aleo(
              textStyle: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey),
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Settings()));
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Consumer<ClubProvider>(builder: (_, value, __) {
          return Container(
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: value.getNotifications().length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 197,
                          width: double.infinity,
                          color: colors[index].withOpacity(0.8),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.notifications,
                                    size: 70,
                                    color: colors[index],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Consumer<ClubProvider>(
                                                builder: (_, value, __) {
                                              return AlertDialog(
                                                  title: const Text(
                                                    "Alert Message",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        const Text(
                                                          "Do you want to delete this Notification ? ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 16),
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  color: Colors
                                                                          .lightBlue[
                                                                      900],
                                                                ),
                                                                height: 35,
                                                                width: 80,
                                                                child:
                                                                    const Center(
                                                                        child:
                                                                            Text(
                                                                  "Cancel",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          16),
                                                                )),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 20,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                value.removeNotification(
                                                                    value.getNotifications()[
                                                                        index]);
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                        const SnackBar(
                                                                  content: Text(
                                                                    "Notification deleted Successfully!",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .black,
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                ));
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  color: Colors
                                                                      .purple,
                                                                ),
                                                                height: 35,
                                                                width: 80,
                                                                child:
                                                                    const Center(
                                                                        child:
                                                                            Text(
                                                                  "Delete",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          16),
                                                                )),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                      ]));
                                            });
                                          });
                                    },
                                    icon: const Icon(
                                      Icons.close_sharp,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                value.getNotifications()[index].title,
                                style: GoogleFonts.aleo(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                              Text(
                                value.getNotifications()[index].description,
                                style: GoogleFonts.aleo(
                                  textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                              ),
                              Text(
                                "${formatDate(value.getNotifications()[index].time, [
                                      yyyy,
                                      '/',
                                      mm,
                                      '/',
                                      dd,
                                      ' ',
                                      hh,
                                      ':',
                                      nn,
                                    ]).toString()} ",
                                style: GoogleFonts.aleo(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          );
        }));
  }

  void clear() {
    _controllerDescription.text = "";
    _controllerTitle.text = "";
  }

  void scheduleNotification(NotifiModel item) async {
    try {
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: DateTime.now().minute,
          channelKey: 'basic_channel',
          title: item.title,
          body: item.description,

          //customSound: "resource:asset/sound/notificationsound.mp3",
          payload: {
            'scheduledTime': item.time.toString(),
          }, // Optional payload
        ),
        schedule: NotificationCalendar.fromDate(
          date: item.time,
          allowWhileIdle: true, // Allow notification even if app is idle
          preciseAlarm: true, // Use precise alarm for accurate scheduling
        ),
      );
    } catch (e) {}
  }
}
