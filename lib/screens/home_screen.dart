import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tg/config/palette.dart';
import 'package:tg/data/data.dart';
import 'package:tg/models/post_model.dart';
import 'package:tg/models/user_model.dart';
import 'package:tg/widgets/circle_button.dart';
import 'package:tg/widgets/create_post_container.dart';
import 'package:tg/widgets/post_container.dart';
import 'package:tg/widgets/rooms.dart';
import 'package:tg/widgets/stories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("facebook",
            style: TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
             CircleButton(icon: Icons.search, iconSize: 30, onTap: ()=> print("search button pressed"),),
             CircleButton(icon: MdiIcons.facebookMessenger, iconSize: 30, onTap: ()=> print("facebook message button pressed"),),
            ],
            ),
            SliverToBoxAdapter(
              child: CreatePostContainer(currentUser: currentUser)
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
              sliver: SliverToBoxAdapter(
                child: Rooms(onlineUsers: onlineUsers),
              ),
            ),
             SliverPadding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              sliver: SliverToBoxAdapter(
                child: Stories(currentUser: currentUser, stories: stories),
              ),
            ),
            SliverList(delegate: SliverChildBuilderDelegate((
             context,index
            ){
              final Post post = posts[index];
              return PostContainer(post: post);
            }
            ),
            )
        ],
      )
    );
  }
}