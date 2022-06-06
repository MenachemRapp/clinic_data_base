create or replace trigger addRooms
       after insert on building
       for each row      
       begin
          if :new.id>0 then
          insert into ROOM (room_number, building_id) values (1,:new.id);
          insert into ROOM (room_number, building_id) values (2,:new.id);
          insert into ROOM (room_number, building_id) values (3,:new.id);
          insert into ROOM (room_number, building_id) values (4,:new.id);
          insert into ROOM (room_number, building_id) values (5,:new.id);
         end if;
       end addRooms;
