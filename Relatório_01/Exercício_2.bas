Dim pin As Integer = 314159
Dim pindigitado As Integer
Print "Digite o PIN!"
Input pindigitado

if pindigitado<>pin THEN
    Print "PIN invalido. Tente novamente"
else
    Print "Transacao autorizada!"
end if
Sleep
