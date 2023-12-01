// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../models/video_model.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<VideoModel> getVideoDetails() async {
    final response = await http.get(
        Uri.parse('https://test-ximit.mahfil.net/api/trending-video/1?page=1'));
    var data = json.decode(response.body.toString());

    if (response.statusCode == 200) {
      print(data);
      return VideoModel.fromJson(data);
    } else {
      return VideoModel.fromJson(data);
    }
  }

  @override
  void initState() {
    getVideoDetails();
    super.initState();
  }

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
      body: FutureBuilder<VideoModel>(
          future: getVideoDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: snapshot.data!.results!.length,
              itemBuilder: (context, index) {
                final snap = snapshot.data!.results!;
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
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Image.network(
                            snap[index].thumbnail.toString(),
                            fit: BoxFit.cover,
                            height: 192,
                            width: double.maxFinite,
                          ),
                          Positioned(
                            right: 8,
                            bottom: 8,
                            child: Container(
                              height: 17,
                              width: 34,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black,
                              ),
                              child: Text(
                                snap[index].duration.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      // Placeholder(
                      //   fallbackHeight: 192,
                      //   fallbackWidth: double.infinity,
                      //   child: Image.network(
                      //     snap[index].thumbnail.toString(),
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      ListTile(
                        contentPadding: EdgeInsets.all(5),
                        // minLeadingWidth: 0,
                        // minVerticalPadding: 0,
                        horizontalTitleGap: 8,
                        leading: CircleAvatar(
                          radius: 34,
                          backgroundColor: Colors.teal,
                          backgroundImage:
                              NetworkImage(snap[index].channelImage.toString()),
                        ),
                        title: Text(
                          snap[index].title.toString(),
                          textAlign: TextAlign.start,
                          style: GoogleFonts.hindSiliguri(
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          '${snap[index].viewers.toString()} views  .   Feb 21, 2021',
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
            );
          }),
    );
  }
}
