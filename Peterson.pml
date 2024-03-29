/*
In this solution, the process which manages to set the global var turn first is the 
one to enter the critical section first. Thereafter, the processes enter the critical 
section in alternation. Note that this is a fair algorithm.
*/

bool turn, flag[2];
int ncrit[2];

active[2] proctype process() {
	do 
	:: true ->
           flag[_pid] = 1 -> 
	   turn = _pid -> 
	   (flag[1-_pid] == 0 || turn == 1-_pid) ->
	   /* entering critical section */
	   ncrit[_pid]++;ncrit[_pid]--;
	   /* exiting critical section */
           flag[_pid] = 0;
	od
}

//ltl p1 { []!((ncrit[0] == 1) && (ncrit[1] == 1)) }
ltl p2 { [](<>(ncrit[0] == 1)) && [](<>(ncrit[1] == 1)) }























