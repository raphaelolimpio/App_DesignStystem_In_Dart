import 'dart:ui';

class Profile {}

class LinkedLabelViewModel {
  final String fullText;
  final String linkedText;
  final VoidCallback? onLinkTap;

  LinkedLabelViewModel({
    required this.fullText,
    required this.linkedText,
    this.onLinkTap,
  });
}
