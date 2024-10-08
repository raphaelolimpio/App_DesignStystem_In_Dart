import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Components/inputImagem/ProfileAvatar/inputProfileAvatar_view_model.dart';

class InputprofileavatarSampleScreen extends StatefulWidget {
  const InputprofileavatarSampleScreen({super.key});

  @override
  State<InputprofileavatarSampleScreen> createState() =>
      _InputprofileavatarSampleScreenState();
}

class _InputprofileavatarSampleScreenState
    extends State<InputprofileavatarSampleScreen> {
  late final ProfileAvatarViewModel _profileAvatarViewModel =
      ProfileAvatarViewModel(
          model: ProfileAvatarModel.medium,
          addImageIcon: Icon(Icons.add_a_photo),
          allowEdit: true,
          removeImageIcon: Icon(Icons.remove_circle),
          onImageChanged: (image) {},
          getImageSource: () async {
            return ImageSource.gallery;
          },
          getPreferredCameraDevice: () async {
            return CameraDevice.rear;
          },
          onImageRemoved: null);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
