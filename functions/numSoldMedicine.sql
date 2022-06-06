create or replace function numSoldMedicine(f_num_medicine in integer)
return integer
is
num_medicine integer;
begin
  select count(*)
  into num_medicine
  from (select 1
        from buying_medicine bm
        group by bm.medicine_name
        having count(*) >= f_num_medicine);
  
  return num_medicine;
end  numSoldMedicine;
  
  
