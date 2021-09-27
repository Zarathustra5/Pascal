unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TFormCalculator }

  TFormCalculator = class(TForm)
    But0: TButton;
    ButAdd: TButton;
    ButSub: TButton;
    ButMod: TButton;
    ButDiv: TButton;
    ButMult: TButton;
    ButCancel: TButton;
    ButEq: TButton;
    But9: TButton;
    But1: TButton;
    But2: TButton;
    But3: TButton;
    But4: TButton;
    But5: TButton;
    But6: TButton;
    But7: TButton;
    But8: TButton;
    Number: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure ButOperatorClick(Sender: TObject);
    procedure ButNumberClick(Sender: TObject);
    procedure ButEqClick(Sender: TObject);
    procedure ButClearClick(Sender: TObject);
  private
    operand1: Integer;

  public

  end;

var
  FormCalculator: TFormCalculator;
  Number: TFormCalculator;

implementation

{$R *.lfm}

{ TFormCalculator }

procedure TFormCalculator.ButNumberClick(Sender: TObject);
begin
  number.Text := number.Text + ( Sender as TButton ).Caption;
end;

procedure TFormCalculator.ButOperatorClick(Sender: TObject);
begin
  operand1:=StrToInt(number.text);
  number.text:='';
  Tag:=(Sender as TButton).Tag;
end;

procedure TFormCalculator.ButEqClick(Sender: TObject);
var operand2,Result:Integer;
begin
  operand2:=StrToInt(number.text);
  case Tag of
    1:Result:=operand1 + Operand2;
    2:Result:=operand1 - Operand2;
    3:Result:=operand1 * Operand2;
    4:Result:=operand1 div Operand2;
    5:Result:=operand1 mod Operand2;
  end;
  number.Text:=inttostr(result);
end;

procedure TFormCalculator.ButClearClick(Sender: TObject);
begin
  Number.Text:='';
end;

end.

