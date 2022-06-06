create or replace trigger countRooms
       after insert or delete or update on room
       declare
          num_rooms integer;
       begin
         for i in (select b.id from building b)
           loop
             select count(*)
             into num_rooms
             from room r
             where r.building_id = i.id;
           dbms_output.put_line('Bulding number: '|| i.id || ' has ' || num_rooms || ' rooms.');
           end loop;
            
       end countRooms;
