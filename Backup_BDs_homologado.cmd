@Echo off
Title Backup e Restore
color 0C
cd /

@author Vinícius Oliveira.

IF exist TEMP (

goto start

) ELSE (

mkdir TEMP

goto start
)
:start
Echo. >> C:\TEMP\loggeral.txt
echo O %username%, Abriu o executavel no horario: %TIME%, e na data: %DATE% >> C:\TEMP\loggeral.txt

echo ___________________________________________________________________________________________ >> C:\TEMP\loggeral.txt

cd Program Files


echo.
:menu
cls
echo.
echo                                     Usuario: %username%    Data:%date%
Echo +++ Selecione a opcao. +++
echo.
Echo *****************************************
Echo *                                       *
Echo *     01) Bakcup                        *
Echo *     02) Restore                       *
Echo *     03) Sair                          *
Echo *                                       *
Echo *****************************************
Echo ps: O backup e restore precisa ser feito numa pasta raiz.				 
echo.
set /p opc= O que faremos(01, 02,ou 03)?


IF %opc% equ 1 goto 1
IF %opc% equ 2 goto 2
IF %opc% equ 3 goto 3

:1
Echo. >> C:\TEMP\loggeral.txt
echo O %username%, entrou no sistema no horario %TIME%, e na data:%DATE% para realizar um backup do banco >> C:\TEMP\loggeral.txt
echo ___________________________________________________________________________________________ >> C:\TEMP\loggeral.txt

cd /
cls

echo.

IF exist Firebird (

cd Firebird/Firebird_3_0

goto backup

) ELSE (

Echo +++ Firebird nao encontrado +++
echo.
Echo *****************************************
Echo *                                       *
Echo *                                       *
Echo *        Instalacao o Firebird          *
Echo *                                       *
Echo *                                       *
Echo *****************************************
echo.
echo.

       Echo Nao encontramos a instalacao do Firebird em Arquivo de programas! 

goto print

)

:print REM menu de escolha
echo.
set /p fbd= Deseja realizar a instalacao do mesmo (1.Sim 2.Nao)?

****************************
IF %fbd% equ 1 goto Instal *
IF %fbd% equ 2 goto Return *
****************************

:Instal 

echo O %username%, nao possuia instalado o Firebird, e fez a instalação >> C:\TEMP\loggeral.txt

echo ___________________________________________________________________________________________ >> C:\TEMP\loggeral.txt

cls
echo.

Echo Iniciando a download do Firebird aguarde.

start https://github.com/FirebirdSQL/firebird/releases/download/R3_0_7/Firebird-3.0.7.33374_1_x64.exe

echo.

pause >nul | Echo.Download concluido pressione enter para continuar para a instalacao


cd \Users\%username%\Downloads

If exist Firebird-3.0.7.33374_1_x64.exe (

start Firebird-3.0.7.33374_1_x64.exe

cd /

cd Program Files

) ELSE (
echo.
echo.

Echo Arquivo nao encontrado favor aguardar o termino do dowload e executar a instalacao!


)

pause > nul


goto backup

:2 
Echo. >> C:\TEMP\loggeral.txt
echo O %username%, entrou no sistema no horario %TIME%, e na data:%DATE% para realizar um restore do banco >> C:\TEMP\loggeral.txt

echo ___________________________________________________________________________________________ >> C:\TEMP\loggeral.txt

cls
echo.
cd/
IF exist Firebird (

cd Firebird/Firebird_3_0

goto restore

) ELSE (

Echo +++ Firebird nao encontrado +++
echo.
Echo *****************************************
Echo *                                       *
Echo *                                       *
Echo *        Instalacao o Firebird          *
Echo *                                       *
Echo *                                       *
Echo *****************************************
echo.
echo.

       Echo Nao encontramos a instalacao do Firebird em Arquivo de programas! 

goto print

)

:print REM menu de escolha
echo.
set /p fbd= Deseja realizar a instalacao do mesmo (1.Sim 2.Nao)?

****************************
IF %fbd% equ 1 goto Instal *
IF %fbd% equ 2 goto Return *
****************************

:Instal 

echo O %username%, nao possuia instalado o Firebird, e fez a instalação >> C:\TEMP\loggeral.txt

echo ___________________________________________________________________________________________ >> C:\TEMP\loggeral.txt

cls
echo.

Echo Iniciando a download do Firebird aguarde.

