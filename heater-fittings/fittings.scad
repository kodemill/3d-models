use <lib/Threading.scad>

// 3/8" male
translate([0, 0, 0]) {
  male_fitting(
    pitch = 1.4111,
    thread_angle = 27,
    D = 16.6,
    d = 8,
    height = 8
  );
  %translate([0, 10, 0])
    text(text = "3/8\"", size = 4, halign = "center");
}



module male_fitting (
  d = 6,
  D = 10,
  height = 10,
  thread_angle = 29,
  pitch = 1,
  $fn = 100,
  cut = true
) {
  // windings = 0,
  dz_fitting = 1.2;
  height = height + (cut ? dz_fitting : 0);
  windings = height/pitch-1;

  translate([0, 0, cut ? -dz_fitting : 0])
  difference () {
    threading(
      pitch = pitch,
      d = D,
      windings = windings,
      angle = thread_angle,
      full = true
    );

    translate([0, 0, -1])
    cylinder(r = d/2, h = 2+height);

    if (cut) {
      translate([0, 0, -.1])
      cylinder(d = D+.1, h = dz_fitting+.1);
    }
  }

}


module female_fitting (
  d = 6,
  D = 10,
  height = 10,
  thread_angle = 29,
  pitch = 1,
  edges,
  $fn = 100,
) {
  windings = height/pitch-1;
  Threading(
    pitch = pitch,
    d = d,
    D = D,
    windings = windings,
    angle = thread_angle,
    edges = edges,
    $fn = $fn
  );
}

module pipe(
  d = 10,
  D = 12,
  d1 = 0,
  d2 = 0,
  D1 = 0,
  D2 = 0,
  h = 10,
  sides = 0
) {
  d1 = d1 != 0 ? d1 : d;
  d2 = d2 != 0 ? d2 : d;
  D1 = D1 != 0 ? D1 : D;
  D2 = D2 != 0 ? D2 : D;
  difference () {
    cylinder(
      h = h,
      d1 = D1,
      d2 = D2,
      $fn = sides
    );

    translate( [0, 0, -.1] )
    cylinder(
      h = h+.2,
      d1 = d1,
      d2 = d2
    );
  }
}
