import 'dart:io';

import 'package:club/main.dart';
import 'package:club/model/user_model.dart';
import 'package:club/pages/home_page.dart';
import 'package:club/pages/userinfo_add.dart';
import 'package:club/provider/club_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MembersInfo extends StatefulWidget {
  final bool editorNot;
  const MembersInfo({super.key, required this.editorNot});

  @override
  State<MembersInfo> createState() => _MembersInfoState();
}

class _MembersInfoState extends State<MembersInfo> {
  List<Workers> filtetItems = [];
  @override
  void initState() {
    filtetItems = context.read<ClubProvider>().getMembersDetails();
    super.initState();
  }

  @override
  List<Color> color = [
    Colors.blue,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.deepPurple,
    Colors.brown,
    Colors.blueGrey,
    Colors.deepPurpleAccent,
    Colors.brown,
    Colors.blueGrey,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomePage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                onChanged: (value) => runFilter(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  hintText: "Serch ",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: filtetItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return UserinfoAdd(
                                    ismain: false, member: filtetItems[index]);
                              },
                            ),
                          );
                        },
                        child: Container(
                          height: 85,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(3, 3),
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: CircleAvatar(
                                                radius: 35,
                                                backgroundColor: color[index]
                                                    .withOpacity(0.4),
                                                child: SizedBox(
                                                  height: 55,
                                                  width: 50,
                                                  child: filtetItems[index]
                                                              .isUserInput ==
                                                          true
                                                      ? Image.file(File(
                                                          filtetItems[index]
                                                              .image))
                                                      : Image.asset(
                                                          filtetItems[index]
                                                              .image),
                                                )),
                                          ),
                                          const SizedBox(
                                            width: 40,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                filtetItems[index].name,
                                                style: GoogleFonts.lora(
                                                  textStyle: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              Text(
                                                filtetItems[index].mob,
                                                style: TextStyle(
                                                    color: Colors.grey[600]),
                                              ),
                                              Text(
                                                "${filtetItems[index].age} ",
                                                style: const TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              right: 12, top: 12),
                                          child: widget.editorNot == false
                                              ? const Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Colors.grey,
                                                  size: 18,
                                                )
                                              : const Icon(
                                                  Icons.edit,
                                                  color: Colors.grey,
                                                  size: 18,
                                                )),
                                    ])
                              ]),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }

  runFilter(String value) {
    List<Workers> result = [];
    if (value.isEmpty) {
      result = context.read<ClubProvider>().getMembersDetails();
    } else {
      result =
          context.read<ClubProvider>().getMembersDetails().where((element) {
        return element.name.toLowerCase().contains(value.toLowerCase());
      }).toList();
    }
    setState(() {
      filtetItems = result;
    });
  }
}