start https://github.com/FirebirdSQL/firebird/releases/download/R3_0_7/Firebird-3.0.7.33374_1_x64.exe

echo.

pause >nul | Echo.Download concluido pressione enter para continuar para a instalacao


cd \Users\%username%\Downloads

If exist Firebird-3.0.7.33374_1_x64.exe (

start Firebird-3.0.7.33374_1_x64.exe

cd /

cd Program Files

) ELSE (
echo.
echo.

Echo Arquivo nao encontrado favor aguardar o termino do dowload e executar a instalacao!


)

pause > nul


:Return

echo O %username%, nao possuia o Firebird e não pode fazer a instalacao >> C:\TEMP\loggeral.txt

echo ___________________________________________________________________________________________ >> C:\TEMP\loggeral.txt

goto menu

pause > nul

goto menu

Rem Aqui inicia o backup
:backup

echo                                     Usuario: %username%    Data:%date%
echo.
Echo +++ Iniciando o backup +++
echo.
Echo *****************************************
Echo *                                       *
Echo *                                       *
Echo *   *.* Realizando o backup *.*         *
Echo *                                       *
Echo *                                       *
Echo *****************************************

set /p opc=  Escolha o codigo do banco a ser feito o backup:
set /p lclb= Escolha o local onde se encontra o arquivo do banco a ser restaurado (o arquivo precisa estar dentro de uma pasta raiz C: ou D:):
set /p tipo= Escolha o tipo de banco (SGHDADOS, SGHIMAGENS, SGHLOG):
set /p KU= O usuario e senha deste banco foram alterados(1. Sim 2. Nao)?

IF KU equ 1 goto sim
IF KU equ 2 goto nao


IF %tipo% equ SGHDADOS (


set bancorestore=.%opc%


) ELSE (

set bancorestore=.gdb


) 


REM KU = Key User
IF %KU% equ 1 ( 

goto sim


goto menu
) ELSE (

goto nao

) 
 


:sim


cls

echo                                     Usuario: %username%    Data:%date%
echo.
Echo +++ Usuario e Senha do banco +++
echo.
Echo *****************************************
Echo *                                       *
Echo *                                       *
Echo * Favor nos informar o Usurio e senha!  *
Echo *                                       *
Echo *                                       *
Echo *****************************************
echo.

set /p usr=Gentileza informar o usuario:
set /p key=Gentileza informar a senha:


echo                                     Usuario: %username%    Data:%date%
echo.
Echo +++ Validacao da pasta Banco dentro do diretorio +++
echo.
Echo *****************************************
Echo *                                       *
Echo *                                       *
Echo *       Validacao da Pasta Banco        *
Echo *                                       *
Echo *                                       *
Echo *****************************************

set cami=%lclb%:
cd / 
cd %cami%


If exist Banco (

cd /

cd Program Files/Firebird/Firebird_3_0

cls
) ELSE (
cls
Echo +++ Pasta nao encontrada +++
echo.
Echo *****************************************
Echo *                                       *
Echo *                                       *
Echo *        Pasta nao encontrada           *
Echo *                                       *
Echo *                                       *
Echo *****************************************
echo.
echo.
Echo Pasta nao encontrada desja realizar a criacao da mesma?
goto print2
)



set bdr=%tipo%%bancorestore%
REM set bd=sghlog__2023-03-01_23-03-01.%opc%


IF exist %lclb%:\Banco\%tipo%%bancorestore% (


Echo "Foi iniciado o backup usando o Usuario:SYSDBA, e a Senha:Masterkey e o arquivo estava no caminho: %cami%\Banco\%bdr% e foi restaurado no caminho: %cami%\Banco\%tipo%%bancorestore%" >> "%cami%\Banco\log.log"

Echo Iniciando o backup aguarde...

Echo. >> %cami%\Banco\Saida_Do_Backup.txt
Echo Backup iniciado no horario %TIME%, e na data:%DATE% >> %cami%\Banco\Saida_Do_Backup.txt
Echo. >> %cami%\Banco\Saida_Do_Backup.txt

gbak -b -v -g -l -user %usr% -pass %key% %cami%\Banco\%bdr% %cami%\Banco\%tipo%.fbk >> %cami%\Banco\Saida_Do_Backup.txt


msg * Sr. %username% O backup foi realizado com sucesso!

echo.
pause >nul | Echo Pressione qualquer tecla para irmos as opcoes de logs.
goto menu2

) ELSE ( 
cls
Echo +++ Arquivo %bdr% nao encontrado +++
echo.
Echo *****************************************
Echo *         Gentileza inserir             *
Echo *                                       *
Echo *        o arquivo .fbk na pasta        *
Echo *                                       *
Echo *                                       *
Echo *****************************************
echo.
echo.

Echo Favor colocar o arquivo de backup dentro da pasta %lclb%:\Banco\%bdr% para prosseguirmos

echo.
pause >nul | echo Arquivo inserido? pressione qualquer tecla para continuarmos o backup.

goto restore


) 




