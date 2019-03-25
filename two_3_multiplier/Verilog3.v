module two_3_multiplier (

input [1:0] m,
input [2:0] q,
output [4:0] p

);


//wire aWire = 1'b0;
wire link1,link2,link3,link4;
assign p[0] =m[0] & q[0];
//and(p[0],m[0],q[0]);


first_row r1 (

        .cin (1'b0),
        .m0 (m[0]),
        .m1 (m[1]),
	     .q0 (q[0]),
	     .q1 (q[1]),
        .s (p[1]),
        .cout (link1)
);
		  





first_row r2 (

        .cin (link1),
        .m0 (m[1]),
        .m1 (1'b0),
	     .q0 (q[0]),
	     .q1 (q[1]),
        .s (link3),
        .cout (link2)

);


  
second_row sr1 (

        .cin (1'b0),
        .m (m[0]),
	     .q2 (q[2]),
	     .pp (link3),
        .s (p[2]),
        .cout (link4)



);

second_row sr2 (

        .cin (link4),
        .m (m[1]),
	     .q2 (q[2]),
	     .pp (link2),
        .s (p[3]),
        .cout (p[4])

);
endmodule
