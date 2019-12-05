
osoba(maksymilian,169,18).
osoba(gabriela,165,12).
osoba(jan,175,50).
osoba(jakub,180,35).
osoba(mikolaj,185,120).
osoba(andrzej,188,120).
osoba(rafal,189,120).
osoba(maja,160,10).
osoba(hanna,161,95).
osoba(kamila,175,22).
osoba(zuzanna,170,73).
osoba(stanislaw,171,41).

wzrost(X,0,niski):-
    X>=175.
wzrost(X,1,niski):-
    X<160.
wzrost(X,Y,niski):-
    X>=160,
    X<175,
    Y is ((-X/15)+(35/3)).

wzrost(X,0,sredni):-
    X =< 165;
    X >= 185.
wzrost(X,1,sredni):-
    X =175.
wzrost(X,Y,sredni):-
    X>165,
    X<175,
    Y is ((X/10)-16.5).
wzrost(X,Y,sredni):-
    X>175,
    X<185,
    Y is ((-X/10)+18.5).

wzrost(X,0,wysoki):-
    X<175.
wzrost(X,1,wysoki):-
    X>=190.
wzrost(X,Y,wysoki):-
    X>=175,
    X<190,
    Y is ((X/15)-35/3).

kapital(X,0,biedny):-
    X>=50.
kapital(X,1,biedny):-
    X<15.
kapital(X,Y,biedny):-
    X>=15,
    X<50,
    Y is ((-X+15)/35).

kapital(X,0,klasa_srednia):-
    X=<20,
    X>=100.
kapital(X,1,klasa_srednia):-
    X=50.
kapital(X,Y,klasa_srednia):-
    X>20,
    X<50,
    Y is ((X/30)-(2/3)).
kapital(X,Y,srednia):-
    X>50,
    X<100,
    Y is ((-X/50)+2).

kapital(X,0,bogaty):-
    X<30.
kapital(X,1,bogaty):-
    X>=100.
kapital(X,Y,bogaty):-
    X>=50,
    X<100,
    Y is ((X/70)-(3/7)).

ocen(Imie,Wzrost,Kapital,Pc):-
    osoba(Imie,Wzrost2,Kapital2),
    wzrost(Wzrost2,Przynaleznosc_wzrost,Wzrost),
    kapital(Kapital2,Przynaleznosc_kapital,Kapital),
    Przynaleznosc_wzrost>0,
    Przynaleznosc_kapital>0,
    Pc is (0.4*Przynaleznosc_wzrost+0.6*Przynaleznosc_kapital).

atrakcyjny(Klasa_wzrostu,Klasa_kapitalu,Imie,Przynaleznosc_do_klas):-
    ocen(Imie,Klasa_wzrostu,Klasa_kapitalu,Przynaleznosc_do_klas).

atrakcyjny(Klasa_wzrostu,Klasa_kapitalu,Lista_osob):-
    findall([Imie,Pc],ocen(Imie,Klasa_wzrostu,Klasa_kapitalu,Pc),Lista_osob).


