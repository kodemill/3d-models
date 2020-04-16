use <lib/Threading.scad>
use <lib/pipe.scad>


$fn = 44;

// emptyLoop(
//   cr=10,
//   angle=90,
//   $step=2.8
// );
union() {
  male_height = 11;
  d_male = 3;
  D_male = 8;
  R_male = D_male/2;
  R_pipe = 3.6;
  stop_height = 11;

  male( d = d_male, D = D_male, height = male_height, pitch = 1.2 );
  translate( [0, 0, male_height-1] )
    pipe(d = d_male, D = 12, height = stop_height);

  translate( [0, 0, stop_height+male_height*2-2] ) rotate( [180] )
    male( d = d_male, D = D_male, height = male_height, pitch = 1.2 );
    // translate( [0, 0, stop_height] )
  // cylinder ()
  // translate( [-R_pipe-R_male, 0, male_height-2] )
  // rotate( [90, 0, 0] )
  //   emptyLoop(
  //     cr=R_pipe,
  //     rin=d_male/2,
  //     rout=R_male,
  //     angle=90,
  //     $step=1
  //   );

  // female( d=D_male, D=D_male+4, height=male_height, pitch=1.2 );
}

module pipe (
  d = 6,
  D = 10,
  height = 10
) {
  difference () {
    cylinder( r = D/2, h = height );
    translate( [0, 0, -1] ) cylinder( r = d/2, h = 2+height );
  }
}

module male (
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
  translate( [0, 0, height] )
  rotate( [180] )
  difference () {
    threading( pitch = pitch, d = D, windings = windings, angle = thread_angle, full = true );
    translate( [0, 0, -1] ) cylinder( r = d/2, h = 2+height );
  }
}

module female (
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
  Threading( pitch = pitch, D = D, d = d, windings = windings, angle = thread_angle );
}
