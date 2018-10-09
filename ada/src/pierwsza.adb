-- pierwsza.adb

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;

procedure Pierwsza is
   N : Positive;
   package Funkcje is new Ada.Numerics.Generic_Elementary_Functions (Float);
   use Funkcje;
begin
   Put ("Podaj liczbe naturalna wieksza od 1: ");
   Get (N);
   pragma Assert (N > 1); -- wlaczyc opcje -gnata
   declare
      I : Natural := 2;
      Limit : Positive := Positive (Sqrt (Float (N)));
   begin
      while I <= Limit and then N rem I /= 0 loop
         I := I + 1;
      end loop;
      if I <= Limit then
         Put_Line ("Liczba " & Positive'Image (N) & " nie jest liczba pierwsza");
         Put_Line (Positive'Image (N) & " dzieli sie bez reszty przez " &
                     Natural'Image (I));
      else
         Put_Line ("Liczba " & Positive'Image (N) & " jest liczba pierwsza");
      end if;
   end;
end Pierwsza;
