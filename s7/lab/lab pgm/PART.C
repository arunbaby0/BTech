#include<stdio.h>
#include<bios.h>
#include<dos.h>
#include<conio.h>
#define H1(x)(x&0xf0)>>8
#define L0(x)(x&0x0f)

struct partitiontabentry
{
 char partitionstate;
 char starthead;
 int startcylsec;
 int partitiontype;
 char endhead;
 int endcylsec;
 long lba;
 long seccount;
};

struct partitiontab
{
 char pgm[496];
 struct partitiontabentry partition[6];
 int sign;
};

void main()
{
 struct partitiontab part;
 int sec,cyl,hibyte,lobyte;
 int i;
 clrscr();
 biosdisk(2,0x00,0,0,1,1,&part);
 for(i=0;i<4;i++)
 {
  printf("\nDetails of partition table entry%d\n",i);
  printf("Active partition %x\n",part.partition[i].partitionstate);
  sec=part.partition[i].startcylsec&0x3f;
  cyl=H1(part.partition[i].startcylsec)|(L0(part.partition[i].startcylsec)&0x0f<<2);
  printf("start sector%d\n",sec);
  printf("start cylinder%d\n",cyl);
  printf("partition type %x\n",part.partition[i].partitiontype);
  sec=part.partition[i].endcylsec&0x3f;
  cyl=H1(part.partition[i].endcylsec)|(L0(part.partition[i].endcylsec)&0x0f<<2);
  printf("end sector%d\n",sec);
  printf("end cylinder %d\n",cyl);
  printf("number of sectors between mbr inst sector of partition %d\n",part.partition[i].lba);
  printf("number of sectors in partition %d\n",part.partition[i].seccount);
  }
  printf("book signature %x\n",part.sign);
  getch();
  }