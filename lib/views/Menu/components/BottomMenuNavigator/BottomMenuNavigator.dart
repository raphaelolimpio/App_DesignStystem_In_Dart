import 'package:flutter/material.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/MenuComponents/BottomMenuNavigator/BottomMenuNavigator_view_model.dart';

class CustomBottomMenuNavigator extends StatefulWidget {
  final ActionBottomMenuNavigatorViewModel viewModel;

  const CustomBottomMenuNavigator._(this.viewModel);

  @override
  _CustomBottomMenuNavigatorState createState() =>
      _CustomBottomMenuNavigatorState();

  // Método para instanciar o widget com o ViewModel apropriado
  static Widget instantiate(
      {required ActionBottomMenuNavigatorViewModel viewModel}) {
    return CustomBottomMenuNavigator._(viewModel);
  }
}

class _CustomBottomMenuNavigatorState extends State<CustomBottomMenuNavigator> {
  late double buttonIconSize;
  late TextStyle buttonTextStyle;
  late Color buttonColor;

  @override
  void initState() {
    super.initState();

    // Ajuste do tamanho do botão e ícones com base no `size`
    switch (widget.viewModel.size) {
      case ActionBottomMenuNavigatorOptionSize.large:
        buttonTextStyle =
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
        buttonIconSize = 32.0;
        break;
      case ActionBottomMenuNavigatorOptionSize.medium:
        buttonTextStyle =
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
        buttonIconSize = 24.0;
        break;
      case ActionBottomMenuNavigatorOptionSize.small:
        buttonTextStyle =
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w200);
        buttonIconSize = 16.0;
        break;
    }

    // Ajuste de cores baseado no `style`
    switch (widget.viewModel.style) {
      case ActionBottomMenuNavigatorStyle.primary:
        buttonColor = Colors.white;
        break;
      case ActionBottomMenuNavigatorStyle.secondary:
        buttonColor = Colors.green;
        break;
      case ActionBottomMenuNavigatorStyle.tertiary:
        buttonColor = Colors.grey;
        break;
    }
  }

  // Define o tamanho do ícone com base no `iconSize` de cada item
  double _getIconSize(ActionIconSize iconSize) {
    switch (iconSize) {
      case ActionIconSize.large:
        return 25.0;
      case ActionIconSize.medium:
        return 20.0;
      case ActionIconSize.small:
        return 16.0;
      default:
        return 20.0;
    }
  }

  // Define a cor do ícone com base no `iconColor` de cada item
  Color _getIconColor(ActionIconColors iconColor) {
    switch (iconColor) {
      case ActionIconColors.primary:
        return Colors.black;
      case ActionIconColors.secondary:
        return Colors.green;
      case ActionIconColors.tertiary:
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Column(
        children: List.generate(widget.viewModel.items.length, (index) {
          final item = widget.viewModel.items[index];
          return Container(
            color: buttonColor,
            margin: const EdgeInsets.symmetric(
                vertical: 5), // Espaço entre os botões
            child: ListTile(
              leading: item.leadingIcon != null
                  ? Icon(
                      item.leadingIcon,
                      size: _getIconSize(item.iconSize),
                      color: _getIconColor(item.iconColor),
                    )
                  : null, // Icone inicial
              title: Text(
                item.text,
                style: buttonTextStyle,
              ), // Texto do meio
              trailing: item.trailingIcon != null
                  ? Icon(
                      item.trailingIcon,
                      size: _getIconSize(item.iconSize),
                      color: _getIconColor(item.iconColor),
                    )
                  : null, // Icone final
              onTap: () {
                if (item.onTap != null) {
                  item.onTap!();
                }
              },
            ),
          );
        }),
      ),
    );
  }
}

class BottomMenuNavigatorController {
  final ActionBottomMenuNavigatorViewModel viewModel;

  BottomMenuNavigatorController(this.viewModel);
}
