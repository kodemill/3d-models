$step=10;
$h=0.1;

// cr : cylinder radisu for wrapping
// r : radius of actual pipe
// vr : radius of "virtual" pipe, used to place the real pipe

module place(cr=20,r=5,vr=5,t=0,dz=0) {
  //dz= t/360*2*vr
    rotate(t,[0,0,1])
    translate([cr+vr,0,dz])
    rotate(90,[1,0,0]) linear_extrude(height=$h,center=true) circle(r=r);
}

module loop(cr=20,r=5,vr=5,angle=360) {
    for( t=[0:$step:angle-$step/2] ) {
        hull() {
            place(cr=cr,r=r,vr=vr,t=t);
            place(cr=cr,r=r,vr=vr,t=t+$step);
        }
    }
}

module emptyLoop(cr=20,rin=5,rout=7,angle=360) {
    difference() {
        /*render(convexity=2)*/ loop(angle=angle,cr=cr,r=rout,vr=rout,$h=0.1);
        /*render(convexity=2)*/ loop(angle=angle,cr=cr,r=rin,vr=rout,$h=0.5);
    }
}

module manyLoops(cr=20,n=5,r=5,vr=5,h=0.1) {
    for(i=[0:n-1]) {
        translate([0,0,i*vr*2]) loop(cr=cr,r=r,vr=vr);
    }
}

module manyEmptyLoops(cr=20,n=5,rout=7,rin=5) {
    for(i=[0:n-1]) {
        translate([0,0,i*rout*2]) emptyLoop(cr=cr,rin=rin,rout=rout);
    }
}

//place();
//loop();
//manyLoops();
manyEmptyLoops();

%translate([0,0,-20]) cylinder(r=20,h=100);
