APPEND DDAKKON 

	IF ~~ THEN BEGIN qd_remove
		SAY @2000
		++ @2001 DO ~SetInterrupt(FALSE) SetGlobal("QD_DAKKON_FOLLOWER","GLOBAL",0) SetGlobal("QD_FOLLOWER","LOCALS",0) ApplySpellRES("QDUND2",Myself) RemoveFamiliar() ChangeEnemyAlly(Myself,NEUTRAL)  SetInterrupt(TRUE)~ EXIT 
	END 

	IF ~~ THEN BEGIN qd_promote
		SAY @2003
		IF ~~ THEN DO ~SetInterrupt(FALSE) SetGlobal("QD_DAKKON_FOLLOWER","GLOBAL",0) SetGlobal("QD_FOLLOWER","LOCALS",0) ApplySpellRES("QDUND2",Myself) RemoveFamiliar() JoinPartyEx(TRUE)  SetInterrupt(TRUE)~ EXIT 
	END 

	IF ~~ THEN BEGIN qd_demote
		SAY @2005
		IF ~~ THEN DO ~SetInterrupt(FALSE) LeaveParty() MakeGlobal() SetGlobal("QD_DAKKON_FOLLOWER","GLOBAL",1) SetGlobal("QD_FOLLOWER","LOCALS",1) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("QDUND1",Myself) SetInterrupt(TRUE)~ EXIT 
	END 
END 


//removal transition
EXTEND_BOTTOM DDAKKON 193 #1
	+ ~InParty("Dakkon") !Global("QD_DAKKON_FOLLOWER","GLOBAL",1)~ + @2006 + qd_demote 
	+ ~Global("QD_DAKKON_FOLLOWER","GLOBAL",1) NumInPartyLT(6)~ + @2002 + qd_promote  
	+ ~Global("QD_DAKKON_FOLLOWER","GLOBAL",1)~ + @2004 + qd_remove  
END 
