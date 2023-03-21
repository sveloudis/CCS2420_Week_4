bool flag[2];
bool turn;
int ncrit[2];

active [2] proctype mutex() {
	pid i = _pid; pid j = 1 - _pid;
	do
	:: flag[i] = true;
	   do
	   :: flag[j] ->
 	      if
 	      :: turn == j ->
 		 flag[i] = false;
 	         (turn != j);
 		 flag[i] = true;
	      :: else -> skip
	      fi
	   :: else -> break	
	   od;
	   /* entering critical section */
           ncrit[i]++;
	   ncrit[i]--;
	   /* exiting critical section */
	   turn = j;
	   flag[i] = false;
	od
}

