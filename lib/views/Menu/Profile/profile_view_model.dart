import 'package:designsystemsampleapp/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:designsystemsampleapp/views/Menu/BottomMenuNavigator/BottomMenuNavigator.dart';
import 'package:designsystemsampleapp/views/Menu/BottomMenuNavigator/BottomMenuNavigator_view_model.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends StatefulWidget {
  const ProfileViewModel({super.key});

  @override
  State<ProfileViewModel> createState() => _ProfileViewModelState();
}

class _ProfileViewModelState extends State<ProfileViewModel> {
  late ActionBottomMenuNavigatorViewModel _actionBottomMenuNavigatorViewModel;
  late BottomBarItem _bottomBarItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var items = [
      _bottomBarItem = BottomBarItem(
        text: "Home",
        trailingIcon: Icons.arrow_forward,
        onTap: () {},
      ),
      _bottomBarItem = BottomBarItem(
        text: "Shipping Info",
        trailingIcon: Icons.arrow_forward,
        onTap: () {},
      ),
      _bottomBarItem = BottomBarItem(
        text: "Notification",
        trailingIcon: Icons.arrow_forward,
        onTap: () {},
      ),
      _bottomBarItem = BottomBarItem(
        text: "Terms & Condition",
        trailingIcon: Icons.arrow_forward,
        onTap: () {},
      ),
    ];

    _actionBottomMenuNavigatorViewModel = ActionBottomMenuNavigatorViewModel(
        size: ActionBottomMenuNavigatorOptionSize.large,
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
          )),
    );
  }
}
