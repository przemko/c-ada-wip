-- euklide.c
--
-- Obliczenie największego wspólnego dzielnika algorytmem 
-- Euklidesa.

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Euklides is
   
   function NWD(A : Positive; B : Positive) return Natural is
      
      Reszta : Natural;
      X : Natural := A;
      Y : Natural := B;
   
   begin
      while Y > 0 loop
         Reszta := X mod Y;
         X := Y;
         Y := Reszta;
      end loop;
      return X;
   end NWD;

   M : Positive;
   N : Positive;
   
begin
   Put ("Podaj pierwsza liczbe dodatnia: ");
   Get (M);
   Put ("Podaj druga liczbe dodatnia: ");
   Get (N);
   Put ("NWD(" & Positive'Image (M) & "," & Positive'Image (N) & ") = ");
   Put_Line (Natural'Image (NWD (M, N)));
end Euklides;

