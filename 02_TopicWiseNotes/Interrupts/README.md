# Interrupts

INT is an assembly language instruction for x86 processors that generates a software interrupt. It takes the interrupt number formatted as a byte value.
```asm
INT X ; where X is the software interrupt that should be generated (0-255).
```

* Depending on the context, compiler, or assembler, a software interrupt number is often given as a hexadecimal value, sometimes with a prefix 0x or the suffix h.
    * For example,
    * ```asm
        INT 21H
        ```
    * The code will generate the software interrupt 0x21 (33 in decimal), causing the function pointed to by the 34th vector in the interrupt table to be executed, which is typically a DOS API call.

## DOS API

Most calls to the DOS API are invoked using software interrupt 21h (INT 21h). By calling INT 21h with a subfunction number in the AH processor register and other parameters in other registers, one invokes various DOS services.
* DOS services include keyboard input, video output, disk file access, executing programs, memory allocation, and various other things.

### DOS INT 21h services
* **AH**-**Description**-**Version**

* 00h	Program terminate	

* 01h	Character input	
* 02h	Character output	
* 03h	Auxiliary input	
* 04h	Auxiliary output	
* 05h	Printer output	
* 06h	Direct console I/O	
* 07h	Direct console input without echo	
* 08h	Console input without echo	
* 09h	Display string	
* 0Ah	Buffered keyboard input	
* 0Bh	Get input status	
* 0Ch	Flush input buffer and input	
* 0Dh	Disk reset	
* 0Eh	Set default drive	
* 0Fh	Open file	
* 10h	Close file	
* 11h	Find first file	
* 12h	Find next file	
* 13h	Delete file	
* 14h	Sequential read	
* 15h	Sequential write	
* 16h	Create or truncate file	
* 17h	Rename file	
* 18h	Reserved	
* 19h	Get default drive	
* 1Ah	Set disk transfer address	
* 1Bh	Get allocation info for default drive	
* 1Ch	Get allocation info for specified drive	
* 1Dh	Reserved	
* 1Eh	Reserved	
* 1Fh	Get disk parameter block for default drive	
* 20h	Reserved	
* 21h	Random read	
* 22h	Random write	
* 23h	Get file size in records	
* 24h	Set random record number	
* 25h	Set interrupt vector	
* 26h	Create PSP	
* 27h	Random block read	
* 28h	Random block write	
* 29h	Parse filename	
* 2Ah	Get date	
* 2Bh	Set date	
* 2Ch	Get time	
* 2Dh	Set time	
* 2Eh	Set verify flag	
* 2Fh	Get disk transfer address	
* 30h	Get DOS version	
* 31h	Terminate and stay resident	
* 32h	Get disk parameter block for specified drive	
* 33h	Get or set Ctrl-Break	
* 34h	Get InDOS flag pointer	
* 35h	Get interrupt vector	
* 36h	Get free disk space	
* 37h	Get or set switch character	
* 38h	Get or set country info	
* 39h	Create subdirectory	
* 3Ah	Remove subdirectory	
* 3Bh	Change current directory	
* 3Ch	Create or truncate file	
* 3Dh	Open file	
* 3Eh	Close file	
* 3Fh	Read file or device	
* 40h	Write file or device	
* 41h	Delete file	
* 42h	Move file pointer	
* 43h	Get or set file attributes	
* 44h	I/O control for devices	
* 45h	Duplicate handle	
* 46h	Redirect handle	
* 47h	Get current directory	
* 48h	Allocate memory	
* 49h	Release memory	
* 4Ah	Reallocate memory	
* 4Bh	Execute program	
* 4Ch	Terminate with return code	
* 4Dh	Get program return code	
* 4Eh	Find first file	
* 4Fh	Find next file	
* 50h	Set current PSP	
* 51h	Get current PSP	
* 52h	Get DOS internal pointers (SYSVARS)	
* 53h	Create disk parameter block	
* 54h	Get verify flag	
* 55h	Create program PSP	
* 56h	Rename file	
* 57h	Get or set file date and time	
* 58h	Get or set allocation strategy	2
* 59h	Get extended error info	
* 5Ah	Create unique file	
* 5Bh	Create new file	
* 5Ch	Lock or unlock file	
* 5Dh	File sharing functions	
* 5Eh	Network functions	
* 5Fh	Network redirection functions	
* 60h	Qualify filename	
* 61h	Reserved	
* 62h	Get current PSP	
* 63h	Get DBCS lead byte table pointer	
* 64h	Set wait for external event flag	
* 65h	Get extended country info	
* 66h	Get or set code page	
* 67h	Set handle count	
* 68h	Commit file	
* 69h	Get or set media id	
* 6Ah	Commit file	
* 6Bh	Reserved	
* 6Ch	Extended open/create file	