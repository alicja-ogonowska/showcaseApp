
# Full Widget Tree Testing Example App

[![License: MIT][license_badge]][license_link]

Generated by the [Very Good CLI][very_good_cli_link] 🤖
Images designed by: [pch.vector / Freepik][vector_images_link]

## What is full widget tree testing? 🌳
It was introduced to me by my dear colleague Natalie Masse Hopper. Make sure to read the [article][natalie_article_link] she wrote about it!

Full widget tree testing is a concept in which we exercise whole app during widget tests. App widget is also a widget, right? Instead of testing small widgets in separation, we can replicate all steps needed to encounter this widget - just as the user would have to do.

### Why do we want to do it?

To look for bugs that may hide between widgets and their interactions. To make sure that we not only have a pretty screen, but we can also navigate to and back from it. Widget tests are quick to run, just as unit tests and give us similar confidence level as integration tests (which are not that quick and easy to write).

### I want to know more!
Here are my slides from Droidcon - [LINK TO SLIDES][droidcon_slides]
Here is the recorded talk from Droidcon - [LINK TO TALK][droidcon_recording]

If you prefer articles than videos, let me know - with proper motivation, I may write an article based on my talk.


## About the app 📝
<img width="200" src="https://alicjaogonowska.pl/wp-content/uploads/2022/10/posts.png"/>         <img width="200" src="https://alicjaogonowska.pl/wp-content/uploads/2022/10/add_post.png"/><img width="200" src="https://alicjaogonowska.pl/wp-content/uploads/2022/10/login.png"/><img width="200" src="https://alicjaogonowska.pl/wp-content/uploads/2022/10/welcome.png"/>

Main screen of the app contains 2 tabs - Posts and Profile.

Posts tab displays a list of posts fetched from the API. It also features a so called Post of the day.
Profile tab allows the user to authenticate. Due to API's limitations, whole user
"authentication" is pretty much mocked. All you need to do is provide a valid e-mail address and password that matches the requirements.

Logged in users can add their own posts.

## Getting Started 🚀

This project contains only 1 flavour - development.

To run the flavor either use the launch configuration in VSCode/Android Studio or use the following command:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart
```

Application uses [GO Rest Api][go_rest_api_link]. To be able to use POST methods, you need to
obtain your own access token. You can do it via Github, Google or Microsoft account on [this  page][go_rest_login_link].

Api key and user id are stored in an environment config file and loaded via dotenv. You must use an id that already exists in the backend service. You can create a new user, for example from Postman, or you can use an existing one. Doesn't really matter.

You need to create .env file at the root of this project. It should have the following format:

```sh
API_KEY={apiKey}
USER_ID={userId}
```

To be able to make builds via GitHub, you need to add API_KEY and USER_ID as secrets to your repository. .env file is then created via Github Action.


## Running Tests 🧪
To run all unit and widget tests (full widget tree tests as well) use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

To run widget tests on your device, use this command:
```sh
flutter run --flavor flavor -t testFilePath/fileName.dart

# Example
flutter run --flavor development -t test/feature/profile/presentation/screen/profile_screen_test.dart
```

To run health check tests, use this command:
```sh
flutter test health_check_tests
```
### Health check what?
Health check tests are widget tests that run on production environment. Yes, it is possible! Setup and tests itself are located in
```
/health_check_tests
```
This kind of tests are useful if your app is content dependent and you want to make sure that required content is there. As they run on production and communicate with real API server, be aware that they may be flacky and fragile. Better check for content type rather than concrete values.
## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:showcase_app/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
 <array> <string>en</string>
 <string>es</string>
 </array>
    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```


[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
[go_rest_api_link]: https://gorest.co.in
[go_rest_login_link]: https://gorest.co.in/consumer/login
[vector_images_link]: http://www.freepik.com
[natalie_article_link]:https://cogitas.net/unleash-full-power-flutter-widget-tests/
[droidcon_slides]:https://docs.google.com/presentation/d/1oOUcf8XrI_IN5VJXp9bEHLNcz8idp4Xu_OFFXoqcUYI/edit?usp=sharing
[droidcon_recording]:https://www.droidcon.com/2022/11/15/lets-test-the-full-widget-tree/
