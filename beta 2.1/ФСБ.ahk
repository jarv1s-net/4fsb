#SingleInstance force
#Persistent
#include UDF.ahk

way = C:\Amazing Games\Amazing Russia\amazing\chatlog.txt  ; пишем сюда путь к чатлогу, например так
nickname = Artemiy_Rodzaevsky
mask = 766862
IfNotExist, %way%
{
MsgBox,,Ошибка,Попробуйте перезайти в игру, если ошибка возникнет снова - укажите верный путь до чат-лога (chatlog.txt)
exitapp
}
idactive = 0
doc = 0
zapretsos = 0
zapros = 0
dom = 0
id = -1
Tablo1() {
	Mouseclick, left, 954, 292
}
Tablo2() {
	Mouseclick, left, 1189, 586
}
Tablo3() {
	Mouseclick, left, 1097, 730
}
Tablo4() {
	Mouseclick, left, 749, 652
}
Tablo5() {
	Mouseclick, left, 957, 772
}
Tablo6() {
	Mouseclick, left, 765, 390
}
Loop, read, %way%
nstroki=%A_Index%
WinWait, AMAZING ONLINE
addChatMessageEx(0x1E90FF, "{FFFFFF}Скрипт by rodzaevsky был подключён:{1E90FF} " version)
start:
WinWait, AMAZING ONLINE
ifWinNotExist, AMAZING ONLINE
{
WinWait, AMAZING ONLINE
sleep 20000
reload
}
FileReadLine, stroka, %way%, %nstroki%
if ErrorLevel
{
nstroki-=1
goto start
}
if stroka=
{
nstroki+=1
goto start
}
IfInString, stroka, {1E90FF} показать свое удостоверение
{
SendMessage, 0x50,, 0x4190419,, A 
sleep 50
doc = 1
sendChat("/me лёгким движением правой руки выхватил удостоверение из внутреннего кармана, затем раскрыл перед лицом человека напротив")
nstroki+=1
goto start
}
IfInString, stroka, Вы при смерти! У Вас кровотечение и несколько переломов!
{
SendMessage, 0x50,, 0x4190419,, A 
sendChat("/r Меня сбили с ног, я иммобилизован. Требуется поддержка{!}")
zapretsos = 1
nstroki+=1
goto start
}
IfInString, stroka, [R] Внимание, приложите все усилия, чтобы спасти ресурсы из военного поезда
{
addChatMessageEx(0x1E90FF, "{FFFFFF}Используйте команду {1E90FF}!ввестикто{FFFFFF}, чтобы ввести протокол КТО и отдать приказ о всеобщем построении гос. структур")
nstroki+=1
goto start
}
IfInString, stroka, [R] Только что был взрыв возле вагона поезда
{
addChatMessageEx(0x1E90FF, "{FFFFFF}Используйте команду {1E90FF}!снятькто{FFFFFF}, чтобы снять протокол КТО")
nstroki+=1
goto start
}
if dom = 1
{
IfInString, stroka, [R] Камеры зафиксировали возле дома лица:
{
if (InStr(stroka, ",")) 
{
SendMessage, 0x50,, 0x4190419,, A 
ClipSaved := ClipboardAll
RegExMatch(stroka, "лица: (.*), .*", domlitsa)
SendInput,{F6}%domlitsa%{Ctrl down}{Left}{Left}{Left}{Left}{Left}{Shift down}{Right}{Ctrl up}{Shift up}{Backspace}{Ctrl down}{Right}{Ctrl up}{Backspace}{Backspace}{Ctrl down}{Shift down}{Right}{Right}{Right}{Ctrl up}{Shift up}{Backspace}{Ctrl down}{Left}{Ctrl up}/id{Space}{Enter}
idactive = 3
dom = 0
nstroki+=1
goto start
}
if (InStr(stroka, "лица: ")) 
{
SendMessage, 0x50,, 0x4190419,, A 
ClipSaved := ClipboardAll
RegExMatch(stroka, "ца: (.*)", domlitsa)
SendInput,{F6}/id %domlitsa%{Ctrl down}{Left}{Ctrl up}{Backspace}{Backspace}{Backspace}{Backspace}{Enter}
idactive = 3
dom = 0
nstroki+=1
goto start
}
}
IfInString, stroka, [R] Камеры зафиксировали возле особняка лица:
{
if (InStr(stroka, ",")) 
{
SendMessage, 0x50,, 0x4190419,, A 
ClipSaved := ClipboardAll
RegExMatch(stroka, "лица: (.*), .*", domlitsa)
SendInput,{F6}%domlitsa%{Ctrl down}{Left}{Left}{Left}{Left}{Left}{Shift down}{Right}{Ctrl up}{Shift up}{Backspace}{Ctrl down}{Right}{Ctrl up}{Backspace}{Backspace}{Ctrl down}{Shift down}{Right}{Right}{Right}{Ctrl up}{Shift up}{Backspace}{Ctrl down}{Left}{Ctrl up}/id{Space}{Enter}
idactive = 3
dom = 0
nstroki+=1
goto start
}
if (InStr(stroka, "лица: ")) 
{
SendMessage, 0x50,, 0x4190419,, A 
ClipSaved := ClipboardAll
RegExMatch(stroka, "ца: (.*)", domlitsa)
SendInput,{F6}/id %domlitsa%{Ctrl down}{Left}{Ctrl up}{Backspace}{Backspace}{Backspace}{Backspace}{Enter}
idactive = 3
dom = 0
nstroki+=1
goto start
}
}
dom = 0
nstroki+=1
goto start
}
IfInString, stroka, Запрашиваю поддержку для поимки преступника по делу номер:
{
if (InStr(stroka, "по делу номер:")) 
{
if zapros = 0
{
addChatMessageEx(0x1E90FF, "{cc3939}[!] {FFFFFF}Вашему товарищу необходимо оказать помощь для поимки преступника, используйте клавишу {1E90FF}Y{FFFFFF}, чтобы откликнуться")
startotklik:
KeyWait, sc15, D T10
if ErrorLevel = 1
{
nstroki+=1
goto start
}
if (isInChat() = 1)
{
goto startotklik
}
SendMessage, 0x50,, 0x4190419,, A 
ClipSaved := ClipboardAll
RegExMatch(stroka, "номер: (.*)", otklik)
SendInput,{F6}%otklik%{Ctrl down}{Left}{Ctrl up}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Ctrl down}{Shift down}{Right}{Shift up}{sc2D}{Ctrl up}{Enter}
sleep 50
id = %clipboard%
addChatMessageEx(0x1E90FF, "{1E90FF}ID преступника{FFFFFF} был обновлён: " id)
sendChat("/frac")
sleep 200
SendInput,{Down}{Down}{Down}{Down}{Down}{Down}{Enter}
sleep 300
SendInput,%id%{Enter}
ClipBoard := ClipSaved
sendChat("/r Выдвигаюсь на помощь по поимке преступника{!}")
nstroki+=1
goto start
}
if zapros = 1
{
zapros = 0
nstroki+=1
goto start
}
}
}
IfInString, stroka, Меня сбили с ног, я иммобилизован. Требуется поддержка!
{
if (InStr(stroka, "]: Меня сбили с ног")) 
{
if zapretsos = 0
{
addChatMessageEx(0x1E90FF, "{cc3939}[!] {FFFFFF}Ваш товарищ был ранен и запрашивает поддержку, используйте клавишу {1E90FF}Y{FFFFFF}, чтобы проложить маршрут")
startranen:
KeyWait, sc15, D T10
if ErrorLevel = 1
{
nstroki+=1
goto start
}
if (isInChat() = 1)
{
goto startranen
}
SendMessage, 0x50,, 0x4190419,, A 
RegExMatch(stroka, " \[(.*)\]: Меня", ranen)
SendMessage, 0x50,, 0x4190419,, A 
sendChat("/frac")
sleep 150
Tablo1()
sleep 150
Tablo2()
sleep 150
Tablo3()
sleep 300
SendInput,%ranen%{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Ctrl down}{Left}{Shift down}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Backspace}{Ctrl up}{Shift up}{Backspace}{Enter}
sleep 100
sendChat("/r Выезжаю на помощь{!}")
nstroki+=1
goto start
}
if zapretsos = 1
{
zapretsos = 0
nstroki+=1
goto start
}
}
}
IfInString, stroka, [R] Внимание всем постам! Сработала сигнализация
{
if (InStr(stroka, "сигнализация дома")) 
{
addChatMessageEx(0x1E90FF, "{cc3939}[!] {FFFFFF}Началось ограбление дома, используйте клавишу {1E90FF}Y{FFFFFF}, чтобы проложить маршрут до места преступления")
startdom:
KeyWait, sc15, D T10
if ErrorLevel = 1
{
nstroki+=1
goto start
}
if (isInChat() = 1)
{
goto startdom
}
SendMessage, 0x50,, 0x4190419,, A 
ClipSaved := ClipboardAll
RegExMatch(stroka, "сигнализация дома (.*),", signaldom)
SendInput,{F6}%signaldom%{Backspace}{Ctrl down}{Left}{Ctrl up}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Ctrl down}{Shift down}{Right}{sc2D}{Ctrl up}{Shift up}{Enter}
sleep 200
house = %clipboard%
addChatMessageEx(0x1E90FF, "{1E90FF}Номер дома{FFFFFF} был обновлён: " house)
sendChat("/r Выдвигаюсь на ограбление дома номер "house)
sendChat("/gps")
sleep 200
SendInput,{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Enter}
sleep 300
SendInput,%house%{Enter}
ClipBoard := ClipSaved
dom = 1
nstroki+=1
goto start
}
if (InStr(stroka, "сигнализация особняка")) 
{
addChatMessageEx(0x1E90FF, "{cc3939}[!] {FFFFFF}Началось ограбление особняка, используйте клавишу {1E90FF}Y{FFFFFF}, чтобы проложить маршрут до места преступления")
startosoba:
KeyWait, sc15, D T10
if ErrorLevel = 1
{
nstroki+=1
goto start
}
if (isInChat() = 1)
{
goto startosoba
}
SendMessage, 0x50,, 0x4190419,, A 
ClipSaved := ClipboardAll
RegExMatch(stroka, "сигнализация особняка (.*),", signalosoba)
SendInput,{F6}%signalosoba%{Backspace}{Ctrl down}{Left}{Ctrl up}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Ctrl down}{Shift down}{Right}{sc2D}{Ctrl up}{Shift up}{Enter}
sleep 200
house = %clipboard%
addChatMessageEx(0x1E90FF, "{1E90FF}Номер особняка{FFFFFF} был обновлён: " mansion)
sendChat("/r Выдвигаюсь на ограбление особняка номер "mansion)
sendChat("/gps")
sleep 200
SendInput,{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Enter}
sleep 300
SendInput,%mansion%{Enter}
ClipBoard := ClipSaved
dom = 1
nstroki+=1
goto start
}
}
IfInString, stroka, Вы оглушили
{
idactive = 1
if (InStr(stroka, "с помощью электрошокера")) 
{
KeyWait RButton
RegExMatch(stroka, "ли (.*) с ", tazer)
SendMessage, 0x50,, 0x4190419,, A 
SendInput,{F6}/id %tazer%{Backspace}{Backspace}{Backspace}{ctrl down}{left}{ctrl up}{Backspace}{Backspace}{Backspace}{enter}
nstroki+=1
goto start
}
if (InStr(stroka, "с помощью дубинки")) 
{
RegExMatch(stroka, "ли (.*) с ", tazer)
SendMessage, 0x50,, 0x4190419,, A 
SendInput,{F6}/id %tazer%{Backspace}{Backspace}{Backspace}{ctrl down}{left}{ctrl up}{Backspace}{Backspace}{Backspace}{enter}
nstroki+=1
goto start
}
}
IfInString, stroka, {F2994A}[
{
if idactive = 1
{
if (InStr(stroka, "Совпадений не найдено")) 
{
nstroki+=1
idactive = 0
goto start
}
if (InStr(stroka, "]")) 
{
ClipSaved := ClipboardAll
RegExMatch(stroka, "}\[(.*)\]", idtazer)
SendMessage, 0x50,, 0x4190419,, A
nstroki+=1
SendInput,{F6}%idtazer%{Backspace}{Ctrl down}{Left}{Ctrl up}{Right}{Backspace}{Ctrl down}{Shift down}{Right}{Shift up}{sc2D}{Ctrl up}{Enter}
sleep 50
id = %clipboard%
addChatMessageEx(0x1E90FF, "{1E90FF}ID преступника{FFFFFF} был обновлён: " id)
idactive = 0
Clipboard := ClipSaved
goto start
}
idactive = 0
goto start
}
if idactive = 2
{
if (InStr(stroka, "]")) 
{
ClipSaved := ClipboardAll
RegExMatch(stroka, "}\[(.*)\]", idtazer)
SendMessage, 0x50,, 0x4190419,, A
nstroki+=1
SendInput,{F6}%idtazer%{Backspace}{Ctrl down}{Left}{Ctrl up}{Right}{Backspace}{Ctrl down}{Shift down}{Right}{Shift up}{sc2D}{Ctrl up}{Enter}
sleep 50
id = %clipboard%
addChatMessageEx(0x1E90FF, "{1E90FF}ID игрока{FFFFFF} с наркотиками был обновлён: " id)
sendChat("/chase  "id)
Clipboard := ClipSaved
idactive = 0
nstroki+=1
}
idactive = 0
goto start
}
if idactive = 3
{
if (InStr(stroka, "]")) 
{
ClipSaved := ClipboardAll
RegExMatch(stroka, "}\[(.*)\]", domlitsa)
SendMessage, 0x50,, 0x4190419,, A
nstroki+=1
SendInput,{F6}%domlitsa%{Backspace}{Ctrl down}{Left}{Ctrl up}{Right}{Backspace}{Ctrl down}{Shift down}{Right}{Shift up}{sc2D}{Ctrl up}{Enter}
sleep 50
id = %clipboard%
addChatMessageEx(0x1E90FF, "{1E90FF}ID {FFFFFF}грабителя был обновлён: " id)
Clipboard := ClipSaved
idactive = 0
nstroki+=1
}
idactive = 0
goto start
}
}
nstroki+=1
IfInString, stroka, [%mask%] производит обыск
{
sleep 250
SendInput, {sc42 down} ;
sleep 5
SendInput, {sc42 up} ;
goto start
}
IfInString, stroka, %nickname% нейтрализовал преступника
{
SendInput, {sc42 down} ;
sleep 5
SendInput, {sc42 up} ;
id = -1
goto start
}
IfInString, stroka, [%mask%] производит обыск
{
sleep 250
SendInput, {sc42 down} ;
sleep 5
SendInput, {sc42 up} ;
goto start
}
IfInString, stroka, %nickname% нейтрализовал преступника
{
SendInput, {sc42 down} ;
sleep 5
SendInput, {sc42 up} ;
id = -1
goto start
}
IfInString, stroka, Вы арестовали
{
SendInput, {sc42 down} ;
sleep 5
SendInput, {sc42 up} ;
id = -1
goto start
}
IfInString, stroka, Вы изъяли из транспорта
{
SendInput, {sc42 down} ;
sleep 5
SendInput, {sc42 up} ;
goto start
}
IfInString, stroka, [%id%] посажен в деморган
{
SendInput, {sc42 down} ;
sleep 5
SendInput, {sc42 up} ;
id = -1
goto start
}
IfInString, stroka, Вы поставили проблесковые
{
sendChat("/me лёгким движением правой руки нажал на кнопку, включил проблесковый маячок")
sleep 500
sendChat("/me закрепил мигалку на служебном автомобиле")
goto start
}
IfInString, stroka, Вы сняли полицейские проблесковые
{
sendChat("/me лёгким движением правой руки нажал на кнопку, выключил проблесковый маячок")
sleep 500
sendChat("/me снял закреплённую мигалку с служебного автомобиля")
goto start
}
IfInString, stroka, Добро пожаловать на Amazing Russia
{
addChatMessageEx(0x1E90FF, "{FFFFFF}Скрипт by rodzaevsky успешно работает:{1E90FF} " version)
goto start
}
if doc = 1
{
IfInString, stroka, Вы отозвали свое
{
SendMessage, 0x50,, 0x4190419,, A 
sendChat("/me поперхнулся")
doc = 0
nstroki+=1
goto start
}
IfInString, stroka, отказался от Вашего предложения
{
SendMessage, 0x50,, 0x4190419,, A 
sendChat("/me закрыл удостоверение, затем вложил во внутренний карман")
doc = 0
nstroki+=1
goto start
}
IfInString, stroka, [%mask%] показал(-а) удостоверение сотрудника
{
SendMessage, 0x50,, 0x4190419,, A 
sendChat("/me закрыл удостоверение, затем вложил во внутренний карман")
doc = 0
nstroki+=1
goto start
}
IfInString, stroka, %nickname% показал(-а) удостоверение сотрудника
{
SendMessage, 0x50,, 0x4190419,, A 
sendChat("/me закрыл удостоверение, затем вложил во внутренний карман")
doc = 0
nstroki+=1
goto start
}
}
goto start
return

NumPad0::
ClipSaved := ClipboardAll
SendMessage, 0x50,, 0x4190419,, A
SendInput,{F6}Введите ID игрока:{space}
KeyWait, sc1C, D 
SendInput,{Ctrl down}{Left}{Ctrl up}
SendInput,{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}
SendInput,{Ctrl down}{Shift down}{Right}{sc2D}
SendInput,{Ctrl up}{Shift up}
sleep 50
if clipboard is number
{
id = %clipboard%
addChatMessageEx(0x1E90FF, "{1E90FF}ID преступника{FFFFFF} был обновлён: " id)
}
else
{
addChatMessageEx(0x1E90FF, "{FF4D00} Введённая переменная не является числом, попробуйте заново")
}
Clipboard := ClipSaved
return

NumPad1::
if id = -1
{
addChatMessageEx(0x1E90FF, "{FF4D00}ID игрока не был установлен, установите его при помощи NumPad0")
return
}
SendMessage, 0x50,, 0x4190419,, A 
sendChat("/cuff "id)
return

NumPad2::
if id = -1
{
addChatMessageEx(0x1E90FF, "{FF4D00}ID игрока не был установлен, установите его при помощи NumPad0")
return
}
SendMessage, 0x50,, 0x4190419,, A 
sendChat("/me достал перчатки, надел их на руки, затем начал проверять внутренние и внешние карманы человека напротив")
sleep 500
sendChat("/frac "id)
sleep 150
Tablo1()
sleep 150
Tablo4()
sleep 150
Tablo1()
return

NumPad3::
if id = -1
{
addChatMessageEx(0x1E90FF, "{FF4D00}ID игрока не был установлен, установите его при помощи NumPad0")
return
}
SendMessage, 0x50,, 0x4190419,, A 
sendChat("/me снял КПК с пояса, ввёл данные о нарушителе в базу данных разыскиваемых")
Sleep 500
sendChat("/su "id)
return

!NumPad6::
if id = -1
{
addChatMessageEx(0x1E90FF, "{FF4D00}ID игрока не был установлен, установите его при помощи NumPad0")
return
}
SendMessage, 0x50,, 0x4190419,, A
sendChat("/su "id)
sleep 300
SendInput,{down 10}{enter}
sleep 300
SendInput,{enter}
return

NumPad4::
if id = -1
{
addChatMessageEx(0x1E90FF, "{FF4D00}ID игрока не был установлен, установите его при помощи NumPad0")
return
}
SendMessage, 0x50,, 0x4190419,, A 
sendChat("/frac "id)
sleep 150
Tablo1()
sleep 150
Tablo5()
return

NumPad5::
if id = -1
{
addChatMessageEx(0x1E90FF, "{FF4D00}ID игрока не был установлен, установите его при помощи NumPad0")
return
}
SendMessage, 0x50,, 0x4190419,, A
sendChat("/me открыл дверь патрульного автомобиля, затем посадил подозреваемого в салон и пристегнул к двери наручниками")
sleep 500
sendChat("/incar "id)
sleep 500
sendChat("/me закрыл дверь патрульного автомобиля")
return

NumPad6::
if id = -1
{
addChatMessageEx(0x1E90FF, "{FF4D00}ID игрока не был установлен, установите его при помощи NumPad0")
return
}
SendMessage, 0x50,, 0x4190419,, A
sendChat("/me включил карманный персональный компьютер, ввёл данные о преступнике в базу")
Sleep 500
sendChat("/me выключил карманный персональный компьютер, затем передал задержанного в участок")
sleep 500
sendChat("/frac "id)
sleep 150
Tablo1()
sleep 150
Tablo4()
sleep 150
Tablo6()
return

NumPad8::
if id = -1
{
addChatMessageEx(0x1E90FF, "{FF4D00}ID игрока не был установлен, установите его при помощи NumPad0")
return
}
SendMessage, 0x50,, 0x4190419,, A 
sendChat("/chase "id)
return

NumPadSub::
if id = -1
{
addChatMessageEx(0x1E90FF, "{FF4D00}ID игрока не был установлен, установите его при помощи NumPad0")
return
}
SendMessage, 0x50,, 0x4190419,, A 
sendChat("/frac "id)
sleep 150
Tablo1()
return

NumPadAdd::
if id = -1
{
addChatMessageEx(0x1E90FF, "{FF4D00}ID игрока не был установлен, установите его при помощи NumPad0")
return
}
SendMessage, 0x50,, 0x4190419,, A 
sendChat("/frac")
sleep 150
Tablo1()
sleep 150
Tablo2()
sleep 150
Tablo3()
sleep 300
SendInput,%id%{enter}
return

PgUp::
if id = -1
{
addChatMessageEx(0x1E90FF, "{FF4D00}ID игрока не был установлен, установите его при помощи NumPad0")
return
}
SendMessage, 0x50,, 0x4190419,, A
sendChat("/deject "id)
return

Home::
if id = -1
{
addChatMessageEx(0x1E90FF, "{FF4D00}ID игрока не был установлен, установите его при помощи NumPad0")
return
}
SendMessage, 0x50,, 0x4190419,, A
sendChat("/mdc "id)
return

!PgUp::
SendMessage, 0x50,, 0x4190419,, A
sendChat("/m Гражданин, остановитесь{!} Предупреждаю: если Вы не выполните...")
sleep 500
sendChat("/m ...законное требование сотрудника ФСБ, я открою огонь{!}")
Sleep 15000
addChatMessageEx(0xFFFFFF, "{FFFFFF}15 секунд прошло")
return

!Home::
SendMessage, 0x50,, 0x4190419,, A
sendChat("/police")
return

!PgDn::
if id = -1
{
addChatMessageEx(0x1E90FF, "{FF4D00}ID игрока не был установлен, установите его при помощи NumPad0")
return
}
SendMessage, 0x50,, 0x4190419,, A 
sendChat("/rep спекайте "id)
return

!Ins::
if id = -1
{
addChatMessageEx(0x1E90FF, "{FF4D00}ID игрока не был установлен, установите его при помощи NumPad0")
return
}
SendMessage, 0x50,, 0x4190419,, A 
sendChat("/r Запрашиваю поддержку для поимки преступника по делу номер: " id)
zapros = 1
return

!7::
KeyWait Alt
SendInput,{sc2A down}{sc15B down}{sc1D down}{sc30 down}{sc2A up}{sc15B up}{sc1D up}{sc30 up}
return

!8::
Run https://forum.criminal-russia.com/categories/zhaloby-servera-yellow.400/
return

!9::
Run https://forum.criminal-russia.com/threads/ugolovnyj-kodeks-rossijskoj-federacii.80418/post-639960
return

:?:!команды::
SendMessage, 0x50,, 0x4190419,, A
addChatMessageEx(0x1E90FF, "{FFFFFF}Доступные команды скрипта:")
addChatMessageEx(0x1E90FF, "{1E90FF}!ввестикто{FFFFFF} - ввести протокол ''КТО'' в области")
addChatMessageEx(0x1E90FF, "{1E90FF}!снятькто{FFFFFF} - снять протокол ''КТО'' в области")
addChatMessageEx(0x1E90FF, "{1E90FF}!дома{FFFFFF} - перечислить недвижимость под угрозой")
addChatMessageEx(0x1E90FF, "{1E90FF}!удом {FFFFFF}[номер] {1E90FF}- {FFFFFF}запомнить номер дома и проложить до него маршрут")
addChatMessageEx(0x1E90FF, "{1E90FF}!уособа {FFFFFF}[номер] {1E90FF}- {FFFFFF}запомнить номер особняка и проложить до него маршрут")
addChatMessageEx(0x1E90FF, "{1E90FF}!д{FFFFFF} - проложить маршрут до дома, сохранённого в памяти скрипта")
addChatMessageEx(0x1E90FF, "{1E90FF}!о{FFFFFF} - проложить маршрут до особняка, сохранённого в памяти скрипта")
addChatMessageEx(0x1E90FF, "{1E90FF}!ввестичс{FFFFFF} - ввести режим ограблений")
addChatMessageEx(0x1E90FF, "{1E90FF}!снятьчс{FFFFFF} - снять режим ограблений")
return

:?:!rjvfyls::
SendMessage, 0x50,, 0x4190419,, A
addChatMessageEx(0x1E90FF, "{FFFFFF}Доступные команды скрипта:")
addChatMessageEx(0x1E90FF, "{1E90FF}!ввестикто{FFFFFF} - ввести протокол ''КТО'' в области")
addChatMessageEx(0x1E90FF, "{1E90FF}!снятькто{FFFFFF} - снять протокол ''КТО'' в области")
addChatMessageEx(0x1E90FF, "{1E90FF}!дома{FFFFFF} - перечислить недвижимость под угрозой")
addChatMessageEx(0x1E90FF, "{1E90FF}!удом {FFFFFF}[номер] {1E90FF}- {FFFFFF}запомнить номер дома и проложить до него маршрут")
addChatMessageEx(0x1E90FF, "{1E90FF}!уособа {FFFFFF}[номер] {1E90FF}- {FFFFFF}запомнить номер особняка и проложить до него маршрут")
addChatMessageEx(0x1E90FF, "{1E90FF}!д{FFFFFF} - проложить маршрут до дома, сохранённого в памяти скрипта")
addChatMessageEx(0x1E90FF, "{1E90FF}!о{FFFFFF} - проложить маршрут до особняка, сохранённого в памяти скрипта")
addChatMessageEx(0x1E90FF, "{1E90FF}!ввестичс{FFFFFF} - ввести режим ограблений")
addChatMessageEx(0x1E90FF, "{1E90FF}!снятьчс{FFFFFF} - снять режим ограблений")
return

:?:!ввестикто::
SendMessage, 0x50,, 0x4190419,, A
sleep 250
sendChat("/d [ФСБ/МВД/ВЧ] Ввожу протокол ''КТО'', всем сотрудникам...")
sleep 500
sendChat("/d [ФСБ/МВД/ВЧ] ...гос. структур построиться на базах своих...")
sleep 500
sendChat("/d [ФСБ/МВД/ВЧ] ...организаций")
return

:?:!ddtcnbrnj::
SendMessage, 0x50,, 0x4190419,, A
sleep 250
sendChat("/d [ФСБ/МВД/ВЧ] Ввожу протокол ''КТО'', всем сотрудникам...")
sleep 500
sendChat("/d [ФСБ/МВД/ВЧ] ...гос. структур построиться на базах своих...")
sleep 500
sendChat("/d [ФСБ/МВД/ВЧ] ...организаций")
return

:?:!снятькто::
SendMessage, 0x50,, 0x4190419,, A
sleep 250
sendChat("/d [ФСБ/МВД/ВЧ] Протокол ''КТО'' снят, все свободны.")
return

:?:!cyznmrnj::
SendMessage, 0x50,, 0x4190419,, A
sleep 250
sendChat("/d [ФСБ/МВД/ВЧ] Протокол ''КТО'' снят, все свободны.")
return

:?:!ввестичс::
SendMessage, 0x50,, 0x4190419,, A
sleep 250
sendChat("/d [ФСБ/МВД/ВЧ] Ввожу красный уровень опасности...")
sleep 500
sendChat("/d [ФСБ/МВД/ВЧ] ...на территории всей области в связи...")
sleep 500
sendChat("/d [ФСБ/МВД/ВЧ] ...с повышением уровня крименогенности, всеобщее...")
sleep 500
sendChat("/d [ФСБ/МВД/ВЧ] ...построение у управления ФСБ, готовность 10 мин...")
return

:?:!ddtcnbxc::
SendMessage, 0x50,, 0x4190419,, A
sleep 250
sendChat("/d [ФСБ/МВД/ВЧ] Ввожу красный уровень опасности...")
sleep 500
sendChat("/d [ФСБ/МВД/ВЧ] ...на территории всей области в связи...")
sleep 500
sendChat("/d [ФСБ/МВД/ВЧ] ...с повышением уровня крименогенности, всеобщее...")
sleep 500
sendChat("/d [ФСБ/МВД/ВЧ] ...построение у управления ФСБ, готовность 10 мин...")
return

:?:!снятьчс::
SendMessage, 0x50,, 0x4190419,, A
sleep 250
sendChat("/d [ФСБ/МВД/ВЧ] Установлен зелёный уровень опасности...")
sleep 500
sendChat("/d [ФСБ/МВД/ВЧ] ...на территории всей области, все свободны.")
return

:?:!cyznmxc::
SendMessage, 0x50,, 0x4190419,, A
sleep 250
sendChat("/d [ФСБ/МВД/ВЧ] Установлен зелёный уровень опасности...")
sleep 500
sendChat("/d [ФСБ/МВД/ВЧ] ...на территории всей области, все свободны.")
return

:?:!дома::
SendMessage, 0x50,, 0x4190419,, A
sleep 250
sendChat("/d [ФСБ/МВД] Сейчас будут перечислены дома и особняки...")
sleep 500
sendChat("/d [ФСБ/МВД] ...которые находятся под угрозой ограбления.")
sleep 500
sendChat("/frac")
sleep 500
Tablo1()
sleep 500
Tablo1()
sleep 500
Tablo1()
sleep 500
SendInput, {down 6}{enter}
sleep 300
SendInput,{F6}/d [ФСБ/МВД] Дома: . Особняки: {Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}
return

:?:!ljvf::
SendMessage, 0x50,, 0x4190419,, A
sleep 250
sendChat("/d [ФСБ/МВД] Сейчас будут перечислены дома и особняки...")
sleep 500
sendChat("/d [ФСБ/МВД] ...которые находятся под угрозой ограбления.")
sleep 500
sendChat("/frac")
sleep 500
Tablo1()
sleep 500
Tablo1()
sleep 500
Tablo1()
sleep 500
SendInput, {down 6}{enter}
sleep 300
SendInput,{F6}/d [ФСБ/МВД] Дома: . Особняки: {Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}
return

:?:!удом::
ClipSaved := ClipboardAll
SendMessage, 0x50,, 0x4190419,, A
sleep 100
SendInput,Введите номер дома:{space}
KeyWait, sc1C, D 
SendInput,{Ctrl down}{Left}{Ctrl up}
SendInput,{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}
SendInput,{Ctrl down}{Shift down}{Right}{sc2D}
SendInput,{Ctrl up}{Shift up}
sleep 50
if clipboard is number
{
house = %clipboard%
addChatMessageEx(0x1E90FF, "{1E90FF}Номер дома{FFFFFF} был обновлён: " house)
sleep 200
sendChat("/gps")
sleep 300
SendInput,{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Enter}
sleep 300
SendInput,%house%{Enter}
}
else
{
addChatMessageEx(0x1E90FF, "{FF4D00} Введённая переменная не является числом, попробуйте заново")
}
Clipboard := ClipSaved
return

:?:!eljv::
ClipSaved := ClipboardAll
SendMessage, 0x50,, 0x4190419,, A
sleep 100
SendInput,Введите номер дома:{space}
KeyWait, sc1C, D 
SendInput,{Ctrl down}{Left}{Ctrl up}
SendInput,{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}
SendInput,{Ctrl down}{Shift down}{Right}{sc2D}
SendInput,{Ctrl up}{Shift up}
sleep 50
if clipboard is number
{
house = %clipboard%
addChatMessageEx(0x1E90FF, "{1E90FF}Номер дома{FFFFFF} был обновлён: " house)
sleep 200
sendChat("/gps")
sleep 300
SendInput,{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Enter}
sleep 300
SendInput,%house%{Enter}
}
else
{
addChatMessageEx(0x1E90FF, "{FF4D00} Введённая переменная не является числом, попробуйте заново")
}
Clipboard := ClipSaved
return

:?:!уособа::
ClipSaved := ClipboardAll
SendMessage, 0x50,, 0x4190419,, A
sleep 100
SendInput,Введите номер особняка:{space}
KeyWait, sc1C, D 
SendInput,{Ctrl down}{Left}{Ctrl up}
SendInput,{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}
SendInput,{Ctrl down}{Shift down}{Right}{sc2D}
SendInput,{Ctrl up}{Shift up}
sleep 50
if clipboard is number
{
mansion = %clipboard%
addChatMessageEx(0x1E90FF, "{1E90FF}Номер особняка{FFFFFF} был обновлён: " mansion)
sleep 200
sendChat("/gps")
sleep 300
SendInput,{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Enter}
sleep 300
SendInput,%mansion%{Enter}
}
else
{
addChatMessageEx(0x1E90FF, "{FF4D00} Введённая переменная не является числом, попробуйте заново")
}
Clipboard := ClipSaved
return

:?:!ejcj,f::
ClipSaved := ClipboardAll
SendMessage, 0x50,, 0x4190419,, A
sleep 100
SendInput,Введите номер особняка:{space}
KeyWait, sc1C, D 
SendInput,{Ctrl down}{Left}{Ctrl up}
SendInput,{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}
SendInput,{Ctrl down}{Shift down}{Right}{sc2D}
SendInput,{Ctrl up}{Shift up}
sleep 50
if clipboard is number
{
mansion = %clipboard%
addChatMessageEx(0x1E90FF, "{1E90FF}Номер особняка{FFFFFF} был обновлён: " mansion)
sleep 200
sendChat("/gps")
sleep 300
SendInput,{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Enter}
sleep 300
SendInput,%mansion%{Enter}
}
else
{
addChatMessageEx(0x1E90FF, "{FF4D00} Введённая переменная не является числом, попробуйте заново")
}
Clipboard := ClipSaved
return

:?:!о::
SendMessage, 0x50,, 0x4190419,, A
sleep 250
sendChat("/gps")
sleep 300
SendInput,{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Enter}
sleep 300
SendInput,%mansion%{Enter}
addChatMessageEx(0x1E90FF, "{FFFFFF}Вы проложили маршрут до особняка " mansion)
return

:?:!j::
SendMessage, 0x50,, 0x4190419,, A
sleep 250
sendChat("/gps")
sleep 300
SendInput,{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Enter}
sleep 300
SendInput,%mansion%{Enter}
addChatMessageEx(0x1E90FF, "{FFFFFF}Вы проложили маршрут до особняка " mansion)
return

:?:!д::
sleep 250
SendMessage, 0x50,, 0x4190419,, A
sendChat("/gps")
sleep 300
SendInput,{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Enter}
sleep 300
SendInput,%house%{Enter}
addChatMessageEx(0x1E90FF, "{FFFFFF}Вы проложили маршрут до дома " house)
return

:?:!l::
SendMessage, 0x50,, 0x4190419,, A
sleep 250
sendChat("/gps")
sleep 300
SendInput,{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Enter}
sleep 300
SendInput,%house%{Enter}
addChatMessageEx(0x1E90FF, "{FFFFFF}Вы проложили маршрут до дома " house)
return

^sc32::
IfExist, %way%
{
chatlog = успешно
}
else
{
chatlog = файла не существует
}
MsgBox,,ahk by rodzaevsky,Никнейм: %nickname%`nНомер аккаунта: %mask%`nЧтение чата: %chatlog%`nВерсия: %version%`n
return