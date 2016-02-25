@ECHO OFF

IF "%1" == "help" GOTO help
IF "%1" == "init" GOTO init
IF "%1" == "activate" GOTO activate
IF "%1" == "upgrade" GOTO upgrade
IF "%1" == "test" GOTO test
IF "%1" == "cover" GOTO cover

:help
  echo v0.1.0
  echo.
  echo Usage:
  echo   bin\do help     - show this help
  echo   bin\do init     - initializes virutal python environment, activates it and installs requirements
  echo   bin\do activate - activates virtual enviroment
  echo   bin\do upgrade  - upgrades requirements
  echo   bin\do test     - run all tests (in order to run specific test execute: bin\do test sample.tests.start_tests)
  echo   bin\do cover    - generates tests coverage
  goto exit

:init
  @ECHO ON
  python -m venv env
  call env\Scripts\activate.bat
  pip install -r requirements.txt
  @ECHO OFF

  echo done
  goto exit

:activate
  call env\Scripts\activate.bat
  goto exit

:upgrade
  pip install -r requirements.txt --upgrade
  goto exit

:test
  for /f "tokens=1,* delims= " %%a in ("%*") do set ALL_BUT_FIRST=%%b
  nosetests %ALL_BUT_FIRST%
  goto exit

:cover
  nosetests --with-coverage --cover-html
  echo Go to cover\index.html
  goto exit

:exit