:nao


echo                                     Usuario: %username%    Data:%date%
echo.
Echo +++ Validacao da pasta Banco dentro do diretorio +++
echo.
Echo *****************************************
Echo *                                       *
Echo *                                       *
Echo *       Validacao da Pasta Banco        *
Echo *                                       *
Echo *                                       *
Echo *****************************************

set cami=%lclb%:
cd / 
cd %cami%


If exist Banco (

cd /

cd Program Files/Firebird/Firebird_3_0

cls
) ELSE (
cls
Echo +++ Pasta nao encontrada +++
echo.
Echo *****************************************
Echo *                                       *
Echo *                                       *
Echo *        Pasta nao encontrada           *
Echo *                                       *
Echo *                                       *
Echo *****************************************
echo.
echo.
Echo Pasta nao encontrada desja realizar a criacao da mesma?
goto print2
)



set bdr=%tipo%%bancorestore%

IF exist %lclb%:\Banco\%tipo%%bancorestore%  (


Echo "Foi iniciado o restore usando o Usuario:SYSDBA, e a Senha:Masterkey e o arquivo estava no caminho: %cami%\Banco\%bdr% e foi restaurado no caminho: %cami%\Banco\%tipo%%bancorestore%" >> "%cami%\Banco\log.log"

Echo Restaurando o banco selecioando aguarde...

Echo. >> %cami%\Banco\Saida_Do_Backup.txt
Echo Backup iniciado no horario %TIME%, e na data:%DATE% >> %cami%\Banco\Saida_Do_Backup.txt
Echo. >> %cami%\Banco\Saida_Do_Backup.txt

gbak -b -v -g -l -user SYSDBA -pass masterkey %cami%\Banco\%bdr% %cami%\Banco\%tipo%.fbk >> %cami%\Banco\Saida_Do_Backup.txt

msg * Sr. %username% O restore foi realizado com sucesso!

echo.
pause >nul | Echo Pressione qualquer tecla para irmos as opcoes de logs.
goto menu2

) ELSE ( 
cls
Echo +++ Arquivo %bdr% nao encontrado +++
echo.
Echo *****************************************
Echo *         Gentileza inserir             *
Echo *                                       *
Echo *        o arquivo .fbk na pasta        *
Echo *                                       *
Echo *                                       *
Echo *****************************************
echo.
echo.

Echo Favor colocar o arquivo de backup dentro da pasta %lclb%:\Banco\%bdr% para prosseguirmos

echo.
pause >nul | echo Arquivo inserido? pressione qualquer tecla para continuarmos o backup.

goto restore


) 

 REM Aqui começa o restore -----------------------------

:restore
)


echo                                     Usuario: %username%    Data:%date%
echo.
Echo +++ Iniciando o restore +++
echo.
Echo *****************************************
Echo *                                       *
Echo *                                       *
Echo *   *.* Realizando o restore *.*        *
Echo *                                       *
Echo *                                       *
Echo *****************************************

set /p opc=  Escolha o codigo do banco a ser feito o restore: 
set /p lclb= Escolha o local onde se encontra o arquivo do banco a ser restaurado (o arquivo precisa estar dentro de uma pasta raiz C: ou D:):
set /p tipo= Escolha o tipo de banco (SGHDADOS, SGHIMAGENS, SGHLOG):
set /p KU= O usuario e senha deste banco foram alterados(1. Sim 2. Nao)?

IF KU equ 1 goto sim
IF KU equ 2 goto nao


IF %tipo% equ SGHDADOS (


set bancorestore=.%opc%


) ELSE (

set bancorestore=.gdb


) 


REM KU = Key User
IF %KU% equ 1 ( 

goto sim


goto menu
) ELSE (

goto nao

) 
 


