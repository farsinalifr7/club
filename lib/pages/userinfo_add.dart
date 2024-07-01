// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:club/main.dart';
import 'package:club/model/main_member_model.dart';
import 'package:club/model/user_model.dart';
import 'package:club/pages/show_members.dart';
import 'package:club/provider/club_provider.dart';
import 'package:date_format/date_format.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:club/pages/home_page.dart';
import 'package:provider/provider.dart';

class UserinfoAdd extends StatefulWidget {
  final bool ismain;

  final Workers? member;
  const UserinfoAdd({
    super.key,
    required this.ismain,
    required this.member,
  });

  @override
  State<UserinfoAdd> createState() => _UserinfoAddState();
}

class _UserinfoAddState extends State<UserinfoAdd> {
  DateTime? selectedDate = DateTime.now();
  String useruplodedimagepath = "";
  String SaveOrUpdate = "Save";
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerNumber = TextEditingController();
  final TextEditingController _controllerAddress = TextEditingController();
  late int index1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    leading();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerName.text = "";
    _controllerNumber.text = "";
    _controllerAddress.text = "";
    SaveOrUpdate = "Save";
    useruplodedimagepath = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[400],
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.purple[400]),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.grey[200],
                                    size: 30,
                                  )),
                            ),
                            if (widget.ismain == false && widget.member != null)
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
                                                        "Do you want to delete this Member ?"),
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
                                                            child: const Center(
                                                                child: Text(
                                                              "Cancel",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 16),
                                                            )),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            context
                                                                .read<
                                                                    ClubProvider>()
                                                                .removeMembersDetails(
                                                                    widget
                                                                        .member!);

                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    const SnackBar(
                                                              content: Text(
                                                                "Member Deleted Successfully!",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              backgroundColor:
                                                                  Colors.black,
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          1),
                                                            ));
                                                            Navigator.pop(
                                                                context);
                                                            Navigator
                                                                .pushReplacement(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            const MembersInfo(
                                                                              editorNot: false,
                                                                            )));
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                color: Colors
                                                                    .purple),
                                                            height: 35,
                                                            width: 80,
                                                            child: const Center(
                                                                child: Text(
                                                              "Delete",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
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
                                  //...........................

                                  //........................................
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.grey[200],
                                  size: 30,
                                ),
                              ),
                          ],
                        ),
                        Text(
                            widget.member == null
                                ? "ADD MEMBER"
                                : "EDIT MEMBER",
                            style: GoogleFonts.aleo(
                              textStyle: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 9,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: SingleChildScrollView(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //if (widget.member != null)
                          if (false)
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: widget.member!.isUserInput == true
                                    ? Image.file(File(widget.member!.image))
                                    : Image.asset(widget.member!.image),
                              ),
                            ),
                          SizedBox(
                            height: 100,
                            child: Center(
                              child: Text(
                                "Tell us about yourself",
                                style: GoogleFonts.aleo(
                                  textStyle: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          TextField(
                            controller: _controllerName,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                                hintText: 'Name',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: _controllerNumber,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                                hintText: 'Mobil No',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          if (widget.ismain == false)
                            InkWell(
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2023, 1, 1),
                                  lastDate: DateTime(2024, 12, 31),
                                ).then((value) {
                                  setState(() {
                                    selectedDate = value!;
                                  });
                                });
                              },
                              child: Container(
                                height: 55,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    //borderRadius: BorderRadius.circular(5),
                                    // border: Border.only(color: Colors.grey)
                                    ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 15),
                                  child: Text(
                                    " ${formatDate(selectedDate!, [
                                          yyyy,
                                          '/',
                                          mm,
                                          '/',
                                          dd
                                        ]).toString()}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black.withOpacity(0.7)),
                                  ),
                                ),
                              ),
                            ),
                          if (widget.ismain == false)
                            const Divider(
                              color: Colors.grey,
                            ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (widget.ismain == false)
                            if (widget.member != null &&
                                widget.member!.isUserInput == true)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        FilePickerResult? result =
                                            await FilePicker.platform
                                                .pickFiles();

                                        if (result != null) {
                                          File file =
                                              File(result.files.single.path!);
                                          useruplodedimagepath = file.path;
                                        } else {
                                          // User canceled the picker
                                        }
                                      },
                                      icon: const Icon(
                                        size: 40,
                                        Icons.add_a_photo,
                                        color: Colors.blueGrey,
                                      )),
                                  const Text(
                                    "Upload Image ",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                          if (widget.member == null && widget.ismain == false)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles();

                                      if (result != null) {
                                        File file =
                                            File(result.files.single.path!);
                                        useruplodedimagepath = file.path;
                                      } else {
                                        // User canceled the picker
                                      }
                                    },
                                    icon: const Icon(
                                      size: 40,
                                      Icons.add_a_photo,
                                      color: Colors.blueGrey,
                                    )),
                                const Text(
                                  "Upload Image ",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          const SizedBox(
                            height: 150,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (widget.ismain == true) {
                                if (_controllerName.text != "" ||
                                    _controllerName.text != "") {
                                  context.read<ClubProvider>().addMainMember(
                                      MainMember(
                                          name: _controllerName.text,
                                          number: _controllerNumber.text));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                      "Data Added Successfully!",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.black,
                                    duration: Duration(seconds: 1),
                                  ));
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                }
                              }

                              if (widget.ismain == false) {
                                // its edit
                                if (widget.member != null) {
                                  context
                                      .read<ClubProvider>()
                                      .updateMembersDetails(
                                          Workers(
                                              payment: [],
                                              isUserInput:
                                                  widget.member!.isUserInput,
                                              name: _controllerName.text,
                                              mob: _controllerNumber.text,
                                              image: useruplodedimagepath,
                                              age: selectedDate!),
                                          index1);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                      "Data Updated Successfully!",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.black,
                                    duration: Duration(seconds: 1),
                                  ));
                                }
                                if (widget.member == null) {
                                  context
                                      .read<ClubProvider>()
                                      .addMembersDetails(Workers(
                                          payment: [],
                                          isUserInput: true,
                                          name: _controllerName.text,
                                          mob: _controllerNumber.text,
                                          image: useruplodedimagepath,
                                          age: selectedDate!));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                      "Data Added Successfully!",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.black,
                                    duration: Duration(seconds: 1),
                                  ));
                                }

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              }
                            },
                            child: Container(
                              height: 55,
                              width: 290,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.withOpacity(0.7),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Center(
                                  child: Text(
                                SaveOrUpdate,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w700),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ));
  }

  void leading() {
    if (widget.member != null) {
      if (widget.member!.isUserInput == true) {}
      index1 = context
          .read<ClubProvider>()
          .getMembersDetails()
          .indexOf(widget.member!);
      _controllerName.text = widget.member!.name;
      _controllerNumber.text = widget.member!.mob;
      selectedDate = widget.member!.age;
      SaveOrUpdate = "Update";
      useruplodedimagepath = widget.member!.image;
    }
  }
}
