// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controller/api_controller.dart';
import '../models/video_model.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiController controller = Get.find<ApiController>();

  @override
  void initState() {
    // getVideoDetails();
    // controller.getVideosData();
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
            textStyle: TextStyle(
              color: const Color(0xff1A202C),
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: FutureBuilder<VideoModel>(
        future: controller.getVideosData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.results!.length,
              itemBuilder: (context, index) {
                final snap = snapshot.data!.results!;
                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                            height: 192.h,
                            width: double.maxFinite,
                          ),
                          Positioned(
                            right: 8,
                            bottom: 8,
                            child: Container(
                              height: 17.h,
                              width: 34.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black,
                              ),
                              child: Text(
                                snap[index].duration.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(5),
                        // minLeadingWidth: 0,
                        // minVerticalPadding: 0,
                        horizontalTitleGap: 8,
                        leading: CircleAvatar(
                          radius: 34.r,
                          backgroundColor: Colors.teal,
                          backgroundImage:
                              NetworkImage(snap[index].channelImage.toString()),
                        ),
                        title: Text(
                          snap[index].title.toString(),
                          textAlign: TextAlign.start,
                          style: GoogleFonts.hindSiliguri(
                            textStyle: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          '${snap[index].viewers.toString()} views  .   Feb 21, 2021',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Color(0xff718096),
                              fontSize: 13.sp,
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
          }

          return Center(child: Text('Nothing to show'));
        },
      ),
    );
  }
}
