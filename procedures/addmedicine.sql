create or replace procedure addMedicine (p_medicine_name in varchar2, p_quantitiy in integer)
is
in_list integer;
current_num integer;
begin
  SELECT count(*)
  into in_list
  FROM MEDICINE m
  WHERE m.name = p_medicine_name;

 if in_list = 0 then
       dbms_output.put_line('adding new medicine: '||p_medicine_name||'.');
       insert into MEDICINE (name, quantity) values (p_medicine_name, p_quantitiy);
       dbms_output.put_line(p_medicine_name||' has now: '|| p_quantitiy||'.');
       
  else
    SELECT m.quantity
    into current_num
    FROM medicine m
    WHERE m.name = p_medicine_name;
      
   
    dbms_output.put_line(p_medicine_name||'. has now: '|| current_num);
    dbms_output.put_line('adding: '||  p_quantitiy);
  
     current_num := current_num + p_quantitiy;
     
     update MEDICINE  m 
     set quantity = current_num 
     where m.name=p_medicine_name;
     
     dbms_output.put_line(p_medicine_name||'. has now: '|| current_num);
  

  end if;     
 
end  addMedicine;
