# Set Up The Environment

# [Make Visual Studio Open ASM Files](https://www.youtube.com/watch?v=LqyVybUodXE)

1. Add masm build dependency

2. Project Properties >> C/C++ >> Precompiled Header >> Delete all the options

3. Write your assembly code, if error happens make sure
the assembly file properties >> Item Type: Microsoft Macro Assembly	

4. run(f10 or f5 or ctr+f5)

---

* If you see this in the output section this is not error, you are good to go
```
'ConsoleApplication3.exe' (Win32): Loaded 'D:\Code\VisualStudioProjects\AssemblyScratch\ConsoleApplication3\Debug\ConsoleApplication3.exe'. Symbols loaded.
'ConsoleApplication3.exe' (Win32): Loaded 'C:\Windows\SysWOW64\ntdll.dll'. Cannot find or open the PDB file.
'ConsoleApplication3.exe' (Win32): Loaded 'C:\Windows\SysWOW64\kernel32.dll'. Cannot find or open the PDB file.
'ConsoleApplication3.exe' (Win32): Loaded 'C:\Windows\SysWOW64\KernelBase.dll'. Cannot find or open the PDB file.
The thread 0x5af4 has exited with code 0 (0x0).
```

* set break points to see step by step assignments of your assembly code

* click right >> add watch to see step by step value of a register or somethig like that

[See Memory](https://www.youtube.com/watch?v=y_3Yze_8TYk)
* Debug >> Windows >> Memory >> memory 1 or 2 or 3 or 4 , too see the current memory

* You can open the sections for Registers, Disassembly, memory, callstack etc. from
 
  `Debug >> Windows >> Select What You Want to open`

* Basic Assembly Template
```asm
.586
.model flat, c
.stack 100h
.data


.code 

; Code Comes Here

end
```

---

* Remove redundant codes from Disassembly

1. Turn your Solution Configuration from Debug to Release.

2. Project Properties >> C/C++ >> Precompiled Header >> Delete all the options

3. if you get this error
    
     `fatal error LNK1281: Unable to generate SAFESEH image.`
    
    * Project Properties >> Linker >> Advanced >> Make Image Has Safe Handlers "No"

* stack cookie error
    * just make sure your files only have valid breakpoints
        * if it has exclamation mark on the breakpoint, remove the breakpoint.

