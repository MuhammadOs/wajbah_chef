import 'package:flutter/material.dart';
import 'package:wajbah_chef/core/widgets/custom_appbar.dart';
import 'widgets/detailed_request_body.dart';

class DetailedRequestView extends StatelessWidget {
  final Duration duration;

  const DetailedRequestView({Key? key, required this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40,),
          CustomAppBar(title: 'New Requests'),
          Expanded(
            child: SingleChildScrollView(
              child: const DetailedRequestBody(),
            ),
          ),
        ],
      ),
    );
  }
}