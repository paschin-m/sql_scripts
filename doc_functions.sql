create or replace function doctype_count(F_ID number) 
return  number IS
cnt number;
begin
select count(*) into cnt from SUP_PRODUCT_LIFECYCLE a where a.PID=F_ID; 
return(cnt);
end doctype_count;
/ 


create or replace function doc_id(p_izd IN varchar2, sibling_order IN number) 
return  number IS
res number;
begin
for r in (select FILE_ID from SUP_DOCUMENTS where FPRODUCT=p_izd AND FDOC_TYPE=sibling_order) 
loop
res := r.FILE_ID;
end loop;
return(res);
end doc_id;
/ 

create or replace function doctype_enclosed_cnt(p_izd IN varchar2, F_ID IN number) 
return  number IS
cnt number;
cnt2 number;

begin
cnt:=0;
  for child in (select SIBLING_ORDER from SUP_PRODUCT_LIFECYCLE spl where spl.PID=F_ID)
  loop
  select count(*) into cnt2 from SUP_DOCUMENTS a where (a.FPRODUCT=p_izd) AND (a.fdoc_type>0) AND (a.fdoc_type=child.SIBLING_ORDER);    
  if(cnt2>0) then cnt:=cnt+1;
  end if;      
  end loop;
return(cnt);
end doctype_enclosed_cnt;
/ 


