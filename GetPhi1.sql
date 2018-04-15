create or replace function GetPhi1(U in Number, V in Number) return number is
  Result Number;
  Phi  Number;
  Phi1 Number;
  Phi2 Number;
  Phi3 Number;
  Phi4 Number;
  Phi5 Number;
  Phi6 Number;
  Phi8 Number;
begin
  Phi := GetPhi(U);
  Phi1 := GetPhi1Ord(U);
  Phi2 := GetPhi2Ord(U);
  Phi3 := GetPhi3Ord(U);
  Phi4 := GetPhi4Ord(U);
  Phi5 := GetPhi5Ord(U);
  Phi6 := GetPhi6Ord(U);
  Phi8 := GetPhi8Ord(U);
  Result := ((3*Phi + Phi2)*V/36) +
            ((36*Phi1 + 21*Phi3 + 2*Phi5)*Power(V, 2)/144) +
            ((1620*Phi2 + 1269*Phi4 + 225*Phi6 + 10*Phi8)*
             Power(U, 3)/12960);
  return(Result);
end GetPhi1;
