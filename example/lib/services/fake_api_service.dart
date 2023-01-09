import 'package:feedback_response/feedback_response.dart';

class FakeApiService {
  FeedbackResponse successDialog() => FeedbackResponse(
        feedbackLevel: FeedbackLevel.success,
        feedbackType: FeedbackType.dialog,
      );
  FeedbackResponse successSnackbar() => FeedbackResponse(
        feedbackLevel: FeedbackLevel.success,
        feedbackType: FeedbackType.snackbar,
      );
  FeedbackResponse successBottomSheet() => FeedbackResponse(
        feedbackLevel: FeedbackLevel.success,
        feedbackType: FeedbackType.bottomSheet,
      );
  FeedbackResponse successNotification() => FeedbackResponse(
        feedbackLevel: FeedbackLevel.success,
        feedbackType: FeedbackType.notification,
      );
}
