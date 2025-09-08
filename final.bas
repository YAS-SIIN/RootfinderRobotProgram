$regfile = "m8def.dat"
$crystal = 4000000
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

    Case &B0001000 : Goto Mostaghim
    Case &B0001100 : Goto Mostaghim
    Case &B0011000 : Goto Mostaghim
    Case &B0011100 : Goto Mostaghim
    Case &B1110111 : Goto Mostaghim

    Case &B0000100 : Goto Chap
    Case &B0000110 : Goto Chap
    Case &B0000010 : Goto Chap
    Case &B0000011 : Goto Chap
    Case &B0000001 : Goto Chap

    Case &B0010000 : Goto Rast
    Case &B0100000 : Goto Rast
    Case &B0110000 : Goto Rast
    Case &B1000000 : Goto Rast
    Case &B1100000 : Goto Rast

    Case &B1111111 : Goto R_stop
    Case &B0000000 : Goto R_stop



    Case Else:
      Goto Scan

   End Select

Mostaghim:

Set Portb.0
Reset Portb.3
Set Portb.4
Reset Portb.5

Pwm1a = 200
Pwm1b = 200

Goto Scan

Chap:

Reset Portb.0
Set Portb.3
Set Portb.4
Reset Portb.5

Pwm1a = 100
Pwm1b = 170

Goto Scan

Rast:

Set Portb.0
Reset Portb.3
Reset Portb.4
Set Portb.5

Pwm1a = 170
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