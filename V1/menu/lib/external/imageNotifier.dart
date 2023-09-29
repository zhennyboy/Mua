import 'dart:io';
import 'package:flutter/foundation.dart';

class ImageNotifier extends ChangeNotifier {
  File? _image;
  File? _prof;
  File? _dateImg;

  File? get image => _image;
  File? get profileImg => _prof;
  File? get dateImg => _dateImg;

  void setImage(File newImage) {
    _image = newImage;
    notifyListeners();
  }

  void setProfImage(File newImage) {
    _prof = newImage;
    notifyListeners();
  }

  void setDateImage(File newImage) {
    _dateImg = newImage;
    notifyListeners();
  }
}
