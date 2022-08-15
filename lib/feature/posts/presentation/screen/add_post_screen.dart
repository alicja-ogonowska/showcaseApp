import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showcase_app/common/presentation/widget/flash_bar.dart';
import 'package:showcase_app/feature/posts/domain/use_case/add_post_use_case.dart';
import 'package:showcase_app/feature/posts/presentation/cubit/add_post/add_post_cubit.dart';
import 'package:showcase_app/feature/posts/presentation/cubit/posts_cubit.dart';
import 'package:showcase_app/feature/posts/presentation/widget/add_post_form.dart';
import 'package:showcase_app/injection/injection.dart';
import 'package:showcase_app/l10n/l10n.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddPostCubit>(
      create: (_) => AddPostCubit(addPostUseCase: getIt.get<AddPostUseCase>()),
      child: _AddNewPostView(),
    );
  }
}

class _AddNewPostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: BlocListener<AddPostCubit, AddPostState>(
          listener: (context, state) => {
            state.whenOrNull(
              success: () {
                FlashBar.success(message: context.l10n.postWasAdded)
                    .show(context);
                context.read<PostsCubit>().fetchPosts();
                Navigator.of(context).pop();
              },
              failure: (_) =>
                  FlashBar.error(message: context.l10n.somethingWentWrong)
                      .show(context),
            ),
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  context.l10n.addNewPostTitle,
                  style: GoogleFonts.patrickHand(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                AddPostForm(
                  onSubmit: (title, content) {
                    context.read<AddPostCubit>().addPost(title, content);
                  },
                ),
                const Image(image: AssetImage('assets/talking.webp'), height:
                130,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
