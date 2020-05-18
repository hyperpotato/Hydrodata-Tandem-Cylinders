function data = findInterp(AyD, fr, C, A)

data = interpn(AyD,fr,C,A(1),A(2));
