import 'package:club/model/category.dart';
import 'package:club/model/droweritem.dart';
import 'package:club/model/main_member_model.dart';
import 'package:club/pages/add_user.dart';
import 'package:club/pages/intro_page.dart';
import 'package:club/pages/show_members.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<Droweritem> droweritems = [];

  List<MainMember> mainmembers = [
    MainMember(name: "Rashid", number: "78342322"),
    MainMember(name: "Sahil", number: "89433454"),
    MainMember(name: "Ashique", number: "667543534"),
  ];
  List<Color> colors = [
    Colors.deepPurple,
    Colors.purple,
    Colors.teal,
    Colors.blueGrey,
    Colors.grey,
    Colors.indigo,
  ];
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    List<Category1> items = [
      Category1(
          icon: const Icon(
            Icons.show_chart_outlined,
            color: Colors.purple,
            size: 30,
          ),
          name: "Show Members",
          color: Colors.purple,
          description: "Total members 13"),
      Category1(
          icon: const Icon(
            Icons.add_outlined,
            color: Colors.teal,
            size: 30,
          ),
          name: "Add Member",
          color: Colors.teal,
          description: "Admin only"),
      Category1(
          icon: const Icon(
            Icons.edit_outlined,
            color: Colors.deepPurple,
            size: 30,
          ),
          name: "Edit Details",
          color: Colors.deepPurple,
          description: "Admin only"),
      Category1(
          icon: const Icon(
            Icons.settings_outlined,
            color: Colors.blueGrey,
            size: 30,
          ),
          name: "Settings",
          color: Colors.blueGrey,
          description: ""),
    ];

    return Scaffold(
        drawer: Drawer(
            child: DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "asset/images/Screenshot__321_-removebg-preview.png",
                width: 400,
                height: 150,
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: Text(
                  "Home Page",
                  style: GoogleFonts.aleo(
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IntroPage()));
                },
                leading: const Icon(
                  Icons.start,
                  color: Colors.black,
                ),
                title: Text(
                  "Intro Page",
                  style: GoogleFonts.aleo(
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        )),
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[100],
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                scaffoldKey.currentState!.openDrawer();
              },
              child: Image.asset(
                "asset/images/image.png",
                width: 40,
                height: 40,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset("asset/images/user.png"),
            )
          ],
          title: Text('Home page',
              style: GoogleFonts.aleo(
                textStyle: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            SizedBox(
              height: 435,
              child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                      childAspectRatio: 1 / 1.3,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: InkWell(
                        onTap: () {
                          if (items[index].name == "Show Members") {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WorkesDetails()));
                          }
                          if (items[index].name == "Add Member") {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddUser()));
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 44,
                                  width: 44,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    //color: items[index].color,
                                  ),
                                  child: items[index].icon,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text(items[index].name,
                                    style: GoogleFonts.notoSansOsmanya(
                                        textStyle: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ))),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(items[index].description,
                                    style: GoogleFonts.notoSansOsmanya(
                                        textStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[500],
                                    ))),
                                const SizedBox(
                                  height: 23,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(""),
                                    Container(
                                      height: 4,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: items[index].color,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Members",
                  style: GoogleFonts.notoSansOsmanya(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black)),
                ),
                Text("See All",
                    style: GoogleFonts.notoSansOsmanya(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[500]))),
              ],
            ),
            SizedBox(
                height: 150,
                child: Expanded(
                    child: ListView.builder(
                        itemCount: mainmembers.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 22,
                                  backgroundColor: colors[index],
                                  child: Text(
                                    mainmembers[index]
                                        .name
                                        .substring(0, 2)
                                        .toUpperCase(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ),
                                title: Text(mainmembers[index].name),
                                subtitle: Text(mainmembers[index].number),
                              ),
                            ),
                          );
                        })))
          ]),
        ));
  }
}
