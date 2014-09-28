{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkBudgetEditForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSpMatSch, uPackageManager, GlobalSPR, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, ibase, cxCurrencyEdit, uMatasVars, uResources, uMatasUtils;

type
  TDocWorkBudgetEditForm = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Label6: TLabel;
    cxSumma: TcxCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    cxKEKV: TcxButtonEdit;
    cxSmeta: TcxButtonEdit;
    cxRazdel: TcxTextEdit;
    cxStatya: TcxTextEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxDbSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBKEKVPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   DBHANDLE : TISC_DB_HANDLE;
   KOD_DOG, ID_DOG: Variant;
   ID_SM, ID_RZ, ID_ST, ID_KEKV: integer;
   NAME_SM, NAME_RZ, NAME_ST, NAME_KEKV: string;
   KOD_SM, KOD_RZ, KOD_ST, KOD_KEKV: integer;
  end;

var
  DocWorkBudgetEditForm: TDocWorkBudgetEditForm;

implementation

uses uDocWorkOstForm, uDocWorkForm, uDocWorkProv, uDocWorkMarks;

{$R *.dfm}

procedure TDocWorkBudgetEditForm.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_RETURN) and (Shift<>[ssCtrl])  then
  Key:=VK_TAB;
 if Key=VK_ESCAPE	then
  CancelButton.SetFocus;
 if (Key=VK_F10) or ((Key=VK_END) and (Shift=[ssCtrl])) then
  OkButton.SetFocus;
end;

procedure TDocWorkBudgetEditForm.cxDbSmetaPropertiesButtonClick(
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

procedure TDocWorkBudgetEditForm.cxDBKEKVPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  id:variant;
begin
 id:=GlobalSPR.GetKEKVSpr(self, DBHandle, fsNormal, _MATAS_PERIOD, DEFAULT_ROOT_ID);
 if VarArrayDimCount(id)>0 then
 begin
  if id[0][0]<>NULL then begin
{           id[0][0]  - идентификатор КЕКВа
           id[0][1]  - наименование КЕКВа
           id[0][2]  - код КЕКВа
}
   ID_KEKV:=id[0][0];
   NAME_KEKV:=id[0][1];
   KOD_KEKV:=id[0][2];
   cxKEKV.Text:=IntToStr(KOD_KEKV);
  end;
 end;
end;

procedure TDocWorkBudgetEditForm.OkButtonClick(Sender: TObject);
begin
 if (ID_SM>0) then
  ModalResult:=mrOk
 else
  ShowMessage('Необходимо заполнить все поля!');
end;

procedure TDocWorkBudgetEditForm.FormCreate(Sender: TObject);
begin
 OkButton.Caption:=MAT_BUTTON_OK_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
end;

end.
