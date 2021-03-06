// plecak.c
//

#include <stdio.h>
#include <assert.h>

int const max_n = 100;
int const max_pojemnosc = 1000000;

int plecak(int n, int rozmiar[n], int wartosc[n],
           int pojemnosc)
{
  int max_wartosc[pojemnosc + 1];
  max_wartosc[0] = 0;
  for(int i = 1; i <= pojemnosc; i++)
  {
    int max = 0;
    for(int t = 0; t < n; t++)
      if(rozmiar[t] <= i)
      {
        int lacznie = max_wartosc[i - rozmiar[t]] + wartosc[t];
        if(lacznie > max)
          max = lacznie;
      }
    max_wartosc[i] = max;
  }
  return max_wartosc[pojemnosc];
}

int main(void)
{
  int n;
  printf("Ile rodzajów przedmiotów (max = %d): ", max_n);
  scanf("%d", &n);
  assert(n > 0);
  assert(n <= max_n);
  int pojemnosc;
  printf("   Pojemność plecaka (max = %d): ", max_pojemnosc);
  scanf("%d", &pojemnosc);
  assert(pojemnosc > 0);
  assert(pojemnosc <= max_pojemnosc);
  int rozmiar[n];
  int wartosc[n];
  for(int i = 0; i < n; i++)
  {
    printf("  rozmiar przedmiotu rodzaju [%d]: ", i);
    scanf("%d", &rozmiar[i]);
    printf("  wartość przedmiotu rodzaju [%d]: ", i);
    scanf("%d", &wartosc[i]);
  } 
  printf("Maksymalna wartość zabranych przedmiotów = %d\n", 
         plecak(n, rozmiar, wartosc, pojemnosc)); 
  return 0;
}

