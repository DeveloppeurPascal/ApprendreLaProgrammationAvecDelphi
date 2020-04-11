unit uProc;

interface

procedure MaProcToto(i: integer); overload;
procedure MaProcToto(s: string); overload;

procedure MaProcedure;
// accessible dans toute unit� utilisant celle-ci en interface ou impl�mentation

procedure Calcule(nb: integer; var res: integer);

implementation

procedure MaProcToto(i: integer);
begin
end;

procedure MaProcToto(s: string);
begin

end;

procedure Calcule(nb: integer; var res: integer);
var
  i: integer;
begin
  res := 0;
  for i := 0 to nb do
    res := res + i;
end;

procedure MaProc2;
// accessible qu'� partir d'ici
begin
  MaProcToto(54);
  MaProcToto('fhfg5j4g5j4g6');
end;

procedure MaProcedure;
// accessible partout car d�clar�e avant, dans l'interface
begin
end;

procedure MaProc3;
  procedure MaProc3Proc;
  // utilisable que dans MaProc3
    procedure MaProc3ProcProc;
    // utilisable que dans MaProc3Proc
    begin
    end;

  begin
    MaProc3ProcProc;
  end;

begin
  MaProc3Proc;
end;

Procedure ExempleParametres(const ParEntreeSeule: integer;
  ParEntreeSeule2: integer; var ParEntreeSortie: integer;
  out ParSortie: integer);
begin
  // ParEntreeSeule => a la valeur de l'appelant
  // bug car const :  ParEntreeSeule := ParEntreeSeule * 2;
  // ParEntreeSeule2 => a la valeur de l'appelant et peut-�tre modifi� localement
  ParEntreeSeule2 := ParEntreeSeule2 * 2;
  // ParEntreeSortie => a la valeur de l'appelant qui peut �tre modifi�e dans le code local
  ParEntreeSortie := ParEntreeSortie * 2;
  // ParSortie => pas de valeur � l'entr�e, modifie la valeur de l'appelant en sortie
  ParSortie := ParSortie * 2;
end;

var
  a, b, c, d: integer;

initialization

a := 1; // const
b := 2;
c := 3; // var
d := 4; // out
ExempleParametres(a, b, c, d); // 1, 2, 6, 0
writeln(a, b, c, d); // 1, 2, 6, 8
// TODO : v�rifier OUT

end.
