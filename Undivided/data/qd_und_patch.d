//-----------------------------------
// MORTE
// - Changes the initial Mortuary dialog. 
// - Updates Morte's interjections. 
//-----------------------------------
ALTER_TRANS DMORTE1 
	BEGIN 17 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~MakeGlobal() ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() SetGlobal("qd_morte_party","GLOBAL",1)~  
END 

//changing dialog checks for morte's presence and availability
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~!NearbyDialog("Dmorte")~ ~OR(2) !See("Morte") StateCheck("Morte", CD_STATE_NOTVALID)~ 
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~NearbyDialog("Dmorte")~ ~See("Morte") !StateCheck("Morte", CD_STATE_NOTVALID)~ 
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~!InParty("Morte")~ ~Global("qd_morte_party","GLOBAL",0)~ 
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~InParty("Morte")~ ~Global("qd_morte_party","GLOBAL",1)~ 