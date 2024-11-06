import 'package:flutter/material.dart';
import 'package:tg/config/palette.dart';
import 'package:tg/models/user_model.dart';
import 'package:tg/widgets/profile_avatar.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;
  const Rooms({super.key, required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: _CreateRoomButton(),
            );
          }
         final User user = onlineUsers[index - 1];
         return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
         child: ProfileAvatar(
          imageUrl: user.imageUrl,
          isActive: true,
         ),
         );
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('CREATE ROOM'),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 3,
          color: Colors.blueAccent[100]!,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.white,
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 35,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            'Create Room',
            style: TextStyle(color: Palette.facebookBlue),
          ),
        ],
      ),
    );
  }
}
