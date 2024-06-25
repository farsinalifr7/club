// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:club/main.dart';
import 'package:club/model/main_member_model.dart';
import 'package:club/model/user_model.dart';
import 'package:club/provider/club_provider.dart';
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
        backgroundColor: Colors.purple,
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.purple),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
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
                                  textStyle: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          Colors.deepPurple.withOpacity(0.8)),
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
                            height: 20,
                          ),
                          if (widget.ismain == false)
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: _controllerAddress,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                  hintText: 'Age',
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
                                              isUserInput:
                                                  widget.member!.isUserInput,
                                              name: _controllerName.text,
                                              mob: _controllerNumber.text,
                                              image: useruplodedimagepath,
                                              age: _controllerAddress.text),
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
                                          isUserInput: true,
                                          name: _controllerName.text,
                                          mob: _controllerNumber.text,
                                          image: useruplodedimagepath,
                                          age: _controllerAddress.text));
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
                                color: Colors.teal.withOpacity(0.7),
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
      _controllerAddress.text = widget.member!.age;
      SaveOrUpdate = "Update";
      useruplodedimagepath = widget.member!.image;
    }
  }
}
