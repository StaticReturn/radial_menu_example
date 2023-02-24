import 'package:flutter/material.dart';

class RadialSelection {
  RadialSelection(this.name, this.icon);
  String name;
  Icon icon;
  double get iconXoffset => _getXoffset();
  set iconXoffset(newValue) => _setXoffset(newValue);
  double _iconXoffset = 0.0;
  bool _xOffsetManuallySet = false;
  double get iconYoffset => _getYoffset();
  set iconYoffset(newValue) => _setYoffset(newValue);
  double _iconYoffset = 0.0;
  bool _yOffsetManuallySet = false;


  _setXoffset(double newValue) {
    _iconXoffset = newValue;
    _xOffsetManuallySet = true;
  }

  _setYoffset(double newValue) {
    _iconYoffset = newValue;
    _yOffsetManuallySet = true;
  }

  double _getXoffset() {
    if (_xOffsetManuallySet) {
      return _iconXoffset;
    } else if (icon.size != null) {
      return icon.size!;
    } else {
      return 0.0;
    }
  }

  double _getYoffset() {
    if (_yOffsetManuallySet) {
      return _iconYoffset;
    }

    if (icon.size != null) {
      return icon.size!;
    } else {
      return 0.0;
    }
  }
}
