import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_ui/material_ui.dart';

/// Enhancement 1: Reusable widget for the post image area.
///
/// Accepts either a network URL (starts with "http") or an asset path
/// (e.g. 'assets/images/iron_man.jpg') and shows a loading indicator
/// and an error placeholder.
class PostImage extends StatelessWidget {
  final String imagePath;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;

  const PostImage({
    super.key,
    required this.imagePath,
    this.height,
    this.fit = BoxFit.cover,
    this.alignment = const Alignment(0, -0.7),
  });

  bool get _isNetwork => imagePath.startsWith('http');

  @override
  Widget build(BuildContext context) {
    final imageHeight = height ?? ScreenUtil().setHeight(220);

    final ImageProvider provider = _isNetwork
        ? NetworkImage(imagePath)
        : AssetImage(imagePath) as ImageProvider;

    return ClipRRect(
      borderRadius: BorderRadius.circular(ScreenUtil().setSp(8)),
      child: Image(
        image: provider,
        width: double.infinity,
        height: imageHeight,
        fit: fit,
        alignment: alignment,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          final total = loadingProgress.expectedTotalBytes;
          return Container(
            height: imageHeight,
            color: Colors.grey[200],
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              value: total != null
                  ? loadingProgress.cumulativeBytesLoaded / total
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => Container(
          height: imageHeight,
          color: Colors.grey[300],
          alignment: Alignment.center,
          child: Icon(
            Icons.broken_image,
            color: Colors.grey,
            size: ScreenUtil().setSp(40),
          ),
        ),
      ),
    );
  }
}
