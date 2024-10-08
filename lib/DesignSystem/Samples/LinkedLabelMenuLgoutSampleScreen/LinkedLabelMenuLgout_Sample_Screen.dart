import 'package:flutter/material.dart';

import '../../Components/MenuComponents/LinkedLabelMenuLgout/LinkedLabelMenu.dart';
import '../../Components/MenuComponents/LinkedLabelMenuLgout/LinkedLabel_View_Model.dart';

class LinkedLabelMenuPage extends StatelessWidget {
  const LinkedLabelMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Linked Label Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinkedLabelMenu.instantiate(
              viewModel: LinkedLabelMenuViewModel(
                fullText: "texto com link",
                linkedText: "com link",
                onLinkTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
