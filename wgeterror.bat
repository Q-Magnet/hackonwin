@echo off
if %1==0 (goto EOF)
if %1==1 (echo E:Generic)
if %1==2 (echo E:Parse error—for instance, when parsing command-line options, the ‘.wgetrc’ or ‘.netrc’...)
if %1==3 (echo E:File I/O Error)
if %1==4 (echo E:Network Failure)
if %1==5 (echo E:SSL verification failure)
if %1==6 (echo E:Username/password authentication failure.)
if %1==7 (echo E:Protocal Error)
if %1==8 (echo E:Server issued an error response)
:EOF