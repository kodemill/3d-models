use <fittings.scad>
use <lib/pipe.scad>

union () {

  // male_end();
  female_fitting(
    edges = 6,
    d = 18,
    pitch = 1.4111,
    D = 25,
    height = 6,
    thread_angle = 27
  );

  translate([33, 0, 0])
  female_fitting(
    edges = 6,
    d = 17.5,
    D = 25,
    height = 6,
    pitch = 1.4111,
    thread_angle = 27
  );
}

module male_end (
  D_stop = 25,
  d_stop = 13,
  length_stop = 12,
  pitch_male_fitting = 1.4111,
  D_male_fitting = 16.42,
  d_male_fitting = 7.5,
  length_male_fitting = 10
  // Dmin_male_fitting = D_male_fitting-pitch_male_fitting/PI - 1.2,
) {
  difference () {
    dz_fitting = -1.29;
    translate([0, 0, dz_fitting])
    male_fitting(
      pitch = pitch_male_fitting,
      thread_angle = 27,
      D = D_male_fitting,
      d = d_male_fitting,
      height = length_male_fitting - dz_fitting
    );

    translate([0, 0, dz_fitting-1])
    cylinder(d = D_male_fitting+.1, h = 1-dz_fitting);
  }

  translate([0, 0, -length_stop])
  difference () {
    cylinder(
      d = 20.6,
      h = length_stop,
      $fn = 6
    );

    translate([0, 0, -.1])
    cylinder(
      d = d_male_fitting+.1,
      h = length_stop+.2
    );
  }
}

module threaded_male (
  D_stop = 25,
  d_stop = 13,
  length_stop = 12,
  pitch_male_fitting = 1.4111,
  D_male_fitting = 16.42,
  d_male_fitting = 7.5,
  length_male_fitting = 10
) {
  difference () {
    dz_fitting = -1.29;
    translate([0, 0, dz_fitting])
    male_fitting(
      pitch = pitch_male_fitting,
      thread_angle = 27,
      D = D_male_fitting,
      d = d_male_fitting,
      height = length_male_fitting - dz_fitting
    );

    translate([0, 0, dz_fitting-1])
    cylinder(d = D_male_fitting+.1, h = 1-dz_fitting);
  }
}
