local players_income = {}
local players_count = 0

local income_enabled = minetest.settings:get_bool("currency.income_enabled", false)
local creative_income_enabled = minetest.settings:get_bool("currency.creative_income_enabled", true)
local income_item = minetest.settings:get("currency.income_item") or "currency:minegeld"
local income_count = tonumber(minetest.settings:get("currency.income_count")) or 1
local income_period = tonumber(minetest.settings:get("currency.income_period")) or 120
local inv_full_message = currency.S("You have payment waiting. Please make room in your inventory to receive payment")

if income_enabled then
	currency.payout = function()
		local job = minetest.after(income_period, currency.payout)
		local players_count = 0
		for name, paycheck in pairs(players_income) do
			local player = minetest.get_player_by_name(name)
			if player then
				players_count = players_count + 1
				local remainder = players_income[name] % 1
				local count = players_income[name] - remainder
				if count > 0 then
					local inv = player:get_inventory()
					if inv:room_for_item("main", {name=income_item, count=count}) then
						inv:add_item("main", {name=income_item, count=count})
						players_income[name] = remainder
						minetest.chat_send_player(name, currency.S("You have been paid $@1", count))
					else
						minetest.chat_send_player(name, currency.inv_full_message)
					end
				end
			else
				players_income[name] = nil
				players_count = players_count - 1
			end
		end
		if players_count == 0 then
			job:cancel()
		end
	end

	local function earn_income(player, multiplier)
		if player then
			local name = player:get_player_name()
			if players_income[name] ~= nil then
				players_income[name] = players_income[name] + (multiplier * income_count)
			end
		end
	end

	minetest.register_on_dignode(function(_, _, digger) earn_income(digger, 0.1) end)
	minetest.register_on_placenode(function(_, _, placer) earn_income(placer, 1) end)
	minetest.register_on_craft(function(_, player) earn_income(player, 10) end)
	minetest.register_on_dieplayer(function(player)
		if player then
			local name = player:get_player_name()
			if players_income[name] ~= nil then players_income[name] = 0 end
		end
	end)

	minetest.register_on_joinplayer(function(player)
		if player then
			local name = player:get_player_name()
			if creative_income_enabled or not minetest.is_creative_enabled(name) then
				players_income[name] = 0
				if players_count == 0 then minetest.after(income_period, currency.payout) end
				players_count = players_count + 1
			end
		end
	end)

	minetest.register_on_leaveplayer(function(player)
		local name = player.get_player_name()
		if name ~= "" then
			players_income[name] = nil
		end
	end)
end
