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

-- Cow Milk

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

-- Saddle
if c("saddle") then
	-- Overwrite the saddle from Mobs Redo
	minetest.register_craftitem(":mobs:saddle", {
		description = S("Saddle"),
		_doc_items_longdesc = S("Saddles can be put on horses, donkeys, mules and pigs in order to mount them."),
		_doc_items_usagehelp = S("Rightclick an animal while holding a saddle to put on the saddle. You can now mount the animal by rightclicking it again."),
		inventory_image = "mcl_mobitems_saddle.png",
		stack_max = 1,
	})
end

if c("saddle") and c("lether") and c("string") and c("iron_ingot") then
	minetest.register_craft({
		output = "mobs_mc:saddle",
		recipe = {
			{"mobs:leather", "mobs:leather", "mobs:leather"},
			{"farming:string", "", "farming:string"},
			{"default:steel_ingot", "", "default:steel_ingot"}
		},
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

-- Spider
if c("spider_eye") then
	minetest.register_craftitem("mobs_mc:spider_eye", {
		description = S("Spider Eye"),
		_doc_items_longdesc = S("Spider eyes are used mainly in crafting and brewing. Spider eyes can be eaten, but they poison you and reduce your health by 2 hit points."),
		inventory_image = "mcl_mobitems_spider_eye.png",
		wield_image = "mcl_mobitems_spider_eye.png",
		-- Simplified poisonous food
		groups = { food = 2, eatable = -2 },
		on_use = minetest.item_eat(-2),
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
