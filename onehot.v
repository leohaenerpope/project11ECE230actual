`timescale 1ns / 1ps
module onehot(
    input w, clk, reset,
    output z,
    output [4:0] outputstate
);
    wire Anext, Bnext, Cnext, Dnext, Enext;
    wire Astate, Bstate, Cstate, Dstate, Estate;
    
    dff Adff(
        .Default(1'b1),
        .D(Anext),
        .clk(clk),
        .Q(Astate),
        .reset(reset)
    );
    
    dff Bdff(
        .Default(1'b1),
        .D(Bnext),
        .clk(clk),
        .Q(Bstate),
        .reset(reset)
    );
    
    dff Cdff(
        .Default(1'b1),
        .D(Cnext),
        .clk(clk),
        .Q(Cstate),
        .reset(reset)
    );
    
    dff Ddff(
        .Default(1'b1),
        .D(Dnext),
        .clk(clk),
        .Q(Dstate),
        .reset(reset)
    );
    
    dff Edff(
        .Default(1'b1),
        .D(Enext),
        .clk(clk),
        .Q(Estate),
        .reset(reset)
    );
    
    assign z = Cstate | Estate;
    
    assign Anext = 1;
    assign Bnext = ~w & (Astate | Dstate | Estate);
    assign Cnext = ~w & (Bstate | Cstate);
    assign Dnext = w & (Astate | Bstate | Cstate);
    assign Enext = w & (Dstate | Estate);
    
    assign outputstate = {Estate, Dstate, Cstate, Bstate, Astate};
        
endmodule
