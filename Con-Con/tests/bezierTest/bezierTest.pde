PVector cp1,cp2,cp3,cp4,p1,p2,p3,p4;
cp1 = new PVector(50,20);
cp2 = new PVector(50,75);
cp3 = new PVector(50,75);
cp4 = new PVector(50,40);
p1 = new PVector(30,20);
p2 = new PVector(30,75);
p3 = new PVector(90,75);
p4 = new PVector(80,20);

translate(50,50);

noFill();
beginShape();
vertex(p1.x, p1.y);
bezierVertex(cp1.x, cp1.y, cp2.x, cp2.y, p2.x, p2.y);
vertex(p3.x, p3.y);
bezierVertex(cp3.x, cp3.y, cp4.x, cp4.y, p4.x, p4.y);
endShape();

ellipse(cp1.x,cp1.y,5,5);
ellipse(cp2.x,cp2.y,5,5);
ellipse(cp3.x,cp1.y,5,5);
ellipse(cp4.x,cp2.y,5,5);