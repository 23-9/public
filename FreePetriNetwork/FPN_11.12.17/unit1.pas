unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ButtonEx: TButton;
    EditL: TEdit;
    EditP: TEdit;
    EditT: TEdit;
    Fp: TStringGrid;
    Ft: TStringGrid;
    deb: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    M0: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ButtonExClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  P,T,L:integer;
  Fpx: array of array of integer;
  Fttransx: array of array of integer;
  Ftemp:array of array of integer;
  M0x:array of array of integer;
  Tree:array of array of integer;
  Fcurlvl:array of array of integer;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var i,j:integer;
begin
P:=StrToInt(EditP.Text) ;
T:=StrToInt(EditT.Text) ;
L:=StrToInt(EditL.Text) ;
SetLength(Fpx,T,P);
SetLength(Ftemp,T,P);
SetLength(Fttransx,T,P);
SetLength(Fcurlvl,T,P);

j:=1;
for i:=1 to L do
j:=j+T*i;
SetLength(Tree,j,T+3);

Fp.RowCount:=P;
Fp.ColCount:=T;
Fp.FixedCols:=0;
Fp.FixedRows:=0;
Fp.DefaultRowHeight:=20;
Fp.DefaultColWidth:=20;

Ft.RowCount:=T;
Ft.ColCount:=P;
Ft.FixedCols:=0;
Ft.FixedRows:=0;
Ft.DefaultRowHeight:=20;
Ft.DefaultColWidth:=20;

M0.RowCount:=P;
M0.ColCount:=1;
M0.FixedCols:=0;
M0.FixedRows:=0;
M0.DefaultRowHeight:=20;
M0.DefaultColWidth:=20;
M0.Height:=20*(P+1);

//debug
deb.RowCount:=12;
deb.ColCount:=12;
deb.FixedCols:=0;
deb.FixedRows:=0;
deb.DefaultRowHeight:=20;
deb.DefaultColWidth:=20;

Fp.Visible:=True;
Ft.Visible:=True;
M0.Visible:=True;
Button2.Visible:=True;
Label3.Visible:=True;
Label4.Visible:=True;
Label5.Visible:=True;
Label6.Visible:=True;
Label7.Visible:=True;
Label8.Visible:=True;
end;

procedure TForm1.Button2Click(Sender: TObject);
var i,j:integer;
begin
for i:=0 to T-1 do           //заносим Fp  в память
  for j:=0 to P-1 do begin
Fpx[i,j]:=StrToInt(Fp.cells[i,j]);
end;

//отнимаем Fp от M0
for i:=0 to T-1 do
  for j:=0 to P-1 do begin
Ftemp[i,j]:=StrToInt(M0.Cells[0,j])-Fpx[i,j];
//Ft.cells[i,j]:=IntToStr(Ftemp[i,j]);
end;

for i:=0 to T-1 do           //заносим Ft  в память и транспонируем
  for j:=0 to P-1 do begin
Fttransx[i,j]:=StrToInt(Ft.cells[j,i]);
deb.cells[i,j]:=IntToStr(Fttransx[i,j]+Ftemp[i,j]); //debug
Fcurlvl[i,j]:=(Fttransx[i,j]+Ftemp[i,j]);   //  сырая разметка текущего уровня
end;
 //Fttransx и Fpx используем в дальнейшем как константы
 for i:=0 to T-1 do
  for j:=0 to P-1 do begin
    if Fcurlvl[i,j]>=0 then
    Tree[i,j]:=Fcurlvl[i,j];
    deb.cells[i,j]:=IntToStr(Tree[i,j]);
  end;
end;

procedure TForm1.ButtonExClick(Sender: TObject);
begin
Fp.cells[0,0]:='0';
Fp.cells[0,1]:='1';
Fp.cells[0,2]:='0';
Fp.cells[0,3]:='0';
Fp.cells[0,4]:='0';
Fp.cells[0,5]:='0';
Fp.cells[1,0]:='0';
Fp.cells[1,1]:='1';
Fp.cells[1,2]:='0';
Fp.cells[1,3]:='0';
Fp.cells[1,4]:='0';
Fp.cells[1,5]:='0';
Fp.cells[2,0]:='2';
Fp.cells[2,1]:='1';
Fp.cells[2,2]:='0';
Fp.cells[2,3]:='0';
Fp.cells[2,4]:='0';
Fp.cells[2,5]:='0';
Fp.cells[3,0]:='0';
Fp.cells[3,1]:='0';
Fp.cells[3,2]:='1';
Fp.cells[3,3]:='1';
Fp.cells[3,4]:='0';
Fp.cells[3,5]:='0';
Fp.cells[4,0]:='0';
Fp.cells[4,1]:='0';
Fp.cells[4,2]:='0';
Fp.cells[4,3]:='0';
Fp.cells[4,4]:='1';
Fp.cells[4,5]:='0';
Fp.cells[5,0]:='0';
Fp.cells[5,1]:='0';
Fp.cells[5,2]:='0';
Fp.cells[5,3]:='0';
Fp.cells[5,4]:='0';
Fp.cells[5,5]:='1';

Ft.cells[0,0]:='1';
Ft.cells[0,1]:='0';
Ft.cells[0,2]:='1';
Ft.cells[0,3]:='0';
Ft.cells[0,4]:='0';
Ft.cells[0,5]:='0';
Ft.cells[1,0]:='0';
Ft.cells[1,1]:='2';
Ft.cells[1,2]:='0';
Ft.cells[1,3]:='0';
Ft.cells[1,4]:='0';
Ft.cells[1,5]:='1';
Ft.cells[2,0]:='0';
Ft.cells[2,1]:='0';
Ft.cells[2,2]:='1';
Ft.cells[2,3]:='0';
Ft.cells[2,4]:='1';
Ft.cells[2,5]:='0';
Ft.cells[3,0]:='0';
Ft.cells[3,1]:='1';
Ft.cells[3,2]:='0';
Ft.cells[3,3]:='0';
Ft.cells[3,4]:='0';
Ft.cells[3,5]:='0';
Ft.cells[4,0]:='0';
Ft.cells[4,1]:='0';
Ft.cells[4,2]:='0';
Ft.cells[4,3]:='1';
Ft.cells[4,4]:='0';
Ft.cells[4,5]:='0';
Ft.cells[5,0]:='0';
Ft.cells[5,1]:='0';
Ft.cells[5,2]:='0';
Ft.cells[5,3]:='1';
Ft.cells[5,4]:='1';
Ft.cells[5,5]:='1';

M0.cells[0,0]:='2';
M0.cells[0,1]:='1';
M0.cells[0,2]:='0';
M0.cells[0,3]:='0';
M0.cells[0,4]:='1';
M0.cells[0,5]:='1';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Fp.Visible:=False;
Ft.Visible:=False;
M0.Visible:=False;
Button2.Visible:=False;
Label3.Visible:=False;
Label4.Visible:=False;
Label5.Visible:=False;
Label6.Visible:=False;
Label7.Visible:=False;
Label8.Visible:=False;
end;

end.

