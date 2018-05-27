#include<stdio.h>
#include<bios.h>
#include<string.h>
#include<conio.h>

int main()
{
   int count, ans, choice;
   unsigned char buffer[512];
   clrscr();
   strcpy(buffer,"arunbaby");

   printf("enter your choice\n 1.Read\n 2.Write\n ");
   scanf("%d",&choice);
   if(choice==1)
   {
   ans=biosdisk(2,0,0,0,1,1,buffer);
   if(ans==1)
   printf("\n floppy not present\n");
   else
   printf("\n floppy present\n");
   printf("\nreturn:%x\n",ans);
	puts(buffer);
   printf("\nreading finished\n");
   }
   else if(choice==2)
   {
   ans=biosdisk(3,0,0,0,1,1,buffer);
   if(ans==1)
   printf("\n floppy not  present\n");
   else
   printf("\n floppy  present\n");
   printf("\nreturn:%x\n",ans);
   printf("\nWriting finished\n");
   }


getch();
return ans;
}