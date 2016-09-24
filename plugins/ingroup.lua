﻿do

-- Check Member
local function check_member_autorealm(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.peer_id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Realm',
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          flood = 'yes'
        }
      }
      save_data(_config.moderation.data, data)
      local realms = 'realms'
      if not data[tostring(realms)] then
        data[tostring(realms)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(realms)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'به ریلم جدیدتان خوش آمدید !')
    end
  end
end
local function check_member_realm_add(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.peer_id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Realm',
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          flood = 'yes'
        }
      }
      save_data(_config.moderation.data, data)
      local realms = 'realms'
      if not data[tostring(realms)] then
        data[tostring(realms)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(realms)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'ریلم اضافه شد')
    end
  end
end
function check_member_group(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.peer_id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Group',
        moderators = {},
        set_owner = member_id ,
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          flood = 'yes',
        }
      }
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'شما به عنوان صاحب گروه ارتقا یافتید.')
    end
  end
end
local function check_member_modadd(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.peer_id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Group',
		long_id = msg.to.peer_id,
        moderators = {},
        set_owner = member_id ,
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          flood = 'yes',
        }
      }
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'گروه اضافه شد و شما شما به عنوان صاحب گروه ارتقا یافتید ')
    end
  end
end
local function automodadd(msg)
  local data = load_data(_config.moderation.data)
  if msg.action.type == 'chat_created' then
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_group,{receiver=receiver, data=data, msg = msg})
  end
end
local function autorealmadd(msg)
  local data = load_data(_config.moderation.data)
  if msg.action.type == 'chat_created' then
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_autorealm,{receiver=receiver, data=data, msg = msg})
  end
