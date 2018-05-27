#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define nodecount 4
int time=0;
//static int nodecount=4;
static int color[4]={0};
static int ancestor[4]={0};
int d[nodecount], f[nodecount];
int adn[4][4]={
	{0,1,0,1},
	{1,0,1,1},
	{0,1,0,1},
	{0,1,1,0}
};
void DFS_visit(int u)
{
	//printf("Node Count%d\n",nodecount );
	//nodecount=4;
	color[u]=1;
	d[u]=time;
	time+=1;
	int i=0,j=0;
	for(;i < nodecount;i++){
		for (j = 0; j < nodecount; j++)
		{
			printf("loop\t%d\t%d\n",i,j);
			//sleep(1); 
			if(adn[i][j]==1)
			{
				if(color[j] == 0)
				{
					ancestor[j]=u;
					DFS_visit(j);
				}
			}

		}
	}
	color[u]=2;
	f[u]=time;
	time+=1;
}
void DFS()
{
	time=0;
	int i;
	for(i=0;i<nodecount;i++)
	{
		printf("Node %d\n",i);
		if(color[i]==0)DFS_visit(i);
	}
}

int main()
{
	printf("DFS\n");
	DFS();
	printf("D:\n");
	int i=0;
	for (i = 0; i < nodecount; i++)
	{
		printf("%d\t", d[i]);
	}
	printf("\nF:\n");
	for (i = 0; i < nodecount; i++)
	{
		printf("%d\t", f[i]);
	}
	printf("\n");
}