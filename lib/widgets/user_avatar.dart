import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lontoc_mobprog/constants.dart';
import 'package:material_ui/material_ui.dart';

/// Avatar widget for the user profile image.
///
/// Shows the image (network URL or asset path) inside a [CircleAvatar].
/// If no image is given or it fails to load, it falls back to the
/// user's initials.
class UserAvatar extends StatelessWidget {
  final String? imagePath;
  final String userName;
  final double radius;

  const UserAvatar({
    super.key,
    this.imagePath,
    this.userName = '',
    this.radius = 20,
  });

  String get _initials {
    final parts = userName.trim().split(RegExp(r'\s+'));
    return parts
        .where((p) => p.isNotEmpty)
        .take(2)
        .map((p) => p[0].toUpperCase())
        .join();
  }

  @override
  Widget build(BuildContext context) {
    final r = ScreenUtil().setSp(radius);
    final path = imagePath;

    ImageProvider? provider;
    if (path != null && path.isNotEmpty) {
      provider = path.startsWith('http')
          ? NetworkImage(path)
          : AssetImage(path) as ImageProvider;
    }

    final initialsText = Text(
      _initials.isEmpty ? '?' : _initials,
      style: TextStyle(
        color: appTextLight,
        fontWeight: FontWeight.bold,
        fontSize: r * 0.8,
      ),
    );

    // The photos are tall portraits, so crop towards the top (the face)
    // instead of the default center crop.
    return CircleAvatar(
      radius: r,
      backgroundColor: appLight,
      child: provider == null
          ? initialsText
          : ClipOval(
              child: Image(
                image: provider,
                width: r * 2,
                height: r * 2,
                fit: BoxFit.cover,
                alignment: const Alignment(0, -0.85),
                errorBuilder: (_, _, _) => initialsText,
              ),
            ),
    );
  }
}
