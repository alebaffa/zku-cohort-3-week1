pragma circom 2.0.0;

include "../../node_modules/circomlib/circuits/comparators.circom";

template RangeProof(n) {
    assert(n <= 252);
    signal input in; // this is the number to be proved inside the range
    signal input range[2]; // the two elements should be the range, i.e. [lower bound, upper bound]
    signal output out;

    component low = LessEqThan(n);
    component high = GreaterEqThan(n);

    // [assignment] insert your code here
    
    // Input signal must be higher than lower range[0]
    high.in[0] <== in;
    high.in[1] <== range[0];
    // high.out should be equal to 1, meaning that input is greater than range[0]

    // Input signal must be lower than higher range[1]
    low.in[0] <== in;
    low.in[1] <== range[1];
    // low.out should be equal to 1, meaning that input is lower than range[1]

    // output = 1 (1 * 1), meaning that input signal is inside the range.
    // result = 1 (one of comparisons is equal to zero), meaning that input signal is outside the range
    out <== high.out * low.out;
}