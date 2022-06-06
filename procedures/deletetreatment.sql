create or replace procedure deleteTreatments (p_attendatnt_id in integer,
                                              p_start_date in varchar2, 
                                              p_end_date in varchar2)
is
deleted_start_date date;
deleted_end_date date;
num_treatments integer;
begin
deleted_start_date :=  to_date(p_start_date, 'dd-mm-yyyy');
deleted_end_date :=  to_date(p_end_date, 'dd-mm-yyyy');


select count(*)
into num_treatments
from treatment t
where (t.attendantid = p_attendatnt_id) 
      and (t.time >= deleted_start_date) 
      and (t.time <= deleted_end_date);

dbms_output.put_line('found '||num_treatments||' treatments.');

delete from treatment t
where (t.attendantid = p_attendatnt_id) 
      and (t.time >= deleted_start_date) 
      and (t.time <= deleted_end_date);
      
commit;

dbms_output.put_line(num_treatments||' treatments deleted.');
 
end  deleteTreatments;
