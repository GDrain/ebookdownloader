@echo off
Title 电子书下载脚本--by:GDrain
::Bat by:GDrain
chcp 936

:menu
Cls
Set choice=
echo #  Step.1
echo .                                      ^&选择网站源^&
echo .                                    ===============
echo .                                   ^>1.顶点小说(23us.la)
echo .                                   ^>2.999小说网(999xs.com)
echo .                                   ^>3.笔趣阁(xsbiquge.com)[*]
echo .                                                                     #Tip：带*为推荐选项。
echo ==============================
Set /P Choice=请输入序号(按"0"退出):
If Not '%Choice%'=='' Set Choice=%Choice:~0,1%
If /I '%Choice%'=='1' goto source1
If /I '%Choice%'=='2' goto source2
If /I '%Choice%'=='3' goto source3
If /I '%Choice%'=='0' goto exit
If /I '%Choice%' GTR '3' goto menu
If /I '%Choice%' LSS '0' goto menu

::=====================================================

:source1
Set "book_source=23us.la"
goto format

:source2
Set "book_source=999xs.com"
goto format

:source3
Set "book_source=xsbiquge.com"
goto format

::=====================================================

:format
Cls
Set choice-st=
echo #  Step.2
echo .                                      ^&选择下载格式^&
echo .                                    =================
echo .                                   ^>1.下载txt格式
echo .                                   ^>2.下载mobi格式
echo .                                   ^>3.下载epub格式[*]
echo .                                   ^>4.下载azw3格式
echo .                                                                     #Tip：带*为推荐选项。
echo ===============================
Set /p choice-st=请输入序号(按"9"返回，按"0"退出):
If Not '%choice-st%'=='' Set choice-st=%choice-st:~0,1%
if /i '%choice-st%'=='1' goto format1
if /i '%choice-st%'=='2' goto format2
if /i '%choice-st%'=='3' goto format3
if /i '%choice-st%'=='4' goto format4
if /i '%choice-st%'=='9' goto menu
if /i '%choice-st%'=='0' goto exit
If /I '%Choice-st%' GTR '3' goto format
If /I '%Choice-st%' LSS '0' goto format

::=====================================================

:format1
Set "book_format=txt"
goto download

:format2
Set "book_format=mobi"
goto download

:format3
Set "book_format=epub"
goto download

:format4
Set "book_format=azw3"
goto download

::=====================================================

:download
Cls
echo #  Step.3
echo .                                      ^&输入书籍id^&
echo .                                    ================
echo .                   #Tip：对应笔趣阁id(https://www.xsbiquge.com/0_642/)，
echo .                         其中0_642就是书籍id。
echo .
echo .
echo ===============================
Set /p book_id=请输入书籍id(按"9"返回，按"0"退出):
if /i '%book_id%'=='9' goto format
if /i '%book_id%'=='0' goto exit

Set resualt=.\ebookdownloader_windows_-amd64-cli.exe --ebhost=%book_source% --bookid=%book_id% --%book_format% --meta
Cls
Set "output1=书源 =  %book_source%"
Set "output2=格式 =  %book_format%"
echo %output1%
echo %output2%
%resualt%
start .\outputs\

::=====================================================

:exit
echo ==============================
echo .
echo .         下载器由袁全伟提供，Batch脚本由GDrain提供。
echo .         下载器项目地址：https://github.com/qq573011406/ebookdownloader
echo .         本脚本只为简化该项目的下载操作而生，感谢使用本脚本。(^^_^^)/~~拜拜!
echo .
Set /p =程序将在             <nul
for /l %%a in (3 -1 1) do (
	Set /p =%%a秒内退出... <nul&ping -n 2 127.1 >nul
	)
Exit