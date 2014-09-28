{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с переоценкой ТМЦ                       }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uPereocIstFinEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxMaskEdit, cxButtonEdit,
  ibase, uMatasVars, uResources, uMatasUtils, GlobalSPR;

type
  TVedPereocIstFinFrom = class(TForm)
    Label3: TLabel;
    cxSmeta: TcxButtonEdit;
    Label4: TLabel;
    cxRazdel: TcxTextEdit;
    Label5: TLabel;
    cxStatya: TcxTextEdit;
    Label1: TLabel;
    cxKEKV: TcxButtonEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OkButtonClick(Sender: TObject);
    procedure cxSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxKEKVPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_SM, ID_RZ, ID_ST, ID_KEKV: integer;
   NAME_SM, NAME_RZ, NAME_ST, NAME_KEKV: string;
   KOD_SM, KOD_RZ, KOD_ST, KOD_KEKV: integer;
  end;

var
  VedPereocIstFinFrom: TVedPereocIstFinFrom;

implementation

{$R *.dfm}

procedure TVedPereocIstFinFrom.FormCreate(Sender: TObject);
begin
 OkButton.Caption:=MAT_BUTTON_OK_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
end;

procedure TVedPereocIstFinFrom.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_RETURN) and (Shift<>[ssCtrl])  then
  Key:=VK_TAB;
 if Key=VK_ESCAPE	then
  CancelButton.SetFocus;
 if (Key=VK_F10) or ((Key=VK_END) and (Shift=[ssCtrl])) then
  OkButton.SetFocus;
end;

procedure TVedPereocIstFinFrom.OkButtonClick(Sender: TObject);
begin
 if (ID_SM>0) then
  ModalResult:=mrOk
 else
  ShowMessage('Необхідно вказати всі дані!');
end;

procedure TVedPereocIstFinFrom.cxSmetaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  id:variant;
begin
  id:=GlobalSPR.GetSmetsEx(self, DBHandle, _MATAS_PERIOD, psmRazdSt, ID_SM, ID_RZ, ID_ST);
  if VarArrayDimCount(id)>0
  then begin
   if id[0]<>NULL
   then begin
    ID_SM:=id[0];
    ID_RZ:=id[1];
    ID_ST:=id[2];
    NAME_SM:=id[6];
    NAME_RZ:=id[4];
    NAME_ST:=id[5];
    KOD_SM:=id[9];
    KOD_RZ:=id[7];
    KOD_ST:=id[8];
    cxSmeta.Text:=IntToStr(KOD_SM);
    cxRazdel.Text:=IntToStr(KOD_RZ);
    cxStatya.Text:=IntToStr(KOD_ST);
  end;
 end;
end;

procedure TVedPereocIstFinFrom.cxKEKVPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
 id:=GlobalSPR.GetKEKVSpr(self, DBHandle, fsNormal, _MATAS_PERIOD, DEFAULT_ROOT_ID);
 if VarArrayDimCount(id)>0 then
 begin
  if id[0][0]<>NULL then begin
   ID_KEKV:=id[0][0];
   NAME_KEKV:=id[0][1];
   KOD_KEKV:=id[0][2];
   cxKEKV.Text:=IntToStr(KOD_KEKV);
  end;
 end;
end;

end.
