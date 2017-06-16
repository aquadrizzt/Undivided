//-----------------------------------
// NORDOM
// - Changes the initial Modron Maze joining dialog. 
// - Updates Nordom's interjections. 
//-----------------------------------

//initial joining dialog
ALTER_TRANS DNORDOM 
	BEGIN 40 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Nordom","GLOBAL",2)
AddexperienceParty(36000) MakeGlobal() ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() SetGlobal("qd_nordom_party","GLOBAL",1)~  
END 

//normal nordom rejoin dialog
ALTER_TRANS DNORDOM 
	BEGIN 8 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~ MakeGlobal() ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() SetGlobal("qd_nordom_party","GLOBAL",1)~  
END 

//first join
ALTER_TRANS DNORDOM 
	BEGIN 8 END //state
	BEGIN 1 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Nordom","GLOBAL",2)
AddexperienceParty(36000) MakeGlobal() ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() SetGlobal("qd_nordom_party","GLOBAL",1)~  
END 

//fortress
ALTER_TRANS DNORDOM 
	BEGIN 145 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Fortress_Nordom","GLOBAL",4) MakeGlobal() ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() SetGlobal("qd_nordom_party","GLOBAL",1)~  
END 

//changing dialog checks for morte's presence and availability
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~!NearbyDialog("DNORDOM")~ ~OR(2) !See("Nordom") StateCheck("Nordom", CD_STATE_NOTVALID)~ 
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~NearbyDialog("DNORDOM")~ ~See("Nordom") !StateCheck("Nordom", CD_STATE_NOTVALID)~ 
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~!InParty("Nordom")~ ~Global("qd_nordom_party","GLOBAL",0)~ 
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~InParty("Nordom")~ ~Global("qd_nordom_party","GLOBAL",1)~ 

//removing from party dialog 
APPEND DNORDOM 

	IF ~~ THEN BEGIN qd_remove_nordom
		SAY @202
		++ @203 DO ~SetGlobal("qd_nordom_party","GLOBAL",0) ActionOverride("Nordom",RemoveFamiliar()) ChangeEnemyAlly("Nordom",NEUTRAL)~ EXIT 
	END 
END 

//removal transition
EXTEND_BOTTOM DNORDOM 9 #1
	++ @204 + qd_remove_nordom  
END 
