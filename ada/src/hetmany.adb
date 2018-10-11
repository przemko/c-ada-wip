-- hetmany.adb

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Hetmany is

   type Wektor is array (Integer range <>) of Integer;

   function Ustaw(Permutacja : in out Wektor; Kolumna : Integer) return Boolean
   is
   begin
      if Kolumna > Permutacja'Last then
         return True;
      end if;
      for Wiersz in Permutacja'Range loop
         declare
            I : Integer := Permutacja'First;
         begin
            while I < Kolumna loop
               if Wiersz = Permutacja(I) or else
                 abs(Permutacja(I) - Wiersz) = Kolumna - I then
                  exit;
               end if;
               I := I + 1;
            end loop;
            if I = Kolumna then
               Permutacja(Kolumna) := Wiersz;
               if Ustaw(Permutacja, Kolumna + 1) then
                  return True;
               end if;
            end if;
         end;
      end loop;
      return False;
   end Ustaw;

   procedure Plansza (Permutacja : Wektor) is
   begin
      for I in Permutacja'Range loop
         for J in Permutacja'Range loop
            Put("+--");
         end loop;
         Put_Line ("+");
         for J in Permutacja'Range loop
            if Permutacja(I) = J then
               Put("|##");
            else
               Put("|  ");
            end if;
         end loop;
         Put_Line("|");
      end loop;
      for I in Permutacja'Range loop
         Put("+--");
      end loop;
      Put_Line ("+");
   end Plansza;

   N : Natural;

begin
   loop
      Put ("Podaj dodatni rozmiar planszy (aby zakonczyc wpisz 0): ");
      Get (N); -- po wpisaniu ujemnej zglaszany jest wyjatek CONSTRAINT_ERROR
      if N = 0 then
         exit;
      end if;
      declare
         P : Wektor (1 .. N);
      begin
         if Ustaw(P, P'First) then
            Plansza(P);
         else
            Put_Line ("Brak rozwiazania");
         end if;
      end;
   end loop;
end Hetmany;
