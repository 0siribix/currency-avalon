local S = currency.S

minetest.register_craftitem("currency:minegeld_cent_5", {
	description = S("@1 Avalon schilling coin", "5"),
	inventory_image = "minegeld_cent_5.png",
		stack_max = 1000,
		groups = {minegeld = 1, minegeld_coin = 1}
})

minetest.register_craftitem("currency:minegeld_cent_10", {
	description = S("@1 Avalon schilling coin", "10"),
	inventory_image = "minegeld_cent_10.png",
		stack_max = 1000,
		groups = {minegeld = 1, minegeld_coin = 1}
})

minetest.register_craftitem("currency:minegeld_cent_25", {
	description = S("@1 Avalon schilling coin", "25"),
	inventory_image = "minegeld_cent_25.png",
		stack_max = 1000,
		groups = {minegeld = 1, minegeld_coin = 1}
})

minetest.register_craftitem("currency:minegeld", {
	description = S("@1 Avalon Mark Note", "1"),
	inventory_image = "minegeld.png",
		stack_max = 65535,
		groups = {minegeld = 1, minegeld_note = 1}
})

minetest.register_craftitem("currency:minegeld_5", {
	description = S("@1 Avalon Mark Note", "5"),
	inventory_image = "minegeld_5.png",
		stack_max = 65535,
		groups = {minegeld = 1, minegeld_note = 1}
})

minetest.register_craftitem("currency:minegeld_10", {
	description = S("@1 Avalon Mark Note", "10"),
	inventory_image = "minegeld_10.png",
		stack_max = 65535,
		groups = {minegeld = 1, minegeld_note = 1}
})

minetest.register_craftitem("currency:minegeld_50", {
	description = S("@1 Avalon Mark Note", "50"),
	inventory_image = "minegeld_50.png",
		stack_max = 65535,
		groups = {minegeld = 1, minegeld_note = 1}
})

minetest.register_craftitem("currency:minegeld_100", {
	description = S("@1 Avalon Mark Note", "100"),
	inventory_image = "minegeld_100.png",
		stack_max = 65535,
		groups = {minegeld = 1, minegeld_note = 1}
})

minetest.register_craftitem("currency:minegeld_bundle", {
	description = S("Bundle of random Avalon Mark notes"),
	inventory_image = "minegeld_bundle.png",
		stack_max = 65535,
})
