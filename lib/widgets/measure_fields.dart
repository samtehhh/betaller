import 'package:flutter/material.dart';

import '../utils/units.dart';

/// Text fields for a height or a weight in the user's own unit: one field
/// for cm, kg or lb, two for ft + in and st + lb, the same split the
/// onboarding pickers use. [value] comes back in cm or kg.
///
/// A value the user did not touch comes back exactly as it went in, so
/// saving a sheet for another field never nudges a stored height by the
/// rounding of its display.
class MeasureFields {
  final double initial;

  /// One suffix per field: ['cm'], ['ft', 'in'], ['kg'], ['lb'], ['st', 'lb'].
  final List<String> suffixes;
  final List<TextEditingController> controllers;
  final List<String> _initialText;
  final double Function(List<double> parts) _toMetric;

  MeasureFields._(this.initial, this.suffixes, List<String> text, this._toMetric)
    : _initialText = text,
      controllers = [for (final t in text) TextEditingController(text: t)];

  /// A height in cm, shown as cm or as ft + in.
  factory MeasureFields.height(UnitPrefs units, double cm) {
    if (!units.imperialHeight) {
      return MeasureFields._(cm, const ['cm'], [cm.toStringAsFixed(1)],
          (p) => p[0]);
    }
    final (whole, rest) = _split(cm / UnitPrefs.cmPerInch, 12);
    return MeasureFields._(
      cm,
      const ['ft', 'in'],
      ['$whole', _trim(rest)],
      (p) => (p[0] * 12 + p[1]) * UnitPrefs.cmPerInch,
    );
  }

  /// A weight in kg, shown as kg, lb, or st + lb.
  factory MeasureFields.weight(UnitPrefs units, double kg) {
    switch (units.weight) {
      case WeightUnit.kg:
        return MeasureFields._(kg, const ['kg'], [kg.toStringAsFixed(1)],
            (p) => p[0]);
      case WeightUnit.lb:
        return MeasureFields._(
          kg,
          const ['lb'],
          [(kg * UnitPrefs.lbPerKg).toStringAsFixed(1)],
          (p) => p[0] / UnitPrefs.lbPerKg,
        );
      case WeightUnit.stLb:
        final (whole, rest) = _split(kg * UnitPrefs.lbPerKg, 14);
        return MeasureFields._(
          kg,
          const ['st', 'lb'],
          ['$whole', _trim(rest)],
          (p) => (p[0] * 14 + p[1]) / UnitPrefs.lbPerKg,
        );
    }
  }

  /// Whole big units and the small rest to one decimal, carrying a rest
  /// that rounds up to a full big unit (5 ft 11.97 in → 6 ft 0 in).
  static (int, double) _split(double small, int perBig) {
    var whole = small ~/ perBig;
    var rest = double.parse((small - whole * perBig).toStringAsFixed(1));
    if (rest >= perBig) {
      whole += 1;
      rest = 0;
    }
    return (whole, rest);
  }

  static String _trim(double v) {
    final s = v.toStringAsFixed(1);
    return s.endsWith('.0') ? s.substring(0, s.length - 2) : s;
  }

  bool get split => controllers.length > 1;

  bool get edited {
    for (var i = 0; i < controllers.length; i++) {
      if (controllers[i].text.trim() != _initialText[i]) return true;
    }
    return false;
  }

  /// The typed value in cm or kg, or null when it doesn't parse. An empty
  /// second field (inches, pounds) counts as 0.
  double? get value {
    if (!edited) return initial;
    final parts = <double>[];
    for (var i = 0; i < controllers.length; i++) {
      final text = controllers[i].text.trim().replaceAll(',', '.');
      final v = text.isEmpty && i > 0 ? 0.0 : double.tryParse(text);
      if (v == null || v < 0) return null;
      parts.add(v);
    }
    return _toMetric(parts);
  }

  /// The fields side by side; [field] builds one in the caller's style.
  Widget build(
    Widget Function(TextEditingController controller, String suffix, int i)
    field, {
    double gap = 10,
  }) {
    if (!split) return field(controllers[0], suffixes[0], 0);
    return Row(
      children: [
        Expanded(child: field(controllers[0], suffixes[0], 0)),
        SizedBox(width: gap),
        Expanded(child: field(controllers[1], suffixes[1], 1)),
      ],
    );
  }

  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
  }
}
