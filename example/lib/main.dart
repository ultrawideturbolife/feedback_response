import 'dart:math';

import 'package:example/services/feedback_response_handler.dart';
import 'package:feedback_response/feedback_response.dart';
import 'package:flutter/material.dart';
import 'package:veto/data/models/base_view_model.dart';

void main() {
  runApp(const HomeView());
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String route = 'home-view';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ViewModelBuilder<HomeViewModel>(
          builder: (context, model) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: ElevatedButton(
                    onPressed: model.onPressed,
                    child: const Text('Random feedback')),
              ),
            ],
          ),
          viewModelBuilder: () => HomeViewModel.locate,
        ),
      ),
    );
  }
}

class HomeViewModel extends BaseViewModel {
  HomeViewModel({
    required this.feedbackResponseHandler,
  });

  final FeedbackResponseHandler feedbackResponseHandler;

  @override
  Future<void> initialise({arguments}) async {
    super.initialise();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressed() {
    feedbackResponseHandler.handleResponse(
      feedbackResponse: FeedbackResponse(
        feedbackLevel:
            FeedbackLevel.values[Random().nextInt(FeedbackLevel.values.length)],
        feedbackType:
            FeedbackType.values[Random().nextInt(FeedbackType.values.length)],
      ),
      context: context!,
    );
  }

  static HomeViewModel get locate => HomeViewModel(
        feedbackResponseHandler: FeedbackResponseHandler(),
      );
}
