import 'package:club/model/notification_model.dart';
import 'package:club/pages/settings.dart';
import 'package:club/provider/club_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Notification1 extends StatelessWidget {
  Notification1({super.key});

  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
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
                              Future<DateTime?> selectedDate = showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2023, 1, 1),
                                lastDate: DateTime(2024, 12, 31),
                              );
                            },
                            child: Container(
                              height: 45,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.6))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  " Date",
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
                                  value.addNotification(
                                    NotificationModel(
                                        time: DateTime.now(),
                                        title: _controllerTitle.text,
                                        description:
                                            _controllerDescription.text),
                                  );
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
          return ListView(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                                              ScaffoldMessenger
                                                                      .of(
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
                              value.getNotifications()[index].time.toString(),
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
          );
        }));
  }
}
