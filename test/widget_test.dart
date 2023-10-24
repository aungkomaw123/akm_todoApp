import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo/main.dart';

void main() {
  testWidgets('Add a Task', (WidgetTester tester) async {
    await tester
        .pumpWidget(MainApp()); // Replace with the instantiation of your app

    // Find and tap the button to add a task
    final addButton = find.byIcon(Icons.add);
    expect(addButton, findsOneWidget);
    await tester.tap(addButton);
    await tester.pump();

    // Find the text field for entering a new task and enter text
    final taskTextField = find.text('Task Title...');
    expect(taskTextField, findsOneWidget);
    await tester.enterText(taskTextField, 'New Task');
    await tester.pump();

    // Find the text field for entering a new task and enter text
    final taskDescField = find.text('Task Description...');
    expect(taskDescField, findsOneWidget);
    await tester.enterText(taskDescField, 'New Desc');
    await tester.pump();

    // Find and tap the button to confirm the task addition
    final confirmButton = find.byIcon(
      CupertinoIcons.check_mark,
    );
    expect(confirmButton, findsOneWidget);
    await tester.tap(confirmButton);
    await tester.pump();

    // Verify that the new task is displayed
    final newTaskText = find.text('New Task');
    expect(newTaskText, findsOneWidget);
  });

  testWidgets('Mark Task as Completed Test', (WidgetTester tester) async {
    await tester
        .pumpWidget(MainApp()); // Replace with the instantiation of your app

    // Find and tap the task you want to mark as completed
    final taskToComplete = find.byType(Checkbox);
    expect(taskToComplete, findsOneWidget);
    await tester.tap(taskToComplete);
    await tester.pump();

    // Verify that the task is marked as completed
    final completedTaskText = find.text('Task to Complete');
    expect(completedTaskText, findsOneWidget);
  });
  testWidgets('Delete Task Test', (WidgetTester tester) async {
    await tester
        .pumpWidget(MainApp()); // Replace with the instantiation of your app

    // Find and tap the delete icon for the task you want to delete
    final taskToDelete = find.byType(Slidable);
    expect(taskToDelete, findsOneWidget);
    await tester.drag(taskToDelete, const Offset(-200, 0));
    await tester.pump();

    // Verify that the task is deleted
    final deletedTaskText = find.text('Task to Delete');
    expect(deletedTaskText, findsNothing);
  });
}
