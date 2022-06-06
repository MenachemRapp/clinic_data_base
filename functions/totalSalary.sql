create or replace function totalSalary 
        (f_start_date in date, 
        f_end_date in date,
        f_attendant_id in integer)
        return integer
is

sum_hours integer;
is_doctor integer;
begin
  select sum(t.duration)
  into sum_hours
  from treatment t
  where t.time >= f_start_date 
        and t.time <= f_end_date 
        and t.attendantid = f_attendant_id;

   select count(*)
   into is_doctor 
   from doctor d 
   where f_attendant_id = d.id;
   
   if is_doctor = 1 then
     return(sum_hours*120);
   end if;
  return (sum_hours*60);

end totalSalary;

