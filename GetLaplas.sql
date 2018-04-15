create or replace function GetLaplas(X in Number) return number is

  const1 constant Number := 0.707106781186548;
  const2 constant Number := 0.564189583547756;
  t Number;
  s Number;
  r Number;
  y Number;
  u Number;
  a Number;
  ibasic Number;
  ientry Number;
  f Number;
  p1 Types.TArrayLaplas;
  q1 Types.TArrayLaplas;
  p2 Types.TArrayLaplas;
  q2 Types.TArrayLaplas;
  p3 Types.TArrayLaplas;
  q3 Types.TArrayLaplas;
  Result Number;
begin
    p1(1):=242.667955230532;
    p1(2):=21.9792616182942;
    p1(3):=6.99638348861914;
    p1(4):=-0.0356098437018154;
    q1(1):=215.058875869861;
    q1(2):=91.1649054045149;
    q1(3):=15.0827976304078;
    q1(4):=1;
    p2(1):=300.459261020162;
    p2(2):=451.918953711873;
    p2(3):=339.320816734344;
    p2(4):=152.989285046940;
    p2(5):=43.1622272220567;
    p2(6):=7.21175825088309;
    p2(7):=0.564195517478974;
    p2(8):=-0.000000136864857382717;
    q2(1):=300.459260956983;
    q2(2):=790.950925327898;
    q2(3):=931.354094850610;
    q2(4):=638.980264465631;
    q2(5):=277.585444743988;
    q2(6):=77.0001529352295;
    q2(7):=12.7827273196294;
    q2(8):=1;
    p3(1):=-0.0299610707703542;
    p3(2):=-0.0494730910623251;
    p3(3):=-0.226956593539687;
    p3(4):=-0.278661308609648;
    p3(5):=-0.0223192459734185;
    q3(1):=0.0106209230528468;
    q3(2):=0.191308926107830;
    q3(3):=1.05167510706793;
    q3(4):=1.98733201817135;
    q3(5):=1;

    ientry:=3;
    t := const1*x;
    if t <= 6.3 then
      goto L10;
    else
      f:=1;
    end if;  
    goto L52;
<<L10>> a := abs(t);
<<L11>> s := t*t;
    if a>0.03 then
      goto L20;
    else
      ibasic:=1;
    end if;  
    y:=t*(p1(1)+s*(p1(2)+s*(p1(3)+s*p1(4))))/(q1(1)+
       s*(q1(2)+s*(q1(3))+s*q1(4)));
    goto L30;
<<L20>> ibasic:=2;
    if a>6 then
      goto L21;
    else
      y:=exp(-s)*(p2(1)+a*(p2(2)+a*(p2(3)+a*(p2(4)+
            a*(p2(5)+a*(p2(6)+a*(p2(7)+a*p2(8))))))))/
            (q2(1)+a*(q2(2)+a*(q2(3)+a*(q2(4)+a*(q2(5)+
            a*(q2(6)+a*(q2(7)+a*q2(8))))))));
    end if;        
    goto L30;
<<L21>> y:=0;
    if a > 26 then
      goto L30;
    else
      r:=1/a;
    end if;  
    u:=r*r;
    y:=r*exp(-s)*(const2+u*(p3(1)+u*(p3(2)+u*(p3(3)+
       u*(p3(4)+u*p3(5)))))/(q3(1)+u*(q3(2)+u*(q3(3)+
       u*(q3(4)+u*q3(5))))));
<<L30>> 
    if ientry<>1 then
      goto L40;
    else
      if ibasic=2 then
        goto L31;
      else
        f:=y;
      end if;  
    end if;  
    goto L52;
<<L31>> 
    f:=1-y;
    if x<0 then
      f:=-f;
    else
      goto L52;
    end if;  
<<L40>> 
    if ientry<>2 then
      goto L50;
    else
      if ibasic=2 then
        goto L41;
      else
        f:=1-y;
      end if;
    end if;    
    goto L52;
<<L41>> f:=y;
    if x<0 then
      f:=2-y;
    else
      goto L52;
    end if;  
<<L50>> r:=0.5*y;
    if ibasic=2 then
      goto L51;
    else 
      f:=0.5+r;  
    end if;  
    goto L52;
<<L51>> 
    f:=1-r;
    if x<0 then
      f:=r;
    else
      if x<0 then
        f:=r;
      else
        Result := F;
      end if;  
    end if;
<<L52>>     
  Result := F;
  return(Result);
end GetLaplas