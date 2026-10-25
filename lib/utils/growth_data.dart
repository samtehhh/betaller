// Height-for-age percentiles live in height_reference.dart (US CDC growth
// charts, LMS method); this file keeps the growth speed and growth plate tables.

/// Average growth velocity (cm/year) by age and gender
/// Based on WHO/CDC reference data
const Map<String, Map<int, double>> averageGrowthVelocity = {
  'male': {
    2: 8.5,
    3: 7.5,
    4: 7.0,
    5: 6.5,
    6: 6.0,
    7: 5.8,
    8: 5.5,
    9: 5.3,
    10: 5.2,
    11: 5.5,
    12: 6.5,
    13: 8.0,
    14: 9.0,
    15: 7.0,
    16: 5.0,
    17: 3.0,
    18: 1.5,
    19: 0.8,
    20: 0.3,
  },
  'female': {
    2: 8.5,
    3: 7.5,
    4: 7.0,
    5: 6.3,
    6: 6.0,
    7: 5.7,
    8: 5.5,
    9: 5.5,
    10: 6.5,
    11: 7.5,
    12: 7.0,
    13: 5.0,
    14: 3.0,
    15: 1.5,
    16: 0.8,
    17: 0.4,
    18: 0.2,
    19: 0.1,
    20: 0.0,
  },
};

/// Growth plate closure timeline by gender
const Map<String, Map<String, int>> growthPlateInfo = {
  'male': {
    'typicalClosureAge': 16,
    'completeClosureAge': 21,
    'peakGrowthAge': 14,
  },
  'female': {
    'typicalClosureAge': 14,
    'completeClosureAge': 18,
    'peakGrowthAge': 12,
  },
};
