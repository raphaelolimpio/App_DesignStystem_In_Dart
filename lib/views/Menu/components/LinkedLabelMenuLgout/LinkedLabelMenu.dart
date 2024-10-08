import 'package:designsystemsampleapp/DesignSystem/Components/MenuComponents/LinkedLabelMenuLgout/LinkedLabel_View_Model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../DesignSystem/shared/colors.dart';
import '../../../../DesignSystem/shared/styles.dart';

class LinkedLabelMenu extends StatelessWidget {
  final LinkedLabelMenuViewModel viewModel;

  const LinkedLabelMenu._({super.key, required this.viewModel});

  static Widget instantiate({required LinkedLabelMenuViewModel viewModel}) {
    return LinkedLabelMenu._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    final int startIndex = viewModel.fullText.indexOf(viewModel.linkedText);
    final int endIndex = startIndex + viewModel.linkedText.length;

    if (startIndex == -1) {
      return Text(viewModel.fullText);
    }

    return RichText(
      text: TextSpan(
        text: viewModel.fullText.substring(0, startIndex),
        style: label3Semibold,
        children: [
          TextSpan(
            text: viewModel.linkedText,
            style: const TextStyle(color: darkTertiaryBrandColor),
            recognizer: TapGestureRecognizer()..onTap = viewModel.onLinkTap,
          ),
          TextSpan(
            text: viewModel.fullText.substring(endIndex),
            style: label2Semibold,
          ),
        ],
      ),
    );
  }
}
