@echo off
Title ���������ؽű�--by:GDrain
::Bat by:GDrain
chcp 936

:menu
Cls
Set choice=
echo #  Step.1
echo .                                      ^&ѡ����վԴ^&
echo .                                    ===============
echo .                                   ^>1.����С˵(23us.la)
echo .                                   ^>2.999С˵��(999xs.com)
echo .                                   ^>3.��Ȥ��(xsbiquge.com)[*]
echo .                                                                     #Tip����*Ϊ�Ƽ�ѡ�
echo ==============================
Set /P Choice=���������(��"0"�˳�):
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
echo .                                      ^&ѡ�����ظ�ʽ^&
echo .                                    =================
echo .                                   ^>1.����txt��ʽ
echo .                                   ^>2.����mobi��ʽ
echo .                                   ^>3.����epub��ʽ[*]
echo .                                   ^>4.����azw3��ʽ
echo .                                                                     #Tip����*Ϊ�Ƽ�ѡ�
echo ===============================
Set /p choice-st=���������(��"9"���أ���"0"�˳�):
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
echo .                                      ^&�����鼮id^&
echo .                                    ================
echo .                   #Tip����Ӧ��Ȥ��id(https://www.xsbiquge.com/0_642/)��
echo .                         ����0_642�����鼮id��
echo .
echo .
echo ===============================
Set /p book_id=�������鼮id(��"9"���أ���"0"�˳�):
if /i '%book_id%'=='9' goto format
if /i '%book_id%'=='0' goto exit

Set resualt=.\ebookdownloader_windows_-amd64-cli.exe --ebhost=%book_source% --bookid=%book_id% --%book_format% --meta
Cls
Set "output1=��Դ =  %book_source%"
Set "output2=��ʽ =  %book_format%"
echo %output1%
echo %output2%
%resualt%
start .\outputs\

::=====================================================

:exit
echo ==============================
echo .
echo .         ��������Ԭȫΰ�ṩ��Batch�ű���GDrain�ṩ��
echo .         ��������Ŀ��ַ��https://github.com/qq573011406/ebookdownloader
echo .         ���ű�ֻΪ�򻯸���Ŀ�����ز�����������лʹ�ñ��ű���(^^_^^)/~~�ݰ�!
echo .
Set /p =������             <nul
for /l %%a in (3 -1 1) do (
	Set /p =%%a�����˳�... <nul&ping -n 2 127.1 >nul
	)
Exit