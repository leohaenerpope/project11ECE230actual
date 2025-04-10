`timescale 1ns / 1ps
module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    onehot onehot1(
        .w(sw),
        .clk(btnC),
        .z(led[0]),
        .outputstate(led[6:2]),
        .reset(btnU)
    );
    
    binary binarystate1(
        .w(sw),
        .clk(btnC),
        .z(led[1]),
        .binaryoutput(led[9:7]),
        .reset(btnU)
    );

endmodule