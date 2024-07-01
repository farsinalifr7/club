import 'package:club/main.dart';
import 'package:club/model/user_model.dart';
import 'package:club/pages/paymenttile.dart';
import 'package:club/pages/settings.dart';
import 'package:club/provider/club_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

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
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Settings()));
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
        title: const Text(
          "Payment Details",
          style: TextStyle(
              color: Colors.grey, fontSize: 33, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  height: 120,
                  width: 147,
                  decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        context
                            .read<ClubProvider>()
                            .getNumberofpaid()
                            .toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 33,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Paid",
                        style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 120,
                  width: 147,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        (context
                                    .read<ClubProvider>()
                                    .getMembersDetails()
                                    .length -
                                context.read<ClubProvider>().getNumberofpaid())
                            .toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 33,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Remaining",
                        style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Members",
                  style: GoogleFonts.notoSansOsmanya(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black)),
                ),
                Text("See All",
                    style: GoogleFonts.notoSansOsmanya(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[500]))),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount:
                        context.read<ClubProvider>().getMembersDetails().length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Paymenttile(
                                          number: index,
                                          member: context
                                              .read<ClubProvider>()
                                              .getMembersDetails()[index],
                                        )));
                          },
                          child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              //color: Colors.white,
                            ),
                            child: ListTile(
                              // leading: CircleAvatar(
                              //   radius: 22,
                              //   backgroundColor: colors[index].withOpacity(0.8),
                              //   child: Text(
                              //     context
                              //         .read<ClubProvider>()
                              //         .getMembersDetails()[index]
                              //         .name
                              //         .substring(0, 2)
                              //         .toUpperCase(),
                              //     style: const TextStyle(
                              //         color: Colors.white,
                              //         fontWeight: FontWeight.w600,
                              //         fontSize: 20),
                              //   ),
                              // ),
                              title: Text(context
                                  .read<ClubProvider>()
                                  .getMembersDetails()[index]
                                  .name),
                              subtitle: Text(context
                                  .read<ClubProvider>()
                                  .getMembersDetails()[index]
                                  .mob),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey[400],
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
