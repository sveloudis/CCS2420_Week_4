bool turn, flag[2];
int ncrit;

active[2] proctype process() {
	do 
	:: true ->
           flag[_pid] = 1 -> 
	   turn = _pid -> 
	   (flag[1-_pid] == 0 || turn == 1-_pid) ->
	   /* entering critical section */
	   ncrit++;
	   ncrit--;
	   /* exiting critical section */
           flag[_pid] = 0;
	od
}