end
local function check_member_realmrem(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Realm configuration removal
      data[tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      local realms = 'realms'
      if not data[tostring(realms)] then
        data[tostring(realms)] = nil
        save_data(_config.moderation.data, data)
      end
      data[tostring(realms)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'ریلم حذف شد')
    end
  end
end
local function check_member_modrem(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.peer_id
    if member_id ~= our_id then
      -- Group configuration removal
      data[tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'گروه حذف شد')
    end
  end
end
--End Check Member
function show_group_settingsmod(msg, target)
 	if not is_momod(msg) then
    	return "فقط برای مدیران !"
  	end
  	local data = load_data(_config.moderation.data)
    if data[tostring(target)] then
     	if data[tostring(target)]['settings']['flood_msg_max'] then
        	NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['flood_msg_max'])
        	print('custom'..NUM_MSG_MAX)
      	else
        	NUM_MSG_MAX = 5
      	end
    end
    local bots_protection = "Yes"
    if data[tostring(target)]['settings']['lock_bots'] then
    	bots_protection = data[tostring(target)]['settings']['lock_bots']
   	end
    local leave_ban = "no"
    if data[tostring(target)]['settings']['leave_ban'] then
    	leave_ban = data[tostring(target)]['settings']['leave_ban']
   	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_link'] then
			data[tostring(target)]['settings']['lock_link'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_sticker'] then
			data[tostring(target)]['settings']['lock_sticker'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['public'] then
			data[tostring(target)]['settings']['public'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_rtl'] then
			data[tostring(target)]['settings']['lock_rtl'] = 'no'
		end
	end
  local settings = data[tostring(target)]['settings']
  local text = "تنظیمات گروه:\nقفل اسم گروه : "..settings.lock_name.."\nقفل عکس گروه : "..settings.lock_photo.."\nقفل ورود اعضا : "..settings.lock_member.."\nقفل خروج : "..leave_ban.."\nحساسیت اسپم : "..NUM_MSG_MAX.."\nمحافظت در برابر ربات : "..bots_protection.."\nقفل اشتراک لینک : "..settings.lock_link.."\nقفل اسم برعکس: "..settings.lock_rtl.."\nقفل ارسال استیکر: "..settings.lock_sticker.."\nاشتراک گروه برای عضویت: "..settings.public
  return text
end

local function set_descriptionmod(msg, data, target, about)
  if not is_momod(msg) then
    return
  end
  local data_cat = 'description'
  data[tostring(target)][data_cat] = about
  save_data(_config.moderation.data, data)
  return 'توضیحات گروه تنظیم شد به:\n'..about
end
local function get_description(msg, data)
  local data_cat = 'description'
  if not data[tostring(msg.to.id)][data_cat] then
    return 'توضیحاتی تنظیم نشده است.'
  end
  local about = data[tostring(msg.to.id)][data_cat]
  local about = string.gsub(msg.to.print_name, "_", " ")..':\n\n'..about
  return 'درباره ی گروه : '..about
end
local function lock_group_arabic(msg, data, target)
  if not is_momod(msg) then
    return 
  end
  local group_arabic_lock = data[tostring(target)]['settings']['lock_arabic']
  if group_arabic_lock == 'yes' then
    return 'عربی همچنان قفل است'
  else
    data[tostring(target)]['settings']['lock_arabic'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'عربی قفل شد'
  end
end

local function unlock_group_arabic(msg, data, target)
  if not is_momod(msg) then
    return 
  end
  local group_arabic_lock = data[tostring(target)]['settings']['lock_arabic']
  if group_arabic_lock == 'no' then
    return 'عربی قفل نبود'
  else
    data[tostring(target)]['settings']['lock_arabic'] = 'no'
    save_data(_config.moderation.data, data)
    return 'عربی از حالت قفل آزاد شد'
  end
end

local function lock_group_bots(msg, data, target)
  if not is_momod(msg) then
    return 
  end
  local group_bots_lock = data[tostring(target)]['settings']['lock_bots']
  if group_bots_lock == 'yes' then
    return 'محافظت در برابر ربات همچنان فعال است'
  else
    data[tostring(target)]['settings']['lock_bots'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'محافظت در برابر ربات فعال شد'
  end
end

local function unlock_group_bots(msg, data, target)
  if not is_momod(msg) then
    return 
  end
  local group_bots_lock = data[tostring(target)]['settings']['lock_bots']
  if group_bots_lock == 'no' then
    return 'محافظت در برابر ربات همچنان غیر فعال است'
  else
    data[tostring(target)]['settings']['lock_bots'] = 'no'
    save_data(_config.moderation.data, data)
    return 'محافظت در برابر ربات غیر فعال شد'
  end
end

local function lock_group_namemod(msg, data, target)
  if not is_momod(msg) then
    return 
  end
  local group_name_set = data[tostring(target)]['settings']['set_name']
  local group_name_lock = data[tostring(target)]['settings']['lock_name']
  if group_name_lock == 'yes' then
    return 'اسم گروه همچنان قفل است'
  else
    data[tostring(target)]['settings']['lock_name'] = 'yes'
    save_data(_config.moderation.data, data)
    rename_chat('chat#id'..target, group_name_set, ok_cb, false)
    return 'اسم گروه قفل شد'
  end
end
local function unlock_group_namemod(msg, data, target)
  if not is_momod(msg) then
    return 
  end
  local group_name_set = data[tostring(target)]['settings']['set_name']
  local group_name_lock = data[tostring(target)]['settings']['lock_name']
  if group_name_lock == 'no' then
    return 'اسم گروه قفل نبود'
  else
    data[tostring(target)]['settings']['lock_name'] = 'no'
    save_data(_config.moderation.data, data)
    return 'اسم گروه از حالت قفل آزاد شد'
  end
end
local function lock_group_floodmod(msg, data, target)
  if not is_momod(msg) then
    return 
  end
  local group_flood_lock = data[tostring(target)]['settings']['flood']
  if group_flood_lock == 'yes' then
    return 'اسپم در گروه همچنان قفل است'
  else
    data[tostring(target)]['settings']['flood'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'اسپم در گروه  قفل شد'
  end
end

local function unlock_group_floodmod(msg, data, target)
  if not is_momod(msg) then
	return 
  end
  if not is_owner(msg) then
    return "فقط صاحب گروه قادر به باز کردن قفل اسپم هست"
  end
  local group_flood_lock = data[tostring(target)]['settings']['flood']
  if group_flood_lock == 'no' then
    return 'اسپم در گروه همچنان قفل نیست'
  else
    data[tostring(target)]['settings']['flood'] = 'no'
    save_data(_config.moderation.data, data)
    return 'اسپم در گروه از حالت قفل آزاد شد'
  end
end

local function lock_group_membermod(msg, data, target)
  if not is_momod(msg) then
    return 
  end
  local group_member_lock = data[tostring(target)]['settings']['lock_member']
  if group_member_lock == 'yes' then
    return 'ورود اعضا به گروه همچنان قفل است'
  else
    data[tostring(target)]['settings']['lock_member'] = 'yes'
    save_data(_config.moderation.data, data)
  end
  return 'ورود اعضا به گروه قفل شد'
end

local function unlock_group_membermod(msg, data, target)
  if not is_momod(msg) then
    return 
  end
  local group_member_lock = data[tostring(target)]['settings']['lock_member']
  if group_member_lock == 'no' then
    return 'ورود اعضا به گروه همچنان قفل نیست'
  else
    data[tostring(target)]['settings']['lock_member'] = 'no'
    save_data(_config.moderation.data, data)
    return 'ورود اعضا به گروه از حالت قفل آزاد شد'
  end
end


local function set_public_membermod(msg, data, target)
  if not is_momod(msg) then
    return 
  end
  local group_member_lock = data[tostring(target)]['settings']['public']
  local long_id = data[tostring(target)]['long_id']
  if not long_id then
	data[tostring(target)]['long_id'] = msg.to.peer_id 
	save_data(_config.moderation.data, data)
  end
  if group_member_lock == 'yes' then
    return 'گروه همچنان در اشتراک عموم است'
  else
    data[tostring(target)]['settings']['public'] = 'yes'
    save_data(_config.moderation.data, data)
  end
  return 'گروه به اشتراک عموم درآمد'
end

local function unset_public_membermod(msg, data, target)
  if not is_momod(msg) then
    return 
  end
  local group_member_lock = data[tostring(target)]['settings']['public']
  local long_id = data[tostring(target)]['long_id']
  if not long_id then
	data[tostring(target)]['long_id'] = msg.to.peer_id 
	save_data(_config.moderation.data, data)
  end
  if group_member_lock == 'no' then
    return 'گروه در اشتراک عموم نیست'
  else
    data[tostring(target)]['settings']['public'] = 'no'
    save_data(_config.moderation.data, data)
    return 'گروه از این پس در اشتراک عموم نخواهد بود'
  end
end

local function lock_group_leave(msg, data, target)
  if not is_momod(msg) then
    return 
  end
  local leave_ban = data[tostring(target)]['settings']['leave_ban']
  if leave_ban == 'yes' then
    return 'افراد خارج شده بن خواهند شد'
  else
    data[tostring(target)]['settings']['leave_ban'] = 'yes'
    save_data(_config.moderation.data, data)
  end
  return 'افراد خارج شده بن خواهند شد'
end

local function unlock_group_leave(msg, data, target)
  if not is_momod(msg) then
    return 
  end
  local leave_ban = data[tostring(msg.to.id)]['settings']['leave_ban']
  if leave_ban == 'no' then
    return 'افراد خارج شده بن نخواهند شد'
  else
    data[tostring(target)]['settings']['leave_ban'] = 'no'
    save_data(_config.moderation.data, data)
    return 'افراد خارج شده بن نخواهند شد'
  end
end

local function unlock_group_photomod(msg, data, target)
  if not is_momod(msg) then
    return 
  end
  local group_photo_lock = data[tostring(target)]['settings']['lock_photo']
  if group_photo_lock == 'no' then
    return 'عکس گروه همچنان قفل نیست'
  else
    data[tostring(target)]['settings']['lock_photo'] = 'no'
    save_data(_config.moderation.data, data)
    return 'عکس گروه از حالت قفل آزاد شد'
  end
end

local function lock_group_links(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_link_lock = data[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'yes' then
    return 'اشتراک لینک همچنان قفل است'
  else
    data[tostring(target)]['settings']['lock_link'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'اشتراک لینک قفل شد'
  end
end

local function unlock_group_links(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_link_lock = data[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'no' then
    return 'اشتراک لینک is قفل تیست'
  else
    data[tostring(target)]['settings']['lock_link'] = 'no'
    save_data(_config.moderation.data, data)
    return 'اشتراک لینک از حالت قفل آزاد شد'
  end
end

local function lock_group_rtl(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_rtl_lock = data[tostring(target)]['settings']['lock_rtl']
  if group_rtl_lock == 'yes' then
    return 'اسم برعکس همچنان قفل است'
  else
    data[tostring(target)]['settings']['lock_rtl'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'اسم برعکس قفل شد'
  end
end

local function unlock_group_rtl(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_rtl_lock = data[tostring(target)]['settings']['lock_rtl']
  if group_rtl_lock == 'no' then
    return 'اسم برعکس قفل نبود'
  else
    data[tostring(target)]['settings']['lock_rtl'] = 'no'
    save_data(_config.moderation.data, data)
    return 'اسم برعکس از حالت قفل آزاد شد'
  end
end

local function lock_group_sticker(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_sticker_lock = data[tostring(target)]['settings']['lock_sticker']
  if group_sticker_lock == 'yes' then
    return 'ارسال استیکر همچنان قفل است'
  else
    data[tostring(target)]['settings']['lock_sticker'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'ارسال استیکر قفل شد'
  end
end

local function unlock_group_sticker(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_sticker_lock = data[tostring(target)]['settings']['lock_sticker']
  if group_sticker_lock == 'no' then
    return 'ارسال استیکر قفل نبود'
  else
    data[tostring(target)]['settings']['lock_sticker'] = 'no'
    save_data(_config.moderation.data, data)
    return 'ارسال استیکر از حالت قفل آزاد شد'
  end
end

local function lock_group_contacts(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_rtl_lock = data[tostring(target)]['settings']['lock_contacts']
  if group_contacts_lock == 'yes' then
    return 'اشتراک مخاطب همچنان قفل است'
  else
    data[tostring(target)]['settings']['lock_contacts'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'اشتراک مخاطب قفل شد'
  end
end

local function unlock_group_contacts(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_contacts_lock = data[tostring(target)]['settings']['lock_contacts']
  if group_contacts_lock == 'no' then
    return 'اشتراک مخاطب قفل نبود'
  else
    data[tostring(target)]['settings']['lock_contacts'] = 'no'
    save_data(_config.moderation.data, data)
    return 'اشتراک مخاطب از حالت قفل آزاد شد'
  end
end

local function enable_strict_rules(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_rtl_lock = data[tostring(target)]['settings']['strict']
  if strict == 'yes' then
    return 'افرادی که خلاف تنظیمات و قوانین عمل کنند حذف خواهند شد'
  else
    data[tostring(target)]['settings']['strict'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'افرادی که خلاف تنظیمات و قوانین عمل کنند حذف خواهند شد'
  end
end

local function disable_strict_rules(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_contacts_lock = data[tostring(target)]['settings']['strict']
  if strict == 'no' then
    return 'افراد در صورت اعمال خلاف قوانین حذف نخواهند شد .'
  else
    data[tostring(target)]['settings']['strict'] = 'no'
    save_data(_config.moderation.data, data)
    return 'تنظیمات و قوانین سخت گیری نخواهد شد و اعضا در صورت اعمال عملی خلاف آنها حذف نخواهند شد'
  end
end

local function set_rulesmod(msg, data, target)
  if not is_momod(msg) then
    return "فقط برای مدیران !"
  end
  local data_cat = 'rules'
  data[tostring(target)][data_cat] = rules
  save_data(_config.moderation.data, data)
  return 'قوانین گروه تنظیم شد به:\n\n'..rules
end
local function modadd(msg)
  -- superuser and admins only (because sudo are always has privilege)
   if not is_momod(msg) then
	return
  end
  if not is_admin1(msg) then
    return "شما ادمین نیستید"
  end
  local data = load_data(_config.moderation.data)
  if is_group(msg) then
    return 'گروه از قبل اضافه شده است.'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_modadd,{receiver=receiver, data=data, msg = msg})
end
local function realmadd(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_momod(msg) then
	return
  end
  if not is_admin1(msg) then
    return "شما ادمین نیستید"
  end
  local data = load_data(_config.moderation.data)
  if is_realm(msg) then
    return 'ریلم از قبل ادد شده است.'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_realm_add,{receiver=receiver, data=data, msg = msg})
end
-- Global functions
function modrem(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_admin1(msg) then
    return "شما ادمین نیستید"
  end
  local data = load_data(_config.moderation.data)
  if not is_group(msg) then
    return 'گروه اضافه نشده است.'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_modrem,{receiver=receiver, data=data, msg = msg})
end

function realmrem(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_admin1(msg) then
    return "شما ادمین نیستید"
  end
  local data = load_data(_config.moderation.data)
  if not is_realm(msg) then
    return 'ریلم اضافه نشده است.'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_realmrem,{receiver=receiver, data=data, msg = msg})
end
local function get_rules(msg, data)
  local data_cat = 'rules'
  if not data[tostring(msg.to.id)][data_cat] then
    return 'هیچ قانونی تنظیم نشده است'
  end
  local rules = data[tostring(msg.to.id)][data_cat]
  local rules = 'قوانین گروه:\n\n'..rules
  return rules
end

local function set_group_photo(msg, success, result)
  local data = load_data(_config.moderation.data)
  local receiver = get_receiver(msg)
  if success then
    local file = 'system/photos/chat_photo_'..msg.to.id..'.jpg'
    print('File downloaded to:', result)
    os.rename(result, file)
    print('File moved to:', file)
    chat_set_photo (receiver, file, ok_cb, false)
    data[tostring(msg.to.id)]['settings']['set_photo'] = file
    save_data(_config.moderation.data, data)
    data[tostring(msg.to.id)]['settings']['lock_photo'] = 'yes'
    save_data(_config.moderation.data, data)
    send_large_msg(receiver, 'عکس ثبت شد', ok_cb, false)
  else
    print('مشکل دانلود: '..msg.id)
    send_large_msg(receiver, 'اتصال برقرار نشد . لطفا دوباره امتحان کنید!', ok_cb, false)
  end
end

local function promote(receiver, member_username, member_id)
  local data = load_data(_config.moderation.data)
  local group = string.gsub(receiver, 'chat#id', '')
  if not data[group] then
    return send_large_msg(receiver, 'گروه اضافه نشده است.')
  end
  if data[group]['moderators'][tostring(member_id)] then
    return send_large_msg(receiver, member_username..' همچنان مدیر است.')
  end
  data[group]['moderators'][tostring(member_id)] = member_username
  save_data(_config.moderation.data, data)
  return send_large_msg(receiver, member_username..' ارتقا یافت.')
end

local function promote_by_reply(extra, success, result)
    local msg = result
    local full_name = (msg.from.first_name or '')..' '..(msg.from.last_name or '')
    if msg.from.username then
      member_username = '@'.. msg.from.username
    else
      member_username = full_name
    end
    local member_id = msg.from.peer_id
    if msg.to.peer_type == 'chat' then
      return promote(get_receiver(msg), member_username, member_id)
    end
end

local function demote(receiver, member_username, member_id)
  local data = load_data(_config.moderation.data)
  local group = string.gsub(receiver, 'chat#id', '')
  if not data[group] then
    return send_large_msg(receiver, 'گروه اضافه نشده است.')
  end
  if not data[group]['moderators'][tostring(member_id)] then
    return send_large_msg(receiver, member_username..' مدیر نیست.')
  end
  data[group]['moderators'][tostring(member_id)] = nil
  save_data(_config.moderation.data, data)
  return send_large_msg(receiver, member_username..'   از مدیریت حذف شد.')
end

local function demote_by_reply(extra, success, result)
    local msg = result
    local full_name = (msg.from.first_name or '')..' '..(msg.from.last_name or '')
    if msg.from.username then
      member_username = '@'..msg.from.username
    else
      member_username = full_name
    end
    local member_id = msg.from.peer_id
    if msg.to.peer_type == 'chat' then
      return demote(get_receiver(msg), member_username, member_id)
    end
end

local function setowner_by_reply(extra, success, result)
  local msg = result
  local receiver = get_receiver(msg)
  local data = load_data(_config.moderation.data)
  local name_log = msg.from.print_name:gsub("_", " ")
  data[tostring(msg.to.id)]['set_owner'] = tostring(msg.from.id)
      save_data(_config.moderation.data, data)
      local text = msg.from.print_name:gsub("_", " ").." از الان صاحب گروه است"
      return send_large_msg(receiver, text)
end

local function promote_demote_res(extra, success, result)
--vardump(result)
--vardump(extra)
      local member_id = result.peer_id
      local member_username = "@"..result.username
      local chat_id = extra.chat_id
      local mod_cmd = extra.mod_cmd
      local receiver = "chat#id"..chat_id
      if mod_cmd == 'promote' then
        return promote(receiver, member_username, member_id)
      elseif mod_cmd == 'demote' then
        return demote(receiver, member_username, member_id)
      end
end

local function mute_user_callback(extra, success, result)
	if result.service then
		local action = result.action.type
		if action == 'chat_add_user' or action == 'chat_del_user' or action == 'chat_rename' or action == 'chat_change_photo' then
			if result.action.user then
				user_id = result.action.user.peer_id
			end
		end
	else
		user_id = result.from.peer_id
	end
	local receiver = extra.receiver
	local chat_id = string.gsub(receiver, 'channel#id', '')
	if is_muted_user(chat_id, user_id) then
		mute_user(chat_id, user_id)
		send_large_msg(receiver, "["..user_id.."] از لیست افراد ساکت شده حذف شد")
	else
		unmute_user(chat_id, user_id)
		send_large_msg(receiver, " ["..user_id.."] به لیست افراد ساکت شده اضافه شد")
	end
end

local function modlist(msg)
  local data = load_data(_config.moderation.data)
  local groups = "groups"
  if not data[tostring(groups)][tostring(msg.to.id)] then
    return 'گروه اضافه نشده است.'
  end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['moderators']) == nil then --fix way
    return 'هیچ مدیری در این گروه تعیین نشده است.'
  end
  local i = 1
  local message = '\nلیست مدیران برای گروه ' .. string.gsub(msg.to.print_name, '_', ' ') .. ':\n'
  for k,v in pairs(data[tostring(msg.to.id)]['moderators']) do
    message = message ..i..' - '..v..' [' ..k.. '] \n'
    i = i + 1
  end
  return message
end

local function callbackres(extra, success, result)
  local user = result.peer_id
  local name = string.gsub(result.print_name, "_", " ")
  local chat = 'chat#id'..extra.chatid
  send_large_msg(chat, user..'\n'..name)
  return user
end

local function callback_mute_res(extra, success, result)
	local user_id = result.peer_id
	local receiver = extra.receiver
	local chat_id = string.gsub(receiver, 'chat#id', '')
	if is_muted_user(chat_id, user_id) then
		unmute_user(chat_id, user_id)
		send_large_msg(receiver, " ["..user_id.."] از لیست اعضای ساکت شده حذف شد")
	else
		mute_user(chat_id, user_id)
		send_large_msg(receiver, " ["..user_id.."] به لیست اعضای ساکت شده اضافه شد")
	end
end

local function help()
  local help_text = tostring(_config.help_text)
  return help_text
end

local function cleanmember(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local chat_id = "chat#id"..result.id
  local chatname = result.print_name
  for k,v in pairs(result.members) do
    kick_user(v.id, result.peer_id)
  end
end

local function killchat(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local chat_id = "chat#id"..result.id
  local chatname = result.print_name
  for k,v in pairs(result.members) do
    kick_user_any(v.id, result.peer_id)
  end
end

local function killrealm(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local chat_id = "chat#id"..result.id
  local chatname = result.print_name
  for k,v in pairs(result.members) do
    kick_user_any(v.id, result.peer_id)
  end
end

--[[local function user_msgs(user_id, chat_id)
  local user_info
  local uhash = 'user:'..user_id
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..user_id..':'..chat_id
  user_info = tonumber(redis:get(um_hash) or 0)
  return user_info
end

local function kick_zero(cb_extra, success, result)
    local chat_id = cb_extra.chat_id
    local chat = "chat#id"..chat_id
    local ci_user
    local re_user
    for k,v in pairs(result.members) do
        local si = false
        ci_user = v.peer_id
        local hash = 'chat:'..chat_id..':users'
        local users = redis:smembers(hash)
        for i = 1, #users do
            re_user = users[i]
            if tonumber(ci_user) == tonumber(re_user) then
                si = true
            end
        end
        if not si then
            if ci_user ~= our_id then
                if not is_momod2(ci_user, chat_id) then
                  chat_del_user(chat, 'user#id'..ci_user, ok_cb, true)
                end
            end
        end
    end
end

local function kick_inactive(chat_id, num, receiver)
    local hash = 'chat:'..chat_id..':users'
    local users = redis:smembers(hash)
    -- Get user info
    for i = 1, #users do
        local user_id = users[i]
        local user_info = user_msgs(user_id, chat_id)
        local nmsg = user_info
        if tonumber(nmsg) < tonumber(num) then
            if not is_momod2(user_id, chat_id) then
              chat_del_user('chat#id'..chat_id, 'user#id'..user_id, ok_cb, true)
            end
        end
    end
    return chat_info(receiver, kick_zero, {chat_id = chat_id})
end]]

local function run(msg, matches)
  local data = load_data(_config.moderation.data)
  local receiver = get_receiver(msg)
   local name_log = user_print_name(msg.from)
  local group = msg.to.id
  if msg.media then
    if msg.media.type == 'photo' and data[tostring(msg.to.id)] and data[tostring(msg.to.id)]['settings']['set_photo'] == 'waiting' and is_chat_msg(msg) and is_momod(msg) then
      load_photo(msg.id, set_group_photo, msg)
    end
  end
if msg.to.type == 'chat' then
  if is_admin1(msg) or not is_support(msg.from.id) then-- Admin only
	  if matches[1] == 'add' and not matches[2] then
		if not is_admin1(msg) and not is_support(msg.from.id) then-- Admin only
			return
		end
		if is_realm(msg) then
		   return 'خطا : اینجا ریلم است.'
		end
		print("گروهه "..msg.to.print_name.."("..msg.to.id..") اضافه شد")
		return modadd(msg)
	  end
	   if matches[1] == 'add' and matches[2] == 'realm' then
		if not is_sudo(msg) then-- Admin only
			return
		end
		if is_group(msg) then
		   return 'خطا : اینجا به عنوان گروه اضافه شده است.'
		end
		print("گروهه "..msg.to.print_name.."("..msg.to.id..") به عنوان ریلم اضافه شد")
		return realmadd(msg)
	  end
	  if matches[1] == 'rem' and not matches[2] then
		if not is_sudo(msg) and not is_support(msg.from.id) then-- Admin only
			return
		end
		if not is_group(msg) then
		   return 'خطا : اینجا گروه نیست.'
		end
		print("گروهه "..msg.to.print_name.."("..msg.to.id..") حذف شد")
		return modrem(msg)
	  end
	  if matches[1] == 'rem' and matches[2] == 'realm' then
		if not is_admin1(msg) then-- Sudo only
			return
		end
		if not is_realm(msg) then
		   return 'خطا : اینجا ریلم نیست.'
		end
		print("گروهه "..msg.to.print_name.."("..msg.to.id..") removed as a realm")
		return realmrem(msg)
	  end
	end
  if matches[1] == 'chat_created' and msg.from.id == 0 and group_type == "group" then
    return automodadd(msg)
  end
 --[[Experimental
  if matches[1] == 'chat_created' and msg.from.id == 0 and group_type == "super_group" then
	local chat_id = get_receiver(msg)
	users = {[1]="user#id211776033"}
		for k,v in pairs(users) do
			chat_add_user(chat_id, v, ok_cb, false)
		end
	--chat_upgrade(chat_id, ok_cb, false)
  end ]]
  if matches[1] == 'chat_created' and msg.from.id == 0 and group_type == "realm" then
    return autorealmadd(msg)
  end
  if msg.to.id and data[tostring(msg.to.id)] then
    local settings = data[tostring(msg.to.id)]['settings']
    if matches[1] == 'chat_add_user' then
      if not msg.service then
        return
      end
      local group_member_lock = settings.lock_member
      local user = 'user#id'..msg.action.user.id
      local chat = 'chat#id'..msg.to.id
      if group_member_lock == 'yes' and not is_owner2(msg.action.user.id, msg.to.id) then
        chat_del_user(chat, user, ok_cb, true)
      elseif group_member_lock == 'yes' and tonumber(msg.from.id) == tonumber(our_id) then
        return nil
      elseif group_member_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'chat_del_user' then
      if not msg.service then
         -- return "Are you trying to troll me?"
      end
      local user = 'user#id'..msg.action.user.id
      local chat = 'chat#id'..msg.to.id
    end
    if matches[1] == 'chat_delete_photo' then
      if not msg.service then
        return
      end
      local group_photo_lock = settings.lock_photo
      if group_photo_lock == 'yes' then
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        redis:incr(picturehash)
        ---
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        local picprotectionredis = redis:get(picturehash)
        if picprotectionredis then
          if tonumber(picprotectionredis) == 4 and not is_owner(msg) then
            kick_user(msg.from.id, msg.to.id)
          end
          if tonumber(picprotectionredis) ==  8 and not is_owner(msg) then
            ban_user(msg.from.id, msg.to.id)
            local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
            redis:set(picturehash, 0)
          end
        end

        chat_set_photo(receiver, settings.set_photo, ok_cb, false)
      elseif group_photo_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'chat_change_photo' and msg.from.id ~= 0 then
      if not msg.service then
        return
      end
      local group_photo_lock = settings.lock_photo
      if group_photo_lock == 'yes' then
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        redis:incr(picturehash)
        ---
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        local picprotectionredis = redis:get(picturehash)
        if picprotectionredis then
          if tonumber(picprotectionredis) == 4 and not is_owner(msg) then
            kick_user(msg.from.id, msg.to.id)
          end
          if tonumber(picprotectionredis) ==  8 and not is_owner(msg) then
            ban_user(msg.from.id, msg.to.id)
          local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
          redis:set(picturehash, 0)
          end
        end

        chat_set_photo(receiver, settings.set_photo, ok_cb, false)
      elseif group_photo_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'chat_rename' then
      if not msg.service then
        return
      end
      local group_name_set = settings.set_name
      local group_name_lock = settings.lock_name
      local to_rename = 'chat#id'..msg.to.id
      if group_name_lock == 'yes' then
        if group_name_set ~= tostring(msg.to.print_name) then
          local namehash = 'name:changed:'..msg.to.id..':'..msg.from.id
          redis:incr(namehash)
          local namehash = 'name:changed:'..msg.to.id..':'..msg.from.id
          local nameprotectionredis = redis:get(namehash)
          if nameprotectionredis then
            if tonumber(nameprotectionredis) == 4 and not is_owner(msg) then
              kick_user(msg.from.id, msg.to.id)
            end
            if tonumber(nameprotectionredis) ==  8 and not is_owner(msg) then
              ban_user(msg.from.id, msg.to.id)
              local namehash = 'name:changed:'..msg.to.id..':'..msg.from.id
              redis:set(namehash, 0)
            end
          end
          rename_chat(to_rename, group_name_set, ok_cb, false)
        end
      elseif group_name_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'setname' and is_momod(msg) then
      local new_name = string.gsub(matches[2], '_', ' ')
      data[tostring(msg.to.id)]['settings']['set_name'] = new_name
      save_data(_config.moderation.data, data)
      local group_name_set = data[tostring(msg.to.id)]['settings']['set_name']
      local to_rename = 'chat#id'..msg.to.id
      rename_chat(to_rename, group_name_set, ok_cb, false)

    end
    if matches[1] == 'setphoto' and is_momod(msg) then
      data[tostring(msg.to.id)]['settings']['set_photo'] = 'waiting'
      save_data(_config.moderation.data, data)
      return 'لطفا عکسی که میخواهید به عنوان عکس گروه تنظیم شود را ارسال کنید'
    end
    if matches[1] == 'promote' and not matches[2] then
	   if not is_momod(msg) then
        return
      end
      if not is_owner(msg) then
        return "فقط صاحب گروه قادر به ارتقای اعضا به عنوان مدیر هست"
      end
      if type(msg.reply_id)~="nil" then
          msgr = get_message(msg.reply_id, promote_by_reply, false)
      end
    end
    if matches[1] == 'promote' and matches[2] then
      if not is_momod(msg) then
        return
      end
      if not is_owner(msg) then
        return "فقط صاحب گروه قادر به ارتقای اعضا به مدیری است"
      end
	local member = matches[2]
	local cbres_extra = {
		chat_id = msg.to.id,
        mod_cmd = 'promote',
		from_id = msg.from.id
	}
	local username = matches[2]
	local username = string.gsub(matches[2], '@', '')
	return resolve_username(username, promote_demote_res, cbres_extra)
    end
    if matches[1] == 'demote' and not matches[2] then
	  if not is_momod(msg) then
        return
      end
      if not is_owner(msg) then
        return "فقط صاحب گروه قادر به تنزل مدیران است"
      end
      if type(msg.reply_id)~="nil" then
          msgr = get_message(msg.reply_id, demote_by_reply, false)
      end
    end
    if matches[1] == 'demote' and matches[2] then
      if not is_momod(msg) then
        return
      end
      if not is_owner(msg) then
        return "فقط صاحب گروه قادر به تنزل مدیران است"
      end
      if string.gsub(matches[2], "@", "") == msg.from.username and not is_owner(msg) then
        return "شما قادر به تنزل خود نیستید"
      end
	local member = matches[2]
	local cbres_extra = {
	chat_id = msg.to.id,
        mod_cmd = 'demote',
	from_id = msg.from.id
	}
	local username = matches[2]
	local username = string.gsub(matches[2], '@', '')
	return resolve_username(username, promote_demote_res, cbres_extra)
    end
    if matches[1] == 'modlist' then
      return modlist(msg)
    end
    if matches[1] == 'about' then
      return get_description(msg, data)
    end
    if matches[1] == 'rules' then
      return get_rules(msg, data)
    end
    if matches[1] == 'set' then
      if matches[2] == 'rules' then
        rules = matches[3]
        local target = msg.to.id
        return set_rulesmod(msg, data, target)
      end
      if matches[2] == 'about' then
        local data = load_data(_config.moderation.data)
        local target = msg.to.id
        local about = matches[3]
        return set_descriptionmod(msg, data, target, about)
      end
    end
end
--Begin chat settings
    if matches[1] == 'lock' then
      local target = msg.to.id
		if matches[2] == 'name' then
			return lock_group_namemod(msg, data, target)
		end
		if matches[2] == 'join' then
			return lock_group_membermod(msg, data, target)
		end
		if matches[2] == 'spam' then
			return lock_group_floodmod(msg, data, target)
		end
		if matches[2] == 'arabic' then
			return lock_group_arabic(msg, data, target)
		end
		if matches[2] == 'bot' then
			return lock_group_bots(msg, data, target)
		end
		if matches[2] == 'leave' then
			return lock_group_leave(msg, data, target)
		end
		if matches[2] == 'links' then
			return lock_group_links(msg, data, target)
		end
		if matches[2]:lower() == 'rtl' then
			return lock_group_rtl(msg, data, target)
		end
		if matches[2] == 'sticker' then
			return lock_group_sticker(msg, data, target)
		end
		if matches[2] == 'contacts' then
			return lock_group_contacts(msg, data, target)
		end
	end
    if matches[1] == 'unlock' then
		local target = msg.to.id
		if matches[2] == 'name' then
			return unlock_group_namemod(msg, data, target)
		end
		if matches[2] == 'join' then
			return unlock_group_membermod(msg, data, target)
		end
		if matches[2] == 'photo' then
			return unlock_group_photomod(msg, data, target)
		end
		if matches[2] == 'spam' then
			return unlock_group_floodmod(msg, data, target)
		end
		if matches[2] == 'arabic' then
			return unlock_group_arabic(msg, data, target)
		end
		if matches[2] == 'bot' then
			return unlock_group_bots(msg, data, target)
		end
		if matches[2] == 'leave' then
			return unlock_group_leave(msg, data, target)
		end
		if matches[2] == 'links' then
			return unlock_group_links(msg, data, target)
		end
		if matches[2]:lower() == 'rtl' then
			return unlock_group_rtl(msg, data, target)
		end
		if matches[2] == 'sticker' then
			return unlock_group_sticker(msg, data, target)
		end
		if matches[2] == 'contacts' then
			return unlock_group_contacts(msg, data, target)
		end
	end
	--End chat settings
	
  --Begin Chat mutes
  if matches[1] == 'mute' and is_owner(msg) then
			local chat_id = msg.to.id
			if matches[2] == 'audio' then
			local msg_type = 'Audio'
				if not is_muted(chat_id, msg_type..': yes') then
					mute(chat_id, msg_type)
					return " پیام های شامل "..matches[2].." حذف خواهند شد"
				else
					return "حذف پیام های شامل "..matches[2].." همچنان فعال است"
				end
			end
			if matches[2] == 'photo' then
			local msg_type = 'Photo'
				if not is_muted(chat_id, msg_type..': yes') then
					mute(chat_id, msg_type)
					return "پیام های شامل "..matches[2].." حذف خواهند شد"
				else
					return "حذف پیام های شامل "..matches[2].." همچنان فعال است"
				end
			end
			if matches[2] == 'video' then
			local msg_type = 'Video'
				if not is_muted(chat_id, msg_type..': yes') then
					mute(chat_id, msg_type)
					return "پیام های شامل "..matches[2].." حذف خواهند شد"
				else
					return "حذف پیام های شامل "..matches[2].." همچنان فعال است"
				end
			end
			if matches[2] == 'gifs' then
			local msg_type = 'Gifs'
				if not is_muted(chat_id, msg_type..': yes') then
					mute(chat_id, msg_type)
					return msg_type.." این پیام ها حذف خواهند شد"
				else
					return "حذف پیام های شامل "..msg_type.." همچنان فعال است"
				end
			end
			if matches[2] == 'documents' then
			local msg_type = 'Documents'
				if not is_muted(chat_id, msg_type..': yes') then
					mute(chat_id, msg_type)
					return msg_type.." این پیام ها حذف خواهند شد"
				else
					return "حذف پیام های شامل "..msg_type.." همچنان فعال است"
				end
			end
			if matches[2] == 'text' then
			local msg_type = 'Text'
				if not is_muted(chat_id, msg_type..': yes') then
					mute(chat_id, msg_type)
					return "پیام های متنی حذف خواهند شد"
				else
					return "حذف پیام های متنی همچنان فعال است"
				end
			end
			if matches[2] == 'all' then
			local msg_type = 'All'
				if not is_muted(chat_id, msg_type..': yes') then
					mute(chat_id, msg_type)
					return "حذف پیام های شامل "..msg_type.."  فعال شد"
				else
					return "حذف پیام های شامل "..msg_type.." همچنان فعال است"
				end
			end
		end
		if matches[1] == 'unmute' and is_owner(msg) then
			local chat_id = msg.to.id
			if matches[2] == 'audio' then
			local msg_type = 'Audio'
				if is_muted(chat_id, msg_type..': yes') then
					unmute(chat_id, msg_type)
					return "حذف پیام های شامل "..msg_type.." غیر فعال شد"
				else
					return "حذف پیام های  "..msg_type.." همچنان غیر فعال است"
				end
			end
			if matches[2] == 'photo' then
			local msg_type = 'Photo'
				if is_muted(chat_id, msg_type..': yes') then
					unmute(chat_id, msg_type)
					return "حذف پیام های شامل "..msg_type.." غیر فعال شد"
				else
					return "حذف پیام های شامل "..msg_type.." همچنان غیر فعال است"
				end
			end
			if matches[2] == 'video' then
			local msg_type = 'Video'
				if is_muted(chat_id, msg_type..': yes') then
					unmute(chat_id, msg_type)
					return "حذف پیام های شامل "..msg_type.." غیر فعال شد"
				else
					return "حذف پیام های شامل "..msg_type.." همچنان غیر فعال است"
				end
			end
			if matches[2] == 'gifs' then
			local msg_type = 'Gifs'
				if is_muted(chat_id, msg_type..': yes') then
					unmute(chat_id, msg_type)
					return msg_type.." دیگر حذف نمیشوند"
				else
					return "حذف پیام های شامل "..msg_type.." همچنان غیر فعال است"
				end
			end
			if matches[2] == 'documents' then
			local msg_type = 'Documents'
				if is_muted(chat_id, msg_type..': yes') then
					unmute(chat_id, msg_type)
					return msg_type.." دیگر حذف نمیشوند"
				else
					return "حذف پیام های شامل  "..msg_type.." همچنان غیر فعال است"
				end
			end
			if matches[2] == 'text' then
			local msg_type = 'Text'
				if is_muted(chat_id, msg_type..': yes') then
					unmute(chat_id, msg_type)
					return "حذف پیام های متنی غیر فعال شد"
				else
					return "حذف پیام های همچنان غیر فعال است"
				end
			end
			if matches[2] == 'all' then
			local msg_type = 'All'
				if is_muted(chat_id, msg_type..': yes') then
					unmute(chat_id, msg_type)
					return "حذف پیام های شامل  "..msg_type.." دیگر حذف نمیشوند"
				else
					return "حذف پیام های شامل  "..msg_type.." همچنان غیر فعال است"
				end
			end
		end

	--Begin chat muteuser
  --Begin chat muteuser
		if matches[1] == "muteuser" and is_momod(msg) then
		local chat_id = msg.to.id
		local hash = "mute_user"..chat_id
		local user_id = ""
			if type(msg.reply_id) ~= "nil" then
				local receiver = get_receiver(msg)
				local get_cmd = "mute_user"
				get_message(msg.reply_id, mute_user_callback, {receiver = receiver, get_cmd = get_cmd})
			elseif matches[1] == "muteuser" and string.match(matches[2], '^%d+$') then
				local user_id = matches[2]
				if is_muted_user(chat_id, user_id) then
					mute_user(chat_id, user_id)
					return "["..user_id.."] از لیست افراد ساکت شده حذف شد"
				else
					unmute_user(chat_id, user_id)
					return "["..user_id.."] به لیست افراد ساکت شده اضافه شد"
				end
			elseif matches[1] == "muteuser" and not string.match(matches[2], '^%d+$') then
				local receiver = get_receiver(msg)
				local get_cmd = "mute_user"
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				resolve_username(username, callback_mute_res, {receiver = receiver, get_cmd = get_cmd})
			end
		end

  --End Chat muteuser
  if matches[1] == "muteslist" and is_momod(msg) then
  local chat_id = msg.to.id
  if not has_mutes(chat_id) then
    set_mutes(chat_id)
    return mutes_list(chat_id)
  end
  return mutes_list(chat_id)
end
if matches[1] == "mutelist" and is_momod(msg) then
  local chat_id = msg.to.id
  return muted_user_list(chat_id)
end

  if matches[1] == 'settings' and is_momod(msg) then
    local target = msg.to.id
    return show_group_settingsmod(msg, target)
  end

  if matches[1] == 'public' and is_momod(msg) then
    local target = msg.to.id
    if matches[2] == 'yes' then
      return set_public_membermod(msg, data, target)
    end
    if matches[2] == 'no' then
      return unset_public_membermod(msg, data, target)
    end
  end

  
  if msg.to.type == 'chat' then
      if matches[1] == 'newlink' and not is_realm(msg) then
        if not is_momod(msg) then
          return "فقط مخصوص مدیران"
        end
        local function callback (extra , success, result)
          local receiver = 'chat#'..msg.to.id
          if success == 0 then
             return send_large_msg(receiver, 'خطایی رخ داده : درخواست لینک امکان پذیر نیست \n\n سازنده ی گروه ربات نیست')
          end
          send_large_msg(receiver, "لینک جدید ساخته شد")
          data[tostring(msg.to.id)]['settings']['set_link'] = result
          save_data(_config.moderation.data, data)
        end
        local receiver = 'chat#'..msg.to.id
        return export_chat_link(receiver, callback, true)
      end
      if matches[1] == 'link' then
        if not is_momod(msg) then
          return "فقط مخصوص مدیران"
        end
        local group_link = data[tostring(msg.to.id)]['settings']['set_link']
        if not group_link then
          return "ابتدا با دستور *لینک جدید* لینکی جدید بسازید"
        end
        return "لینک گروهه "..msg.to.id..":\n"..group_link
      end
      if matches[1] == 'setowner' and matches[2] then
        if not is_owner(msg) then
          return "فقط مخصوص صاحب گروه"
        end
        data[tostring(msg.to.id)]['set_owner'] = matches[2]
        save_data(_config.moderation.data, data)
        local text = matches[2].." اضافه کرد به عنوان صاحب گروه"
        return text
      end
      if matches[1] == 'setowner' and not matches[2] then
        if not is_owner(msg) then
          return "فقط مخصوص صاحب گروه"
        end
        if type(msg.reply_id)~="nil" then
            msgr = get_message(msg.reply_id, setowner_by_reply, false)
        end
      end
  end
  if matches[1] == 'owner' then
    local group_owner = data[tostring(msg.to.id)]['set_owner']
    if not group_owner then
      return "برای این گروه صاحبی تعیین نشده است . لطفا از پشتیبانی یا مدیران اصلی درخواست کنید"
    end
    return "صاحب گروه شخصه : ["..group_owner..']'
  end
  if matches[1] == 'setgpowner' then
    local receiver = "chat#id"..matches[2]
    if not is_admin1(msg) then
      return "مخصوص ادمین هاست"
    end
    data[tostring(matches[2])]['set_owner'] = matches[3]
    save_data(_config.moderation.data, data)
    local text = matches[3].." اضافه شد به عنوان صاحب گروه"
    send_large_msg(receiver, text)
    return
  end
  if matches[1] == 'setflood' then
    if not is_momod(msg) then
      return "فقط مخصوص مدیران"
    end
    if tonumber(matches[2]) < 5 or tonumber(matches[2]) > 20 then
      return "عدد امکان پذیر نیست . باید بین 5 تا 20 باشد"
    end
    local flood_max = matches[2]
    data[tostring(msg.to.id)]['settings']['flood_msg_max'] = flood_max
    save_data(_config.moderation.data, data)
    return 'حساسیت اسپم تنظیم شد روی  '..matches[2]
  end

if msg.to.type == 'chat' then
  if matches[1] == 'clear' then
    if not is_owner(msg) then
      return "فقط صاحب گروه قادر به پاک کردن هست"
    end
    if matches[2] == 'member' then
      if not is_owner(msg) then
        return "فقط ادمین های اصلی قادر به پاکسازی اعضای گروه هستند"
      end
      local receiver = get_receiver(msg)
      chat_info(receiver, cleanmember, {receiver=receiver})
    end
 end
    if matches[2] == 'modlist' then
      if next(data[tostring(msg.to.id)]['moderators']) == nil then --fix way
        return 'هیچ مدیری در این گروه وجود ندارد.'
      end
      local message = '\nلیست مدیران برای گروهه  ' .. string.gsub(msg.to.print_name, '_', ' ') .. ':\n'
      for k,v in pairs(data[tostring(msg.to.id)]['moderators']) do
        data[tostring(msg.to.id)]['moderators'][tostring(k)] = nil
        save_data(_config.moderation.data, data)
      end
    end
    if matches[2] == 'rules' then
      local data_cat = 'rules'
      data[tostring(msg.to.id)][data_cat] = nil
      save_data(_config.moderation.data, data)
    end
    if matches[2] == 'about' then
      local data_cat = 'description'
      data[tostring(msg.to.id)][data_cat] = nil
      save_data(_config.moderation.data, data)
    end
  end
if msg.to.type == 'chat' then
  if matches[1] == 'kill' and matches[2] == 'chat' then
    if not is_admin1(msg) then
        return nil
    end
    if not is_realm(msg) then
        local receiver = get_receiver(msg)
        return modrem(msg),
        print("درحال بستن گروه ..."),
        chat_info(receiver, killchat, {receiver=receiver})
    else
        return 'این یک ریلم هست'
    end
 end
  if matches[1] == 'kill' and matches[2] == 'realm' then
   if not is_admin1(msg) then
       return nil
   end
   if not is_group(msg) then
      local receiver = get_receiver(msg)
      return realmrem(msg),
      print("درحال بستن ریلم..."),
      chat_info(receiver, killrealm, {receiver=receiver})
   else
      return 'این یک گروه هست'
   end
 end
  if matches[1] == 'about' then
    local cbres_extra = {
      chatid = msg.to.id
    }
    local username = matches[2]
    local username = username:gsub("@","")
    resolve_username(username,  callbackres, cbres_extra)
  return
  end
  if matches[1] == 'kickinactive' then
    --send_large_msg('chat#id'..msg.to.id, 'I\'m in matches[1]')
    if not is_momod(msg) then
      return 'فقط یک مدیر قادر به اخراج غیر فعال ها است'
    end
    local num = 1
    if matches[2] then
        num = matches[2]
    end
    local chat_id = msg.to.id
    local receiver = get_receiver(msg)
    return kick_inactive(chat_id, num, receiver)
  end
 end
end
end

local function pre_process(msg)
if not msg.text and msg.media then
  msg.text = '['..msg.media.type..']'
end
return msg
end

return {
  patterns = {
  "^[!#/]([Aa]dd)$",
  "^[!#/]([Aa]dd) (realm)$",
  "^[!#/]([Rr]em)$",
  "^[!#/]([Rr]em) (realm)$",
  "^[!#/]([Rr]ules)$",
  "^[!#/]([Aa]bout)$",
  "^[!#/]([Ss]etname) (.*)$",
  "^[!#/]([Ss]setphoto)$",
  "^[!#/]([Pp]romote) (.*)$",
  "^[!#/]([Pp]romote)",
  "^[!#/]([Cc]lear) (.*)$",
  "^[!#/]([Kk]ill) (chat)$",
  "^[!#/]([Kk]ill) (realm)$",
  "^[!#/]([Dd]emote) (.*)$",
  "^[!#/]([Dd]emote)",
  "^[!#/]([Ss]et) ([^%s]+) (.*)$",
  "^[!#/]([Ll]ock) (.*)$",
  "^[!#/]([Ss]etowner) (%d+)$",
  "^[!#/]([Ss]etowner)",
  "^[!#/]([Oo]wner)$",
  "^[!#/]([Ss]etabout) (.*)$",
  "^[!#/]([Ss]etgpowner) (%d+) (%d+)$",-- (group id) (owner id)
  "^[!#/]([Uu]nlock) (.*)$",
  "^[!#/]([Ss]etflood) (%d+)$",
  "^[!#/]([Ss]ettings)$",
  "^[!#/]([Pp]ublic) (.*)$",
  "^[!#/]([Mm]odlist)$",
  "^[!#/]([Nn]ewlink)$",
  "^[!#/]([Ll]ink)$",
  "^[!#/]([Mm]ute) ([^%s]+)$",
  "^[!#/]([Uu]nmute) ([^%s]+)$",
  "^[!#/]([Mm]uteuser)$",
  "^[!#/]([Mm]uteuser) (.*)$",
  "^[!#/]([Mm]uteslist)$",
  "^[!#/]([Mm]utelist)$",
  "^[!#/](kickinactive)$",
  "^[!#/](kickinactive) (%d+)$",
  "%[(document)%]",
  "%[(photo)%]",
  "%[(video)%]",
  "%[(audio)%]",
  "^!!tgservice (.+)$",
  },
  run = run,
  pre_process = pre_process
}
end
