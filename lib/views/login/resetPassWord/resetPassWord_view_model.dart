import 'package:designsystemsampleapp/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/InputField/input_text.dart';
import 'package:designsystemsampleapp/views/login/login.dart';
import 'package:designsystemsampleapp/views/login/login_view_model.dart';
import 'package:flutter/material.dart';

class ResetpasswordViewModel extends StatefulWidget {
  const ResetpasswordViewModel({super.key});

  @override
  State<ResetpasswordViewModel> createState() => _ResetpasswordViewModelState();
}

class _ResetpasswordViewModelState extends State<ResetpasswordViewModel> {
  @override
  late ActionButtonViewModel _loginButtonViewModel;
  late Login _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = Login(); // Inicializa o ViewModel
    //botão
    _loginButtonViewModel = ActionButtonViewModel(
      size: ActionButtonSize.large,
      style: ActionButtonStyle.primary,
      text: 'Login',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginViewModel()),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 50.0, bottom: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(color: Colors.blueGrey[50]),
                  child: Center(
                    child: const Text(
                        "We will send you on your email reset password link",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 20.0)),
                  ),
                ),
                const SizedBox(height: 16.0),

                StyledInputField.instantiate(
                    viewModel: _viewModel.emailViewModel),
                const SizedBox(height: 16.0),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    child: ActionButton.instantiate(
                        viewModel: _loginButtonViewModel),
                  ),
                ), //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
