APPEND DNORDOM 

	IF ~~ THEN BEGIN qd_remove
		SAY @6000
		++ @6001 DO ~SetInterrupt(FALSE) SetGlobal("QD_NORDOM_FOLLOWER","GLOBAL",0) SetGlobal("QD_FOLLOWER","LOCALS",0) ApplySpellRES("QDUND2",Myself) RemoveFamiliar() ChangeEnemyAlly(Myself,NEUTRAL)  SetInterrupt(TRUE)~ EXIT 
	END 

	IF ~~ THEN BEGIN qd_promote
		SAY @3003
		IF ~~ THEN DO ~SetInterrupt(FALSE) SetGlobal("QD_NORDOM_FOLLOWER","GLOBAL",0) SetGlobal("QD_FOLLOWER","LOCALS",0) ApplySpellRES("QDUND2",Myself) RemoveFamiliar() JoinPartyEx(TRUE)  SetInterrupt(TRUE)~ EXIT 
	END 

	IF ~~ THEN BEGIN qd_demote
		SAY @6005
		IF ~~ THEN DO ~SetInterrupt(FALSE) LeaveParty() MakeGlobal() SetGlobal("QD_NORDOM_FOLLOWER","GLOBAL",1) SetGlobal("QD_FOLLOWER","LOCALS",1) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("QDUND1",Myself) SetInterrupt(TRUE)~ EXIT 
	END 
END 


//removal transition
EXTEND_BOTTOM DNORDOM 9 #1
	+ ~InParty("Nordom") !Global("QD_NORDOM_FOLLOWER","GLOBAL",1)~ + @6006 + qd_demote 
	+ ~Global("QD_NORDOM_FOLLOWER","GLOBAL",1) NumInPartyLT(6)~ + @6002 + qd_promote  
	+ ~Global("QD_NORDOM_FOLLOWER","GLOBAL",1)~ + @6004 + qd_remove  
END 
