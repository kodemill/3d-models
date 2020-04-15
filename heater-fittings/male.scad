use <lib/Threading.scad>

for (i=[0:5]) {
  dx = i*40;
  D = 9+i*.2;
  translate([dx, 0, 0]) {
    testModel(pitch = 1, height = 10, D = D );
    translate([18, 0, 0])
      testModel(pitch = 2, height = 10,  D = D);
    // translate([0, 10, 0])
    //   text(str(D));
  }
}

module testModel (
  d = 6,
  D = 10,
  windings = 5,
  height = 0,
  thread_angle = 29,
  pitch = 1,
  $fn = 100,
) {
  height = height == 0 ? pitch*(windings+1) : height;
  windings = height == 0 ? windings : height/pitch-1;

  union() {
    difference() {
      cylinder( r = D/2+3, h = 3 );
      translate( [0, 0, -1] )
        cylinder(
          r = d/2 - 2/PI - .5,
          h = 14
        );
    }
    difference () {
      threading( pitch = pitch, d = D, windings = windings, angle = thread_angle, full = true );
      translate( [0, 0, -1] )
        cylinder( r = d/2, h = 2+pitch*(windings+1) );
    }
  }
}

