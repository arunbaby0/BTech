
#include<stdio.h>
void main()
{
int a[20],top=-1,i,choice,size;
int pushed,poped,con,c;
printf("\nEnter the size");
scanf("%d",&size);
do
{
printf("\n1-Push \n2-Pop \nEnter your choice");
scanf("%d",&choice);
if(choice==1)
{
if(top==(size-1))
printf("\noverflow!!!");
else
{
printf("\nEnter element to PUSH");
scanf("%d",&pushed);
top++;
a[top]=pushed;
}
}
else if(choice==2)
{
if(top==-1)
printf("\nunderflow!!!");
else
{
poped=a[top];
top--;
printf("\nPOPed element : %d",poped);
}
}
printf("\n1-Continue\n2-Quit\ncontinue?");
scanf("%d",&c);
if(c==1)
con=1;
else if(c==2)
con=0;
}while(con!=0);
}


