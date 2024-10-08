import 'package:designsystemsampleapp/DesignSystem/Components/LinkedLabel/linked_label.dart';

import 'package:designsystemsampleapp/DesignSystem/Components/MenuComponents/BottomMenuNavigator/BottomMenuNavigator.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/MenuComponents/BottomMenuNavigator/BottomMenuNavigator_view_model.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/MenuComponents/LinkedLabelMenuLgout/LinkedLabel_View_Model.dart';
import 'package:flutter/material.dart';

import '../../../DesignSystem/Components/MenuComponents/LinkedLabelMenuLgout/LinkedLabelMenu.dart';

class ProfileViewModel extends StatefulWidget {
  const ProfileViewModel({super.key});

  @override
  State<ProfileViewModel> createState() => _ProfileViewModelState();
}

class _ProfileViewModelState extends State<ProfileViewModel> {
  late ActionBottomMenuNavigatorViewModel _actionBottomMenuNavigatorViewModel;
  late BottomBarItem _bottomBarItem;
  late LinkedLabelMenuViewModel _linkedLabelMenuViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _linkedLabelMenuViewModel = LinkedLabelMenuViewModel(
        fullText: "Logout", linkedText: "Logout", onLinkTap: () {});

    var items = [
      _bottomBarItem = BottomBarItem(
        text: "Edit Name",
        trailingIcon: Icons.arrow_forward_ios,
        iconSize: ActionIconSize.medium,
        iconColor: ActionIconColors.primary,
        onTap: () {},
      ),
      _bottomBarItem = BottomBarItem(
        text: "Shipping Info",
        trailingIcon: Icons.arrow_forward_ios,
        iconSize: ActionIconSize.medium,
        iconColor: ActionIconColors.primary,
        onTap: () {},
      ),
      _bottomBarItem = BottomBarItem(
        text: "Notification",
        trailingIcon: Icons.arrow_forward_ios,
        iconSize: ActionIconSize.medium,
        iconColor: ActionIconColors.primary,
        onTap: () {},
      ),
      _bottomBarItem = BottomBarItem(
        text: "Terms & Condition",
        trailingIcon: Icons.arrow_forward_ios,
        iconSize: ActionIconSize.medium,
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
                  padding: EdgeInsets.all(0.0),
                  child: Container(
                    width: double.infinity,
                    child: CustomBottomMenuNavigator.instantiate(
                      viewModel: _actionBottomMenuNavigatorViewModel,
                    ),
                  ),
                ),
                // Novo Container para alinhar o botão e o LinkedLabelMenu
                Padding(
                  padding: EdgeInsets.only(right: 310.0, left: 10.0),
                  child: LinkedLabelMenu.instantiate(
                    viewModel: _linkedLabelMenuViewModel,
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
