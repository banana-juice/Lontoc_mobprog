import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lontoc_mobprog/widgets/custom_text.dart';
import 'package:lontoc_mobprog/widgets/post_action_button.dart';
import 'package:lontoc_mobprog/widgets/post_image.dart';
import 'package:lontoc_mobprog/widgets/user_avatar.dart';
import 'package:material_ui/material_ui.dart';

class NewsfeedCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final DateTime date;
  final int? numOfLikes;
  final int? numOfComments;
  final String? imagePath;
  final String? avatarPath;
  final String? currentUserAvatarPath;
  final String? photoCredit;

  /// Shows a placeholder box when the post has no [imagePath] yet.
  final bool hasPlaceholder;

  const NewsfeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes,
    this.numOfComments,
    this.imagePath,
    this.avatarPath,
    this.currentUserAvatarPath,
    this.photoCredit,
    this.hasPlaceholder = false,
  });

  static const List<String> _months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', //
    'August', 'September', 'October', 'November', 'December',
  ];

  /// "25 minutes ago" for recent posts, "November 20, 2026" after a week.
  static String formatDate(DateTime date, {DateTime? now}) {
    final age = (now ?? DateTime.now()).difference(date);
    String ago(int n, String unit) => '$n $unit${n == 1 ? '' : 's'} ago';

    if (!age.isNegative) {
      if (age.inMinutes < 1) return 'Just now';
      if (age.inHours < 1) return ago(age.inMinutes, 'minute');
      if (age.inDays < 1) return ago(age.inHours, 'hour');
      if (age.inDays < 7) return ago(age.inDays, 'day');
    }
    return '${_months[date.month - 1]} ${date.day}, ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final screenUtilSp = ScreenUtil().setSp(10);
    final screenUtilWidth = ScreenUtil().setWidth(10);
    final screenUtilFontUserNameSize = ScreenUtil().setSp(15);
    final screenUtilIconSize = ScreenUtil().setSp(15);

    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(screenUtilSp),
      child: Padding(
        padding: EdgeInsets.all(screenUtilSp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserAvatar(imagePath: avatarPath, userName: userName),
                SizedBox(width: screenUtilWidth),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: userName,
                      fontSize: screenUtilFontUserNameSize,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: formatDate(date),
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(3)),
                        Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: screenUtilIconSize,
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.more_horiz),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            // post Content
            CustomText(
              text: postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            if (imagePath != null)
              PostImage(imagePath: imagePath!)
            else if (hasPlaceholder)
              const PostPlaceholder(),
            if (imagePath != null && photoCredit != null)
              Padding(
                padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(3),
                  bottom: ScreenUtil().setHeight(5),
                ),
                child: CustomText(
                  text: photoCredit!,
                  fontSize: ScreenUtil().setSp(9),
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LikeButton(initialLikes: numOfLikes ?? 0),
                CommentButton(numOfComments: numOfComments ?? 0),
                PostActionButton(
                  icon: Icons.share,
                  label: 'Share',
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: [
                UserAvatar(
                  imagePath: currentUserAvatarPath,
                  userName: 'Me',
                  radius: 15,
                ),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(10),
                      0,
                      0,
                      0,
                    ),
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil().setHeight(25),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil().setSp(10)),
                      ),
                    ),
                    child: CustomText(
                      text: 'Write a comment...',
                      fontSize: ScreenUtil().setSp(11),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            CustomText(
              text: 'View all comments',
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
