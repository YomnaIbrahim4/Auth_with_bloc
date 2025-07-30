import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sign_up/main.dart';
import 'package:sign_up/models/auth_repo.dart';

void main() {
  testWidgets('App loads without crashing', (WidgetTester tester) async {

    final authRepo = AuthRepo();


    await tester.pumpWidget(MyApp());


    expect(find.text('Sign Up'), findsOneWidget);
  });
}