:sim


cls

echo                                     Usuario: %username%    Data:%date%
echo.
Echo +++ Usuario e Senha do banco +++
echo.
Echo *****************************************
Echo *                                       *
Echo *                                       *
Echo * Favor nos informar o Usurio e senha!  *
Echo *                                       *
Echo *                                       *
Echo *****************************************
echo.

set /p usr=Gentileza informar o usuario:
set /p key=Gentileza informar a senha:


echo                                     Usuario: %username%    Data:%date%
echo.
Echo +++ Validacao da pasta Banco dentro do diretorio +++
echo.
Echo *****************************************
Echo *                                       *
Echo *                                       *
Echo *       Validacao da Pasta Banco        *
Echo *                                       *
Echo *                                       *
Echo *****************************************

set cami=%lclb%:
cd / 
cd %cami%


If exist Banco (

cd /

cd Program Files/Firebird/Firebird_3_0

cls
) ELSE (
cls
Echo +++ Pasta nao encontrada +++
echo.
Echo *****************************************
Echo *                                       *
Echo *                                       *
Echo *        Pasta nao encontrada           *
Echo *                                       *
Echo *                                       *
Echo *****************************************
echo.
echo.
Echo Pasta nao encontrada desja realizar a criacao da mesma?
goto print2
)



set bdr=%tipo%.fbk
REM set bd=sghlog__2023-03-01_23-03-01.%opc%


IF exist %lclb%:\Banco\%bdr% (


Echo "Foi iniciado o restore usando o Usuario:SYSDBA, e a Senha:Masterkey e o arquivo estava no caminho: %cami%\Banco\%bdr% e foi restaurado no caminho: %cami%\Banco\%tipo%%bancorestore%" >> "%cami%\Banco\log.log"

Echo Iniciando o restore aguarde...

Echo. >> %cami%\Banco\Saida_Do_Restore.txt
Echo Restore iniciado no horario %TIME%, e na data:%DATE% >> %cami%\Banco\Saida_Do_Restore.txt
Echo. >> %cami%\Banco\Saida_Do_Restore.txt
gbak -c -v -p 8192 -user %usr% -password %key% %cami%\Banco\%bdr% %cami%\Banco\%tipo%%bancorestore% >> %cami%\Banco\Saida_Do_Restore.txt



msg * Sr. %username% O restore foi realizado com sucesso!

echo.
pause >nul | Echo Pressione qualquer tecla para irmos as opcoes de logs.
goto menu2

) ELSE ( 
cls
Echo +++ Arquivo %bdr% nao encontrado +++
echo.
Echo *****************************************
Echo *         Gentileza inserir             *
Echo *                                       *
Echo *        o arquivo .fbk na pasta        *
Echo *                                       *
Echo *                                       *
Echo *****************************************
echo.
echo.

Echo Favor colocar o arquivo de backup dentro da pasta %lclb%:\Banco\%bdr% para prosseguirmos

echo.
pause >nul | echo Arquivo inserido? pressione qualquer tecla para continuarmos o backup.

goto restore


) 




:nao


echo                                     Usuario: %username%    Data:%date%
echo.
Echo +++ Validacao da pasta Banco dentro do diretorio +++
echo.
Echo *****************************************
Echo *                                       *
Echo *                                       *
Echo *       Validacao da Pasta Banco        *
Echo *                                       *
Echo *                                       *
Echo *****************************************

set cami=%lclb%:
cd / 
cd %cami%


If exist Banco (

cd /

cd Program Files/Firebird/Firebird_3_0

cls
) ELSE (
cls
Echo +++ Pasta nao encontrada +++
echo.
Echo *****************************************
Echo *                                       *
Echo *                                       *
Echo *        Pasta nao encontrada           *
Echo *                                       *
Echo *                                       *
Echo *****************************************
echo.
echo.
Echo Pasta nao encontrada desja realizar a criacao da mesma?
goto print2
)



set bdr=%tipo%.fbk
REM set bd=sghlog__2023-03-01_23-03-01.%opc%

