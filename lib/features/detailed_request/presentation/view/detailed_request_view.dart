import 'package:flutter/material.dart';
import 'widgets/detailed_request_body.dart';

class DetailedRequestView extends StatelessWidget {
  final Duration duration;

  const DetailedRequestView({Key? key, required this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detailed Request'),
      ),
      body: DetailedRequestBody(),
    );
  }
}
