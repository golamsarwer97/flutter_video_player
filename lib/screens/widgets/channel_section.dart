import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChannelSection extends StatelessWidget {
  final String channelImage, channelName, subscribers;
  const ChannelSection({
    super.key,
    required this.channelImage,
    required this.channelName,
    required this.subscribers,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(5),
      horizontalTitleGap: 8,
      leading: CircleAvatar(
        radius: 34.r,
        backgroundColor: Colors.teal,
        backgroundImage: NetworkImage(channelImage),
      ),
      title: Text(
        channelName,
        textAlign: TextAlign.start,
        style: GoogleFonts.hindSiliguri(
          textStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      subtitle: Text(
        '$subscribers Subscribers',
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            color: const Color(0xff718096),
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      trailing: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: const Text(
          'Subscribe',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff3898FC),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}
