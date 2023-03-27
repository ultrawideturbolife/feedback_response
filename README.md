# FeedbackResponse

A Flutter package that streamlines creating and managing feedback responses in your application. It provides an easy way to create feedback responses with predefined levels (info, warning, success, error) and UI types (none, dialog, snackbar, bottomSheet, notification). The package simplifies communication between classes and handling errors deep within your class hierarchy.

## Features

- Predefined feedback levels and UI types
- Extendable with custom feedback levels and UI types
- Easy conversion to other data types
- Immutable response objects

The feedback_response package streamlines communication between all your classes. In case of issues deep within your class hierarchy, simply send a feedback response. As your classes communicate via these responses, they will identify the error and pass it up to the UI view, providing users with precise information about the issue. The UI intelligently decides the type of notification to display based on the `feedbackType` and adjusts the severity level according to the `feedbackLevel`.

## Usage

### Basic Usage

Import the package:

```dart
import 'package:feedback_response/feedback_response.dart';
```

Create a feedback response:

```dart
FeedbackResponse response = FeedbackResponse.success(
  title: 'Success',
  message: 'Your request has been processed successfully.',
  feedbackLevel: FeedbackLevel.success,
  feedbackType: FeedbackType.dialog,
);
```

```dart
FeedbackResponse response = FeedbackResponse.success(
  title: 'Success',
  message: 'Your request failed.',
  feedbackLevel: FeedbackLevel.error,
  feedbackType: FeedbackType.snackbar,
);
```

### Extended Usage

You can create custom feedback levels and UI types by deriving from `FeedbackResponseInterface`:

```dart
class CustomFeedbackResponse<T extends Object?> extends FeedbackResponseInterface<T, CustomFeedbackLevel, CustomFeedbackType> {
  // Your custom implementation here
}
```

And then use your custom feedback response class:

```dart
CustomFeedbackResponse response = CustomFeedbackResponse.customLevel(
  customFeedbackLevel: CustomFeedbackLevel.myLevel
  customFeedbackType: CustomFeedbackType.myType
  title: 'My Title',
  message: 'My message',
);
```

### Accessing Response Properties

You can access the properties of your feedback responses, such as `title`, `message`, `result`, `feedbackLevel`, and `feedbackType`. You can also use `isSuccess` to check if the response is successful.

```dart
print(response.title);
print(response.message);
print(response.result);
print(response.feedbackLevel);
print(response.feedbackType);
print(response.isSuccess);
```

### Casting Your Response

You can easily cast your response's result to any other data type using the `resultAsType()` method:

```dart
MyClass myClass = response.resultAsType<MyClass>();
```

## License

This package is licensed under the [MIT License](https://opensource.org/licenses/MIT).
```
