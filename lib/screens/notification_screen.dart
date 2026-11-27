import 'package:lontoc_mobprog/widgets/notification.dart';
import 'package:material_ui/material_ui.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  // Sample notifications (made up for this activity).
  static const List<NotificationCard> _notifications = [
    NotificationCard(
      name: 'Kim Minji',
      avatarPath: 'assets/images/minji.jpg',
      post: 'Good morning!',
      description: 'Shared a new post',
    ),
    NotificationCard(
      name: 'Park Jihyo',
      avatarPath: 'assets/images/jihyo.jpg',
      post: 'Practice done!',
      description: 'Shared a new post',
    ),
    NotificationCard(
      name: 'Kang Haerin',
      avatarPath: 'assets/images/haerin.jpg',
      post: 'Found a cute cat',
      description: 'Added a new update',
    ),
    NotificationCard(
      name: 'Sakura Miyawaki',
      avatarPath: 'assets/images/sakura.jpg',
      post: 'New crochet project',
      description: 'Added a new update',
    ),
    NotificationCard(
      name: 'Kim Chaewon',
      avatarPath: 'assets/images/chaewon.jpg',
      post: 'See you at the next show!',
      description: 'Mentioned FEARNOT in a post',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Material gives the tap ripple a white surface to draw on.
    return Material(
      color: Colors.white,
      child: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) => _notifications[index],
      ),
    );
  }
}
