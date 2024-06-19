import 'package:club/model/user_model.dart';
import 'package:club/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkesDetails extends StatelessWidget {
  WorkesDetails({super.key});

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
  List<Workers> workerList = [
    Workers(
        name: "Ajnas",
        mob: "930344542",
        image: "asset/images/peson1-removebg-preview.png",
        payment: "1200"),
    Workers(
        name: "Ameer",
        mob: "966454562",
        image: "asset/images/person2-removebg-preview.png",
        payment: "1100"),
    Workers(
        name: "Ansy",
        mob: "99563179",
        image: "asset/images/person3-removebg-preview.png",
        payment: "1150"),
    Workers(
        name: "Nishana",
        mob: "95656764",
        image: "asset/images/person4-removebg-preview.png",
        payment: "1100"),
    Workers(
        name: "Masood",
        mob: "99563179",
        image: "asset/images/person5-removebg-preview.png",
        payment: "1150"),
    Workers(
        name: "Akshay",
        mob: "623566339",
        image: "asset/images/person6-removebg-preview.png",
        payment: "1100"),
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
              child: const TextField(
                // onChanged: (value) => runFilter(value),
                decoration: InputDecoration(
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
                  itemCount: workerList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 85,
                        decoration: BoxDecoration(
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
                                              backgroundColor:
                                                  color[index].withOpacity(0.4),
                                              child: SizedBox(
                                                height: 55,
                                                width: 50,
                                                child: Image.asset(
                                                    workerList[index].image),
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
                                              workerList[index].name,
                                              style: GoogleFonts.lora(
                                                textStyle: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            Text(
                                              workerList[index].mob,
                                              style: TextStyle(
                                                  color: Colors.grey[600]),
                                            ),
                                            Text(
                                              " ₹ ${workerList[index].payment} / day",
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
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(right: 12, top: 12),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.grey,
                                        size: 18,
                                      ),
                                    ),
                                  ])
                            ]),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
