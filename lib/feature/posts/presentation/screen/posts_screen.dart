import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase_app/feature/posts/domain/entity/post.dart';
import 'package:showcase_app/feature/posts/presentation/cubit/posts_cubit.dart';
import 'package:showcase_app/feature/posts/presentation/widget/add_posts_button.dart';
import 'package:showcase_app/feature/profile/presentation/bloc/user_cubit.dart';
import 'package:showcase_app/l10n/l10n.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _PostsView();
  }
}

class _PostsView extends StatelessWidget {
  const _PostsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.posts),
      ),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => Container(),
            loading: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (state) => _PostsList(state.posts),
            failure: (_) => const Center(
              child: Text('Error'),
            ),
          );
        },
      ),
    );
  }
}

class _PostsList extends StatelessWidget {
  const _PostsList(this.posts);

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Stack(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: posts.length,
              padding: const EdgeInsets.symmetric(vertical: 16).copyWith(
                bottom: 80,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(posts[index].title),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(posts[index].body),
                  ),
                  leading: Column(
                    children: [
                      const Icon(Icons.person),
                      Text('${posts[index].userId}'),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(),
                );
              },
            ),
            state.whenOrNull(
                  authenticated: (authenticated) => Positioned(
                    right: 20,
                    bottom: 20,
                    child: AddPostsButton(onClick: _openAddNewPostScreen),
                  ),
                ) ??
                const SizedBox.shrink()
          ],
        );
      },
    );
  }

  void _openAddNewPostScreen() {}
}
