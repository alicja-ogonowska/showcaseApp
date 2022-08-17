import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase_app/common/presentation/widget/button.dart';
import 'package:showcase_app/common/presentation/widget/form_text_field.dart';
import 'package:showcase_app/feature/posts/presentation/cubit/add_post/add_post_cubit.dart';
import 'package:showcase_app/l10n/l10n.dart';

class AddPostForm extends StatefulWidget {
  const AddPostForm({super.key, required this.onSubmit});

  @override
  _AddPostFormState createState() => _AddPostFormState();

  final Function(
    String title,
    String content,
  ) onSubmit;
}

class _AddPostFormState extends State<AddPostForm> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late FocusNode _titleFocusNode;
  late FocusNode _contentFocusNode;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    _titleFocusNode = FocusNode();
    _contentFocusNode = FocusNode();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            FormTextField(
              title: context.l10n.title,
              controller: _titleController,
              focusNode: _titleFocusNode,
              nextFocusNode: _contentFocusNode,
              validator: (String? title) =>
                  (title?.isNotEmpty ?? true) ? null : context.l10n.cantBeEmpty,
            ),
            const SizedBox(height: 16),
            FormTextField(
              title: context.l10n.content,
              controller: _contentController,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _submitNewPost(),
              focusNode: _contentFocusNode,
              maxLines: 6,
              validator: (String? content) {
                if (content == null ||
                    content.isNotEmpty && content.length <= 500) {
                  return null;
                } else if (content.isEmpty) {
                  return context.l10n.cantBeEmpty;
                } else {
                  return context.l10n.contentTooLong(content.length);
                }
              },
            ),
            const SizedBox(height: 32),
            BlocBuilder<AddPostCubit, AddPostState>(
              builder: (context, state) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Button(
                  onPressed: _submitNewPost,
                  child: state.whenOrNull(
                        loading: () => const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        ),
                      ) ??
                      Text(context.l10n.submit),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitNewPost() {
    FocusScope.of(context).unfocus();
    final formValidated = _formKey.currentState?.validate() ?? false;
    if (formValidated) {
      widget.onSubmit(_titleController.text, _contentController.text);
    }
  }
}
