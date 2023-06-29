//------- using integration test --------------
/*import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:weather_app/main.dart' as app;


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
            (tester) async {
          app.main();

          final historicButton = find.byKey(ValueKey("historic_button"));
          await tester.pumpAndSettle();

          // Verify the counter starts at 0.
          await Future.delayed(const Duration(seconds: 15), (){});
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 10), (){});
          expect(historicButton, findsOneWidget);
          tester.tap(historicButton);
          await Future.delayed(const Duration(seconds: 10), (){});
        });
  });
}*/
//------- using flutter drive  --------------
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
void main() {
  group('App State Integration Test', () {
    final historical = find.byValueKey("historic_button");
    final precipitation = find.byValueKey("pre_button");
    final temperature = find.byValueKey("temp_button");
    FlutterDriver? driver;

    setUpAll(() async {
      // Connect to the Flutter application before running the tests
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      // Disconnect from the Flutter application after running the tests
      if (driver != null) {
        driver?.close();
      }
    });

    test('Navigate to historical weather screen', () async {

      await Future.delayed(Duration(seconds: 8));
      // Scroll the main screen to reach historical button
      await driver?.scrollUntilVisible(historical, historical,dyScroll:100.0);


      // Wait for historical button to visible
      await driver?.waitFor(historical,timeout: Duration(seconds: 20));

      // Tap on historical button to navigate on Historical Weather Screen

      await driver?.tap(historical);

      Future.delayed(Duration(seconds: 5));

      // Navigate to Previous Screen for other test
      await driver?.tap(find.pageBack());
    });

    test('FullScreen precipitation map', () async {
      // Wait for historical button to visible
      await driver?.waitFor(precipitation,timeout: Duration(seconds: 20));

      // Tap on historical button to navigate on Historical Weather Screen

      await driver?.tap(precipitation);

      Future.delayed(Duration(seconds: 5));

      // Navigate to Previous Screen for other test
      await driver?.tap(find.pageBack());
    });

    test('FullScreen temperature map', () async {
      // Wait for historical button to visible
      await driver?.waitFor(precipitation,timeout: Duration(seconds: 20));

      // Tap on historical button to navigate on Historical Weather Screen

      await driver?.tap(precipitation);

      Future.delayed(Duration(seconds: 5));

      // Navigate to Previous Screen for other test
      await driver?.tap(find.pageBack());
    });
  });
}