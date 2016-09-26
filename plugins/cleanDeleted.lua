﻿local function check_member_super_deleted(cb_extra, success, result)
local receiver = cb_extra.receiver
 local msg = cb_extra.msg
  local deleted = 0 
if success == 0 then
send_large_msg(receiver, "<b>➡ من ادمین گروه نیستم.</b>") 
end
for k,v in pairs(result) do
  if not v.first_name and not v.last_name then
deleted = deleted + 1
 kick_user(v.peer_id,msg.to.id)
 end
 end
 send_large_msg(receiver, deleted.." <b>اعضای دیلیت اکانت کرده از گروه پاک شدند!</b>") 
 end 
local function run(msg, matches)
if is_owner(msg) then
 local receiver = get_receiver(msg) 
channel_get_users(receiver, check_member_super_deleted,{receiver = receiver, msg = msg})
 end
 end
 return {
  description = "پاک کردن اعضای دیلیت اکانت کرده",
    Ernest = {
    	"Created by: @Ernest_Channel",
    },
       patterns = {
    "^[/#!]([Cc]lean deleted)$"
 },
run = run,
}