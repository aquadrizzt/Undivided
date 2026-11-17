APPEND DANNAH 

	IF ~~ THEN BEGIN qd_remove
		SAY @3000
		++ @3001 DO ~SetInterrupt(FALSE) SetGlobal("QD_ANNAH_FOLLOWER","GLOBAL",0) SetGlobal("QD_FOLLOWER","LOCALS",0) ApplySpellRES("QDUND2",Myself) RemoveFamiliar() ChangeEnemyAlly(Myself,NEUTRAL)  SetInterrupt(TRUE)~ EXIT 
	END 

	IF ~~ THEN BEGIN qd_promote
		SAY @3003
		IF ~~ THEN DO ~SetInterrupt(FALSE) SetGlobal("QD_ANNAH_FOLLOWER","GLOBAL",0) SetGlobal("QD_FOLLOWER","LOCALS",0) ApplySpellRES("QDUND2",Myself) RemoveFamiliar() JoinPartyEx(TRUE)  SetInterrupt(TRUE)~ EXIT 
	END 

	IF ~~ THEN BEGIN qd_demote
		SAY @3005
		IF ~~ THEN DO ~SetInterrupt(FALSE) LeaveParty() MakeGlobal() SetGlobal("QD_ANNAH_FOLLOWER","GLOBAL",1) SetGlobal("QD_FOLLOWER","LOCALS",1) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("QDUND1",Myself) SetInterrupt(TRUE)~ EXIT 
	END 
END 


//removal transition
EXTEND_BOTTOM DANNAH 187 #1
	+ ~InParty("Annah") !Global("QD_ANNAH_FOLLOWER","GLOBAL",1)~ + @3006 + qd_demote 
	+ ~Global("QD_ANNAH_FOLLOWER","GLOBAL",1) NumInPartyLT(6)~ + @3002 + qd_promote  
	+ ~Global("QD_ANNAH_FOLLOWER","GLOBAL",1)~ + @3004 + qd_remove  
END 
