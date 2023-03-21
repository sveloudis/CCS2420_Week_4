Both Dekker's and Peterson's algorithms guarantee mutual exclusion: at any time, at most one process can be in the critical area. 
Nevertheless, neither of the two algorithms guarantees fairness; this is not to claim, of course, that these algorithms are flawed: it is merely not in their intention to be fair!

In class we demonstrated today why Dekker's algorithm does not guarantee fairness: as long as flag[1] (i.e., the flag corresponding to P1) remains 0, P0  repeatedly enters and exits the critical area. Thus, there is at least one possible execution in which the scheduler retains control within P0 for a sufficient amount of time during which P0 repeatedly visits the critical area several times, whilst P1 has still not made any progress. 

The same applies to Peterson's algorithm: as long as flag[1] (i.e., the flag corresponding to P1) remains 0, P0  repeatedly enters and exits the critical area...
