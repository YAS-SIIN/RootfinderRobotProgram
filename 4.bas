$regfile = "m8def.dat"
$crystal = 8000000
Config Lcdpin = Pin , Db4 = Portd.0 , Db5 = Portd.1 , Db6 = Portd.2 , _
Db7 = Portd.3 , E = Portd.4 , Rs = Portd.5
Config Lcd = 16 * 2
Do
Lcd "Y@30N"
Waitms 100
Lowerline
Lcd "ALI"
Waitms 100
Cls
Lcd "Sadeh"
Waitms 100
Lowerline
Lcd "Amo"
Waitms 100
Cls
Loop
End                                                         'end program