import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../util/json/posts/posts.dart';
import '../../../../util/main_screen_launcher.dart';
import '../../../../util/mocks/mock_server_responses_manager.dart';
import '../../../../util/test_actions.dart';

void main() {
  testWidgets('should display error message when request fails',
      (tester) async {
    final Widget widget = await getMainScreenWidget(tester);

    await launchTab(tester, widget, TabName.posts);

    findTextWidget('Oops, something went wrong!').once();
  });
  group('Posts screen', () {
    testWidgets('should display title', (tester) async {
      final Widget widget = await getMainScreenWidget(tester);
      MockServerResponsesManager().mockServerResponse(
        ApiCall.getPosts,
        MockServerResponseType.code_200,
        responseJsonFilePath: Posts.postsListFilePath,
      );

      await launchTab(tester, widget, TabName.posts);

      findTextWidget('Check what other users are talking about!').once();
    });

    testWidgets(
        'should display error message when request fails and post '
        'lists after successful retry', (tester) async {
      final Widget widget = await getMainScreenWidget(tester);

      await launchTab(tester, widget, TabName.posts);
      findTextWidget('Oops, something went wrong!').once();

      MockServerResponsesManager().mockServerResponse(
        ApiCall.getPosts,
        MockServerResponseType.code_200,
        responseJsonFilePath: Posts.postsListFilePath,
      );
      await tap(tester, findTextWidget('Try again'));

      findTextWidget('Oops, something went wrong!').never();
      findTextWidget('Check what other users are talking about!').once();
    });

    testWidgets('should display error message when request time outs',
        (tester) async {
      final Widget widget = await getMainScreenWidget(tester);

      MockServerResponsesManager().mockServerResponse(
        ApiCall.getPosts,
        MockServerResponseType.timeout,
      );

      await launchTab(tester, widget, TabName.posts);

      findTextWidget('Oops, something went wrong!').once();
    });
    group('Add post button', () {
      testWidgets('should be visible for a logged in user', (tester) async {
        final Widget widget = await getMainScreenWidget(tester, loggedIn: true);

        MockServerResponsesManager().mockServerResponse(
          ApiCall.getPosts,
          MockServerResponseType.code_200,
          responseJsonFilePath: Posts.postsListFilePath,
        );

        await launchTab(tester, widget, TabName.posts);

        findIconWidget(Icons.add).once();
      });
      testWidgets('should not be visible for a not logged in user',
          (tester) async {
        final Widget widget = await getMainScreenWidget(tester);

        MockServerResponsesManager().mockServerResponse(
          ApiCall.getPosts,
          MockServerResponseType.code_200,
          responseJsonFilePath: Posts.postsListFilePath,
        );

        await launchTab(tester, widget, TabName.posts);

        findIconWidget(Icons.add).never();
      });
    });
  });
}
