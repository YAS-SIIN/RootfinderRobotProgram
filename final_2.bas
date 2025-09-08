$regfile = "m8def.dat"
$crystal = 1000000
Config Lcdpin = Pin , Db4 = Portc.0 ,Db5 = PortC.1  , Db6 = Portc.2 , _
Db7 = Portc.3 , E = Portc.4 , Rs = Portc.5
Config Lcd = 16 * 2
'----------------------------
 Config Portd = Input
Ddrd.0 = 0 : Portd.0 = 1
Ddrd.1 = 0 : Portd.1 = 1
Ddrd.2 = 0 : Portd.2 = 1
Ddrd.3 = 0 : Portd.3 = 1
Ddrd.4 = 0 : Portd.4 = 1
Ddrd.5 = 0 : Portd.5 = 1
Ddrd.6 = 0 : Portd.6 = 1

Config Timer1 = Pwm , Pwm = 8 , Compare A Pwm = Clear Down , Compare B Pwm = Clear Down , Prescale = 8
Pwm1a = 0
Pwm1b = 0
'----------------------------
Config Portb = Output
In1 Alias Portb.0
In2 Alias Portb.3
In3 Alias Portb.4
In4 Alias Portb.5
'sensors


Do


Scan:

  Select Case Pind:

    Case &B00001000 : Goto Mostaghim
    Case &B00001100 : Goto Mostaghim
    Case &B00011000 : Goto Mostaghim
    Case &B00011100 : Goto Mostaghim
    Case &B11110111 : Goto Mostaghim

    Case &B00000100 : Goto Chap
    Case &B00000110 : Goto Chap
    Case &B00000010 : Goto Chap
    Case &B00000011 : Goto Chap
    Case &B00000001 : Goto Chap

    Case &B00010000 : Goto Rast
    Case &B00100000 : Goto Rast
    Case &B00110000 : Goto Rast
    Case &B01000000 : Goto Rast
    Case &B01100000 : Goto Rast

    Case &B01111111 : Goto R_stop



    Case Else:
      Goto Scan

   End Select

Mostaghim:

Set In1
Reset In2
Set In3
Reset In4
Lcd "Rast"
Waitms 100
Lowerline
Cls
Pwm1a = 150
Pwm1b = 150

Goto Scan

Chap:

Reset In1
Set In2
Set In3
Reset In4

Pwm1a = 100
Pwm1b = 130

Goto Scan

Rast:

Set In1
Reset In2
Reset In3
Set In4

Pwm1a = 130
Pwm1b = 100

Goto Scan

R_stop:

Reset In1
Reset In2
Reset In3
Reset In4

Goto Scan

Loop

End                                                         'end program