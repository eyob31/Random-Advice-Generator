import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Daily Advices',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            // next Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const HomePage(),
                  ),
                );
              },
              child: const CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.blueGrey,
                child: Icon(
                  Icons.chevron_right_sharp,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
