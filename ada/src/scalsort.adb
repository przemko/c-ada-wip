-- scalsort.adb

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

procedure ScalSort is

   type Wektor is array (Integer range <>) of Integer;

   procedure Sort (Tab : in out Wektor) is

      Robocza : Wektor(Tab'Range);

      procedure Scal (Pierwszy, Srodek, Ostatni : Integer) is

         I : Integer := Pierwszy;
         J : Integer := Srodek + 1;
         K : Integer := Pierwszy;

      begin
         while K <= Ostatni loop
            if I <= Srodek and then J <= Ostatni then
               if Tab(I) <= Tab(J) then
                  Robocza(K) := Tab(I);
                  I := I + 1;
               else
                  Robocza(K) := Tab(J);
                  J := J + 1;
               end if;
            elsif I <= Srodek then
               Robocza(K) := Tab(I);
               I := I + 1;
            else
               Robocza(K) := Tab(J);
               I := I + 1;
            end if;
            K := K + 1;
         end loop;
         for I in Pierwszy .. Ostatni loop
            Tab(I) := Robocza(I);
         end loop;
      end Scal;

      procedure RekSort (Pierwszy, Ostatni : Integer) is
         Srodek : Integer;
      begin
         if Pierwszy < Ostatni then
            Srodek := Pierwszy + (Ostatni - Pierwszy) / 2;
            RekSort (Pierwszy, Srodek);
            RekSort (Srodek + 1, Ostatni);
            Scal (Pierwszy, Srodek, Ostatni);
         end if;
      end RekSort;

   begin
      RekSort (Tab'First, Tab'Last);
   end Sort;

   N : Integer := 20;
   Tab : Wektor(1 .. N);
   type Zakres is range 0 .. 99;
   package Liczba_Losowa is new Ada.Numerics.Discrete_Random (Zakres);
   use Liczba_Losowa;
   G : Generator;
begin
   Reset (G);                        -- inicjowanie generatora
   for I in Tab'Range loop
      Tab(I) := Integer(Random (G)); -- generowanie liczby pseudolosowej
   end loop;
   Put ("Przed sortowaniem: ");
   for I in Tab'Range loop
      Put (Tab(I), Width => 3);
   end loop;
   New_Line;
   Sort (Tab);
   Put ("    po sortowaniu: ");
   for I in Tab'Range loop
      Put (Tab(I), Width => 3);
   end loop;
   New_Line;
end ScalSort;
