import 'package:club/main.dart';
import 'package:club/pages/settings.dart';
import 'package:club/provider/club_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AchivmentDetails extends StatelessWidget {
  const AchivmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    List<Color> colors = [
      Colors.purple,
      Colors.deepPurple,
      Colors.teal,
      Colors.blueGrey,
      Colors.indigo,
      Colors.brown,
      Colors.purple,
      Colors.deepPurple,
      Colors.teal,
      Colors.blueGrey,
      Colors.brown,
      Colors.orange,
    ];
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Consumer<ClubProvider>(builder: (_, value, __) {
                  return AlertDialog(
                      title: const Text(
                        "ADD Achivments",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      content:
                          Column(mainAxisSize: MainAxisSize.min, children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Achivment",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.text = "";
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
                                value.addAchivment(controller.text);
                                controller.text = "";
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                    "New Achivment Added Successfully!",
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
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Settings()));
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          "Achivment ",
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Consumer<ClubProvider>(builder: (_, value, __) {
            return Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.2, crossAxisCount: 2),
                    itemCount: value.getAchivment().length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(5, 5),
                                blurRadius: 4,
                                spreadRadius: 5,
                              ),
                            ],
                            color: colors[index].withOpacity(0.7),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(40),
                                bottomLeft: Radius.circular(40)),
                          ),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: IconButton(
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
                                                          const Text(
                                                              "Do you want to delete this item?"),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  controller
                                                                      .text = "";
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
                                                                  value.removeAchivment(
                                                                      value.getAchivment()[
                                                                          index]);

                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                          const SnackBar(
                                                                    content:
                                                                        Text(
                                                                      "item Deleted Successfully!",
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
                                        Icons.close_outlined,
                                        color: Colors.white,
                                      )),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Center(
                                    child: Text(
                                  value.getAchivment()[index],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )),
                              ],
                            ),
                          ),
                        ),
                      );
                    }));
          })
        ],
      ),
    );
  }
}
