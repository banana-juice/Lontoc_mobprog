import 'package:lontoc_mobprog/widget/newsfeed_card.dart';
import 'package:material_ui/material_ui.dart';

// Images live in assets/images/.
// Photos: snow plumflower via Wikimedia Commons.
const String _karinaAvatar = 'assets/images/karina.jpg';
const String _winterAvatar = 'assets/images/winter.jpg';
const String _winterPost = 'assets/images/winter_post.jpg';
const String _myAvatar = 'assets/images/my_avatar.jpg'; // optional; falls back to initials

const String _karinaCredit =
    'Photo: snow plumflower, CC BY-SA 4.0, via Wikimedia Commons';
const String _winterCredit =
    'Photo: snow plumflower, CC BY-SA 2.0, via Wikimedia Commons';

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsfeedCard(
          userName: 'Karina',
          postContent: 'Ready for the stage tonight! 💙 #aespa',
          date: '2 hours ago',
          numOfLikes: 12500,
          numOfComments: 860,
          avatarPath: _karinaAvatar,
          currentUserAvatarPath: _myAvatar,
          imagePath: _karinaAvatar,
          photoCredit: _karinaCredit,
        ),
        NewsfeedCard(
          userName: 'Winter',
          postContent:
              'Winter is here ❄️ Thank you for always being with us!',
          date: 'November 20, 2026',
          numOfLikes: 9800,
          numOfComments: 532,
          avatarPath: _winterAvatar,
          currentUserAvatarPath: _myAvatar,
          imagePath: _winterPost,
          photoCredit: _winterCredit,
        ),
      ],
    );
  }
}
