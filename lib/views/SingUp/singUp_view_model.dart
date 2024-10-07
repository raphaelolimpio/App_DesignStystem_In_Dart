import 'package:designsystemsampleapp/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:designsystemsampleapp/views/Menu/menuBotton_view_model.dart';
import 'package:designsystemsampleapp/views/SingUp/singUp.dart';
import 'package:designsystemsampleapp/views/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/InputField/input_text.dart';

class SingUpViewModel extends StatefulWidget {
  const SingUpViewModel({super.key});

  @override
  State<SingUpViewModel> createState() => _SingUpViewModelState();
}

class _SingUpViewModelState extends State<SingUpViewModel> {
  late SingUp _viewModel; // Instância do ViewModel
  late ActionButtonViewModel
      _singUpButtonViewModel; // Instância do ActionButton
  late LinkedLabelViewModel _linkedLabelViewModel; // Instância do LinkedLabel
  late ActionButtonViewModel _creatAccountButtonViewModel; // Instância do

  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _viewModel = SingUp(); // Inicializa o ViewModel
    //botão
    _singUpButtonViewModel = ActionButtonViewModel(
      size: ActionButtonSize.large,
      style: ActionButtonStyle.primary,
      text: 'Singup',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MenubottonViewModel()),
        );
      },
    );

    _creatAccountButtonViewModel = ActionButtonViewModel(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginViewModel()),
        );
      },
      size: ActionButtonSize.small,
      style: ActionButtonStyle.primary,
      text: "Login",
    );

    _linkedLabelViewModel = LinkedLabelViewModel(
        fullText: "I've read agreen Terms & Services",
        linkedText: "Terms & Services",
        onLinkTap: () => _viewModel.OnLinktTap(context));
  }

  @override
  void dispose() {
    _viewModel.dispose(); // Libera os recursos no ViewModel
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //imagem
              Padding(
                padding: EdgeInsets.only(top: 25.0, bottom: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      "https://th.bing.com/th/id/OIP.L5IWtVZ4PY3xJ8Sr7EUmywHaHa?rs=1&pid=ImgDetMain",
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),

              //inputTExt
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Campo de email
                    StyledInputField.instantiate(
                        viewModel: _viewModel.emailViewModel),
                    const SizedBox(height: 16.0),
                    // Campo de senha
                    StyledInputField.instantiate(
                        viewModel: _viewModel.passwordViewModel),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.1, horizontal: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _viewModel.buildCustomCheckbox(
                      isChecked: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                      linkedLabelViewModel: _linkedLabelViewModel,
                    ),
                  ],
                ),
              ),

              //buton login
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  child: ActionButton.instantiate(
                      viewModel: _singUpButtonViewModel),
                ),
              ),
              //buton criar conta
              Padding(
                padding: EdgeInsets.only(top: 90.0, bottom: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Already Have An Account?"),
                    const SizedBox(height: 10.0),
                    ActionButton.instantiate(
                        viewModel: _creatAccountButtonViewModel), //
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
