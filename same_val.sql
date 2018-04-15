create or replace function SameValue(
   A    in Number,
   B    in Number,
   Prec in Number
) return Boolean 
is
  Result Boolean;
begin
  if (Abs(A - B) <= Prec) then
    Result := True;
  else
    Result := False; 
  end if;
  return(Result);
end SameValue;