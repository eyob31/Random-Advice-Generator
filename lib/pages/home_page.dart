import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String quote = "Advice of the Day Goes here";

  fetchAdvice() async {
    final response =
        await http.get(Uri.parse("https://api.adviceslip.com/advice"));
    var result = json.decode(response.body);
    setState(() {
      quote = result['slip']['advice'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Advice',
          style: GoogleFonts.lato(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quote,
              textAlign: TextAlign.center,
              style: GoogleFonts.vollkorn(
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Where the quote is found
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                "Todays's advice",
                style: GoogleFonts.lora(
                  color: Colors.blueGrey,
                  fontSize: 22,
                  // fontWeight: FontWeight.w900,
                ),
              ),
            ),

            const SizedBox(
              height: 100.0,
            ),

            // Regenerate New Quote Button

            Center(
              child: MaterialButton(
                onPressed: () {
                  fetchAdvice();
                },
                padding: const EdgeInsets.all(20),
                elevation: 50.0,
                color: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'New Advice',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
