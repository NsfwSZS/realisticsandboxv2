if CLIENT then
	local antilag = false
	local antilagConvar = CreateClientConVar("bucket_mcore", 0, true)

	local function antilagOn()
		RunConsoleCommand("gmod_mcore_test", "1")
		RunConsoleCommand("mat_queue_mode", "-1")
		RunConsoleCommand("cl_threaded_bone_setup", "1")
		RunConsoleCommand("cl_threaded_client_leaf_system", "1")
		RunConsoleCommand("r_threaded_client_shadow_manager", "1")
		RunConsoleCommand("r_threaded_particles", "1")
		RunConsoleCommand("r_threaded_renderables", "1")
		RunConsoleCommand("r_queued_ropes", "1")
		RunConsoleCommand("studio_queue_mode", "1")

		hook.Remove("PreventScreenClicks", "SuperDOFPreventClicks")
		hook.Remove("PostRender", "RenderFrameBlend")
		hook.Remove("PreRender", "PreRenderFrameBlend")
		hook.Remove("Think", "DOFThink")
		hook.Remove("RenderScreenspaceEffects", "RenderBokeh")
		hook.Remove("NeedsDepthPass", "NeedsDepthPass_Bokeh")
		hook.Remove("PostDrawEffects", "RenderWidgets")
		hook.Remove("Think", "RenderHalos")
	end

	local function antilagOff()
		RunConsoleCommand("gmod_mcore_test", "0")
		RunConsoleCommand("mat_queue_mode", "0")
		RunConsoleCommand("cl_threaded_bone_setup", "0")
		RunConsoleCommand("cl_threaded_client_leaf_system", "0")
		RunConsoleCommand("r_threaded_client_shadow_manager", "0")
		RunConsoleCommand("r_threaded_particles", "0")
		RunConsoleCommand("r_threaded_renderables", "0")
		RunConsoleCommand("r_queued_ropes", "0")
		RunConsoleCommand("studio_queue_mode", "0")
	end

	local function runWhenValid()
		timer.Simple(5, function()
			if antilagConvar:GetInt() >= 1 then
				antilagOn()
				antilag = true
			end
		end)
	end

	hook.Add("InitPostEntity", "runValid", runWhenValid)

	local chatCommands = {
		["!al"] = function()
			if not antilag then
				antilagOn()
			end
		end,
		["!al 1"] = function()
			if not antilag then
				antilag = true
				antilagOn()
			end
			RunConsoleCommand("bucket_mcore", "1")
		end,
		["!al 0"] = function()
			if antilag then
				antilagOff()
				antilag = false
			end
			RunConsoleCommand("bucket_mcore", "0")
		end,
	}

	hook.Add("OnPlayerChat", "bucketMcore", function(ply, strText, bTeam, bDead)
		if ply == LocalPlayer() then
			strText = string.lower(strText)
			if chatCommands[strText] ~= nil then
				chatCommands[strText]()
				return true
			end
		end
	end)
end

local function antiWidget(ent)
	if ent:IsWidget() then
		hook.Add("PlayerTick", "TickWidgets", function(pl, mv)
			widgets.PlayerTick(pl, mv)
		end)
		hook.Remove("OnEntityCreated", "WidgetInit") -- calls it only once
	end
end

hook.Add("OnEntityCreated", "WidgetInit", antiWidget)
