#include<stdio.h>
main()
{
int a[10][10], b[10][10],a1[20][20],b1[20][20];
int i,j,t1,t2,m,n;
t1=1;
t2=1;
printf("\n Enter the order matrix ");
scanf("%d%d",&m,&n);
printf("\n Enter elements of first matrix ");
for(i=0;i<m;i++)
{
for(j=0;j<n;j++)
{
scanf("%d",&a[i][j]);
}
}
printf("\n Enter elements of second matrix ");
for(i=0;i<m;i++)
{
for(j=0;j<n;j++)
{
scanf("%d",&b[i][j]);
}
}
for(i=0;i<m;i++)
{
for(j=0;j<n;j++)
{
if(a[i][j]!=0)
{
a1[t1][0]=i;
a1[t1][1]=j;
a1[t1][2]=a[i][j];
t1++;
}
}
}
a1[0][0]=m;
a1[0][1]=n;
a1[0][2]=--t1;
for(i=0;i<m;i++)
{
for(j=0;j<n;j++)
{
if(b[i][j]!=0)
{
b1[t2][0]=i;
b1[t2][1]=j;
b1[t2][2]=b[i][j];
t2++;
}
}
}
b1[0][0]=m;
b1[0][1]=n;
b1[0][2]=--t2;
printf("\nfirst sparse matrix\n");
for(i=0;i<=t1;i++)
{
for(j=0;j<3;j++)
printf("%d\t",a1[i][j]);
printf("\n");
}
printf("\nsecond sparse matrix\n ");
for(i=0;i<=t2;i++)
{
for(j=0;j<3;j++)
printf("%d\t",b1[i][j]);
printf("\n");
}
i=1,j=1;
int k=1;
int c[20][20];
while((i<=t1)&&(j<=t2))
{
if((a1[i][0]==b1[j][0])&&(a1[i][1]==b1[j][1]))
{
c[k][0]=a1[i][0];
c[k][1]=a1[i][1];
c[k][2]=a1[i][2]+b1[j][2];
i++;
k++;
j++;
}
else if(a1[i][0]<b1[j][0])
{
c[k][0]=a1[i][0];
c[k][1]=a1[i][1];
c[k][2]=a1[i][2];
k++;
i++;
}
else if(a1[i][0]>b1[j][0])
{
c[k][0]=b1[j][0];
c[k][1]=b1[j][1];
c[k][2]=b1[j][2];
k++;
j++;
}
else if(a1[i][1]<b1[j][1])
{
c[k][0]=a1[i][0];
c[k][1]=a1[i][1];
c[k][2]=a1[i][2];
k++;
i++;
}
else if(a1[i][1]>b1[j][1])
{
c[k][0]=b1[j][0];
c[k][1]=b1[j][1];
c[k][2]=b1[j][2];
k++;
j++;
}
}
while(i<=t1)
{
c[k][0]=a1[i][0];
c[k][1]=a1[i][1];
c[k][2]=a1[i][2];
k++;
i++;
}
while(j<=t2)
{
c[k][0]=b1[j][0];
c[k][1]=b1[j][1];
c[k][2]=b1[j][2];
k++;
j++;
}
c[0][0]=m;
c[0][1]=n;
c[0][2]=--k;
printf("\n Added sparse matrix \n ");
for(i=0;i<=k;i++)
{
for(j=0;j<3;j++)
printf("%d\t",c[i][j]);
printf("\n");
}
}


