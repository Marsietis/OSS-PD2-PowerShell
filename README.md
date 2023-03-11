# (LT) OS praktikos darbas #2

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
