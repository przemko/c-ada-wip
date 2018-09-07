-- euklides_rozszerzony.adb

-- Program przedstawia wartosc najwiekszego wspolnego dzielnika
-- dwoch liczb w postaci ich liniowej kombinacji. Wykorzystano
-- rozszerzony algorytm Euklidesa.

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Euklides_Rozszerzony is
   
   M, N : Positive;
   A, B, X, Y, R, S : Integer;
   Reszta, Iloraz : Natural;
   Zapamietaj_R, Zapamietaj_S : Integer;
   
begin
   Put ("Podaj pierwsza liczbe dodatnia: ");
   Get (M);
   Put ("Podaj druga liczbe dodatnia: ");
   Get (N);
   A := M;
   B := N;
   X := 1;
   Y := 0;
   R := 0;
   S := 1;
   while B > 0 loop
      Reszta := A rem B;
      Iloraz := A / B;
      A := B;
      B := Reszta;
      Zapamietaj_R := R;
      Zapamietaj_S := S;
      R := X - Iloraz * R;
      S := Y - Iloraz * S;
      X := Zapamietaj_R;
      Y := Zapamietaj_S;
   end loop;
   Put ("NWD(" & Positive'Image (M) & "," & Positive'Image (N) & ") = ");
   Put (Natural'Image (X) & " *" & Positive'Image (M) & " + ");
   Put (Natural'Image (Y) & " *" & Positive'Image (N) & " = ");
   Put_Line (Natural'Image (A));
end Euklides_Rozszerzony;

