
$regfile = "m32def.dat"
$crystal = 3000000
'----------------------------
Config Porta = Output
Config Lcdpin = Pin , Db4 = Porta.0 , Db5 = Porta.1 , Db6 = Porta.2 , Db7 = Porta.3 , E = Porta.4 , Rs = Porta.5
Config Lcd = 16 * 2
Lcd "SHAHID MADANI"
Waitms 100
Lowerline
Lcd "Gorouhe <Aras>"
Waitms 200
Cls
Lcd "SADEG ASADNEZHAD"
Waitms 100
Lowerline
Lcd "ALI SHRIMOHAMADI"
Waitms 200
Cls
'----------------------------
Config Portb = Input
Ddrb.0 = 0 : Portb.0 = 1
Ddrb.1 = 0 : Portb.1 = 1
Ddrb.2 = 0 : Portb.2 = 1
Ddrb.3 = 0 : Portb.3 = 1
Ddrb.4 = 0 : Portb.4 = 1
Ddrb.5 = 0 : Portb.5 = 1
Ddrb.6 = 0 : Portb.6 = 1
Config Timer1 = Pwm , Pwm = 8 , Compare A Pwm = Clear Down , Compare B Pwm = Clear Down , Prescale = 8
Pwm1a = 0
Pwm1b = 0
'----------------------------

Config Portd = Output
In1 Alias Portd.0
In2 Alias Portd.1
In3 Alias Portd.2
In4 Alias Portd.3
'sensors:
Scan:
Do
Select Case Pinb:
    Case &B00001000 : Goto Scansefid
    Case &B00011100 : Goto Scansefid
    Case &B00001100 : Goto Scansefid
    Case &B00011000 : Goto Scansefid

    Case &B01110111 : Goto Scansiyah
    Case &B01100011 : Goto Scansiyah
    Case &B01110011 : Goto Scansiyah
    Case &B01100111 : Goto Scansiyah
    Case Else:
         Goto Scan
    End Select

Loop


Scansiyah:

Do


Select Case Pinb:

    Case &B01110111 : Goto Mostaghim
    Case &B01110011 : Goto Mostaghim
    Case &B01100111 : Goto Mostaghim
    Case &B01100011 : Goto Mostaghim


    Case &B01111011 : Goto Chap
    Case &B01111001 : Goto Chap
    Case &B01111101 : Goto Chap
    Case &B01111100 : Goto Chap
    Case &B01111110 : Goto Chap


    Case &B01101111 : Goto Rast
    Case &B01011111 : Goto Rast
    Case &B01001111 : Goto Rast
    Case &B00111111 : Goto Rast
    Case &B00011111 : Goto Rast

    Case &B01111111 : Goto R_stop
    Case Else:
      Goto Scan

   End Select


Mostaghim:

Set In1
Reset In2
Set In3
Reset In4

Pwm1a = 60
Pwm1b = 60

Lcd "Mostaghim"
Waitms 100
Cls
Goto Scansiyah


Chap:

Reset In1
Set In2
Set In3
Reset In4
Pwm1a = 10
Pwm1b = 50
Lcd "Chap"
Waitms 100
Cls
Goto Scansiyah

Rast:

Set In1
Reset In2
Reset In3
Set In4

Pwm1a = 50
Pwm1b = 10
Lcd "Rast"
Waitms 100
Cls
Goto Scansiyah

R_stop:

Reset In1
Reset In2
Reset In3
Reset In4

Lcd "STOP"
Waitms 100
Cls
Goto Scansefid

Loop

Scansefid:

Do

Select Case Pinb:

    Case &B00001000 : Goto Mostaghim1
    Case &B00001100 : Goto Mostaghim1
    Case &B00011000 : Goto Mostaghim1
    Case &B00011100 : Goto Mostaghim1


    Case &B00000100 : Goto Chap1
    Case &B00000110 : Goto Chap1
    Case &B00000010 : Goto Chap1
    Case &B00000011 : Goto Chap1
    Case &B00000001 : Goto Chap1


    Case &B00010000 : Goto Rast1
    Case &B00100000 : Goto Rast1
    Case &B00110000 : Goto Rast1
    Case &B01000000 : Goto Rast1
    Case &B01100000 : Goto Rast1

    Case &B00000000 : Goto R_stop1
    Case Else:
      Goto Scan

   End Select


Mostaghim1:

Set In1
Reset In2
Set In3
Reset In4

Pwm1a = 60
Pwm1b = 60
Lcd "Mostaghim"
Waitms 100
Cls

Goto Scansefid


Chap1:

Reset In1
Set In2
Set In3
Reset In4
Pwm1a = 10
Pwm1b = 50
Lcd "Chap"
Waitms 100
Cls
Goto Scansefid

Rast1:

Set In1
Reset In2
Reset In3
Set In4

Pwm1a = 50
Pwm1b = 10
Lcd "Rast"
Waitms 100
Cls

Goto Scansefid

R_stop1:

Reset In1
Reset In2
Reset In3
Reset In4

Lcd "STOP"
Waitms 100
Cls
Goto Scansefid

Loop
End                                                         'end program