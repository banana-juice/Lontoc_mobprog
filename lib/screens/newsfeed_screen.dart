import 'package:lontoc_mobprog/widgets/newsfeed_card.dart';
import 'package:material_ui/material_ui.dart';

// Images live in assets/images/.
// All idol photos come from Wikimedia Commons; credits are in README.md.
const String _karinaAvatar = 'assets/images/karina.jpg';
const String _winterAvatar = 'assets/images/winter.jpg';
const String _winterPost = 'assets/images/winter_post.jpg';
const String _myAvatar =
    'assets/images/my_avatar.jpg'; // optional; falls back to initials
const String _minjiPhoto = 'assets/images/minji.jpg';
const String _haerinPhoto = 'assets/images/haerin.jpg';
const String _jihyoPhoto = 'assets/images/jihyo.jpg';
const String _sakuraPhoto = 'assets/images/sakura.jpg';
const String _chaewonPhoto = 'assets/images/chaewon.jpg';

const String _minjiCredit = 'Photo: K-POPIT, CC BY 3.0, via Wikimedia Commons';
const String _jihyoCredit =
    'Photo: Pearly Gates Korea, CC BY 3.0, via Wikimedia Commons';
const String _sakuraCredit = 'Photo: K-POPIT, CC BY 3.0, via Wikimedia Commons';

const String _karinaCredit =
    'Photo: snow plumflower, CC BY-SA 4.0, via Wikimedia Commons';
const String _winterCredit =
    'Photo: snow plumflower, CC BY-SA 2.0, via Wikimedia Commons';

class NewsfeedScreen extends StatefulWidget {
  const NewsfeedScreen({super.key});

  @override
  State<NewsfeedScreen> createState() => _NewsfeedScreenState();
}

class _NewsfeedScreenState extends State<NewsfeedScreen>
    with AutomaticKeepAliveClientMixin {
  // Keeps likes and scroll position when switching tabs.
  @override
  bool get wantKeepAlive => true;

  late final List<NewsfeedCard> _posts = _buildPosts(DateTime.now());

  // Sample posts (made up for this activity). Each one has its own date and
  // counts, and either a photo, a placeholder, or no image at all.
  List<NewsfeedCard> _buildPosts(DateTime now) {
    return [
      NewsfeedCard(
        userName: 'Kim Minji',
        postContent: 'Good morning! Have a lovely day, everyone 🐻 #NewJeans',
        date: now.subtract(const Duration(minutes: 25)),
        numOfLikes: 15200,
        numOfComments: 940,
        avatarPath: _minjiPhoto,
        currentUserAvatarPath: _myAvatar,
        imagePath: _minjiPhoto,
        photoCredit: _minjiCredit,
      ),
      NewsfeedCard(
        userName: 'Karina',
        postContent: 'Ready for the stage tonight! 💙 #aespa',
        date: now.subtract(const Duration(hours: 2)),
        numOfLikes: 12500,
        numOfComments: 860,
        avatarPath: _karinaAvatar,
        currentUserAvatarPath: _myAvatar,
        imagePath: _karinaAvatar,
        photoCredit: _karinaCredit,
      ),
      NewsfeedCard(
        userName: 'Park Jihyo',
        postContent: 'Practice done! Thank you for waiting, ONCE 🍭 #TWICE',
        date: now.subtract(const Duration(hours: 5)),
        numOfLikes: 18700,
        numOfComments: 1203,
        avatarPath: _jihyoPhoto,
        currentUserAvatarPath: _myAvatar,
        imagePath: _jihyoPhoto,
        photoCredit: _jihyoCredit,
      ),
      NewsfeedCard(
        userName: 'Kang Haerin',
        postContent: 'Found a cute cat on the way home 🐱',
        date: now.subtract(const Duration(days: 1)),
        numOfLikes: 14300,
        numOfComments: 778,
        avatarPath: _haerinPhoto,
        currentUserAvatarPath: _myAvatar,
        hasPlaceholder: true,
      ),
      NewsfeedCard(
        userName: 'Sakura Miyawaki',
        postContent: 'Finished a new crochet project today 🧶 #LESSERAFIM',
        date: now.subtract(const Duration(days: 3)),
        numOfLikes: 11800,
        numOfComments: 645,
        avatarPath: _sakuraPhoto,
        currentUserAvatarPath: _myAvatar,
        imagePath: _sakuraPhoto,
        photoCredit: _sakuraCredit,
      ),
      NewsfeedCard(
        userName: 'Kim Chaewon',
        postContent: 'See you at the next show! Stay healthy 🤍 #FEARNOT',
        date: DateTime(2026, 11, 18),
        numOfLikes: 13400,
        numOfComments: 702,
        avatarPath: _chaewonPhoto,
        currentUserAvatarPath: _myAvatar,
      ),
      NewsfeedCard(
        userName: 'Winter',
        postContent: 'Winter is here ❄️ Thank you for always being with us!',
        date: DateTime(2026, 11, 15),
        numOfLikes: 9800,
        numOfComments: 532,
        avatarPath: _winterAvatar,
        currentUserAvatarPath: _myAvatar,
        imagePath: _winterPost,
        photoCredit: _winterCredit,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (context, index) => _posts[index],
    );
  }
}
