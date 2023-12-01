// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Trending Videos',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
                color: Color(0xff1A202C),
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Placeholder(
                  fallbackHeight: 192,
                  fallbackWidth: double.infinity,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(5),
                  // minLeadingWidth: 0,
                  // minVerticalPadding: 0,
                  horizontalTitleGap: 8,
                  leading: CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.teal,
                  ),
                  title: Text(
                    'আরব নেতাদের যে ভুলে ফি*লি*স্তি*নের এই দুর্দাশা | আবু ত্বহা মুহাম্মদ আদনান',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.hindSiliguri(
                        textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                  subtitle: Text(
                    '53,245 views  .   Feb 21, 2021',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: Color(0xff718096),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  trailing: Icon(
                    Icons.more_vert,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
