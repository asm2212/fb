import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tg/models/user_model.dart';
import 'package:tg/widgets/profile_avatar.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 8, 5, 0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration.collapsed(
                    hintText: "What's on your mind?",
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 10, thickness: 0.5),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: () => print("Live"),
                    icon: const Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: const Text('Live'),
                  ),
                ),
                const VerticalDivider(width: 6),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () => print("Photo"),
                    icon: const Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: const Text('Photo'),
                  ),
                ),
                const VerticalDivider(width: 6),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () => print("Room"),
                    icon: const Icon(
                      Icons.video_call,
                      color: Colors.purple,
                    ),
                    label: const Text('Room'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
