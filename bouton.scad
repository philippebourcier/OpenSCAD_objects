$fn=90;

module torus(twists) {
step=1;
for(i=[0:step:360]) {
        rotate([0,0,i]) rotate_extrude(angle=step,convexity=10){
            translate([8.5,0,0]) rotate([0,0,i/2.4*twists]) circle(1.2, $fn=4);
        }
    }
}

module bouton() {
    // un bouton de base
    difference() {
        cylinder(h=1,d=20);
        translate([0,0,0.5]) cylinder(1,d=16);
        translate([3,3,-1]) cylinder(5,d=2);
        translate([3,-3,-1]) cylinder(5,d=2);
        translate([-3,3,-1]) cylinder(5,d=2);
        translate([-3,-3,-1]) cylinder(5,d=2);
    }
    // on rajoute un donuts ou autre forme, coupé
    difference() {
        // truc marrant
        //translate([0,0,1]) torus(3*1.2);
        // donuts classique
        rotate_extrude(angle=360) { translate([10-3/2, 0])circle(d=3); }
        translate([0,0,-2]) cube([21,21,5],center=true);
    }
}

// pour voir le rendu du bouton
//translate([0,0,10]) bouton();

// on fait un moule
module moule() {
    difference() {
        cube([23,23,10],center=true);
        rotate([180]) bouton();
        translate([0,0,4]) cylinder(h=8,d=19,center=true);
    }
}

// pour voir le moule
moule();
