import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Para selecionar imagens

enum CameraDevices {
  front,
  rear,
}

enum ProfileAvatarModel {
  small,
  medium,
  large,
}

//predefinição de tamanho
extension ProfileAvatarSizeExtension on ProfileAvatarModel {
  double get size {
    switch (this) {
      case ProfileAvatarModel.small:
        return 40.0;
      case ProfileAvatarModel.medium:
        return 60.0;
      case ProfileAvatarModel.large:
        return 80.0;
    }
  }
}

class ProfileAvatarViewModel {
  XFile? image; // A imagem do avatar, pode ser nula.
  final double
      radius; // O raio do círculo do avatar, determinado pelo tamanho do avatar.
  final bool
      allowEdit; // Um booleano que indica se a edição da imagem é permitida.
  final Widget? addImageIcon; // O ícone que permite adicionar uma nova imagem.
  final Widget? removeImageIcon; // O ícone que permite remover a imagem atual.
  final Function(XFile?)
      onImageChanged; // Função callback chamada quando a imagem é alterada.
  final Function
      onImageRemoved; // Função callback chamada quando a imagem é removida.
  final Future<ImageSource> Function()
      getImageSource; // Função que retorna a fonte da imagem (câmera ou galeria).
  final Future<CameraDevices> Function()
      getPreferredCameraDevice; // Função que retorna o dispositivo da câmera preferido.

  ProfileAvatarViewModel({
    this.image,
    required ProfileAvatarModel model,
    required this.allowEdit,
    required this.addImageIcon,
    required this.removeImageIcon,
    required this.onImageChanged,
    required this.onImageRemoved,
    required this.getImageSource,
    required this.getPreferredCameraDevice,
  }) : radius = model.size;

  void updateImage(XFile? newImage) {
    image = newImage;
    onImageChanged(newImage);
  }

  void removeImage() {
    image = null;
    onImageRemoved();
  }
}
