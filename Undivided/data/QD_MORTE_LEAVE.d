APPEND DMORTE 

	IF ~~ THEN BEGIN qd_remove
		SAY @1000
		++ @1001 DO ~SetInterrupt(FALSE) SetGlobal("QD_MORTE_FOLLOWER","GLOBAL",0) SetGlobal("QD_FOLLOWER","LOCALS",0) ApplySpellRES("QDUND2",Myself) RemoveFamiliar() ChangeEnemyAlly(Myself,NEUTRAL)  SetInterrupt(TRUE)~ EXIT 
	END 

	IF ~~ THEN BEGIN qd_promote
		SAY @1003
		IF ~~ THEN DO ~SetInterrupt(FALSE) SetGlobal("QD_MORTE_FOLLOWER","GLOBAL",0) SetGlobal("QD_FOLLOWER","LOCALS",0) ApplySpellRES("QDUND2",Myself) RemoveFamiliar() JoinPartyEx(TRUE)  SetInterrupt(TRUE)~ EXIT 
	END 

	IF ~~ THEN BEGIN qd_demote
		SAY @1005
		IF ~~ THEN DO ~SetInterrupt(FALSE) LeaveParty() SetGlobal("QD_MORTE_FOLLOWER","GLOBAL",1) SetGlobal("QD_FOLLOWER","LOCALS",1) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("QDUND1",Myself) SetInterrupt(TRUE)~ EXIT 
	END 
END 

APPEND DMORTE2 

	IF ~~ THEN BEGIN qd_remove
		SAY @1000
		++ @1001 DO ~SetInterrupt(FALSE) SetGlobal("QD_MORTE_FOLLOWER","GLOBAL",0) SetGlobal("QD_FOLLOWER","LOCALS",0) ApplySpellRES("QDUND2",Myself) RemoveFamiliar() ChangeEnemyAlly(Myself,NEUTRAL)  SetInterrupt(TRUE)~ EXIT 
	END 

	IF ~~ THEN BEGIN qd_promote
		SAY @1003
		IF ~~ THEN DO ~SetInterrupt(FALSE) SetGlobal("QD_MORTE_FOLLOWER","GLOBAL",0) SetGlobal("QD_FOLLOWER","LOCALS",0) ApplySpellRES("QDUND2",Myself) RemoveFamiliar() JoinPartyEx(TRUE)  SetInterrupt(TRUE)~ EXIT 
	END 

	IF ~~ THEN BEGIN qd_demote
		SAY @1005
		IF ~~ THEN DO ~SetInterrupt(FALSE) LeaveParty() SetGlobal("QD_MORTE_FOLLOWER","GLOBAL",1) SetGlobal("QD_FOLLOWER","LOCALS",1) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("QDUND1",Myself) SetInterrupt(TRUE)~ EXIT 
	END 
END 


//removal transition
EXTEND_BOTTOM DMORTE 729 #1
	+ ~InParty("Morte") !Global("QD_MORTE_FOLLOWER","GLOBAL",1)~ + @1006 + qd_demote 
	+ ~Global("QD_MORTE_FOLLOWER","GLOBAL",1) NumInPartyLT(6)~ + @1002 + qd_promote  
	+ ~Global("QD_MORTE_FOLLOWER","GLOBAL",1)~ + @1004 + qd_remove  
END 

EXTEND_BOTTOM DMORTE 329 #1
	+ ~InParty("Morte") !Global("QD_MORTE_FOLLOWER","GLOBAL",1)~ + @1006 + qd_demote 
	+ ~Global("QD_MORTE_FOLLOWER","GLOBAL",1) NumInPartyLT(6)~ + @1002 + qd_promote  
	+ ~Global("QD_MORTE_FOLLOWER","GLOBAL",1)~ + @1004 + qd_remove  
END 

EXTEND_BOTTOM DMORTE 444 #2
	+ ~InParty("Morte") !Global("QD_MORTE_FOLLOWER","GLOBAL",1)~ + @1006 + qd_demote 
	+ ~Global("QD_MORTE_FOLLOWER","GLOBAL",1) NumInPartyLT(6)~ + @1002 + qd_promote  
	+ ~Global("QD_MORTE_FOLLOWER","GLOBAL",1)~ + @1004 + qd_remove  
END 


EXTEND_BOTTOM DMORTE2 12 #1
	+ ~InParty("Morte") !Global("QD_MORTE_FOLLOWER","GLOBAL",1)~ + @1006 + qd_demote 
	+ ~Global("QD_MORTE_FOLLOWER","GLOBAL",1) NumInPartyLT(6)~ + @1002 + qd_promote  
	+ ~Global("QD_MORTE_FOLLOWER","GLOBAL",1)~ + @1004 + qd_remove  
END 