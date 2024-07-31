--/======================================================================================================/--
--|										 	   Tr��ng Giang DEV			    					    	 |--
--| 	Telegram: cjgawatama		  		  Github: cjgawatama				 Youtube: @HoaiNiemJX1 	 |--
--/======================================================================================================/--
--|								     FUNCTION BOSS TAN THUY HOANG DEATH      			 				 |--
--/======================================================================================================/--
--|                                                                                                      |--
--|                                                                                                      |--
--|                                                                                                      |--
--/=Include Th� Vi�n=====================================================================================/--
IncludeLib("TASKSYS")
IncludeLib("LEAGUE")
Include("\\script\\global\\signet_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\global\\tgiang_dev\\0_config\\config_server.lua")				   	    --/Config ---|--
--/======================================================================================================/--
--|                                                                                                      |--
--|                                                                                                      |--
--|                                                                                                      |--
--/=H�m Th�c Thi=========================================================================================/--
--/-0-MAIN-----------------------------------------------------------------------------------------------|--
function main()
	dofile("script/global/tgiang_dev/3_chuc_nang/1_bibaotanlang/fun_tanlang_death2.lua")
end
--/-1-H�m th�c thi khi boss ch�t-------------------------------------------------------------------------|--
function OnDeath( nNpcIndex )
	--/-Item r�i ra t� boss, tu� ch�nh � file config_award-----------
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbBossThanhThuItemDropAward,format("killed_%s",GetNpcName(nNpcIndex)))
    tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbBossTTHItemDropAward,format("killed_%s",GetNpcName(nNpcIndex)))
	--/-Ph�n th��ng gi�t boss-----------
    local nTeamSize = GetTeamSize();
	local szName; 
	--/-Ph�n th��ng gi�t boss - Team-----------
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			if(doFunByPlayer(GetTeamMember(i), IsCaptain)==1)then
				szName = doFunByPlayer(GetTeamMember(i), GetName);
			end
			doFunByPlayer(GetTeamMember(i), PlayerFunLib.AddExp, PlayerFunLib, EXP_TL_TTH, 0, format("%s ph�n th��ng","Kinh nghi�m �� b�i Boss T�n Thu� Ho�ng "));
			Msg2Player("<color=yellow>��i hi�p �� ��nh ch�t boss nh�n th��ng: <color> "..EXP_TL_TTH)
		end
	else 
	--/-Ph�n th��ng gi�t boss - M�t m�nh-----------
		szName = GetName();
		PlayerFunLib:AddExp(EXP_TL_TTH, 0, format("%s ph�n th��ng","Kinh nghi�m �� b�i Boss T�n Thu� Ho�ng "));
		Msg2Player("<color=green>��i hi�p nh�n ���c kinh nghi�m gi�t boss: <color>"..EXP_TL_TTH)
	end
	--/-Ph�n th��ng gi�t boss - ��ng g�n boss-----------
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);	
	for i=1,nCount do
		doFunByPlayer(tbRoundPlayer[i], PlayerFunLib.AddExp, PlayerFunLib, EXP_TL_TTH_NEAR, 0, format("%s ph�n th��ng","Kinh nghi�m ��ng g�n l�c Boss T�n Thu� Ho�ng "));
		Msg2Player("<color=blue>��i hi�p nh�n ���c kinh nghi�m ��ng g�n boss: <color>"..EXP_TL_TTH_NEAR)
	end
	--/-Th�ng b�o ti�u di�t-----------	
	local szNews = format("��i hi�p <color=yellow>%s<color> t�i <color=yellow>%s<color> �� ti�u di�t th�nh c�ng <color=yellow>%s<color>!", GetName(), SubWorldName(SubWorld),GetNpcName(nNpcIndex));
	AddGlobalNews(szNews);

end;
--/-2-h�m xo� boss---------------------------------------------------------------------------------------|--

function OnTimer(nNpcIndex, nTimeOut)
	DelNpc(nNpcIndex);
end
--/======================================================================================================/--
--|                                                                                                      |--
--|                                                END                                              	 |--
--|                                                                                                      |--
--/======================================================================================================/--