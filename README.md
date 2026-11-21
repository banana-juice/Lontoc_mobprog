# lab_act1a

Laboratory Activity 1A: a Facebook-style newsfeed built with Flutter.

## Laboratory Discussion

**Question:** Discuss how you integrate the image to the `newsfeed_card.dart` and make it dynamic whether it has an image or not.

### 1. The image is an optional parameter

In `lib/widget/newsfeed_card.dart`, the card takes the image as a nullable `String?`:

```dart
final String? imagePath;
final String? photoCredit;

const NewsfeedCard({
  ...
  this.imagePath,
  this.photoCredit,
});
```

Since `imagePath` is not `required`, a post can be created with or without a picture. A text-only post just leaves it out, and the default value is `null`.

### 2. Collection `if` decides whether the image is shown

Inside the card's `Column`, the image is placed with Dart's collection `if`:

```dart
if (imagePath != null) PostImage(imagePath: imagePath!),
if (imagePath != null && photoCredit != null)
  Padding(
    ...
    child: CustomText(text: photoCredit!, ...),
  ),
```

- If `imagePath` is `null`, the `PostImage` widget is **not added to the widget tree at all**. No empty space or blank box is left, so the like/comment row moves up right under the post text.
- If `imagePath` has a value, `PostImage` is added between the post content and the action buttons.
- The photo credit follows the same idea. It only appears when there is an image **and** a credit, so a credit can never show under a post with no picture.

### 3. `PostImage` is a separate reusable widget

The image logic lives in `lib/widget/post_image.dart` so that `NewsfeedCard` stays short and readable. `PostImage`:

- Accepts either a **network URL** (starts with `http`, uses `NetworkImage`) or a **local asset path** (uses `AssetImage`), so the same card works for both.
- Shows a `CircularProgressIndicator` while the image loads (`loadingBuilder`).
- Shows a grey broken-image placeholder if the image cannot be loaded (`errorBuilder`), so a bad path does not crash the screen.
- Uses `BoxFit.cover` with rounded corners (`ClipRRect`) and a responsive height from `flutter_screenutil`.

### 4. The avatar also handles a missing image

`lib/widget/user_avatar.dart` uses the same approach for the profile picture. `avatarPath` is nullable, and if it is `null` or fails to load, the avatar falls back to the user's initials (for example "K" for Karina) inside the `CircleAvatar`.

### 5. Usage in `newsfeed_screen.dart`

```dart
// Post WITH an image
NewsfeedCard(
  userName: 'Winter',
  postContent: 'Winter is here ❄️ Thank you for always being with us!',
  date: 'November 20, 2026',
  avatarPath: 'assets/images/winter.jpg',
  imagePath: 'assets/images/winter_post.jpg',
  photoCredit: 'Photo: snow plumflower, CC BY-SA 2.0, via Wikimedia Commons',
),

// Post WITHOUT an image (just omit imagePath)
NewsfeedCard(
  userName: 'Karina',
  postContent: 'Ready for the stage tonight! 💙',
  date: '2 hours ago',
),
```

### 6. Asset setup

The local images are stored in `assets/images/` and registered in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/images/
```

After adding new asset files, the app has to be fully stopped and run again (`flutter run`). Hot reload and hot restart do not bundle new assets, so the images show the broken-image placeholder until the app is rebuilt.

### Summary

| Case | `imagePath` | Result |
| --- | --- | --- |
| Text-only post | `null` | No image area is built, and the layout closes up. |
| Post with an image | a path or URL | `PostImage` is shown, with a loader while loading. |
| Image fails to load | invalid path or URL | A grey placeholder icon is shown instead of an error. |
| Image with a credit | path and `photoCredit` | The credit text is shown under the image. |

Making `imagePath` nullable and checking it with a collection `if` keeps one `NewsfeedCard` widget flexible for every kind of post, without duplicating the card for "with image" and "without image" versions.
