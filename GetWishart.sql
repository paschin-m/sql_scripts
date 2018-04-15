create or replace function GetWishart(
   A in Number, 
   B in Number, 
   X in Number
   ) return number 
is
  Result Number;
  U    Number;
  V    Number;
  W2   Number;
  Phi1 Number;
  Phi2 Number;
  L    Number; -- Laplas
begin
  U      := GetU(A, B, X);
  V      := GetV(A, B);
  W2     := GetW2(A, B);
  L      := GetLaplas(U);
  Phi1   := GetPhi1(U, V);
  Phi2   := GetPhi2(U, V);
  Result := L + Phi1 + W2*Phi2;
  return(Result);
end GetWishart;