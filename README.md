# OSS praktikos darbas / #2 OSS practice work #2

## (LT)
## Naudojant „Windows PowerShell“ integruotą „scriptinimo“ aplinką (ISE), sukurti script‘ą (us), kurie analizuotų kompiuteryje veikiančius procesus. 
### Bendroji dalis:
1)	Kintamųjų ir funkcijų pavadinimai turi būti rašomi anglų kalba;
2)	Elementai turi turėti prasmingus pavadinimus (pvz. $processName vs $aaa);
3)	Kintamieji pradedami rašyti mažąja raide;
4)	Funkcijos rašomos pradedant didžiąja raide (pvz. GetWordsCount );
Specialioji dalis:
1)	Script‘as (ai) turi atlikti šiuos veiksmus: 
•	Kompiuteryje veikiančių procesų sąraše atlikti paiešką pagal proceso vardą, vardo dalį arba proceso Id. Jeigu procesas nėra randamas, script‘as turi parodyti pranešimą, kad procesas pagal duotus raktažodžius yra nerastas. Jeigu procesas randamas, script‘as turi paklausti vartotojo ar nutraukti procesą. Jeigu atsakymas yra teigiamas, script‘as turi nutraukti (close/kill) proceso vykdymą.
•	Atrinkti procesus pagal pasirinktą parametrą (pvz VM). Atrinktus procesus (Name, Id, Value) įrašyti į failą nurodant datą: FilteredProcessList<Data:Laikas>.csv. Procesų atranka turi būti vykdoma begaliniame cikle su 30sec intervalais. Konkrečiu momentu turi būti saugomi tik 5 vėliausiai sugeneruoti failai t.y. script‘as turi atlikti sukurtų failų kiekio stebėjimą ir ištrinti failus, jeigu jų kiekis yra didesnis už 5 („HouseKeeping“).
•	Windows naudotojo registre (HKCU) sukurti katalogą „HKEY_CURRENT_USER\Software\PowershellScriptRunTime“, kuriame būtų patalpintas raktas (Key) pavadinimu „RunTime“ su jame išsaugota paskutine script‘o vykdymo data (yyyy-MM-dd HH:mm).
2)	Script‘o atliekami veiksmai turi rodyti pranešimus (pvz. Getting process list, Writting process list to file ir kt.);

Taip pat DomainPS aplankale yra scriptas, kuris naudodamas Sysinternals suite įrankį whois suranda domeno (tik .com) užregistravimo datą ir išveda į failą.


## (EN)

## Using Windows PowerShell's Integrated Scripting Environment (ISE), create script(s) that analyse the processes running on your computer. 
### General part:
1) Variable and function names must be written in English;
2) Elements must have meaningful names (e.g. $processName vs $aaa);
3) Variables should start with a lower case letter;
4) Functions shall be capitalized (e.g. GetWordsCount );
Special part:
1) The script(s) must do the following: 
- Search the list of processes running on the computer by process name, part of name or process Id. If the process is not found, the script shall display a message that the process is not found for the given keywords. If the process is found, the script shall ask the user whether to terminate the process. If the answer is yes, the script must abort (close/kill) the process.
- Select processes according to the selected parameter (e.g. VM). Write the selected processes (Name, Id, Value) to a file with the date: FilteredProcessList<Data:Time>.csv. The selection of processes must be done in an infinite loop with 30sec intervals. Only the 5 most recently generated files shall be stored at a given time, i.e. the script shall keep track of the number of files generated and delete files if the number of files is higher than 5 ("HouseKeeping").
- In the Windows user registry (HKCU), create a directory "HKEY_CURRENT_USER\Software\PowershellScriptRunTime", where a key named "RunTime" is placed with the last date of the script's execution stored in the key (YYYY-MM-dd HH:mm).
2) The actions performed by the script must display messages (e.g. Getting process list, Writing process list to file, etc.);

There is also a script in the DomainPS folder that uses the Sysinternals suite whois tool to find the registration date of a domain (.com only) and output it to a file.
