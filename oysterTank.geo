//+
SetFactory("OpenCASCADE");
//+
w=1.27;
l=2.43;
h=0.86;
ratio=.02;
lPoints=101;
wPoints=101;
hPoints=101;
outletD=0.05;
//+
p1=newp; Point(p1) = {0, 0, 0, 1.0};
//+
p2=newp; Point(p2) = {-l/2, -w/2, 0, 1.0};
//+
p3=newp; Point(p3) = {l/2, -w/2, 0, 1.0};
//+
p4=newp; Point(p4) = {l/2, w/2, 0, 1.0};
//+
p5=newp; Point(p5) = {-l/2, w/2, 0, 1.0};
//+
p6=newp; Point(p6) = {-l/2, -w/2, h, 1.0};
//+
p7=newp; Point(p7) = {l/2, -w/2, h, 1.0};
//+
p8=newp; Point(p8) = {l/2, w/2, h, 1.0};
//+
p9=newp; Point(p9) = {-l/2, w/2, h, 1.0};
//+
//p10=newp; Point(p10) = {l/2-1.1*outletD/2, w/2=1.1*outletD/2, 0};
//+
c1=newc; Curve(c1) = {p2, p3};
//+
c2=newc; Curve(c2) = {p3, p4};
//+
c3=newc; Curve(c3) = {p4, p5};
//+
c4=newc; Curve(c4) = {p5, p2};
//+
c5=newc; Curve(c5) = {p6, p7};
//+
c6=newc; Curve(c6) = {p7, p8};
//+
c7=newc; Curve(c7) = {p8, p9};
//+
c8=newc; Curve(c8) = {p9, p6};
//+
c9=newc; Curve(c9) = {p2, p6};
//+
c10=newc; Curve(c10) = {p3, p7};
//+
c11=newc; Curve(c11) = {p4, p8};
//+
c12=newc; Curve(c12) = {p5, p9};
//+
//c13=newc; Circle(c13)= {l/2-1.1*outletD/2, w/2-1.1*outletD/2, 0, outletD/2};
//+
Transfinite Curve{c1} = lPoints Using Bump ratio;
//+
Transfinite Curve{c2}= wPoints Using Bump ratio;
//+
Transfinite Curve{c3}=lPoints Using Bump ratio;
//+
Transfinite Curve{c4}=wPoints Using Bump ratio;
//+
Transfinite Curve{c5} = lPoints Using Bump ratio;
//+
Transfinite Curve{c6}= wPoints Using Bump ratio;
//+
Transfinite Curve{c7}=lPoints Using Bump ratio;
//+
Transfinite Curve{c8}= wPoints Using Bump ratio;
//+
Transfinite Curve{c9}= hPoints Using Bump ratio;
//+
Transfinite Curve{c10}=hPoints Using Bump ratio;
//+
Transfinite Curve{c11}=hPoints Using Bump ratio;
//+
Transfinite Curve{c12}=hPoints Using Bump ratio;
//+
//Transfinite Curve{c13}=200;
//+
l1=newll; Curve Loop(l1) = {c1, c2, c3, c4};
//+
s1=news; Plane Surface(s1) = {l1};
//+
Transfinite Surface{s1};
//+
Recombine Surface{s1};
//+
l2=newll; Curve Loop(l2) = {c5, c6, c7, c8};
//+
s2=news; Plane Surface(s2) = {l2};
//+
Transfinite Surface{s2};
//+
Recombine Surface{s2};
//+
l3=newll; Curve Loop(l3) = {c1, c10, -c5, -c9};
//+
s3=news; Plane Surface(s3) = {l3};
//+
Transfinite Surface{s3};
//+
Recombine Surface{s3};
//+
l4=newll; Curve Loop(l4) = {c2, c11, -c6, -c10};
//+
s4=news; Plane Surface(s4) = {l4};
//+
Transfinite Surface{s4};
//+
Recombine Surface{s4};
//+
l5=newll; Curve Loop(l5) = {c3, c12, -c7, -c11};
//+
s5=news; Plane Surface(s5) = {l5};
//+
Transfinite Surface{s5};
//+
Recombine Surface{s5};
//+
l6=newll; Curve Loop(l6) = {c4, c9, -c8, -c12};
//+
s6=news; Plane Surface(s6) = {l6};
//+
Transfinite Surface{s6};
//+
Recombine Surface{s6};
//+
//l7=newll; Curve Loop(l7) = {c13};
//+
//s7=news; Plane Surface(s7) = {l7};
//+
//s8=news;
//BooleanDifference(s8)={Surface{s1}; Delete;}{Surface{s7};};
//+
sl1=newsl; Surface Loop(sl1)= {s1, s2, s3, s4, s5, s6};
//+
v1=newv; Volume(v1)= {sl1};
//+
Transfinite Volume{v1};
//+
Recombine Volume{v1};
//+
Physical Surface("bottom", 1) = {s1};
//+
Physical Surface("top", 2) = {s2};
//+
Physical Surface("front", 3) = {s3};
//+
Physical Surface("right", 4) = {s4};
//+
Physical Surface("back", 5) = {s5};
//+
Physical Surface("left", 6) = {s6};
//
//Physical Surface("inlet", 7) = {s7};
//+
Physical Volume("internal") = {v1};

