// name:     ArrayEWOps5
// keywords: array
// status:   correct
//
// Array elementwise operators: power

class ArrayEWOps5
  Real[2,2] x,x1,x2,y,z;
  Real t,u,v;
equation
  x=y.^z;
  x1=y.^t;
  x2=t.^y;
  v=t.^u;
  annotation(__OpenModelica_commandLineOptions="-d=-newInst");
end ArrayEWOps5;

// Result:
// class ArrayEWOps5
//   Real x[1,1];
//   Real x[1,2];
//   Real x[2,1];
//   Real x[2,2];
//   Real x1[1,1];
//   Real x1[1,2];
//   Real x1[2,1];
//   Real x1[2,2];
//   Real x2[1,1];
//   Real x2[1,2];
//   Real x2[2,1];
//   Real x2[2,2];
//   Real y[1,1];
//   Real y[1,2];
//   Real y[2,1];
//   Real y[2,2];
//   Real z[1,1];
//   Real z[1,2];
//   Real z[2,1];
//   Real z[2,2];
//   Real t;
//   Real u;
//   Real v;
// equation
//   x[1,1] = y[1,1] ^ z[1,1];
//   x[1,2] = y[1,2] ^ z[1,2];
//   x[2,1] = y[2,1] ^ z[2,1];
//   x[2,2] = y[2,2] ^ z[2,2];
//   x1[1,1] = y[1,1] ^ t;
//   x1[1,2] = y[1,2] ^ t;
//   x1[2,1] = y[2,1] ^ t;
//   x1[2,2] = y[2,2] ^ t;
//   x2[1,1] = t ^ y[1,1];
//   x2[1,2] = t ^ y[1,2];
//   x2[2,1] = t ^ y[2,1];
//   x2[2,2] = t ^ y[2,2];
//   v = t ^ u;
// end ArrayEWOps5;
// endResult
