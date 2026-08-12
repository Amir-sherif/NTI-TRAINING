module full_adder(
input a,b,cin,
output reg C_flag,
output reg sum
);

always@(*)
begin
    C_flag=0;
sum=( a ^ b ^ cin);
if (a+b+cin>1'b1)
  begin
  C_flag=1;
end
 
end
endmodule