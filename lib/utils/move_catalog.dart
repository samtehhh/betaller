/// Where each move belongs in the exercise library, and what it needs.
///
/// The weekly plan stays something anyone can do at home (a bar is the only
/// extra), so moves that need weights or a band live here, in their own
/// group, for people who have them.
enum MoveGroup { jump, stretch, strength, hang, posture, weights }

const Map<MoveGroup, List<String>> kMoveGroups = {
  MoveGroup.jump: [
    'masai_jumps',
    'pogo_jumps',
    'jumping',
    'jump_squats',
    'tuck_jumps',
    'broad_jumps',
    'single_leg_hops',
    'high_knees',
    'skipping_rope',
    'calf_pulses',
    'calf_raise',
    'sprint_intervals',
    'hiit_workout',
    'burpees',
  ],
  MoveGroup.hang: [
    'dead_hang_active',
    'bar_hanging',
    'scapular_pull',
    'hanging_knee_raise',
    'pull_ups',
    'inversion_hang',
  ],
  MoveGroup.stretch: [
    'cobra_stretch',
    'downward_dog',
    'upward_salute',
    'mountain_pose',
    'toe_touch',
    'seated_forward_fold',
    'standing_side_stretch',
    'cat_cow',
    'childs_pose',
    'puppy_pose',
    'low_lunge_arch',
    'hip_flexor_stretch',
    'bow_pose',
    'pilates_roll_over',
    'spinal_twist',
    'chest_stretch',
    'legs_up_wall',
    'knee_circles',
    'wall_dog',
    'deadlift_stretch',
    'morning_stretch',
    'evening_yoga',
  ],
  MoveGroup.strength: [
    'squats',
    'lunges',
    'step_ups',
    'wall_sit',
    'single_leg_calf_raise',
    'glute_bridge',
    'table_top',
    'push_ups',
    'plank',
    'side_plank',
    'bird_dog',
    'dead_bug',
    'superman',
    'pilates_core',
    'swimming_basketball',
  ],
  MoveGroup.posture: [
    'wall_stand',
    'wall_angels',
    'chin_tucks',
    'scapular_retraction',
    'thoracic_extension',
    'pelvic_shift',
    'neck_stretches',
    'shoulder_rolls',
  ],
  MoveGroup.weights: [
    'goblet_squat',
    'dumbbell_deadlift',
    'dumbbell_row',
    'overhead_press',
    'farmer_carry',
    'band_pull_apart',
  ],
};

/// Moves with no clip that have two photographs instead: the start and
/// the end of the movement, at `assets/exercises/stills/<id>_1.jpg` and
/// `_2.jpg`. Source and licence: tool/exercise_stills_credits.json.
const kExerciseStills = <String>{
  'jump_squats',
  'tuck_jumps',
  'single_leg_hops',
  'pelvic_shift',
  'childs_pose',
  'seated_forward_fold',
  'standing_side_stretch',
  'spinal_twist',
  'chest_stretch',
  'mountain_pose',
  'scapular_retraction',
  'hanging_knee_raise',
  'scapular_pull',
  'pull_ups',
  'dead_bug',
  'side_plank',
  'lunges',
  'step_ups',
  'push_ups',
  'goblet_squat',
  'dumbbell_deadlift',
  'dumbbell_row',
  'farmer_carry',
  'band_pull_apart',
  'superman',
  'broad_jumps',
};

/// Every move in the library, in group order.
List<String> get kLibraryMoves => [
  for (final ids in kMoveGroups.values) ...ids,
];

/// The group a move belongs to, or null for something that is not a move
/// (a habit such as water or sleep).
MoveGroup? moveGroupOf(String id) {
  for (final e in kMoveGroups.entries) {
    if (e.value.contains(id)) return e.key;
  }
  return null;
}
