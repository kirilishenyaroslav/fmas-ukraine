{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uCheBalPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, cxButtons, uResources;

type
  TfmCheBalPrice = class(TForm)
    cxTextEditCheBalPr: TcxTextEdit;
    Label1: TLabel;
    cxButtonCheBl: TcxButton;
    cxButtonCan: TcxButton;
    procedure cxTextEditCheBalPrKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditCheBalPrExit(Sender: TObject);
    procedure cxButtonCanClick(Sender: TObject);
    procedure cxButtonCheBlClick(Sender: TObject);
  private
    long_pole : string;
    prap_flag, d, dk : integer;
    zpt, zpt1 : string;
  public
    ResultArray : Variant;
  end;
     function CheBal(AOwner:TComponent; Bal_now : string):Variant;
var
  fmCheBalPrice: TfmCheBalPrice;

implementation

{$R *.dfm}

function CheBal(AOwner:TComponent; Bal_now : string):Variant;
var
 form : TfmCheBalPrice;
begin
      form                                  := TfmCheBalPrice.Create(AOwner);
      form.cxTextEditCheBalPr.Text          := Bal_now;
      
      form.ShowModal;
      CheBal := form.ResultArray;
      form.Free;
end;

procedure TfmCheBalPrice.cxTextEditCheBalPrKeyPress(Sender: TObject; var Key: Char);
var
   i, z: integer;
begin
    if Key = '.' then Key := DecimalSeparator;

    if (Key >= 'а') and (Key <= 'я') then
    begin
        Key := Chr(0);
    end;
    if Key = ',' then
    begin
        prap_flag := 0;
        zpt := cxTextEditCheBalPr.Text;
        long_pole:= IntToStr(cxTextEditCheBalPr.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                Key := Chr(0);
            end;
        end;
    end;

    //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditCheBalPr.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditCheBalPr.GetTextLen);
        for z := 1 to StrToInt(long_pole) do
        begin
            if zpt[z] = ',' then
            begin
                prap_flag := 1;
                dk := z;
            end;
        end;
        zpt1 := '';
        if (prap_flag = 1) then
        begin
            d := StrToInt(long_pole)-dk;
            if (d > 2) then
            begin
                d := dk + 2;
                for z := 1 to d do
                begin
                    if (z <> d) then
                    begin
                        zpt1 := zpt1 + zpt[z];
                    end else
                    begin
                        if (zpt[d+1] = '5') or (zpt[d+1] = '6') or (zpt[d+1] = '7') or (zpt[d+1] = '8') or (zpt[d+1] = '9') then
                        begin
                            zpt1 := zpt1 + IntToStr(StrToInt(zpt[z]) + 1);
                        end;
                    end;
                    cxTextEditCheBalPr.Text := zpt1;
                end;
            end;
        end;
      //**********************************************************************//

end;

procedure TfmCheBalPrice.cxTextEditCheBalPrExit(Sender: TObject);
var
   i: integer;
begin
    //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditCheBalPr.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditCheBalPr.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                prap_flag := 1;
                dk := i;
            end;
        end;
        zpt1 := '';
        if (prap_flag = 1) then
        begin
            d := StrToInt(long_pole)-dk;
            if (d > 2) then
            begin
                d := dk + 2;
                for i := 1 to d do
                begin
                    if (i <> d) then
                    begin
                        zpt1 := zpt1 + zpt[i];
                    end else
                    begin
                        if (zpt[d+1] = '5') or (zpt[d+1] = '6') or (zpt[d+1] = '7') or (zpt[d+1] = '8') or (zpt[d+1] = '9') then
                        begin
                            zpt1 := zpt1 + IntToStr(StrToInt(zpt[i]) + 1);
                        end;
                    end;
                    cxTextEditCheBalPr.Text := zpt1;
                end;
            end;
        end;
      //**********************************************************************//

end;

procedure TfmCheBalPrice.cxButtonCanClick(Sender: TObject);
begin
    close;
end;

procedure TfmCheBalPrice.cxButtonCheBlClick(Sender: TObject);
begin
    if MessageBox(Handle, 'Ви впевненiщо бажаєте змiнити балансову вартiсть?', Pchar(MAT_INV_Attention),mb_YesNO)=mrYes
    then
    begin
        ResultArray    := VarArrayCreate([0,1], varVariant);
        ResultArray[0] := cxTextEditCheBalPr.Text;
        close;
    end;
end;

end.
