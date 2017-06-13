//-----------------------------------
// MORTE
// - Changes the initial Mortuary joining and rejoin dialog. 
// - Updates Morte's interjections. 
//-----------------------------------

//mortuary joining dialog
ALTER_TRANS DMORTE1 
	BEGIN 17 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~MakeGlobal() ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() SetGlobal("qd_morte_party","GLOBAL",1)~  
END 

//normal morte rejoin dialog
ALTER_TRANS DMORTE 
	BEGIN 325 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~MakeGlobal() ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() SetGlobal("qd_morte_party","GLOBAL",1)~  
END 

ALTER_TRANS DMORTE 
	BEGIN 326 END //state
	BEGIN 1 END  //transition 
BEGIN 
	"ACTION" ~MakeGlobal() ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() SetGlobal("qd_morte_party","GLOBAL",1)~  
END 

ALTER_TRANS DMORTE 
	BEGIN 327 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~MakeGlobal() ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() SetGlobal("qd_morte_party","GLOBAL",1)~  
END 

//morte mortuary rejoin dialog
ALTER_TRANS DMORTE2 
	BEGIN 27 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~MakeGlobal() ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() SetGlobal("qd_morte_party","GLOBAL",1)~  
END 

ALTER_TRANS DMORTE2 
	BEGIN 28 END //state
	BEGIN 1 END  //transition 
BEGIN 
	"ACTION" ~MakeGlobal() ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() SetGlobal("qd_morte_party","GLOBAL",1)~  
END 

ALTER_TRANS DMORTE2 
	BEGIN 29 END //state
	BEGIN 0 END  //transition 
BEGIN 
	"ACTION" ~MakeGlobal() ChangeEnemyAlly(Myself,FAMILIAR) AddFamiliar() SetGlobal("qd_morte_party","GLOBAL",1)~  
END 

//changing dialog checks for morte's presence and availability
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~!NearbyDialog("Dmorte")~ ~OR(2) !See("Morte") StateCheck("Morte", CD_STATE_NOTVALID)~ 
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~NearbyDialog("Dmorte")~ ~See("Morte") !StateCheck("Morte", CD_STATE_NOTVALID)~ 
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~!InParty("Morte")~ ~Global("qd_morte_party","GLOBAL",0)~ 
REPLACE_TRIGGER_TEXT_REGEXP ~.*~ ~InParty("Morte")~ ~Global("qd_morte_party","GLOBAL",1)~ 

//removing from party dialog 
APPEND DMORTE 

	IF ~~ THEN BEGIN qd_remove_morte
		SAY @100
		++ @101 DO ~SetGlobal("qd_morte_party","GLOBAL",0) ActionOverride("Morte",RemoveFamiliar()) ChangeEnemyAlly("Morte",NEUTRAL)~ EXIT 
	END 
END 

//removal transition
EXTEND_BOTTOM DMORTE 729 #1
	++ @102 + qd_remove_morte  
END 

EXTEND_BOTTOM DMORTE 329 #1
	++ @102 + qd_remove_morte  
END 

/*
//new teeth item for ingress' teeth
ALTER_TRANS DCANDRI 
	BEGIN 0 END //state
	BEGIN 0 1 END  //transition 
BEGIN 
	"ACTION" ~SetGlobal("Ingress","GLOBAL",8) GiveItemCreate("QDINGTTH",Protagonist,1,0,0) AddexperienceParty(750)~  
END 
*/

//giving morte new teeth 
/*
EXTEND_BOTTOM DMORTE 729 #9
	+ ~OR(3) PartyHasItem("QDFDTTH") PartyHasItem("QDVTTH") PartyHasItem("QDINGTTH")~ + @103 + qd_morte_teeth  
END 

EXTEND_BOTTOM DMORTE 329 #9
	+ ~OR(3) PartyHasItem("QDFDTTH") PartyHasItem("QDVTTH") PartyHasItem("QDINGTTH")~ + @103 + qd_morte_teeth   
END 

APPEND DMORTE 

	IF ~~ THEN BEGIN qd_morte_teeth
		SAY @104
		+ ~PartyHasItem("QDFDTTH")~ + @105 + qd_morte_teeth_drake
		+ ~PartyHasItem("QDVTTH")~ + @107 + qd_morte_teeth_viper
		+ ~PartyHasItem("QDINGTTH")~ + @108 + qd_morte_teeth_ingress
		++ @109 + 329
		++ @110 EXIT 
	END 
		
	IF ~~ THEN BEGIN qd_morte_teeth_viper
		SAY @111 = @114 
			++ @115 DO ~ApplySpellRES("QDUNDM5",Myself)~ + 329 
			++ @116 DO ~ApplySpellRES("QDUNDM5",Myself)~ EXIT 
	END
	
	IF ~~ THEN BEGIN qd_morte_teeth_ingress
		SAY @112 = @113 = @114 
			++ @115 + 329 
			++ @116 EXIT 
	END 
	
	IF ~~ THEN BEGIN qd_morte_teeth_drake
		SAY @117 = @114 
			++ @115 + 329 
			++ @116 EXIT 
	END
END 
*/
