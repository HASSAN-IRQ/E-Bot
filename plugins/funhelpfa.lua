do
 function run(msg, matches)
return [[ 
🔃دستورات رهنمای فان ربات:
➖➖➖➖➖➖➖➖➖
#voice متن
🔃تبدیل متن به ویس
➖➖➖➖➖➖➖➖➖
#sticker متن 
🔃تبدیل متن به استیکر
➖➖➖➖➖➖➖➖➖
#redact متن
🔃گذاشتن قاب برای نوشته
➖➖➖➖➖➖➖➖➖
#write متن
🔃نوشتن متن به 100 فونت(انگلیسی فقط)
➖➖➖➖➖➖➖➖➖
#praytime شهر
🔃نمایش اوقات شرعی شهرموردنظر
➖➖➖➖➖➖➖➖➖
#aparat کلمه
🔃جستجو از آپارات
➖➖➖➖➖➖➖➖➖
#src کلمه
🔃جستجو درگوگل
➖➖➖➖➖➖➖➖➖
#tophoto 
🔃ارسال استیکر و تبدیل آن به عکس
➖➖➖➖➖➖➖➖➖
#tosticker
🔃ارسال عکس و تبدیل آن به استیکر
➖➖➖➖➖➖➖➖➖
#qr لینک یا نوشته
🔃تبدیل لینک یا نوشته به عکس کیو ار کد
➖➖➖➖➖➖➖➖➖
#arz
🔃نمایش قیمت ارز
➖➖➖➖➖➖➖➖➖
#music نام خاننده یا موزیک
🔃اوردن موزیک مورد نظر
🔃/dl شماره لیست موزیک
🔃دانلود موزیک مورد نظر
➖➖➖➖➖➖➖➖➖
#config Ip
🔃نمایش ادرس ای پی داده شده
➖➖➖➖➖➖➖➖➖
#mypic
🔃ارسال عکس شما
➖➖➖➖➖➖➖➖➖
#support
🔃نمایش لینک گروه پشتیبان ربات
➖➖➖➖➖➖➖➖➖
#date
🔃نمایش اطلاعات ماه
➖➖➖➖➖➖➖➖➖
#fal
🔃نمایش فال
➖➖➖➖➖➖➖➖➖
#new
🔃نمایش اخبار روز
➖➖➖➖➖➖➖➖➖
#alexa website
🔃نمایش رنک الکسای وبسایت
➖➖➖➖➖➖➖➖➖
]]
end
return {
patterns = {
"^[!/#][Ff]un fa$",
"^[Ff]un fa$"
},
run = run
}
end