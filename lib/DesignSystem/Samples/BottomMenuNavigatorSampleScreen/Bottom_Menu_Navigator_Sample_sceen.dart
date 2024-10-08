import 'package:designsystemsampleapp/DesignSystem/Components/MenuComponents/BottomMenuNavigator/BottomMenuNavigator.dart';
import 'package:flutter/material.dart';

import '../../Components/MenuComponents/BottomMenuNavigator/BottomMenuNavigator_view_model.dart';

class BottomMenuNavigatorSampleSceen extends StatefulWidget {
  const BottomMenuNavigatorSampleSceen({super.key});

  @override
  State<BottomMenuNavigatorSampleSceen> createState() =>
      _BottomMenuNavigatorSampleSceenState();
}

class _BottomMenuNavigatorSampleSceenState
    extends State<BottomMenuNavigatorSampleSceen> {
  late ActionBottomMenuNavigatorViewModel _actionBottomMenuNavigatorViewModel;
  late BottomBarItem _bottomBarItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var items = [
      _bottomBarItem = BottomBarItem(
        text: "Home",
        trailingIcon: Icons.arrow_forward_ios,
        iconSize: ActionIconSize.small,
        iconColor: ActionIconColors.primary,
        onTap: () {},
      ),
    ];

    _actionBottomMenuNavigatorViewModel = ActionBottomMenuNavigatorViewModel(
        size: ActionBottomMenuNavigatorOptionSize.medium,
        style: ActionBottomMenuNavigatorStyle.primary,
        items: items);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    child: CustomBottomMenuNavigator.instantiate(
                        viewModel: _actionBottomMenuNavigatorViewModel),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
