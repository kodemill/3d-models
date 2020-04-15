use <lib/Threading.scad>


// Threading(D = 25, pitch = 2, d=20, windings = 10, angle = 20, $fn=100);

// #1 ACME thread
//threading(pitch = 2, d=20, windings = 5, angle = 29);
// #2 threaded rod 20°
  //threading(pitch = 2, d=20, windings = 30, angle = 20, full = true);

for (i=[0.60:.20:2]) {
  translate([-30+ i * 60, 0, 0])
    testModel(pitch = i, windings = 5/i);
}


module testModel (
  diameter_male_outer = 6.2,
  D = 11,
  thread_angle = 29,
  windings = 5,
  $fn = 100,
  pitch = 1
) {
  union() {
    difference() {
      cylinder( r = D/2, h = 2 );
      translate( [0, 0, -1] )
        cylinder(
          r = diameter_male_outer/2 - 2/PI - .5,
          h = 14
        );
    }
    //translate([0, 0, 1.75])
    threading(
      pitch = pitch,
      d = diameter_male_outer,
      windings = windings,
      angle = thread_angle
    );
  }
}
