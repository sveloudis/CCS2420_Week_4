/*
- If both processes set their flags, then the one whose pid equals the value of turn enters the crit. section  
- Initially a process continuously enters the crit. section as long as the other process' flag remains unset
*/


bool flag[2] = false;
bool turn = 0;
byte count = 0;
active [2] proctype mutex()
{
	/* i is my index, j is the other process */
	pid i = _pid; pid j = 1 - _pid;
	
	/* Infinite loop - observe the label!*/
	again:
		/* [noncritical section] */
		flag[i] = true;
		/* [trying section] */
		do
		:: flag[j] ->
			if
			:: turn == j -> // check if it's the other process' turn
				flag[i] = false;
				(turn != j);
				flag[i] = true;
			:: else -> skip
			fi;
		:: else -> break
		od;
		/* [critical section] */
		count++;
		count--;
		turn = j;
		flag[i] = false;
	goto again;
}


//ltl p1 { []((count == 0) || (count == 1)) }
//ltl p2 { [](<>(flag[0])) && [](<>(flag[1])) }
//ltl p3 { [](!flag[0] -> <>(flag[0]))  && [](!flag[1] -> <>(flag[1]))}
ltl p4 { [](flag[0] -> <>(!flag[0]))  && [](flag[1] -> <>(!flag[1]))}
