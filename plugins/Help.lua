do
 function run(msg, matches)
  local hash = 'group:'..msg.to.id
  local group_lang = redis:hget(hash,'lang')
  if group_lang then
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
#mute [gifs-audio-video-photo-text-documents-all]
🔃میوت کردن امکانات بالا
➖➖➖➖➖➖➖➖➖
#unmute [gifs-audio-video-photo-text-documents-all]
🔃آنمیوت کردن امکانات بالا
➖➖➖➖➖➖➖➖➖
#unlock [links-flood-arabic-member-english-sticker-contacts-strict-tgservice-fwd-reply-fosh-leave-tag-emoji-username-join-media-bots-number]
🔃باز کردن امکانات بالا
➖➖➖➖➖➖➖➖➖
#lock [links-flood-arabic-member-english-sticker-contacts-strict-tgservice-fwd-reply-fosh-leave-tag-emoji-username-join-media-bots-number]
🔃قفل امکانات بالا
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
else
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
#mute [gifs-audio-video-photo-text-documents-all]
⚠️Mute features high
〰〰〰〰〰〰〰〰〰〰〰〰
#unmute [gifs-audio-video-photo-text-documents-all]
⚠️UnMute features high
〰〰〰〰〰〰〰〰〰〰〰〰
#unlock [links-flood-arabic-member-english-sticker-contacts-strict-tgservice-fwd-reply-fosh-leave-tag-emoji-username-join-media-bots-number]
⚠️Opening up possibilities
〰〰〰〰〰〰〰〰〰〰〰〰
#lock [links-flood-arabic-member-english-sticker-contacts-strict-tgservice-fwd-reply-fosh-leave-tag-emoji-username-join-media-bots-number]
⚠️Close up possibilities
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
end
return {
patterns = {
"^[!/#][Hh]elp$",
},
run = run
}
end
