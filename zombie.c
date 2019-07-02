#include <stdio.h> 
#include <sys/types.h> 
#include <unistd.h> 

int main()
{
	int p_id;
	p_id=fork();
	
	if(p_id != 0)
	{
		printf("Parent process: %d\n",getpid());
		printf("Parent sleeping\n");
		sleep(10);
		while(1)
		{
			
		}
		printf("Parent Completed ...\n");
		exit(0);
	}
	else
	{
		printf("Child Process %d\n",getpid());
		printf("Parent process: %d\n",getppid());
		sleep(10);
		exit(0);
	}
	
	return 0;
}
