import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lontoc_mobprog/constants.dart';
import 'package:lontoc_mobprog/widgets/custom_text.dart';
import 'package:lontoc_mobprog/widgets/user_avatar.dart';
import 'package:material_ui/material_ui.dart';

/// One row of the notification list.
///
/// Named NotificationCard because Flutter already has a class called
/// Notification.
class NotificationCard extends StatelessWidget {
  final String name;
  final String post;
  final String description;
  final String? avatarPath;
  final VoidCallback? onTap;

  const NotificationCard({
    super.key,
    required this.name,
    required this.post,
    required this.description,
    this.avatarPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12)),
        ),
        child: Row(
          children: [
            UserAvatar(imagePath: avatarPath, userName: name),
            SizedBox(width: ScreenUtil().setWidth(10)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: name,
                    fontSize: ScreenUtil().setSp(18),
                    color: appDark,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: 'Post: $post',
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.black87,
                  ),
                  CustomText(
                    text: description,
                    fontSize: ScreenUtil().setSp(11),
                    color: Colors.black87,
                    fontStyle: FontStyle.italic,
                  ),
                ],
              ),
            ),
            const Icon(Icons.more_horiz),
          ],
        ),
      ),
    );
  }
}
