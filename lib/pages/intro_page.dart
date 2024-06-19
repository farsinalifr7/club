import 'package:club/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 130,
            ),
            SizedBox(
                height: 289,
                width: 350,
                child: Image.asset(
                  "asset/images/Screenshot__321_-removebg-preview.png",
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 20,
            ),
            Text(" Therkkayam Yuvajana ",
                style: GoogleFonts.aleo(
                  textStyle: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                )),
            Text(" Sangam ",
                style: GoogleFonts.aleo(
                  textStyle: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                )),
            const SizedBox(
              height: 30,
            ),
            Text(
                " you can easily find a sports buddy in your own neighborhood to do what you like together!",
                style: GoogleFonts.lora(
                  textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[500]),
                )),
            const SizedBox(
              height: 40,
            ),
            Center(
                child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                width: 320,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Colors.black, Colors.grey, Colors.black]),
                  borderRadius: BorderRadius.circular(10),
                  //color: Colors.purple[500]
                ),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Get Started",
                        style: GoogleFonts.aleo(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )
                  ],
                )),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
