//partition table parameters
#include<stdio.h>
#include<bios.h>
#include<conio.h>
#include<dos.h>
#define H1(x)(x&0xf0)>>8
#define L0(x)(x&0x0f)
struct partitiontableentry
{
char partitionstate;
char starthead;
char startcylindersector;
int partitiontype;
int endhead;
int endcylindersector;
long sectorcount;
long lba;
};
struct partitiontable
{
char pgm[446];
struct partitiontableentry partition[4];
short sign;
};
void main()
{
struct partitiontable part;
int lobyte,hibyte,cylinder,sector,i;
clrscr();
biosdisk(2,0x00, 0,0,1,1,&part);
for(i=0;i<4;i++)
{
printf("\n DETAILS OF PARTITION TABLE ENTRY\n:%d",i);
printf("\nactive partition: %x",part.partition[i].partitionstate);
sector=part.partition[i].startcylindersector&0x3f;
cylinder =H1(part.partition[i].startcylindersector)|(L0(part.partition[i].startcylindersector)&0x0f<<2);
printf("\nstart sector%d",sector);
printf("\nstart cylinder %d",cylinder);
printf("\npartitiontype: %x",part.partition[i].partitiontype);
sector=part.partition[i].endcylindersector&0x3f;
cylinder=H1(part.partition[i].endcylindersector)|(L0(part.partition[i].endcylindersector)&0x0f<<2);
printf("\nend sector%d",sector);
printf("\nend cylinder%d",cylinder);
printf("\nnumber of sectors between mbr and inst sector of partition %d",part.partition[i].lba);
printf("\nnumber of sectors in partition :%d",part.partition[i].sectorcount);
}
printf("book signature %x",part.sign);
getch();
}