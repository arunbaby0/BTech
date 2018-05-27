#include <stdio.h>

int Quicksort(int A[],int low,int high)
{
	if(low < high)
	{
		//printf("Partition\n");
		int t = Partition(A,low,high);
		Quicksort(A,low,t-1);
		Quicksort(A,t+1,high);
	}
}
int Partition(int A[],int low,int high)
{
	int Pivot=A[low];
	int l = low	+1;
	int r=high;
	do
	{
		while(l<=high && A[l]<=Pivot)
		{
			l+=1;
		}
		//printf("part 1");
		while(A[r]>Pivot)
			{
				r-=1;
			}
		if(l<r)
		{
			//swap
			//A[l]^=(A[r]^=(A[l]^=A[r]));
			int temp;
			temp=A[l];
			A[l]=A[r];
			A[r]=temp;
			l+=1;
			r-=1;
		}
	}while(l<=r);
	//swap
	//A[low]^=(A[r]^=(A[low]^=A[r]));
	int temp;
	temp=A[low];
	A[low]=A[r];
	A[r]=temp;
	return r;
}
int main()
{
	printf("start\n");
	int A[2]={2,1};
	Quicksort(A,0,1);
	int i=0;
	for(i=0;i<2;i++)
		{
			printf("%d\n", A[i]);
		}
	return 0;
}
