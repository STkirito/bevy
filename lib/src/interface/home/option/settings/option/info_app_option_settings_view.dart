import 'package:bevy/src/interface/shared/background_info_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoAppOptionSettingsView extends StatelessWidget {
  const InfoAppOptionSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundInfoApp(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bevy',
            style: GoogleFonts.dancingScript(
                fontWeight: FontWeight.w700, color: Colors.white, fontSize: 40),
          ),
          const SizedBox(height: 10),
          Text(
            'V 1.0.0',
            style: GoogleFonts.dancingScript(
                fontWeight: FontWeight.w700, color: Colors.white, fontSize: 15),
          ),
        ],
      )),
    );
  }
}
