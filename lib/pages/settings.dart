import 'package:club/model/settings_item_model.dart';
import 'package:club/pages/achivment_details.dart';
import 'package:club/pages/contacts_numbers.dart';
import 'package:club/pages/home_page.dart';
import 'package:club/pages/notification.dart';
import 'package:club/pages/payment_details.dart';
import 'package:club/pages/userinfo_add.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    List<SettingsItemModel> items = [
      SettingsItemModel(icondate: Icons.add, title: "Add Main Member"),
      SettingsItemModel(icondate: Icons.payment, title: "Payment Details"),
      SettingsItemModel(
          icondate: Icons.archive_rounded, title: "Achievement Details"),
      SettingsItemModel(
          icondate: Icons.notification_add, title: "Add Notification"),
      SettingsItemModel(
          icondate: Icons.phone_android, title: "Contact Numbers"),
    ];
    List<Color> colors = [
      Colors.purple,
      Colors.deepPurple,
      Colors.teal,
      Colors.blueGrey,
      Colors.brown,
      Colors.orange,
    ];
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text(
            'Settings',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            if (items[index].title == "Achievement Details")
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AchivmentDetails()));
                            if (items[index].title == "Add Main Member")
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const UserinfoAdd(
                                            ismain: true,
                                            member: null,
                                          )));
                            if (items[index].title == "Payment Details")
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PaymentDetails()));
                            if (items[index].title == "Contact Numbers")
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ContactsNumbers()));
                            if (items[index].title == "Add Notification")
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Notification1()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: const Offset(5, 5),
                                    blurRadius: 5,
                                    spreadRadius: 3,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: colors[index].withOpacity(0.7)),
                            height: 100,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: double.infinity,
                                  width: 250,
                                  child: Center(
                                    child: Text(
                                      items[index].title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Icon(
                                  items[index].icondate,
                                  size: 35,
                                  color: Colors.grey[200],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
