#include <stdio.h> 
#include <sys/types.h> 
#include <unistd.h> 

int main()
{
	int p_id;
	p_id=fork();
	
	if(p_id == 0)
	{
		printf("child process: %d\n",getpid());
		printf("child process Parent: %d\n",getppid());
		printf("Child Process going in sleep state\n");
		sleep(10);
		printf("child process(Orphan Child: %d\n",getpid());
		printf("Childs New Parent %d\n",getppid());
	}
	else
	{
		printf("Parent process: %d\n",getpid());
		sleep(5);
		printf("Parent Process Complete\n");
		exit(0);
	}
	
	return 0;
}
