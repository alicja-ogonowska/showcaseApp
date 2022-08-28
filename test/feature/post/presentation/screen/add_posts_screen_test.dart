import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../util/json/posts/posts.dart';
import '../../../../util/main_screen_launcher.dart';
import '../../../../util/mocks/mock_server_responses_manager.dart';
import '../../../../util/test_actions.dart';

void main() {
  group('Add post screen', () {
    testWidgets('should display error when adding new post fails',
        (tester) async {
      final Widget widget = await getMainScreenWidget(tester, loggedIn: true);
      MockServerResponsesManager().mockServerResponse(
        ApiCall.getPosts,
        MockServerResponseType.code_200,
        responseJsonFilePath: Posts.postsListFilePath,
      );

      await launchTab(tester, widget, TabName.posts);

      await tap(tester, findIconWidget(Icons.add));

      await enterText(tester, findFormFieldByTitle('Title'), 'Title');
      await enterText(
        tester,
        findFormFieldByTitle('Content'),
        'This is body of the post.',
      );
      await tap(tester, findTextWidget('Submit'));

      findTextWidget('Oops, something went wrong!').once();

     await waitForFlashbarToClose(tester);
    });
    testWidgets('should display validation errors when validation fails',
        (tester) async {
      final Widget widget = await getMainScreenWidget(tester, loggedIn: true);
      MockServerResponsesManager().mockServerResponse(
        ApiCall.getPosts,
        MockServerResponseType.code_200,
        responseJsonFilePath: Posts.postsListFilePath,
      );

      await launchTab(tester, widget, TabName.posts);

      await tap(tester, findIconWidget(Icons.add));

      await tap(tester, findTextWidget('Submit'));

      findTextWidget("It can't be empty.").times(2);
    });

    testWidgets(
        'should display success message and go back to posts screen '
        'when adding new post succeeds', (tester) async {
      final Widget widget = await getMainScreenWidget(tester, loggedIn: true);
      MockServerResponsesManager().mockServerResponse(
        ApiCall.getPosts,
        MockServerResponseType.code_200,
        responseJsonFilePath: Posts.postsListFilePath,
      );
      MockServerResponsesManager().mockServerResponse(
        ApiCall.addPost,
        MockServerResponseType.code_201,
        responseJsonFilePath: Posts.emptyResponse,
      );

      await launchTab(tester, widget, TabName.posts);
      await tap(tester, findIconWidget(Icons.add));

      await enterText(tester, findFormFieldByTitle('Title'), 'Title');
      await enterText(
        tester,
        findFormFieldByTitle('Content'),
        'This is body of the post.',
      );
      await tap(tester, findTextWidget('Submit'));
      await waitForAnimations(tester);

      findTextWidget('Your post was added!').once();

      await waitForFlashbarToClose(tester);

      findTextWidget('Check what other users are talking about!').once();
    });
  });
}
