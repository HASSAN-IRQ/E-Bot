do
 function run(msg, matches)
   if msg.to.type == 'channel' then 
   if not is_owner(msg) then
    return
    end
   return [[ <b>SuperGroup Help</b>:⏬
   ➖➖➖➖➖➖➖➖➖
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
#unlock [links-flood-arabic-member-english-sticker-contacts-strict-tgservice-fwd-reply-fosh-leave-tag-username-join-media-bots]
🔃باز کردن امکانات بالا
➖➖➖➖➖➖➖➖➖
#lock [links-flood-arabic-member-english-sticker-contacts-strict-tgservice-fwd-reply-fosh-leave-tag-username-join-media-bots]
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
➖➖➖➖➖➖➖➖➖
@Ernest_TG
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
