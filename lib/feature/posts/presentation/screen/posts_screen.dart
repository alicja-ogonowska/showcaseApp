import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showcase_app/common/presentation/asset_images.dart';
import 'package:showcase_app/common/presentation/widget/button.dart';
import 'package:showcase_app/feature/posts/domain/entity/post.dart';
import 'package:showcase_app/feature/posts/presentation/cubit/posts_cubit.dart';
import 'package:showcase_app/feature/posts/presentation/screen/add_post_screen.dart';
import 'package:showcase_app/feature/posts/presentation/widget/add_posts_button.dart';
import 'package:showcase_app/feature/posts/presentation/widget/post_item.dart';
import 'package:showcase_app/feature/posts/presentation/widget/post_of_the_day.dart';
import 'package:showcase_app/feature/profile/presentation/cubit/user_cubit.dart';
import 'package:showcase_app/l10n/l10n.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => Container(),
            loading: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (state) => _PostsView(state.posts, state.postOfTheDay),
            failure: (_) => _ErrorView(),
          );
        },
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              context.l10n.somethingWentWrong,
              style: GoogleFonts.patrickHand(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          const Image(image: AssetImage(AssetImages.error)),
          const SizedBox(height: 16),
          Button(
            child: Text(context.l10n.tryAgain),
            onPressed: () => context.read<PostsCubit>().fetchPosts(),
          ),
        ],
      ),
    );
  }
}

class _PostsView extends StatelessWidget {
  const _PostsView(this.posts, this.postOfTheDay);

  final List<Post> posts;
  final Post? postOfTheDay;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      context.l10n.checkPosts,
                      style: GoogleFonts.patrickHand(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Image(image: AssetImage(AssetImages.postsHeader)),
                  PostOfTheDay(post: postOfTheDay),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: posts.length,
                    padding: const EdgeInsets.symmetric(vertical: 16).copyWith(
                      bottom: state.whenOrNull(
                            authenticated: (authenticated) => 80,
                          ) ??
                          16,
                    ),
                    itemBuilder: (BuildContext context, int index) =>
                        PostItem(post: posts[index]),
                  ),
                ],
              ),
            ),
            state.whenOrNull(
                  authenticated: (authenticated) => Positioned(
                    right: 20,
                    bottom: 20,
                    child: AddPostsButton(
                      onClick: () => _openAddNewPostScreen(context),
                    ),
                  ),
                ) ??
                const SizedBox.shrink()
          ],
        );
      },
    );
  }

  void _openAddNewPostScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddPostScreen()),
    );
  }
}
