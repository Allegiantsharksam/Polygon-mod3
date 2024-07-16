pragma circom 2.0.0;

template Multiplier2 () {  

  // signal inputs
  signal input a;
  signal input b;

  // signals from gates
  signal  x;
  signal y;

  // final signal output
  signal output Q;

  // component gates used to create custom circuit
  component andGate=AND();
  component notGate=NOT();
  component orGate = OR();

  //circuit logic
  andGate.a<== a;
  andGate.b<==b;
  x<== andGate.out;


  notGate.in<==b;
  y<==notGate.out;


  orGate.a <== x;
  orGate.b <== y;
  Q <== orGate.out;

   // print basic log message
   log("Successfully Get Result");
}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}
template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}
template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}


component main = Multiplier2();
