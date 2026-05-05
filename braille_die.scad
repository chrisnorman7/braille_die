$fn = 50;

// The distance between pips.
pip_spacing = 5;

// The size of the die.
die_size = 3 * pip_spacing;

// The radius of the corners of the cube.
corner_radius = 3;

// The radius for the pips.
pip_radius = 1.2;

// The offset where pips will start.
pip_offset = corner_radius + (pip_spacing / 2);

// The full size of the cube.
full_size = corner_radius + die_size + corner_radius;

// A half the size of each face.
half_size = full_size / 2;

// The main body of the die.
module body() {
  translate([corner_radius, corner_radius, corner_radius])
    minkowski() {
      cube([die_size, die_size, die_size]);
      sphere(r=corner_radius);
    }
}

// A pip on the die.
module pip() {
  sphere(r=pip_radius);
}

// The 1 face.
module face_1() {
  translate(v=[half_size, half_size, full_size])
    pip();
}

// The 6 face.
module face_6() {
  translate([pip_offset, pip_offset, 0])
    pip();
  translate([pip_offset, pip_offset + pip_spacing, 0])
    pip();
  translate([pip_offset, pip_offset + pip_spacing + pip_spacing, 0])
    pip();
  translate([full_size - pip_offset, pip_offset, 0])
    pip();
  translate([full_size - pip_offset, pip_offset + pip_spacing, 0])
    pip();
  translate([full_size - pip_offset, pip_offset + pip_spacing + pip_spacing, 0])
    pip();
}

// The 2 face.
module face_2() {
  translate([pip_offset, 0, pip_offset])
    pip();
  translate([full_size - pip_offset, 0, full_size - pip_offset])
    pip();
}

// The 5 face.
module face_5() {
  // Centre.
  translate([half_size, full_size, half_size])
    pip();
  // Bottom left.
  translate([pip_offset, full_size, pip_offset])
    pip();
  // Top left.
  translate([pip_offset, full_size, full_size - pip_offset])
    pip();
  // Top right.
  translate([full_size - pip_offset, full_size, full_size - pip_offset])
    pip();
  // Bottom right.
  translate([full_size - pip_offset, full_size, pip_offset])
    pip();
}

// The 3 face.
module face_3() {
  translate([full_size, full_size - pip_offset, pip_offset])
    pip();
  translate([full_size, pip_offset, full_size - pip_offset])
    pip();
  translate([full_size, half_size, half_size])
    pip();
}

// The 4 face.
module face_4() {
  translate([0, pip_offset, pip_offset])
    pip();
  translate([0, full_size - pip_offset, pip_offset])
    pip();
  translate([0, full_size - pip_offset, full_size - pip_offset])
    pip();
  translate([0, pip_offset, full_size - pip_offset])
    pip();
}

// The full die.
module die() {
  difference() {
    body();
    face_1();
    face_2();
    face_3();
    face_4();
    face_5();
    face_6();
  }
}

die();
