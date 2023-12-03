// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_video_player/screens/widgets/new_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import './widgets/react_button.dart';
import './widgets/channel_section.dart';
import './widgets/comment_section.dart';

class DetailsPage extends StatefulWidget {
  static const routeName = "/details-page";

  final String? channelName,
      channelImage,
      title,
      views,
      subscribers,
      thumbnail,
      videoUrl;

  const DetailsPage({
    super.key,
    this.channelName,
    this.title,
    this.views,
    this.subscribers,
    this.thumbnail,
    this.channelImage,
    this.videoUrl,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl.toString()),
    );
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      placeholder: Image.network(
        widget.thumbnail.toString(),
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    SizedBox(
                      height: 211,
                      width: double.maxFinite,
                      child: Chewie(controller: _chewieController),
                    ),
                    Positioned(
                      top: 5,
                      left: 5,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                contentPadding: EdgeInsets.all(10),
                // minLeadingWidth: 0,
                // minVerticalPadding: 0,
                horizontalTitleGap: 8,
                title: Text(
                  // snap[index].title.toString(),
                  widget.title.toString(),
                  textAlign: TextAlign.start,
                  style: GoogleFonts.hindSiliguri(
                    textStyle: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                subtitle: Text(
                  // ${snap[index].viewers.toString()}
                  ' ${widget.views.toString()} views  .   3 days ago',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: Color(0xff718096),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ReactButton(
                    icon: Icons.favorite_border,
                    text: 'MASH ALLAH (12k)',
                  ),
                  ReactButton(
                    icon: Icons.thumb_up_alt_outlined,
                    text: 'LIKE (12k)',
                  ),
                  ReactButton(
                    icon: Icons.share,
                    text: 'SHARE',
                  ),
                  ReactButton(
                    icon: Icons.emoji_flags_outlined,
                    text: 'REPORT',
                  ),
                ],
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NewPage(
                        title: widget.channelName.toString(),
                      ),
                    ),
                  );
                },
                child: ChannelSection(
                  channelImage: widget.channelImage.toString(),
                  channelName: widget.channelName.toString(),
                  subscribers: widget.subscribers.toString(),
                ),
              ),
              Divider(color: Colors.grey),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NewPage(title: 'Comment'),
                    ),
                  );
                },
                child: CommentSection(),
              ),
              SizedBox(height: 15),
              Divider(color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
