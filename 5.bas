$regfile = "m8def.dat"
$crystal = 4000000
Config Lcdpin = Pin , Db4 = Portd.0 , Db5 = Portd.1 , Db6 = Portd.2 , _
Db7 = Portd.3 , E = Portd.4 , Rs = Portd.5
Config Lcd = 16 * 4
Cursor Off
Do
Lcd "sadeg"
Waitms 300
Lowerline
Lcd "asadnezhad"
Waitms 300
Thirdline
Lcd "ali"
Waitms 300
Fourthline
Lcd "mahmodi"
Loop
End                                                         'end program