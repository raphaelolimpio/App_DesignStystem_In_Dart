import 'package:designsystemsampleapp/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/inputImagem/InputImagem.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/inputImagem/ProfileAvatar/inputProfileAvatar_view_model.dart';
import 'package:designsystemsampleapp/views/Menu/menuBotton_view_model.dart';
import 'package:designsystemsampleapp/views/SingUp/singUp_view_model.dart';
import 'package:designsystemsampleapp/views/login/login.dart';
import 'package:designsystemsampleapp/views/login/resetPassWord/resetPassWord_view_model.dart';
import 'package:flutter/material.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/InputField/input_text.dart';
import 'package:image_picker/image_picker.dart';

class LoginViewModel extends StatefulWidget {
  const LoginViewModel({super.key});

  @override
  State<LoginViewModel> createState() => _LoginViewModelState();
}

class _LoginViewModelState extends State<LoginViewModel> {
  late Login _viewModel; // Instância do ViewModel
  late ActionButtonViewModel _loginButtonViewModel; // Instância do ActionButton
  late LinkedLabelViewModel _linkedLabelViewModel; // Instância do LinkedLabel
  late ActionButtonViewModel _creatAccountButtonViewModel; // Instância
  late final ProfileAvatarViewModel _profileAvatarLoginViewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = Login(); // Inicializa o ViewModel

    //imagem do perfil
    _profileAvatarLoginViewModel = ProfileAvatarViewModel(
      model: ProfileAvatarModel.large,
      addImageIcon: null,
      allowEdit: true,
      removeImageIcon: Icon(Icons.remove_circle),
      onImageChanged: (image) {},
      getImageSource: () async {
        return ImageSource.gallery;
      },
      getPreferredCameraDevice: () async {
        return CameraDevices.rear;
      },
      onImageRemoved: () {},
    );

    //botão
    _loginButtonViewModel = ActionButtonViewModel(
      size: ActionButtonSize.large,
      style: ActionButtonStyle.primary,
      text: 'Login',
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
          MaterialPageRoute(builder: (context) => const SingUpViewModel()),
        );
      },
      size: ActionButtonSize.small,
      style: ActionButtonStyle.primary,
      text: "Sing Up",
    );

    _linkedLabelViewModel = LinkedLabelViewModel(
        fullText: "Forgot Password",
        linkedText: "Forgot Password",
        onLinkTap: () => ResetpasswordViewModel());
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
                padding: EdgeInsets.only(top: 50.0, bottom: 50.0),
                child: ProfileAvatar(viewModel: _profileAvatarLoginViewModel),
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
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child:
                      LinkedLabel.instantiate(viewModel: _linkedLabelViewModel),
                ),
              ),

              //buton login
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  child: ActionButton.instantiate(
                      viewModel: _loginButtonViewModel),
                ),
              ),
              //buton criar conta
              Padding(
                padding: EdgeInsets.only(top: 100.0, bottom: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Don't have An Account?"),
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
