import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tg/config/palette.dart';
import 'package:tg/models/post_model.dart';
import 'package:tg/widgets/profile_avatar.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _PostHeader(post: post),
                  const SizedBox(height: 4),
                  Text(post.caption),
                  post.imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(
                          height: 6,
                        ),
                ],
              ),
            ),
            post.imageUrl != null &&
                    post.imageUrl.isNotEmpty &&
                    post.imageUrl != "none"
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CachedNetworkImage(
                      imageUrl: post.imageUrl,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: _PostStats(post: post),
            )
          ],
        ));
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} .',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print("More"),
        )
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  const _PostStats({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Container(
            decoration: BoxDecoration(
                color: Palette.facebookBlue, shape: BoxShape.circle),
            child: const Icon(
              Icons.thumb_up,
              size: 15,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: Text(
              '${post.likes}',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            '${post.comments} Comments',
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            '${post.shares} Shares',
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ]),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _PostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20,
              ),
              labels: 'Like',
              onTap: () => print('Like'),
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20,
              ),
              labels: 'Comment',
              onTap: () => print('Comment'),
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 26,
              ),
              labels: 'Share',
              onTap: () => print('Share'),
            ),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String labels;
  final VoidCallback onTap;
  const _PostButton({
    Key? key,
    required this.icon,
    required this.labels,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 4), // Adjusted padding
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: icon), // Added Flexible
                const SizedBox(width: 4),
                Flexible(
                    child: Text(labels,
                        overflow: TextOverflow.ellipsis)), // Added Flexible
              ],
            ),
          ),
        ),
      ),
    );
  }
}
