//-----------------------------------
// VHAILOR
// - Changes the initial joining and rejoin dialog. 
// - Updates Vhailor's interjections. 
//-----------------------------------

//main join dialog
ALTER_TRANS DVHAIL 
	BEGIN 79 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("QDUNDV2",Myself) GiveItemCreate("qd_und1","vhail",1,0,0) XEquipItem("qd_und1","vhail",SLOT_RING_LEFT,1) SetGlobal("qd_vhailor_party","GLOBAL",1) ChangeAIScript("PCVHAIL",DEFAULT) SetGlobal("Vhailor_Join","GLOBAL",1) ActionOverride(Protagonist,DestroyItem("qd_und1"))~  
END 

ALTER_TRANS DVHAIL 
	BEGIN 81 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("QDUNDV2",Myself) GiveItemCreate("qd_und1",Myself,1,0,0) XEquipItem("qd_und1","vhail",SLOT_RING_LEFT,1) SetGlobal("qd_vhailor_party","GLOBAL",1) ChangeAIScript("PCVHAIL",DEFAULT) SetGlobal("Vhailor_Join","GLOBAL",1) ActionOverride(Protagonist,DestroyItem("qd_und1"))~   
END 

//normal vhailor rejoin dialog
ALTER_TRANS DVHAIL 
	BEGIN 8 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("QDUNDV2",Myself) GiveItemCreate("qd_und1",Myself,1,0,0) XEquipItem("qd_und1","vhail",SLOT_RING_LEFT,1) SetGlobal("qd_vhailor_party","GLOBAL",1) ChangeAIScript("PCVHAIL",DEFAULT) SetGlobal("Vhailor_Join","GLOBAL",1) ActionOverride(Protagonist,DestroyItem("qd_und1"))~    
END 

//vhailor fortress final battle rejoin
ALTER_TRANS DVHAIL 
	BEGIN 158 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("QDUNDV2",Myself) GiveItemCreate("qd_und1",Myself,1,0,0) XEquipItem("qd_und1","vhail",SLOT_RING_LEFT,1) SetGlobal("qd_vhailor_party","GLOBAL",1) ChangeAIScript("PCVHAIL",DEFAULT) SetGlobal("Vhailor_Join","GLOBAL",1) ActionOverride(Protagonist,DestroyItem("qd_und1"))~  
END 

//left over Vhailor join [shouldn't matter]
ALTER_TRANS DVHAIL 
	BEGIN 0 END //state
	BEGIN 1 END  //transition 
BEGIN 
	"ACTION" ~ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() ApplySpellRES("QDUNDV2",Myself) GiveItemCreate("qd_und1",Myself,1,0,0) XEquipItem("qd_und1","vhail",SLOT_RING_LEFT,1) SetGlobal("qd_vhailor_party","GLOBAL",1) ChangeAIScript("PCVHAIL",DEFAULT) SetGlobal("Vhailor_Join","GLOBAL",1) ActionOverride(Protagonist,DestroyItem("qd_und1"))~  
END 

//changing dialog checks for Vhailor's presence and availability
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~!NearbyDialog("Dvhail")~ ~OR(2) !See("Vhail") StateCheck("Vhail", CD_STATE_NOTVALID)~ 
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~NearbyDialog("Dvhail")~ ~See("Vhail") !StateCheck("Vhail", CD_STATE_NOTVALID)~ 
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~!InParty("Vhail")~ ~Global("qd_vhailor_party","GLOBAL",0)~ 
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~InParty("Vhail")~ ~Global("qd_vhailor_party","GLOBAL",1)~ 
REPLACE_ACTION_TEXT dvhail ~Enemy()~ ~SetGlobal("qd_vhailor_party","GLOBAL",0) RemoveFamiliar() DestroyItem("qd_und1") Enemy()~ 

//removing from party dialog 
APPEND DVHAIL 
	IF ~~ THEN BEGIN qd_remove_vhailor
		SAY @102
		++ @103 DO ~SetGlobal("qd_vhailor_party","GLOBAL",0) ActionOverride("Vhail",RemoveFamiliar()) ActionOverride("Vhail",DestroyItem("qd_und1")) ChangeEnemyAlly("Vhail",NEUTRAL)~ EXIT 
	END 
END 

//removal transitions 
EXTEND_BOTTOM DVHAIL 35 #1
	++ @101 + qd_remove_vhailor  
END 
