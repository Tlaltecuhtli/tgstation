
/obj/item/clothing/gloves/fingerless
	name = "fingerless gloves"
	desc = "Plain black gloves without fingertips for the hard working."
	icon_state = "fingerless"
	item_state = "fingerless"
	item_color = null	//So they don't wash.
	transfer_prints = TRUE
	strip_delay = 40
	equip_delay_other = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	custom_price = 10

/obj/item/clothing/gloves/botanic_leather
	name = "botanist's leather gloves"
	desc = "These leather gloves protect against thorns, barbs, prickles, spikes and other harmful objects of floral origin.  They're also quite warm."
	icon_state = "leather"
	item_state = "ggloves"
	permeability_coefficient = 0.9
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 70, "acid" = 30)

/obj/item/clothing/gloves/combat
	name = "combat gloves"
	desc = "These tactical gloves are fireproof and shock resistant."
	icon_state = "black"
	item_state = "blackgloves"
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	strip_delay = 80
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 50)

/obj/item/clothing/gloves/bracer
	name = "bone bracers"
	desc = "For when you're expecting to get slapped on the wrist. Offers modest protection to your arms."
	icon_state = "bracers"
	item_state = "bracers"
	item_color = null	//So they don't wash.
	transfer_prints = TRUE
	strip_delay = 40
	equip_delay_other = 20
	body_parts_covered = ARMS
	cold_protection = ARMS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	armor = list("melee" = 15, "bullet" = 35, "laser" = 35, "energy" = 20, "bomb" = 35, "bio" = 35, "rad" = 35, "fire" = 0, "acid" = 0)

/obj/item/clothing/gloves/rapid
	name = "Gloves of the North Star"
	desc = "Just looking at these fills you with an urge to beat the shit out of people."
	icon_state = "rapid"
	item_state = "rapid"
	transfer_prints = TRUE
	var/warcry = "AT"

/obj/item/clothing/gloves/rapid/Touch(mob/living/target,proximity = TRUE)
	var/mob/living/M = loc

	if(M.a_intent == INTENT_HARM)
		M.changeNext_move(CLICK_CD_RAPID)
		if(warcry)
			M.say("[warcry]", ignore_spam = TRUE, forced = "north star warcry")
	.= FALSE

/obj/item/clothing/gloves/rapid/attack_self(mob/user)
	var/input = stripped_input(user,"What do you want your battlecry to be? Max length of 6 characters.", ,"", 7)
	if(input)
		warcry = input

/obj/item/clothing/gloves/knuckles
	name = "knuckles"
	desc = "Because you really needed another excuse to punch your crewmates."
	icon_state = "knuckles"
	item_state = "knuckles"
	equip_delay_other = 60
	var/originaldmglow
	var/originaldmghigh

/obj/item/clothing/gloves/knuckles/equipped(mob/user, slot)
	if(!ishuman(user))
		return
	if(slot == SLOT_GLOVES)
		var/mob/living/carbon/human/H = user
		originaldmglow = H.dna.species.punchdamagelow
		originaldmghigh = H.dna.species.punchdamagehigh
		H.dna.species.punchdamagelow = 12
		H.dna.species.punchdamagehigh = 18
	return
/obj/item/clothing/gloves/knuckles/dropped(mob/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(H.get_item_by_slot(SLOT_GLOVES) == src)
		H.dna.species.punchdamagelow = originaldmglow
		H.dna.species.punchdamagehigh = originaldmghigh
	return
