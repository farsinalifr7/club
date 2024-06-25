import 'package:club/model/category.dart';
import 'package:club/model/main_member_model.dart';
import 'package:club/model/notification_model.dart';
import 'package:club/model/user_model.dart';
import 'package:flutter/material.dart';

class ClubProvider extends ChangeNotifier {
  List<MainMember> mainmembers = [
    MainMember(name: "Rashid", number: "78342322"),
    MainMember(name: "Sahil", number: "89433454"),
    MainMember(name: "Ashique", number: "667543534"),
  ];

  // Homepage Categories

  List<Category1> items = [
    Category1(
        icon: const Icon(
          Icons.show_chart_outlined,
          color: Colors.purple,
          size: 30,
        ),
        name: "Show Members",
        color: Colors.purple,
        description: "Total members"),
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

  // member details
  List<Workers> workerList = [
    Workers(
        isUserInput: false,
        name: "Ajnas",
        mob: "930344542",
        image: "asset/images/peson1-removebg-preview.png",
        age: "24"),
    Workers(
        isUserInput: false,
        name: "Ameer",
        mob: "966454562",
        image: "asset/images/person2-removebg-preview.png",
        age: "26"),
    Workers(
        isUserInput: false,
        name: "Ansy",
        mob: "99563179",
        image: "asset/images/person3-removebg-preview.png",
        age: "28"),
    Workers(
        isUserInput: false,
        name: "Nishana",
        mob: "95656764",
        image: "asset/images/person4-removebg-preview.png",
        age: "32"),
    Workers(
        isUserInput: false,
        name: "Masood",
        mob: "99563179",
        image: "asset/images/person5-removebg-preview.png",
        age: "32"),
    Workers(
        isUserInput: false,
        name: "Akshay",
        mob: "623566339",
        image: "asset/images/person6-removebg-preview.png",
        age: "30"),
  ];

  List<NotificationModel> notifications = [
    NotificationModel(
        time: DateTime.now(),
        title: "FoodBall Match",
        description: "foodBall Match contectod in vengara turf "),
    NotificationModel(
        time: DateTime.now(),
        title: "Cricket Match",
        description: "Cricket Match contectod in vengara turf "),
    NotificationModel(
        time: DateTime.now(), title: "Rent", description: "Rs 400 Club rent "),
  ];

  List<MainMember> contacts = [
    MainMember(name: "Vengara", number: "94543454622"),
    MainMember(name: "kakkad", number: "5764397654"),
    MainMember(name: "Kottakkal", number: "5753689765"),
    MainMember(name: "kannattipadi", number: "9675432064")
  ];
  // get list of Contacts
  List<MainMember> getContacts() {
    return contacts;
  }

  // add contact to list of Contacts
  void addContacts(MainMember item) {
    contacts.add(item);
    notifyListeners();
  }

  // remove contact from list of Contacts
  void removeContacts(MainMember item) {
    contacts.remove(item);
    notifyListeners();
  }

  // achievement list
  List<String> achivments = [
    "Win PS1",
    "Runner Up PS2",
  ];
// get list of achievement
  List<String> getAchivment() {
    return achivments;
  }

  void addAchivment(String achivment) {
    achivments.add(achivment);
    notifyListeners();
  }

  // remove achivment
  void removeAchivment(String achivment) {
    achivments.remove(achivment);
    notifyListeners();
  }

  // get members details
  List<Workers> getMembersDetails() {
    return workerList;
  }

  // add member details
  void addMembersDetails(Workers item) {
    workerList.add(item);
    notifyListeners();
  }

  // remove member details
  void removeMembersDetails(Workers item) {
    workerList.remove(item);
    notifyListeners();
  }

  // update member details
  void updateMembersDetails(Workers item, int index) {
    // int index = workerList.indexOf(item);
    workerList[index] = item;
    notifyListeners();
  }

  List<Category1> getHomeCategories() {
    return items;
  }

  void addMainMember(MainMember item) {
    mainmembers.add(item);
    notifyListeners();
  }

  void removeMainMember(MainMember item) {
    mainmembers.remove(item);
    notifyListeners();
  }

  List<MainMember> getMainmembers() {
    return mainmembers;
  }

//........................Notifications...................................
  // get notifications from the list
  List<NotificationModel> getNotifications() {
    return notifications;
  }

  // add notification to the list
  void addNotification(NotificationModel item) {
    notifications.add(item);
    notifyListeners();
  }

  // remove notification from the list
  void removeNotification(NotificationModel item) {
    notifications.remove(item);
    notifyListeners();
  }
}
