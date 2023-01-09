import 'package:example/widgets/simple_notification.dart';
import 'package:feedback_response/feedback_response.dart';
import 'package:flutter/material.dart';

class FeedbackResponseHandler {
  Future<void> handleResponse({
    required FeedbackResponse feedbackResponse,
    required BuildContext context,
  }) async {
    switch (feedbackResponse.feedbackType) {
      case FeedbackType.none:
        break;
      case FeedbackType.dialog:
        await showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Dialog: ${feedbackResponse.feedbackLevel.name}',
                ),
              ),
              backgroundColor: () {
                switch (feedbackResponse.feedbackLevel) {
                  case FeedbackLevel.info:
                    return Colors.blue;
                  case FeedbackLevel.warning:
                    return Colors.yellow;
                  case FeedbackLevel.success:
                    return Colors.green;
                  case FeedbackLevel.error:
                    return Colors.red;
                }
              }(),
            );
          },
        );
        break;
      case FeedbackType.snackbar:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Snackbar: ${feedbackResponse.feedbackLevel.name}'),
            backgroundColor: () {
              switch (feedbackResponse.feedbackLevel) {
                case FeedbackLevel.info:
                  return Colors.blue;
                case FeedbackLevel.warning:
                  return Colors.yellow;
                case FeedbackLevel.success:
                  return Colors.green;
                case FeedbackLevel.error:
                  return Colors.red;
              }
            }(),
          ),
        );
        break;
      case FeedbackType.bottomSheet:
        Scaffold.of(context).showBottomSheet(
          (context) => BottomSheet(
            onClosing: () {},
            backgroundColor: () {
              switch (feedbackResponse.feedbackLevel) {
                case FeedbackLevel.info:
                  return Colors.blue;
                case FeedbackLevel.warning:
                  return Colors.yellow;
                case FeedbackLevel.success:
                  return Colors.green;
                case FeedbackLevel.error:
                  return Colors.red;
              }
            }(),
            builder: (context) {
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 16, right: 16, bottom: 200),
                    child: Text(
                        'Bottom sheet: ${feedbackResponse.feedbackLevel.name}'),
                  ),
                ],
              );
            },
          ),
        );
        break;
      case FeedbackType.notification:
        final overlayEntry = OverlayEntry(
          builder: (context) {
            return SimpleNotification(
              feedbackResponse: feedbackResponse,
            );
          },
          opaque: false,
        );
        Navigator.of(context).overlay?.insert(
              overlayEntry,
            );
        await Future.delayed(const Duration(seconds: 1))
            .then((value) => overlayEntry.remove());
        break;
    }
  }
}
