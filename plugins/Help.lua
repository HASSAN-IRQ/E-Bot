do
 function run(msg, matches)
if matches[1] == 'help' and is_momod2(msg) then
return [[ 
نمایش فارسی راهنمای ربات
#help fa
نمایش انگلیسی راهنمای ربات
#help en
➖➖➖➖➖➖➖➖
Show FA Help
#help fa
Show EN Help
#help en
➖➖➖➖➖➖➖➖
@Ernest_TG
]]
end
if matches[1] == 'help' and matches[2] == 'fa' and is_momod2(msg) then	
return [[ راهنمای دستورات
⚠️نمایش راهنمای گروه⚠️
#Ghelp fa
⚜نمایش دستورات قفل و بازکردن⚜
#lock fa
☄نمایش راهنمای موت و انموت کردن☄
#Mute fa
]]
end
if matches[1] == 'help' and matches[2] == 'en' and is_momod2(msg) then	
return [[ 🔆For See Help🔆
〰〰〰〰〰〰〰〰〰
〽️See Group Order〽️
#Ghelp en
〰〰〰〰〰〰〰〰〰
⚜Lock And Unlock Group Help
#lock en
〰〰〰〰〰〰〰〰〰
〽️Mute And Unmute Help〽️
#Mute en]]
end
if matches[1] == 'ghelp' and matches[2] == 'fa' and is_momod2(msg) then	
return [[ Order Group Help:⏬
#gpinfo
🔃نمایش اطلاعات گروه
➖➖➖➖➖➖➖➖➖
#kick
🔃پاک کردن شخص موردنظر
➖➖➖➖➖➖➖➖➖
#ban
🔃محروم کردن شخص موردنظر
➖➖➖➖➖➖➖➖➖ 
#settings
🔃نمایش تنظیمات گروه
➖➖➖➖➖➖➖➖➖
#rules
🔃نمایش قوانین گروه
➖➖➖➖➖➖➖➖➖
#rmsg [1-100]
🔃پاک کردن پیام های اخیر سوپرگروه
➖➖➖➖➖➖➖➖➖
#setrules متن
🔃قراردادن قوانین
➖➖➖➖➖➖➖➖➖
#setabout متن
🔃قرار دادن شرح برای گروه
➖➖➖➖➖➖➖➖➖
#newlink
🔃ساخت لینک جدید
➖➖➖➖➖➖➖➖➖
#link
🔃نمایش لینک گروه
➖➖➖➖➖➖➖➖➖
#setlink
🔃ست کردن لینک گروه(ربات سازنده گروه نباشد)
➖➖➖➖➖➖➖➖➖
#admins
🔃نمایش لیست ادمین های گروه
➖➖➖➖➖➖➖➖➖
#modlist
🔃نمایش کمک مدیران
➖➖➖➖➖➖➖➖➖
#id
🔃نمایش ایدی شما
➖➖➖➖➖➖➖➖➖
#setflood [3-30]
🔃قراردادن حساسیت ارسال پشت سرهم
➖➖➖➖➖➖➖➖➖
#filter کلمه
🔃فیلتر کردن کلمه
➖➖➖➖➖➖➖➖➖
#unfilter کلمه
🔃دراوردن کلمه از فیلتر
➖➖➖➖➖➖➖➖➖
#silent
🔃موت کردن یک کاربر
➖➖➖➖➖➖➖➖➖
#silent
🔃دراوردن کاربر موت شده
➖➖➖➖➖➖➖➖➖
#public [yes|no]
🔃عمومی و خصوصی کردن گروه
➖➖➖➖➖➖➖➖➖
#res @username
🔃گرفتن ایدی شخص موردنظر
➖➖➖➖➖➖➖➖➖
#log
🔃برگرداندن تاریخچه گروه
➖➖➖➖➖➖➖➖➖
#pmuser
🔃نمایش فعالان روز گروه
➖➖➖➖➖➖➖➖➖
#owner
🔃نمایش ایدی صاحب گروه
➖➖➖➖➖➖➖➖➖
#bots
🔃نمایش ربات های داخل گروه
➖➖➖➖➖➖➖➖➖
#promote
🔃کمک ادمین کردن یک شخص
➖➖➖➖➖➖➖➖➖
#demote 
🔃خارج کردن یک شخص ازکمک ادمینی
➖➖➖➖➖➖➖➖➖
#setname نام گروه
🔃تغییر دادن نام گروه
➖➖➖➖➖➖➖➖➖
#setphoto
🔃تغییر دادن عکس گروه
➖➖➖➖➖➖➖➖➖
#who
🔃گرفتن لیست اعضای گروه
]]
end	
if matches[1] == 'ghelp' and matches[2] == 'en' and is_momod2(msg) then	
return [[ 
⚠️Group Order Help:
〰〰〰〰〰〰〰〰〰〰〰〰
#gpinfo
⚠️Show SuperGroup Info
〰〰〰〰〰〰〰〰〰〰〰〰
#kick
CKick Intended User
〰〰〰〰〰〰〰〰〰〰〰〰
#rmsg [1-100]
⚠️delete a recent message Supergroup
〰〰〰〰〰〰〰〰〰〰〰〰
#ban
⚠️Ban Intended User 
〰〰〰〰〰〰〰〰〰〰〰〰
#settings
⚠️Show SuperGroup Setting
〰〰〰〰〰〰〰〰〰〰〰〰
#rules
⚠️Show SuperGroup Rules
〰〰〰〰〰〰〰〰〰〰〰〰
#setrules text
⚠️Set SuperGroup Rules
〰〰〰〰〰〰〰〰〰〰〰〰
#setabout text
⚠️Set SuperGroup About Text
〰〰〰〰〰〰〰〰〰〰〰〰
#newlink
⚠️Create NewLink
〰〰〰〰〰〰〰〰〰〰〰〰
#link
⚠️Show SuperGroup Link
〰〰〰〰〰〰〰〰〰〰〰〰
#setlink
⚠️Set SuperGroup Link
⚠️If Not Creator
〰〰〰〰〰〰〰〰〰〰〰〰
#admins
⚠️Show SuperGroup Admins
〰〰〰〰〰〰〰〰〰〰〰〰
#modlist
⚠️Show Moderestor
〰〰〰〰〰〰〰〰〰〰〰〰
#id
⚠️Show Id 
〰〰〰〰〰〰〰〰〰〰〰〰
#setflood [3-30]
⚠️Set SuperGroup Flooding
〰〰〰〰〰〰〰〰〰〰〰〰
#filter Word
⚠️Filter Word
〰〰〰〰〰〰〰〰〰〰〰〰
#unfilter Word
⚠️Unfilter Word
〰〰〰〰〰〰〰〰〰〰〰〰
#silent
⚠️Silent Intended User
〰〰〰〰〰〰〰〰〰〰〰〰
#silent
⚠️Unsilent Intended User
〰〰〰〰〰〰〰〰〰〰〰〰
#public [yes|no]
⚠️Go To Public SuperGroup
〰〰〰〰〰〰〰〰〰〰〰〰
#res @username
⚠️Get Id Of UserId
〰〰〰〰〰〰〰〰〰〰〰〰
#log
⚠️Return Log SuperGroup
〰〰〰〰〰〰〰〰〰〰〰〰
#pmuser
⚠️Show Today Active User
〰〰〰〰〰〰〰〰〰〰〰〰
#owner
⚠️Show Id Of Owner
〰〰〰〰〰〰〰〰〰〰〰〰
#bots
⚠️Show List Bots SuperGroup
〰〰〰〰〰〰〰〰〰〰〰〰
#promote
⚠️Promote User
〰〰〰〰〰〰〰〰〰〰〰〰
#demote 
⚠️Demote User
〰〰〰〰〰〰〰〰〰〰〰〰
#setname Name SuperGroup
⚠️Change SuperGroup Name
〰〰〰〰〰〰〰〰〰〰〰〰
#setphoto
⚠️Change SuperGroup Photo
〰〰〰〰〰〰〰〰〰〰〰〰
#who
⚠️Return MemBer Log
〰〰〰〰〰〰〰〰〰〰〰〰
⚠️End Group Order Help
]]
end
if matches[1] == 'lock' and matches[2] == 'fa' and is_momod2(msg) then	
return [[ Lock Help:⏬
#lock links  
➰بستن  لینک گروه
➖➖➖➖➖➖➖➖➖
#lock flood   
➰بستن  حساسیت ارسال پشت سرهم
➖➖➖➖➖➖➖➖➖
#lock arabic   
➰بستن  چت کردن به زبان فارسی
➖➖➖➖➖➖➖➖➖
#lock member 
➰بستن  اد کردن اشخاص درگروه
➖➖➖➖➖➖➖➖➖
#lock english  
➰بستن  چت کردن انگلیسی
➖➖➖➖➖➖➖➖➖
#lock sticker  
➰بستن  ارسال استیکر 
➖➖➖➖➖➖➖➖➖
#lock contacts  
➰بستن  ارسال شماره تلفن
➖➖➖➖➖➖➖➖➖
#lock strict   
➰سخت گیرانه کردن تنظیمات
➖➖➖➖➖➖➖➖➖
#lock tgservice 
➰بستن  سرویس های تی جی ربات
➖➖➖➖➖➖➖➖➖
#lock fwd  
➰ بستن  فرواردکردن درگروه
➖➖➖➖➖➖➖➖➖
#lock reply 
➰بستن  ریپلای درگروه
➖➖➖➖➖➖➖➖➖
#lock fosh 
➰بستن  فحش درگروه
➖➖➖➖➖➖➖➖➖
#lock leave 
➰جوین دادن دوباره ممکن نیست
➖➖➖➖➖➖➖➖➖
#lock tag   
➰بستن  هشتگ # 
➖➖➖➖➖➖➖➖➖
#lock emoji  
➰بستن  امجو
➖➖➖➖➖➖➖➖➖
#lock username   
➰بستن  یوزرنیم @
➖➖➖➖➖➖➖➖➖
#lock join   
➰بستن  جوین به وسیله لینک
➖➖➖➖➖➖➖➖➖
#lock media 
➰بستن  ارسال مدیا
➖➖➖➖➖➖➖➖➖
#lock bots
➰بستن ربات مخرب
➖➖➖➖➖➖➖➖➖
#lock number
➰بستن ارسال عدد
➖➖➖➖➖➖➖➖➖
برای باز کردن به جای lock باید unlock بذارین.
]]
end
if matches[1] == 'lock' and matches[2] == 'en' and is_momod2(msg) then	
return [[ 
LockHelp:
〰〰〰〰〰〰〰〰〰〰〰
#lock links
⚠️Close Link Ads⚠️
〰〰〰〰〰〰〰〰〰〰〰
#lock flood
⚠️Close Flood Sending⚠️
〰〰〰〰〰〰〰〰〰〰〰
#lock arabic
⚠️Close Arabic/Persia⚠️
〰〰〰〰〰〰〰〰〰〰〰
#lock member
⚠️Close MemeBerAdder⚠️
〰〰〰〰〰〰〰〰〰〰〰
#lock english
⚠️Close English⚠️
〰〰〰〰〰〰〰〰〰〰〰
#lock sticker
Close SendSticker⚠️
〰〰〰〰〰〰〰〰〰〰〰
#lock contacts
⚠️Close Contacts PosT⚠️
〰〰〰〰〰〰〰〰〰〰〰
#lock strict
⚠️Hard Settings:Yes⚠️
〰〰〰〰〰〰〰〰〰〰〰
#lock tgservice
⚠️Close TgService⚠️
〰〰〰〰〰〰〰〰〰〰〰
#lock fwd
⚠️Close Forwarding Post⚠️
〰〰〰〰〰〰〰〰〰〰〰
#lock reply
⚠️Close Reply⚠️
〰〰〰〰〰〰〰〰〰〰〰
#lock fosh
⚠️Close BadWord⚠️
〰〰〰〰〰〰〰〰〰〰〰
#lock leave
⚠️Close Rejoin⚠️
〰〰〰〰〰〰〰〰〰〰〰
#lock tag
⚠️Close HashTag #⚠️
〰〰〰〰〰〰〰〰〰〰〰
#lock emoji
⚠️Close Send Emoji⚠️
〰〰〰〰〰〰〰〰〰〰〰
#lock username
⚠️Close @ Word⚠️
〰〰〰〰〰〰〰〰〰〰〰
#lock join
⚠️Close JoinGroup⚠️
〰〰〰〰〰〰〰〰〰〰〰
#lock media
⚠️Close Send AllMedia⚠️
〰〰〰〰〰〰〰〰〰〰〰
#lock bots
⚠️Close Telegram Bots⚠️
〰〰〰〰〰〰〰〰〰〰〰
#lock number
⚠️Close Send number⚠️
〰〰〰〰〰〰〰〰〰〰〰
Instead, let's open the lock to unlock.
]]
end
if matches[1] == 'mute' and matches[2] == 'en' and is_momod2(msg) then	
return [[ 
⚠️MuteHelp⚠️:
〰〰〰〰〰〰〰〰〰
#mute gifs
⚠️Close Send Gifs
〰〰〰〰〰〰〰〰〰
#mute audio
⚠️Close Send Audio
〰〰〰〰〰〰〰〰〰
#mute video
⚠️Close Send Video
〰〰〰〰〰〰〰〰〰
#mute photo
⚠️Close Send Photo
〰〰〰〰〰〰〰〰〰
#mute all
⚠️Silent Group
〰〰〰〰〰〰〰〰〰
<b>⚠️UnMuteHelp⚠️:</b>
〰〰〰〰〰〰〰〰〰
#unmute gifs
⚠️Open Send Gifs
〰〰〰〰〰〰〰〰〰
#unmute audio
⚠️Open Send Audio
〰〰〰〰〰〰〰〰〰
#unmute video
⚠️Open Send Video
〰〰〰〰〰〰〰〰〰
#unmute photo
⚠️Open Send Photo
〰〰〰〰〰〰〰〰〰
#unmute all
⚠️UnSilent Group
]]		
end						
if matches[1] == 'mute' and matches[2] == 'fa' and is_momod2(msg) then
return [[ Mute Help:⏬
#mute gifs
➰بستن ارسال گیف
➖➖➖➖➖➖➖➖➖
#mute audio
➰بستن ارسال فایل صوتی
➖➖➖➖➖➖➖➖➖
#mute video
➰بستن ارسال ویدیو
➖➖➖➖➖➖➖➖➖
#mute photo
➰بستن ارسال عکس
➖➖➖➖➖➖➖➖➖
#mute text
➰بستن ارسال نوشته
➖➖➖➖➖➖➖➖➖
#mute all
➰بستن همه
➖➖➖➖➖➖➖➖➖
<b>Unmute Help:⏬</b>
➖➖➖➖➖➖➖➖➖
#unmute gifs
➰بازکردن ارسال گیف
➖➖➖➖➖➖➖➖➖
#unmute audio
➰بازکردن ارسال فایل صوتی
➖➖➖➖➖➖➖➖➖
#unmute video
➰بازکردن ارسال ویدیو
➖➖➖➖➖➖➖➖➖
#unmute photo
➰بازکردن ارسال عکس
➖➖➖➖➖➖➖➖➖
#unmute text
➰بازکردن ارسال نوشته
➖➖➖➖➖➖➖➖➖
#unmute all
➰بازکردن همه
➖➖➖➖➖➖➖➖➖
<b>Silent Help:⏬</b>
➖➖➖➖➖➖➖➖➖
#silent @username
#silent by ryple
➰موت کردن یک کاربر
➖➖➖➖➖➖➖➖➖
#unsilent[id|username]
➰انموت کردن یک کاربر
➖➖➖➖➖➖➖➖➖
#silentlist
➰نمایش کاربران موت شده
]]
end
end
			
return {
patterns = {
"^[!/#][Hh]elp$",
"^[!/#][Hh]elp [Ff]a$",
"^[!/#][Hh]elp [Ee]n$",
"^[!/#][Gg]help [Ff]a$",
"^[!/#][Gg]help [Ee]n$",
"^[!/#][Ll]ock [Ff]a$",
"^[!/#][Ll]ock [Ee]n$",
"^[!/#][Mm]ute [Ee]n$",
"^[!/#][Mm]ute [Ff]a$"
},
run = run
}
end
