APPEND DIGNUS 

	IF ~~ THEN BEGIN qd_remove
		SAY @4000
		++ @4001 DO ~SetInterrupt(FALSE) SetGlobal("QD_IGNUS_FOLLOWER","GLOBAL",0) SetGlobal("QD_FOLLOWER","LOCALS",0) ApplySpellRES("QDUND2",Myself) RemoveFamiliar() ChangeEnemyAlly(Myself,NEUTRAL)  SetInterrupt(TRUE)~ EXIT 
	END 

	IF ~~ THEN BEGIN qd_promote
		SAY @4003
		IF ~~ THEN DO ~SetInterrupt(FALSE) SetGlobal("QD_IGNUS_FOLLOWER","GLOBAL",0) SetGlobal("QD_FOLLOWER","LOCALS",0) ApplySpellRES("QDUND2",Myself) RemoveFamiliar() JoinPartyEx(TRUE)  SetInterrupt(TRUE)~ EXIT 
	END 

	IF ~~ THEN BEGIN qd_demote
		SAY @4005
		IF ~~ THEN DO ~SetInterrupt(FALSE) LeaveParty() MakeGlobal() SetGlobal("QD_IGNUS_FOLLOWER","GLOBAL",1) SetGlobal("QD_FOLLOWER","LOCALS",1) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("QDUND1",Myself) SetInterrupt(TRUE)~ EXIT 
	END 
END 


//removal transition
EXTEND_BOTTOM DIGNUS 16 #1
	+ ~InParty("Ignus") !Global("QD_IGNUS_FOLLOWER","GLOBAL",1)~ + @4006 + qd_demote 
	+ ~Global("QD_IGNUS_FOLLOWER","GLOBAL",1) NumInPartyLT(6)~ + @4002 + qd_promote  
	+ ~Global("QD_IGNUS_FOLLOWER","GLOBAL",1)~ + @4004 + qd_remove  
END 
