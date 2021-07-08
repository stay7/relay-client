import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relay/header/app_header.dart';

class ErrorPage extends StatelessWidget {
  final String title;
  final String message;
  final FlutterErrorDetails errorDetails;

  ErrorPage(
      {this.title = '에러 발생',
      this.message = '에러가 발생했습니다.',
      required this.errorDetails})
      : assert(errorDetails != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        bottomBorder: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(errorDetails.context.toString()),
            Text(errorDetails.stack.toString())
          ],
        ),
      ),
    );
  }
}
