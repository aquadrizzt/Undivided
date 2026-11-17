APPEND DGRACE 

	IF ~~ THEN BEGIN qd_remove
		SAY @5000
		++ @5001 DO ~SetInterrupt(FALSE) SetGlobal("QD_GRACE_FOLLOWER","GLOBAL",0) SetGlobal("QD_FOLLOWER","LOCALS",0) ApplySpellRES("QDUND2",Myself) RemoveFamiliar() ChangeEnemyAlly(Myself,NEUTRAL)  SetInterrupt(TRUE)~ EXIT 
	END 

	IF ~~ THEN BEGIN qd_promote
		SAY @5003
		IF ~~ THEN DO ~SetInterrupt(FALSE) SetGlobal("QD_GRACE_FOLLOWER","GLOBAL",0) SetGlobal("QD_FOLLOWER","LOCALS",0) ApplySpellRES("QDUND2",Myself) RemoveFamiliar() JoinPartyEx(TRUE)  SetInterrupt(TRUE)~ EXIT 
	END 

	IF ~~ THEN BEGIN qd_demote
		SAY @5005
		IF ~~ THEN DO ~SetInterrupt(FALSE) LeaveParty() MakeGlobal() SetGlobal("QD_GRACE_FOLLOWER","GLOBAL",1) SetGlobal("QD_FOLLOWER","LOCALS",1) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("QDUND1",Myself) SetInterrupt(TRUE)~ EXIT 
	END 
END 


//removal transition
EXTEND_BOTTOM DGRACE 139 #1
	+ ~InParty("Grace") !Global("QD_GRACE_FOLLOWER","GLOBAL",1)~ + @5006 + qd_demote 
	+ ~Global("QD_GRACE_FOLLOWER","GLOBAL",1) NumInPartyLT(6)~ + @5002 + qd_promote  
	+ ~Global("QD_GRACE_FOLLOWER","GLOBAL",1)~ + @5004 + qd_remove  
END 
