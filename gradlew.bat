@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  Gradle startup script for Windows
@rem
@rem ##########################################################################

@set DIR=%~dp0
@set APP_HOME=%DIR%

@rem Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
@set DEFAULT_JVM_OPTS="-Xmx64m" "-Xms64m"

@rem Find Java
@if defined JAVA_HOME goto findJava
@set JAVA_EXE=java
@goto startGradle

@:findJava
@if exist "%JAVA_HOME%\bin\java.exe" set JAVA_EXE="%JAVA_HOME%\bin\java.exe"
@if exist "%JAVA_HOME%\jre\bin\java.exe" set JAVA_EXE="%JAVA_HOME%\jre\bin\java.exe"
@if defined JAVA_EXE goto startGradle

@:startGradle
@if not defined JAVA_EXE set JAVA_EXE=java

@rem Check if the wrapper JAR exists
@if not exist "%APP_HOME%gradle\wrapper\gradle-wrapper.jar" goto missingWrapper

@rem Execute Gradle
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %GRADLE_OPTS% -jar "%APP_HOME%gradle\wrapper\gradle-wrapper.jar" %*
@goto end

@:missingWrapper
@echo The wrapper JAR is missing. Did you forget to run 'gradlew wrapper'?
@exit /b 1

@:end
