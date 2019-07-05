#include <stdio.h> 
#include <sys/types.h> 
#include <unistd.h> 


void sort(int arr[], int n) 
{ 
   int i, j,temp; 
   for (i = 0; i < n-1; i++)       
  
       // Last i elements are already in place    
       for (j = 0; j < n-i-1; j++)
   			{  
           if (arr[j] > arr[j+1]) 
             {
             		temp = arr[j];
             		arr[j]=arr[j+1];
             		arr[j+1]=temp;
         			}
   			}
		printf("Printing Sorted Array\n");
		for(int i=0;i<n;i++)
			{
				printf("%d ",arr[i]);
			}
			printf("\n");
} 
int main()
{
	int arr[20],n,i,ch;													//Array for storing Numbers and its count
	printf("Enter the Number of Elements\n");
	scanf("%d",&n);														//Accept the count
	
	for(i=0;i<n;i++)
		{
			printf("Enter %dth Number\n",i);
			scanf("%d",&arr[i]);
		}
	printf("Input Sucessful\n\n");
	
	printf("Choose Option...\n");
	printf("1.Orphan Process\n");
	printf("2.Zombie Process\n");
	scanf("%d",&ch);		
	
	int p_id;
	p_id=fork();
	
	if(p_id == 0)
	{
		if(ch == 1)
		{
			
			printf("You have entered Child Process..ID--%d\n\n",getpid());
			printf("Parent of this Process is..Id--%d\n\n",getppid());
			printf("Sorting the numbers (Child Process)\n");
			sort(arr,n);
			sleep(5);
			printf("Orphan Child Process..Id--%d\n",getpid());
			printf("New Parent..Id--%d",getppid());
						 
			 
		}
		
		if(ch == 2)
			{
				printf("You have entered Child Process..ID--%d\n\n",getpid());
				printf("Parent of this Process is..Id--%d\n\n",getppid());
				printf("Sorting the numbers (Child Process)\n");
				sort(arr,n);
				exit(0);		
		}
	}
		
	else
	{
		if(ch == 1)
			{
				
				printf("You have entered Parent Process..ID--%d\n\n",getpid());
				printf("Parent of this Process is..Id--%d\n\n",getppid());
				printf("Sorting the numbers (Parent process)\n");
				sort(arr,n);
				printf("Parent Process Finished\n");
				exit(0);
			}
		if(ch == 2)
		{
			printf("You have entered Parent Process..ID--%d\n\n",getpid());
			printf("Parent of this Process is..Id--%d\n\n",getppid());
			printf("Sorting the numbers (Parent process)\n");
			sort(arr,n);
			
			printf("Putting Parent Process in Wait State\n");
			sleep(5);
			while(1)
			{
			
			}
			printf("Parent Process is Finished\n\n");
			printf("Parent of this Process is..Id--%d\n\n",getppid());
			exit(0);
		}
	}
	
	return 0;
}
