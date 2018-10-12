-- plecak.adb

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Plecak is

   type Wektor is array (Integer range <>) of Natural;

   function Rozwiazanie(Rozmiar : Wektor;
                        Wartosc : Wektor;
                        Pojemnosc : Natural) return Natural is

      Max_Wartosc : Wektor (0 .. Pojemnosc) := (others => 0);

   begin
      for Limit in 1 .. Pojemnosc loop
         declare
            Max : Natural := 0;
         begin
            for Rodzaj in Rozmiar'Range loop
               if Rozmiar (Rodzaj) <= Limit then
                  declare
                     Lacznie : Natural :=
                       Max_Wartosc (Limit - Rozmiar (Rodzaj)) +
                         Wartosc (Rodzaj);
                  begin
                     if Lacznie > Max then
                        Max := Lacznie;
                     end if;
                  end;
               end if;
            end loop;
            Max_Wartosc (Limit) := Max;
         end;
      end loop;
      return Max_Wartosc (Pojemnosc);
   end Rozwiazanie;

   N : Positive;
   Pojemnosc : Positive;

begin
   Put ("Ile rodzajow przedmiotow: ");
   Get (N);
   Put ("  Jaka pojemnosc plecaka: ");
   Get (Pojemnosc);
   declare
      Rozmiar : Wektor (1 .. N);
      Wartosc : Wektor (1 .. N);
   begin
      for I in 1 .. N loop
         Put (" Rozmiar " & Integer'Image (I) & " rodzaju przedmiotu: ");
         Get (Rozmiar (I));
         Put (" Wartosc " & Integer'Image (I) & " rodzaju przedmiotu: ");
         Get (Wartosc (I));
      end loop;
      Put ("Maksymalna wartosc zabranych przedmiotow = ");
      Put (Rozwiazanie (Rozmiar, Wartosc, Pojemnosc));
      New_Line;
   end;
end Plecak;
