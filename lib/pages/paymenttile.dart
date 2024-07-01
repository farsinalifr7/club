// ignore_for_file: public_member_api_docs, sort_constructors_first
//import 'package:club/model/paymentmodel.dart';
import 'package:club/model/paymentmodel.dart';
import 'package:club/pages/payment_details.dart';
import 'package:club/provider/club_provider.dart';
import 'package:flutter/material.dart';

import 'package:club/model/user_model.dart';
import 'package:provider/provider.dart';

class Paymenttile extends StatefulWidget {
  final Workers member;
  final int number;
  const Paymenttile({
    super.key,
    required this.member,
    required this.number,
  });

  @override
  State<Paymenttile> createState() => _PaymenttileState();
}

class _PaymenttileState extends State<Paymenttile> {
  bool isChecked = false;
  bool isChecked2 = false;
  bool showEdit = false;

  late Workers updatedMember;

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.member.name,
          style: const TextStyle(
              color: Colors.grey, fontSize: 28, fontWeight: FontWeight.w800),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaymentDetails()));
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      _controller.text = "";
                      isChecked = false;
                      isChecked2 = false;
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Consumer<ClubProvider>(
                                builder: (_, value, __) {
                              return AlertDialog(
                                  title: const Text(
                                    "Add Notification",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextField(
                                          controller: _controller,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "Enter Year",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Checkbox(
                                                  value: isChecked,
                                                  onChanged: (val) {
                                                    if (val != null) {
                                                      isChecked = val;
                                                      setState(() {});
                                                    }
                                                  },
                                                ),
                                                const Text('First Term'),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Checkbox(
                                                  value: isChecked2,
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      isChecked2 = newValue!;
                                                    });
                                                  },
                                                ),
                                                const Text('Second Term'),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: Colors.amber,
                                                ),
                                                height: 35,
                                                width: 80,
                                                child: const Center(
                                                    child: Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16),
                                                )),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                widget.member.payment.add(
                                                  Paymentmodel(
                                                      Year: _controller.text,
                                                      first: isChecked,
                                                      second: isChecked2),
                                                );
                                                value.updateorEditpayment(
                                                    widget.number,
                                                    widget.member);
                                                clear();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: Text(
                                                    "Payment Information added Successfully!",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  backgroundColor: Colors.black,
                                                  duration:
                                                      Duration(seconds: 1),
                                                ));
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: Colors.lightBlue[900],
                                                ),
                                                height: 35,
                                                width: 80,
                                                child: const Center(
                                                    child: Text(
                                                  "Save",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(5, 5),
                            blurRadius: 4,
                            spreadRadius: 5,
                          ),
                        ],
                        color: Colors.purple.withOpacity(0.8),
                        // borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        showEdit = !showEdit;
                      });
                    },
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(5, 5),
                            blurRadius: 4,
                            spreadRadius: 5,
                          ),
                        ],
                        color: Colors.deepPurple.withOpacity(0.8),
                        // borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 45,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payments",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: SizedBox(
                width: double.infinity,
                height: 400,
                child: Consumer<ClubProvider>(builder: (_, val, __) {
                  return ListView.builder(
                      itemCount:
                          val.getMembersDetails()[widget.number].payment.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: InkWell(
                            onTap: () {
                              _controller.text = val
                                  .getMembersDetails()[widget.number]
                                  .payment[index]
                                  .Year
                                  .toString();
                              isChecked = val
                                  .getMembersDetails()[widget.number]
                                  .payment[index]
                                  .first;
                              isChecked2 = val
                                  .getMembersDetails()[widget.number]
                                  .payment[index]
                                  .second;

                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Consumer<ClubProvider>(
                                        builder: (_, value, __) {
                                      return AlertDialog(
                                          title: const Text(
                                            "Edit Payment",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                TextField(
                                                  controller: _controller,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration:
                                                      const InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    labelText: "Enter Year",
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Checkbox(
                                                          value: isChecked,
                                                          onChanged:
                                                              (newValue) {
                                                            setState(() {
                                                              isChecked =
                                                                  newValue!;
                                                            });
                                                          },
                                                        ),
                                                        const Text(
                                                            'First Term'),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Checkbox(
                                                          value: isChecked2,
                                                          onChanged:
                                                              (newValue) {
                                                            setState(() {
                                                              isChecked2 =
                                                                  newValue!;
                                                            });
                                                          },
                                                        ),
                                                        const Text(
                                                            'Second Term'),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.amber,
                                                        ),
                                                        height: 35,
                                                        width: 70,
                                                        child: const Center(
                                                            child: Text(
                                                          "Cancel",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16),
                                                        )),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        widget.member.payment
                                                            .remove(widget
                                                                    .member
                                                                    .payment[
                                                                index]);
                                                        value
                                                            .updateorEditpayment(
                                                                widget.number,
                                                                widget.member);
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                          content: Text(
                                                            "Payment Information updated Successfully!",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          backgroundColor:
                                                              Colors.black,
                                                          duration: Duration(
                                                              seconds: 1),
                                                        ));
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors.purple,
                                                        ),
                                                        height: 35,
                                                        width: 70,
                                                        child: const Center(
                                                            child: Text(
                                                          "delete",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16),
                                                        )),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        widget
                                                                .member
                                                                .payment[index]
                                                                .Year =
                                                            _controller.text;

                                                        widget
                                                            .member
                                                            .payment[index]
                                                            .first = isChecked;

                                                        widget
                                                                .member
                                                                .payment[index]
                                                                .second =
                                                            isChecked2;
                                                        value
                                                            .updateorEditpayment(
                                                                widget.number,
                                                                widget.member);
                                                        clear();
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                          content: Text(
                                                            "Payment Information Updated Successfully!",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          backgroundColor:
                                                              Colors.black,
                                                          duration: Duration(
                                                              seconds: 1),
                                                        ));
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: Colors
                                                              .lightBlue[900],
                                                        ),
                                                        height: 35,
                                                        width: 70,
                                                        child: const Center(
                                                            child: Text(
                                                          "update",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
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
                            },
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  val
                                      .getMembersDetails()[widget.number]
                                      .payment[index]
                                      .Year,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                val
                                            .getMembersDetails()[widget.number]
                                            .payment[index]
                                            .first ==
                                        true
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      )
                                    : const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                                const SizedBox(
                                  width: 50,
                                ),
                                val
                                            .getMembersDetails()[widget.number]
                                            .payment[index]
                                            .second ==
                                        true
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      )
                                    : const Icon(Icons.close,
                                        color: Colors.red),
                                const SizedBox(
                                  width: 50,
                                ),
                                if (showEdit)
                                  const Icon(
                                    Icons.edit,
                                    color: Colors.grey,
                                  ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void clear() {
    _controller.text = "";
  }
}
