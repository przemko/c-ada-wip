-- hanoi.adb
--
-- Program rozwiazuje lamiglowke wiezy z Hanoi.

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Hanoi is

   procedure Hanoi_Rekurencyjnie (Ile : in Integer;
                                  Skad, Dokad : in Integer;
                                  Licznik : in out Integer) is

      Pomoc : Integer := 6 - (Skad + Dokad);

   begin
      if Ile > 0 then
         Hanoi_Rekurencyjnie (Ile - 1, Skad, Pomoc, Licznik);
         Licznik := Licznik + 1;
         Put_Line (Integer'Image (Licznik) & ":" & Integer'Image (Skad) &
                     " ==>" & Integer'Image (Dokad));
         Hanoi_Rekurencyjnie (Ile - 1, Pomoc, Dokad, Licznik);
      end if;
   end hanoi_Rekurencyjnie;

   N : Natural;
   Licznik : Natural := 0;

begin
   Put ("Podaj liczbe krazkow do przeniesienia: ");
   Get (N);
   Hanoi_Rekurencyjnie (N, 1, 3, Licznik);
   Put_Line ("Rozwiazano lamiglowke wykonujac" & Integer'Image (Licznik) &
               " ruchow.");
end Hanoi;

