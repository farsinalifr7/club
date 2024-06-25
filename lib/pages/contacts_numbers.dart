import 'package:club/main.dart';
import 'package:club/model/main_member_model.dart';
import 'package:club/pages/settings.dart';
import 'package:club/provider/club_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ContactsNumbers extends StatefulWidget {
  const ContactsNumbers({super.key});

  @override
  State<ContactsNumbers> createState() => _ContactsNumbersState();
}

class _ContactsNumbersState extends State<ContactsNumbers> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerNumber = TextEditingController();
  @override
  void initState() {
    super.initState();
    controllerName.text = "";
    controllerNumber.text = "";
  }

  @override
  // void dispose() {
  //   controllerName.dispose();
  //   controllerNumber.dispose();
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.purple,
      Colors.deepPurple,
      Colors.teal,
      Colors.blueGrey,
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
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Consumer<ClubProvider>(builder: (_, value, __) {
                  return AlertDialog(
                      title: const Center(
                        child: Text(
                          "Add Contacts",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                        ),
                      ),
                      content:
                          Column(mainAxisSize: MainAxisSize.min, children: [
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: controllerName,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Title",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: controllerNumber,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Number",
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
                                controllerName.text = "";
                                controllerNumber.text = "";
                                Navigator.pop(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.orange,
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
                                value.addContacts(MainMember(
                                    name: controllerName.text,
                                    number: controllerNumber.text.toString()));
                                controllerName.text = "";
                                controllerNumber.text = "";

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                    "New Contacts Added Successfully!",
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
                                  "save",
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
          weight: 50,
          size: 30,
        ),
      ),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Settings()));
            },
            icon: const Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        title: const Text(
          'Contacts Numbers',
          style: TextStyle(
              fontSize: 28, color: Colors.grey, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Consumer<ClubProvider>(builder: (_, value, __) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: value.getContacts().length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 155,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: CircleAvatar(
                                        radius: 27,
                                        backgroundColor:
                                            colors[index].withOpacity(0.8),
                                        child: const Center(
                                          child: Icon(
                                            Icons.phone,
                                            color: Colors.white,
                                            size: 35,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Consumer<ClubProvider>(
                                                    builder: (_, value, __) {
                                                  return AlertDialog(
                                                      title: const Center(
                                                        child: Text(
                                                          "Alert Message",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ),
                                                      content: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            const Text(
                                                                "Do you Want to Delete this Contact ?"),
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
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      color: Colors
                                                                              .lightBlue[
                                                                          900],
                                                                    ),
                                                                    height: 35,
                                                                    width: 80,
                                                                    child: const Center(
                                                                        child: Text(
                                                                      "Cancel",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight: FontWeight
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
                                                                    value.removeContacts(
                                                                        value.getContacts()[
                                                                            index]);

                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                            const SnackBar(
                                                                      content:
                                                                          Text(
                                                                        "Contacts Deleted Successfully!",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                      backgroundColor:
                                                                          Colors
                                                                              .black,
                                                                      duration: Duration(
                                                                          seconds:
                                                                              1),
                                                                    ));
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      color: Colors
                                                                          .purple,
                                                                    ),
                                                                    height: 35,
                                                                    width: 80,
                                                                    child: const Center(
                                                                        child: Text(
                                                                      "Delete",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight: FontWeight
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
                                          Icons.close,
                                          color: Colors.grey,
                                        ))
                                  ],
                                ),
                                Text(
                                  value.getContacts()[index].name,
                                  style: GoogleFonts.aleo(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ),
                                Text(
                                  value.getContacts()[index].number,
                                  style: GoogleFonts.aleo(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          );
        }),
      ),
    );
  }
}
