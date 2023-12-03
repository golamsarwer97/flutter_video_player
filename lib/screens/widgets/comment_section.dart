import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Comments 7.5k'),
              Spacer(),
              Icon(Icons.unfold_more),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: 'Add Comment',
                contentPadding: EdgeInsets.all(8),
                suffixIcon: Icon(Icons.send),
              ),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(5),
            // minLeadingWidth: 0,
            // minVerticalPadding: 0,
            horizontalTitleGap: 8,
            leading: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: CircleAvatar(
                radius: 18.r,
                backgroundColor: Colors.teal,
                // backgroundImage:
                //     NetworkImage(snap[index].channelImage.toString()),
              ),
            ),
            title: Row(
              children: [
                Text(
                  // snap[index].title.toString(),
                  'Fahmida khanom',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.hindSiliguri(
                    textStyle: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  // snap[index].title.toString(),
                  '2 Days ago',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.hindSiliguri(
                    textStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            subtitle: Text(
              // ${snap[index].viewers.toString()}
              'হুজুরের বক্তব্য গুলো ইংরেজি তে অনুবাদ করে সারা পৃথিবীর মানুষদের কে শুনিয়ে দিতে হবে। কথা গুলো খুব দামি',
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
