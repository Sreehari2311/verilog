module full_sub_struct(
        input a,b,c_in ,
        output diff , borrow );

        wire x,y,z,p,q; 
        xor g1 (x,a,b);
        xor g2(diff,x,c_in);
        not g3(y,a);
        and g4(z,y,b);
        not g5(p,x);
        and g6(q,p,c_in);
        or g7(borrow,z,q);

endmodule
