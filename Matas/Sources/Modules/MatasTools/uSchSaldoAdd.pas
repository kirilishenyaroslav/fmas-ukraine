{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с дополнительными функциями             }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSchSaldoAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls, ibase,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxCurrencyEdit,
  uResources, uMatasUtils, uSpMatSch;

type
  TSchSaldoAdd = class(TForm)
    LabelSch: TLabel;
    cxSchEdit: TcxButtonEdit;
    Label1: TLabel;
    cxSumma: TcxCurrencyEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxSchEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_SCH: integer;
    DBHandle : TISC_DB_HANDLE;
  end;

var
  SchSaldoAdd: TSchSaldoAdd;

implementation

{$R *.dfm}

procedure TSchSaldoAdd.FormCreate(Sender: TObject);
begin
 Caption:=MAT_SYS_PREFIX+MAT_STR_TOOLS_01_SCH_SALDO+':'+MAT_STR_MODE_ADD;
 ID_SCH:=0;
end;

procedure TSchSaldoAdd.cxSchEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
begin
 Res:=uSpMatSch.GetMatSch(self, DBHandle, 0, ID_SCH);
 if  VarType(Res) <> varEmpty
  then begin
   ID_SCH := Res[0];
   cxSchEdit.Text := RES[1]; //+' "'+RES[2]+'"';
  end;
end;

procedure TSchSaldoAdd.cxButton1Click(Sender: TObject);
begin
 if ID_SCH<>0 then ModalResult:=mrOk
 else
 begin
  ShowMessage('Необхідно вказати рахунок!');
  exit;
 end
end;

end.
