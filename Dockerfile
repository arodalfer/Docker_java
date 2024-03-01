FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN powershell (new-object System.Net.WebClient).Downloadfile('https://download.oracle.com/java/17/latest/jdk-17_windows-x64_bin.exe', 'C:\jdk-17_windows-x64_bin.exe')
RUN powershell start-process -filepath C:\jdk-17_windows-x64_bin.exe -passthru -wait -argumentlist "/s,INSTALLDIR=c:\Java\jdk-17,/L,install64.log"

RUN mkdir c:\\app

# Copiar tu archivo JAR al contenedor
ADD HelloWorld.jar "c:\\app"

WORKDIR c:\\app

# Comando CMD para ejecutar el archivo JAR
CMD [ "c:\\Java\\jdk-17\\bin\\java.exe", "-jar", "c:\\app\\HelloWorld.jar"]

# CMD [ "c:\\Java\\jdk-17\\bin\\java.exe", "-version"]