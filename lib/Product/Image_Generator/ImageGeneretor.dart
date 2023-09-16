// ignore_for_file: file_names

enum ImageEnum { chicken, banana, water, avocado }

extension ImageGenerator on ImageEnum {
  String get toPath => 'asset/Image/ic_$name.png';
}
