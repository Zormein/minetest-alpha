--MCmobs v0.5
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")
--THIS IS THE MASTER ITEM LIST TO USE WITH DEFAULT

-- intllib
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

local c = mobs_mc.is_item_variable_overridden

-- Chicken

if c("feather") then
	minetest.register_craftitem("mobs_mc:feather", {
		description = S("Feather"),
		_doc_items_longdesc = S("Feathers are used in crafting and are dropped from chickens."),
		inventory_image = "mcl_mobitems_feather.png",
	})
end

-- Pig
if c("porkchop_raw") then
	minetest.register_craftitem("mobs_mc:porkchop_raw", {
		description = S("Raw Porkchop"),
		_doc_items_longdesc = S("A raw porkchop is the flesh from a pig and can be eaten safely. Cooking it will greatly increase its nutritional value."),
		inventory_image = "mcl_mobitems_porkchop_raw.png",
		groups = { food = 2, eatable = 3 },
		on_use = minetest.item_eat(3),
	})
end

if c("porkchop_cooked") then
	minetest.register_craftitem("mobs_mc:porkchop_cooked", {
		description = S("Cooked Porkchop"),
		_doc_items_longdesc = "Cooked porkchop is the cooked flesh of a pig and is used as food.",
		inventory_image = "mcl_mobitems_porkchop_cooked.png",
		groups = { food = 2, eatable = 8 },
		on_use = minetest.item_eat(8),
	})
end

if c("porkchop_raw") and c("porkchop_cooked") then
	minetest.register_craft({
		type = "cooking",
		output = "mobs_mc:porkchop_cooked",
		recipe = "mobs_mc:porkchop_raw",
		cooktime = 5,
	})
end

-- Rotten flesh
if c("rotten_flesh") then
	minetest.register_craftitem("mobs_mc:rotten_flesh", {
		description = S("Rotten Flesh"),
		_doc_items_longdesc = S("Yuck! This piece of flesh clearly has seen better days. Eating it will only poison you and reduces your health by 4 hit points. But tamed wolves can eat it just fine."),
		inventory_image = "mcl_mobitems_rotten_flesh.png",
		-- Simplified poisonous food
		groups = { food = 2, eatable = -4 },
		on_use = minetest.item_eat(-4),
	})
end

-- Cow
if c("milk") then
	-- milk
	minetest.register_craftitem("mobs_mc:milk_bucket", {
		description = S("Milk"),
		_doc_items_longdesc = S("Milk is a food item obtained by using a bucket on a cow."),
		inventory_image = "mobs_bucket_milk.png",
		groups = { food = 3, eatable = 1 },
		on_use = minetest.item_eat(1, "bucket:bucket_empty"),
		stack_max = 1,
	})
end

if c("milk") then
	-- milk
	minetest.register_craftitem("mobs_mc:milk_bucket", {
		description = S("Milk"),
		_doc_items_longdesc = S("Milk is a food item obtained by using a bucket on a cow."),
		inventory_image = "mobs_bucket_milk.png",
		groups = { food = 3, eatable = 1 },
		on_use = minetest.item_eat(1, "bucket:bucket_empty"),
		stack_max = 1,
	})
end

-- Mushroom stew

if c("bowl") then
	minetest.register_craftitem("mobs_mc:bowl", {
		description = S("Bowl"),
		_doc_items_longdesc = S("Bowls are mainly used to hold tasty soups."),
		inventory_image = "mcl_core_bowl.png",
	})

	minetest.register_craft({
		output = "mobs_mc:bowl",
		recipe = {
			{ "group:wood", "", "group:wood" },
			{ "", "group:wood", "", },
		}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "mobs_mc:bowl",
		burntime = 5,
	})
end

if c("mushroom_stew") then
	minetest.register_craftitem("mobs_mc:mushroom_stew", {
		description = S("Mushroom Stew"),
		_doc_items_longdesc = S("Mushroom stew is a healthy soup."),
		inventory_image = "farming_mushroom_stew.png",
		groups = { food = 3, eatable = 6 },
		on_use = minetest.item_eat(6, "mobs_mc:bowl"),
		stack_max = 1,
	})
end

-- Misc.

if c("snowball") and minetest.get_modpath("default") then
	minetest.register_craft({
		output = "mobs_mc:snowball 2",
		recipe = {
			{"default:snow"},
		},
	})
	minetest.register_craft({
		output = "default:snow 2",
		recipe = {
			{"mobs_mc:snowball", "mobs_mc:snowball"},
			{"mobs_mc:snowball", "mobs_mc:snowball"},
		},
	})
	-- Change the appearance of default snow to avoid confusion with snowball
	minetest.override_item("default:snow", {
		inventory_image = "",
		wield_image = "",
	})
end

if c("bone") then
	minetest.register_craftitem("mobs_mc:bone", {
		description = S("Bone"),
		_doc_items_longdesc = S("Bones can be used to tame wolves so they will protect you. They are also useful as a crafting ingredient."),
		_doc_items_usagehelp = S("Hold the bone in your hand near wolves to attract them. Rightclick the wolf to give it a bone and tame it."),
		inventory_image = "mcl_mobitems_bone.png"
	})
	if minetest.get_modpath("bones") then
		minetest.register_craft({
			output = "mobs_mc:bone 3",
			recipe = {{ "bones:bones" }},
		})
	end
end
