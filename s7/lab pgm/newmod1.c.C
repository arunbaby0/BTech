#include <stdio.h>
#include <conio.h>
#include <process.h>
#include <dos.h>
  struct brecord
  {
    char jmp[3],oem[8];
   short int bps;
   char spc;
   short int rsc;
   char numf;
   short int mnrd;
   short int tots;
   char md;
   short int stat;
   short int spt;
   short int numh;
   int chs;
   int ts;
   }bsc;

int main(void)
{
  int i, strt, ch_out, sector;

  printf("Insert a diskette into drive A and press any key\n");
  getch();
  sector = 0;
  if (absread(0, 1, sector, &bsc)!= 0)
  {
     perror("Disk problem");
     exit(1);
  }
  printf("Read OK\n");
  printf("\nbps  =%d",bsc.bps);
  printf("\nspc  =%c",bsc.spc);
  printf("\nrsc  =%d",bsc.rsc);
  printf("\nnumf =%c",bsc.numf);
  printf("\nmnrd =%d",bsc.mnrd);
  printf("\ntots =%d",bsc.tots);
  printf("\nmd   =%c",bsc.md);
  printf("\nstat =%d",bsc.stat);
  printf("\nspt  =%d",bsc.spt);
  printf("\nnumh =%d",bsc.numh);
  printf("\nchs  =%d",bsc.chs);
  printf("\nts   =%d",bsc.ts);
  printf("\n");
getch();
}