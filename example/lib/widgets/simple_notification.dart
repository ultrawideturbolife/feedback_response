import 'package:feedback_response/feedback_response.dart';
import 'package:flutter/material.dart';

class SimpleNotification extends StatefulWidget {
  const SimpleNotification({
    required this.feedbackResponse,
    Key? key,
  }) : super(key: key);

  final FeedbackResponse feedbackResponse;

  @override
  State<StatefulWidget> createState() => SimpleNotificationState();
}

class SimpleNotificationState extends State<SimpleNotification>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> position;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    position =
        Tween<Offset>(begin: const Offset(0.0, -4.0), end: Offset.zero).animate(
      CurvedAnimation(parent: controller, curve: Curves.bounceInOut),
    );
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: SlideTransition(
            position: position,
            child: Center(
              child: Container(
                decoration: ShapeDecoration(
                    color: () {
                      switch (widget.feedbackResponse.feedbackLevel) {
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Notification: ${widget.feedbackResponse.feedbackLevel.name}',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
