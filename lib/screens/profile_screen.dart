import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lontoc_mobprog/constants.dart';
import 'package:lontoc_mobprog/widgets/custom_text.dart';
import 'package:lontoc_mobprog/widgets/user_avatar.dart';
import 'package:material_ui/material_ui.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: ScreenUtil().setHeight(30)),
          const UserAvatar(
            imagePath: 'assets/images/my_avatar.jpg',
            userName: 'Lontoc',
            radius: 50,
          ),
          SizedBox(height: ScreenUtil().setHeight(10)),
          CustomText(
            text: 'Lontoc',
            fontSize: ScreenUtil().setSp(22),
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          CustomText(
            text: 'K-pop fan on $appName',
            fontSize: ScreenUtil().setSp(13),
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
