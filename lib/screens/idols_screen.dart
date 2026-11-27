import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lontoc_mobprog/constants.dart';
import 'package:lontoc_mobprog/widgets/custom_text.dart';
import 'package:lontoc_mobprog/widgets/user_avatar.dart';
import 'package:material_ui/material_ui.dart';

class IdolsScreen extends StatelessWidget {
  const IdolsScreen({super.key});

  static const List<({String name, String group, String? avatar})> _idols = [
    (name: 'Kim Minji', group: 'NewJeans', avatar: 'assets/images/minji.jpg'),
    (
      name: 'Kang Haerin',
      group: 'NewJeans',
      avatar: 'assets/images/haerin.jpg',
    ),
    (name: 'Park Jihyo', group: 'TWICE', avatar: 'assets/images/jihyo.jpg'),
    (
      name: 'Sakura Miyawaki',
      group: 'LE SSERAFIM',
      avatar: 'assets/images/sakura.jpg',
    ),
    (
      name: 'Kim Chaewon',
      group: 'LE SSERAFIM',
      avatar: 'assets/images/chaewon.jpg',
    ),
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
            color: Colors.black,
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
