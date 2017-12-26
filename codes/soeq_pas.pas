(* $Id: soep_pas.pas 975 2017-12-25 19:22:43Z mueller $ *)
(*
(* Copyright 2017- by Walter F.J. Mueller <W.F.J.Mueller@gsi.de> *)
(*
(* This program is free software; you may redistribute and/or modify *)
(* it under the terms of the GNU General Public License version 3.   *)
(* See Licence.txt in distribition directory for further details.    *)
(*                                                                   *)
(*  Revision History:                                                *)
(* Date         Rev Version  Comment                                 *)
(* 2017-12-26   976   1.0    Initial version (derived from soeq_pas) *)

program soep(input,output);
type
   bits =  (b00,b01,b02,b03,b04,b05,b06,b07,
            b08,b09,b10,b11,b12,b13,b14,b15,
            b16,b17,b18,b19,b20,b21,b22,b23,
            b24,b25,b26,b27,b28,b29,b30,b31,
            b32,b33,b34,b35,b36,b37,b38,b39,
            b40,b41,b42,b43,b44,b45,b46,b47,
            b48,b49,b50,b51,b52,b53,b54,b55,
            b56,b57,b58,b59,b60,b61,b62,b63);
   bset = set of bits;
var
   nmax,prnt,imax : integer;
   nmsqrt         : integer;
   wimax,iw       : integer;
   i,n,imin       : integer;
   np,il,nl       : integer;
   rnmax          : real;
   sieve          : ARRAY[0 .. 781250] of bset;
   bval           : ARRAY[0 .. 63 ] of bits;
   bmsk           : ARRAY[0 .. 63 ] of bset;
   b              : bits;
   ball           : bset;
begin

   b    := b00;
   bval[0] :=  b;
   bmsk[0] := [b];
   for i := 1 to 63 do begin
      b := succ(b);
      bval[i] :=  b;
      bmsk[i] := [b];
   end;
   
   read(nmax);
   read(prnt);

   if (nmax < 10) or (nmax > 100000000) then begin
      writeln(' ', 'nmax out of range (10...100000000), abort');
      exit(8);
   end;

   rnmax  := nmax;
   nmsqrt := trunc(sqrt(nmax));
   imax   := (nmax-1) div 2;
   wimax  := (imax+63) div 64;
   ball   := [b00 .. b63];
   for i := 0 to wimax do sieve[i] := ball;

   n := 3;
   while n <= nmsqrt do begin
      i := n div 2;
      if bval[i mod 64] in sieve[i div 64] then begin
         i := (n*n) div 2;
         while i <= imax do begin
            iw := i div 64;
            sieve[iw] := sieve[iw] - bmsk[i mod 64];
            i := i + n;
         end;
      end;
      n := n + 2;
   end;
   
   if prnt > 0 then begin
      writeln(' ', 'List of Primes up to ', nmax:9);
      write(2:8);
      np := 1;
      for i := 1 to imax do begin
         if bval[i mod 64] in sieve[i div 64] then begin
            write(1+2*i:8);
            np := np + 1;
            if np = 10 then begin
               writeln(' ');
               np := 0;
            end;
         end;
      end;
      if np > 0 then writeln();
   end;

   il :=  4;
   nl := 10;
   np :=  1;
   for i := 1 to imax do begin
      if bval[i mod 64] in sieve[i div 64] then np := np + 1;
      if i = il then begin
         nl := 2*il + 2;
         writeln(' ', 'pi(', nl:9, '): ', np:9);
         il := 10*(il+1)-1;
      end;
   end;

   if nl < nmax then writeln(' ', 'pi(', nmax:9, '): ', np:9);
   
end.