-- floatmacheps.adb
--
-- Obliczenie epsilon maszynowego dla typu digits 18.
--

with Ada.Text_IO; use Ada.Text_IO;

procedure FloatMachEps is
   
   type Real is digits 18; -- sami decydujemy jaka dokladnosc
   
   Przyrost : Real := 1.0;
   MachEps : Real := 0.0;
   
begin
   while 1.0 + Przyrost > 1.0 loop
      MachEps := Przyrost;
      Przyrost := 0.5 * Przyrost;
   end loop;
   Put_Line ("Macheps dla typu digits 18  wynosi: " & Real'Image (Macheps));
end FloatMachEps;
