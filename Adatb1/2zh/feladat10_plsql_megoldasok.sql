/*
Írjunk meg egy procedúrát, amelyik a NIKOVITS.VAGYONOK tábla alapján kiírja azoknak
a személyeknek a nevét, akikre igaz, hogy van olyan leszármazottjuk, akinek nagyobb
a vagyona, mint az illető vagyona.
*/
create or replace PROCEDURE GAZDAG_LESZARMAZOTT is 
cursor valami is 
  SELECT apja
  FROM nikovits.vagyonok
  WHERE CONNECT_BY_ROOT vagyon < vagyon
  CONNECT BY  PRIOR nev = apja;
 bonus   VARCHAR2(20);
BEGIN
    open valami;
    loop
    fetch valami into bonus; 
    exit when valami%NOTFOUND;  
  DBMS_OUTPUT.PUT_LINE('apa = ' ||bonus );
  end loop;
END;
