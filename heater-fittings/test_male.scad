use <lib/Threading.scad>

// for (i=[0:3]) {
//   D = 7.9+i*.1;
//   d = D-3;
//   height = 7;
//   translate( [i*34, 0, 0] ) {
//     testModel( pitch = 1.2, height = height, D = D, d = d );
//     translate( [15, 0, 0] )
//       testModel( pitch = 1.3, height = height,  D = D, d = d );
//     translate([0, 10, 0])
//       text(str(D));
//   }
// }
// te

for (i=[0:3]) {
  // D = 16.7+i*.1;
  D = 16.8;
  d = D-3;
  height = 7;
  pitch = 1.1023-.1+i*.1;
  // pitch = 1.10236220472;
  translate([i*21, 0, 0]) {
    testModel(pitch = pitch, height = height, D = D, d = d);
    // translate( [20, 0, 0] )
    //   testModel( pitch = 2, height = height,  D = D, d = d );
    translate([0, 10, 0])
      %text(text = str(pitch), size = 4, halign = "center");
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
      cylinder( r = D/2+1, h = 2 );
      translate( [0, 0, -1] )
        cylinder(
          r = d/2,
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

