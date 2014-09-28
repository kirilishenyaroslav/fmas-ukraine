{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Номенклатор                                     }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpNomTreeEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxMaskEdit, cxButtonEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, StdCtrls, cxButtons, ibase, GlobalSPR,
  cxDropDownEdit, uSpNomLang, uSpNomLib;

type
  TSpNomTreeEditForm = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    LabelName: TLabel;
    LabelSch: TLabel;
    cxNameEdit: TcxTextEdit;
    cxSchEdit: TcxButtonEdit;
    LabelNType: TLabel;
    cxComboBoxNType: TcxComboBox;
    cxKodEdit: TcxTextEdit;
    LabelKod: TLabel;
    procedure OkButtonClick(Sender: TObject);
    procedure cxSchEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxSchEditExit(Sender: TObject);
  private
    DBHANDLE : TISC_DB_HANDLE;
  public
    ID_SCH: integer;
    SCH_NUMBER: string;
    NTYPE: integer;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);overload;
  end;

var
  SpNomTreeEditForm: TSpNomTreeEditForm;

implementation

{$R *.dfm}

uses uSpNom;

constructor TSpNomTreeEditForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
  Self.DBHANDLE := DBHandle;
 end;
 NTYPE:=0;
 OkButton.Caption:=NOM_STR_BUTTON_OK_CONST;
 CancelButton.Caption:=NOM_STR_BUTTON_CANCEL_CONST;
 LabelName.Caption:=NOM_STR_LABEL_NAME;
 LabelNType.Caption:=NOM_STR_LABEL_NTYPE;
 LabelSch.Caption:=NOM_STR_LABEL_SCH;
 LabelKod.Caption:=NOM_STR_GRID_CAP_NOMN; 
 cxComboBoxNType.Properties.Items.Add(NOM_STR_NTYPE_TMC);
 cxComboBoxNType.Properties.Items.Add(NOM_STR_NTYPE_USL);
 cxComboBoxNType.Text:=NOM_STR_NTYPE_TMC;
end;

procedure TSpNomTreeEditForm.OkButtonClick(Sender: TObject);
begin
 NTYPE:=cxComboBoxNType.ItemIndex+1;
 if cxSchEdit.Text='' then
  ID_SCH:=0;
 if cxNameEdit.Text='' then
 begin
  agMessageDlg(NOM_STR_MSG_ERROR, NOM_STR_MSG_ERROR_EMPTY_NAME, mtError, [mbOk]);
  cxNameEdit.SetFocus;
  Exit;
 end
 else
  ModalResult:=mrOk;
end;

procedure TSpNomTreeEditForm.cxSchEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Res : Variant;
begin
 Res:=GlobalSPR.GetSch(self, self.DBHandle, fsNormal, Date, 1, -1, ID_SCH);
 if VarArrayDimCount(Res)>0 then
 begin
   Id_Sch := (Res[0][0]);
   cxSchEdit.Text := VarToStr(RES[0][3]);
//   +' "'+VarToStr(RES[0][1])+'"';
   SCH_NUMBER := VarToStr(RES[0][3]);
 end;
end;

procedure TSpNomTreeEditForm.FormShow(Sender: TObject);
begin
 case NTYPE of
  1:  cxComboBoxNType.Text:=NOM_STR_NTYPE_TMC;
  2:  cxComboBoxNType.Text:=NOM_STR_NTYPE_USL;
 end;
end;

procedure TSpNomTreeEditForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
  Key:=VK_TAB;
 if Key=VK_ESCAPE	then
  CancelButton.SetFocus;
 if (Key=VK_F10) or ((Key=VK_END) and (Shift=[ssCtrl])) then
  OkButton.SetFocus;
end;

function LGetMatSchEx(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aMode: integer; ID_SCH: integer; SCH_NUMBER: string):Variant;stdcall;
var
 hPack     : HModule;
 SpravProc : function (AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aMode: integer; ID_SCH: integer; SCH_NUMBER: string):Variant;stdcall;
 Res: Variant;
begin
 hPack := GetModuleHandle('MatasSpr.bpl');
 if hPack < 32 then hPack := LoadPackage('MatasSpr.bpl');
 if hPack > 0 then begin
  @SpravProc := GetProcAddress(hPack, PCHAR('GetMatSchEx'));
  if @SpravProc <> NIL then Res:=SpravProc(AOwner, DBHANDLE, aID_USER, aMode, ID_SCH, SCH_NUMBER);
 end else begin
  ShowMessage(PChar(LoadErrorG + 'MatasSpr.bpl'));
 end;
 LGetMatSchEx:=Res;
end;

procedure TSpNomTreeEditForm.cxSchEditExit(Sender: TObject);
var
  Res : Variant;
begin
  Res:=LGetMatSchEx(self, DBHandle, 0, 0, ID_SCH, cxSchEdit.Text);
  if  VarType(Res) <> varEmpty then begin
   ID_SCH := Res[0];
   cxSchEdit.Text := RES[1];
  end
  else
   ShowMessage('Указанный счет не найден в справочнике счетов');
end;

end.
