create or replace function ReadyGammaOther(N in Integer, NGamma in Common_rel.TGammaArray) return boolean 
is
  Result Boolean;
  --NFound Boolean;
  I Integer;
begin
  Result := False;
  for I in Common_rel.MinOtherInd .. Common_rel.MaxOtherInd Loop
    if(N = NGamma(I))then
      Result := True;
      Exit;
    end if;
  End Loop;
  return(Result);
end ReadyGammaOther;