IF exist %lclb%:\Banco\%bdr%  (


Echo "Foi iniciado o restore usando o Usuario:SYSDBA, e a Senha:Masterkey e o arquivo estava no caminho: %cami%\Banco\%bdr% e foi restaurado no caminho: %cami%\Banco\%tipo%%bancorestore%" >> "%cami%\Banco\log.log"

Echo Restaurando o banco selecioando aguarde...

Echo. >> %cami%\Banco\Saida_Do_Restore.txt
Echo Restore iniciado no horario %TIME%, e na data:%DATE% >> %cami%\Banco\Saida_Do_Restore.txt
Echo. >> %cami%\Banco\Saida_Do_Restore.txt
gbak -c -v -p 8192 -user SYSDBA -pass masterkey %cami%\Banco\%bdr% %cami%\Banco\%tipo%%bancorestore% >> %cami%\Banco\Saida_Do_Restore.txt


msg * Sr. %username% O restore foi realizado com sucesso!

echo.
pause >nul | Echo Pressione qualquer tecla para irmos as opcoes de logs.
goto menu2

) ELSE ( 
cls
Echo +++ Arquivo %bdr% nao encontrado +++
echo.
Echo *****************************************
Echo *         Gentileza inserir             *
Echo *                                       *
Echo *        o arquivo .fbk na pasta        *
Echo *                                       *
Echo *                                       *
Echo *****************************************
echo.
echo.

Echo Favor colocar o arquivo de backup dentro da pasta %lclb%:\Banco\%bdr% para prosseguirmos

echo.
pause >nul | echo Arquivo inserido? pressione qualquer tecla para continuarmos o backup.

goto restore


) 



:print2
cls
echo.
echo                                     Usuario: %username%    Data:%date%
echo.
Echo +++ A pasta banco nao foi encontrado no diretorio informado +++
echo.
Echo *****************************************
Echo *                                       *
Echo *                                       *
Echo *       Criacao Pasta Banco             *
Echo *                                       *
Echo *                                       *
Echo *****************************************


set /p diretorio=Deseja realizar a criacao da pasta (1.Sim 2.Nao)?

IF %diretorio% equ 1 goto pastabanco  
IF %diretorio% equ 2 goto vaimenu  


:pastabanco

echo O %username%, nao possuia a pasta banco e permitiu que a mesma fosse criada >> C:\TEMP\loggeral.txt

echo ___________________________________________________________________________________________ >> C:\TEMP\loggeral.txt

cd /

mkdir Banco
echo.
set /p diretorio=Pasta criada deseja fazer o backup ou o restore (1.backup 2.restore)?

IF %diretorio% equ 1 goto backup  
IF %diretorio% equ 2 goto restore  


:vaimenu

echo O %username%, nao possuia a pasta banco e nao permitiu que a mesma fosse criada >> C:\TEMP\loggeral.txt

echo ___________________________________________________________________________________________ >> C:\TEMP\loggeral.txt

goto menu



:menu2
cls
echo.
echo                                     Usuario: %username%    Data:%date%
echo.
Echo +++ Logs +++
echo.
Echo *****************************************
Echo *       01) Log geral                   *
Echo *       02) Log banco                   *
Echo *       03) Log backup                  *
Echo *       04) Log restore                 *
Echo *       05) Retornar ao menu princ      *
Echo *****************************************


set /p logs=Qual log voce deseja exibir?

IF %logs% equ 1 goto loggeral  
IF %logs% equ 2 goto logbanco  
IF %logs% equ 3 goto log_reto_bkp 
IF %logs% equ 4 goto log_reto_restore 
IF %logs% equ 5 goto menu 

:loggeral

start C:\TEMP\loggeral.txt

echo.
pause >nul | Echo Pressione qualquer tecla para voltar aos logs.

goto menu2

:logbanco

echo.

start %cami%\Banco\log.log
pause >nul | Echo Pressione qualquer tecla para voltar aos logs.

goto menu2

:log_reto_bkp

echo.

start %cami%\Banco\Saida_Do_Backup.txt
pause >nul | Echo Pressione qualquer tecla para voltar aos logs.

goto menu2

:log_reto_restore

echo.

start %cami%\Banco\Saida_Do_Restore.txt
pause >nul | Echo Pressione qualquer tecla para voltar aos logs.

goto menu2

:3
Echo. >> C:\TEMP\loggeral.txt
echo O %username%, entrou no sistema no horario %TIME%, e na data:%DATE% para nao realizar nada :( >> C:\TEMP\loggeral.txt

echo ___________________________________________________________________________________________ >> C:\TEMP\loggeral.txt

Exit

