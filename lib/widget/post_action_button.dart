import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lontoc_mobprog/constant.dart';
import 'package:lontoc_mobprog/widget/custom_text.dart';
import 'package:material_ui/material_ui.dart';

/// Enhancement 3: Reusable action button (icon + label) used for
/// Like / Comment / Share.
class PostActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onPressed;

  const PostActionButton({
    super.key,
    required this.icon,
    required this.label,
    this.color = fbDarkPrimary,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: color, size: ScreenUtil().setSp(18)),
      label: CustomText(
        text: label,
        fontSize: ScreenUtil().setSp(12),
        color: color,
      ),
    );
  }
}

/// Like button that keeps its own state: tapping toggles the like
/// and updates the number of likes.
class LikeButton extends StatefulWidget {
  final int initialLikes;

  const LikeButton({super.key, this.initialLikes = 0});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late int _likes = widget.initialLikes;
  bool _isLiked = false;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _likes += _isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PostActionButton(
      icon: _isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
      label: '$_likes',
      color: _isLiked ? fbPrimary : fbDarkPrimary,
      onPressed: _toggleLike,
    );
  }
}

/// Comment button showing the number of comments.
class CommentButton extends StatelessWidget {
  final int numOfComments;
  final VoidCallback? onPressed;

  const CommentButton({super.key, this.numOfComments = 0, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return PostActionButton(
      icon: Icons.mode_comment_outlined,
      label: numOfComments > 0 ? '$numOfComments' : 'Comment',
      onPressed: onPressed ?? () {},
    );
  }
}
