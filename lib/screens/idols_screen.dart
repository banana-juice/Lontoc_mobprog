import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lontoc_mobprog/constants.dart';
import 'package:lontoc_mobprog/widgets/custom_text.dart';
import 'package:lontoc_mobprog/widgets/user_avatar.dart';
import 'package:material_ui/material_ui.dart';

class IdolsScreen extends StatelessWidget {
  const IdolsScreen({super.key});

  static const List<({String name, String group, String? avatar})> _idols = [
    (name: 'Kim Minji', group: 'NewJeans', avatar: null),
    (name: 'Kang Haerin', group: 'NewJeans', avatar: null),
    (name: 'Park Jihyo', group: 'TWICE', avatar: null),
    (name: 'Sakura Miyawaki', group: 'LE SSERAFIM', avatar: null),
    (name: 'Kim Chaewon', group: 'LE SSERAFIM', avatar: null),
    (name: 'Karina', group: 'aespa', avatar: 'assets/images/karina.jpg'),
    (name: 'Winter', group: 'aespa', avatar: 'assets/images/winter.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _idols.length,
      itemBuilder: (context, index) {
        final idol = _idols[index];
        return ListTile(
          leading: UserAvatar(imagePath: idol.avatar, userName: idol.name),
          title: CustomText(
            text: idol.name,
            fontSize: ScreenUtil().setSp(15),
            color: appDark,
            fontWeight: FontWeight.bold,
          ),
          subtitle: CustomText(
            text: idol.group,
            fontSize: ScreenUtil().setSp(12),
            color: appPrimary,
          ),
        );
      },
    );
  }
}
