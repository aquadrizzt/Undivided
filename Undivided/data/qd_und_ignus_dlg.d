//-----------------------------------
// IGNUS
// - Changes the initial joining and rejoin dialog. 
// - Updates Ignus' interjections. 
//-----------------------------------

//main join dialog
ALTER_TRANS DIGNUS 
	BEGIN 7 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1")) SetGlobal("Ignus_Free","GLOBAL",1) SetGlobal("Ignus","GLOBAL",2)~  
END 

ALTER_TRANS DIGNUS 
	BEGIN 8 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) ActionOverride(Protagonist,DestroyItem("qd_und1"))~  
END 

ALTER_TRANS DIGNUS 
	BEGIN 9 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Ignus","GLOBAL",2) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

ALTER_TRANS DIGNUS 
	BEGIN 14 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Party_Ignus_Waiting_VO","GLOBAL",1) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

ALTER_TRANS DIGNUS 
	BEGIN 14 END //state
	BEGIN 1 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Party_Ignus_Waiting_VO","GLOBAL",1) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

ALTER_TRANS DIGNUS 
	BEGIN 14 END //state
	BEGIN 2 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Party_Ignus_Waiting_VO","GLOBAL",1) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

ALTER_TRANS DIGNUS 
	BEGIN 14 END //state
	BEGIN 3 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Party_Ignus_Waiting_VO","GLOBAL",1) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END  

ALTER_TRANS DIGNUS 
	BEGIN 14 END //state
	BEGIN 4 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Party_Ignus_Waiting_VO","GLOBAL",1) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

ALTER_TRANS DIGNUS 
	BEGIN 14 END //state
	BEGIN 5 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Party_Ignus_Waiting_VO","GLOBAL",1) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

ALTER_TRANS DIGNUS 
	BEGIN 84 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Party_Ignus_Waiting_VO","GLOBAL",2) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

ALTER_TRANS DIGNUS 
	BEGIN 84 END //state
	BEGIN 1 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Party_Ignus_Waiting_VO","GLOBAL",2) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

ALTER_TRANS DIGNUS 
	BEGIN 84 END //state
	BEGIN 2 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Party_Ignus_Waiting_VO","GLOBAL",2) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

ALTER_TRANS DIGNUS 
	BEGIN 84 END //state
	BEGIN 3 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Party_Ignus_Waiting_VO","GLOBAL",2) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

ALTER_TRANS DIGNUS 
	BEGIN 84 END //state
	BEGIN 4 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Party_Ignus_Waiting_VO","GLOBAL",2) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

ALTER_TRANS DIGNUS 
	BEGIN 84 END //state
	BEGIN 5 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Party_Ignus_Waiting_VO","GLOBAL",2) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

ALTER_TRANS DIGNUS 
	BEGIN 85 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Party_Ignus_Waiting_VO","GLOBAL",0) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

ALTER_TRANS DIGNUS 
	BEGIN 85 END //state
	BEGIN 1 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Party_Ignus_Waiting_VO","GLOBAL",0) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

ALTER_TRANS DIGNUS 
	BEGIN 85 END //state
	BEGIN 2 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Party_Ignus_Waiting_VO","GLOBAL",0) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

ALTER_TRANS DIGNUS 
	BEGIN 85 END //state
	BEGIN 3 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Party_Ignus_Waiting_VO","GLOBAL",0) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

ALTER_TRANS DIGNUS 
	BEGIN 85 END //state
	BEGIN 4 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Party_Ignus_Waiting_VO","GLOBAL",0) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

ALTER_TRANS DIGNUS 
	BEGIN 85 END //state
	BEGIN 5 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Party_Ignus_Waiting_VO","GLOBAL",0) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

//ignus fortress final battle rejoin
ALTER_TRANS DIGNUS 
	BEGIN 91 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Fortress_Ignus","GLOBAL",4) ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("qdundi2",Myself) GiveItemCreate("qd_und1","ignus",1,0,0) XEquipItem("qd_und1","ignus",SLOT_RING_LEFT,1) SetGlobal("qd_ignus_party","GLOBAL",1) ChangeAIScript("PCIGNUS",DEFAULT) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

//changing dialog checks for Vhailor's presence and availability
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~!NearbyDialog("dignus")~ ~OR(2) !See("Ignus") StateCheck("Ignus", CD_STATE_NOTVALID)~ 
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~NearbyDialog("dignus")~ ~See("Ignus") !StateCheck("Ignus", CD_STATE_NOTVALID)~ 
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~!InParty("Ignus")~ ~Global("qd_ignus_party","GLOBAL",0)~ 
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~InParty("Ignus")~ ~Global("qd_ignus_party","GLOBAL",1)~ 
REPLACE_ACTION_TEXT dignus ~Enemy()~ ~SetGlobal("qd_ignus_party","GLOBAL",0) RemoveFamiliar() DestroyItem("qd_und1") Enemy()~ 

//removing from party dialog 
APPEND DIGNUS 
	IF ~~ THEN BEGIN qd_remove_ignus
		SAY @202
		++ @203 DO ~SetGlobal("qd_ignus_party","GLOBAL",0) ActionOverride("Ignus",RemoveFamiliar()) ActionOverride("Ignus",DestroyItem("qd_und1")) ChangeEnemyAlly("Ignus",NEUTRAL)~ EXIT 
	END 
END 

//removal transitions 
EXTEND_BOTTOM DIGNUS 16 #1
	++ @201 + qd_remove_ignus  
END 
