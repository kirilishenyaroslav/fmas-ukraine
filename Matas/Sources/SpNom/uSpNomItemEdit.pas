{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Номенклатор                                     }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpNomItemEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ibase, GlobalSPR,
  cxCurrencyEdit, cxMaskEdit,
  cxButtonEdit, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxDropDownEdit, cxCalc, ExtCtrls, DB, FIBDataSet, FIBDatabase,
  pFIBDatabase, pFIBDataSet, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, uSpNomLang, uSpNomLib;

type
  TSpNomItemEditForm = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    LabelName: TLabel;
    LabelNomn: TLabel;
    LabelUnit: TLabel;
    LabelPrice: TLabel;
    cxNameEdit: TcxTextEdit;
    cxNomnEdit: TcxTextEdit;
    cxPriceEdit: TcxCurrencyEdit;
    SelButton: TcxButton;
    LabelNType: TLabel;
    cxComboBoxNType: TcxComboBox;
    cxPriceNDSEdit: TcxCurrencyEdit;
    LabelPriceNDS: TLabel;
    cxNDSEdit: TcxCurrencyEdit;
    LabelNDS: TLabel;
    cxTypeNDS: TcxComboBox;
    cxNDSPercentEdit: TcxCurrencyEdit;
    LabelNTypeNDS: TLabel;
    LabelNDSPercent: TLabel;
    cxUnit: TcxButtonEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure SelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxPriceEditExit(Sender: TObject);
    procedure cxPriceNDSEditExit(Sender: TObject);
    procedure cxUnitPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxNDSPercentEditExit(Sender: TObject);
    procedure cxUnitKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxNameEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxPriceEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxPriceNDSEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxNDSEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    DBHANDLE : TISC_DB_HANDLE;
  public
    NTYPE: integer;
    ID_UNIT: integer;
    SaveAndSelect: boolean;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);overload;
  end;

var
  SpNomItemEditForm: TSpNomItemEditForm;

implementation
{$R *.dfm}

uses uSpNom;

constructor TSpNomItemEditForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
  Self.DBHANDLE := DBHandle;
 end;
 SaveAndSelect:=False;
 LabelNType.Caption:=NOM_STR_LABEL_NTYPE;
 cxComboBoxNType.Properties.Items.Add(NOM_STR_NTYPE_TMC);
 cxComboBoxNType.Properties.Items.Add(NOM_STR_NTYPE_USL);
 cxComboBoxNType.Text:=NOM_STR_NTYPE_TMC;
end;

procedure TSpNomItemEditForm.OkButtonClick(Sender: TObject);
begin
 if cxNameEdit.Text='' then
 begin
  agMessageDlg(NOM_STR_MSG_ERROR, NOM_STR_MSG_ERROR_EMPTY_NAME, mtError, [mbOk]);
  cxNameEdit.SetFocus;
  Exit;
 end;
 if ID_UNIT<=0 then
 begin
  agMessageDlg(NOM_STR_MSG_ERROR, NOM_STR_MSG_ERROR_EMPTY_UNIT, mtError, [mbOk]);
  cxUnit.SetFocus;
  Exit;
 end;
 ModalResult:=mrOk;
end;

procedure TSpNomItemEditForm.SelButtonClick(Sender: TObject);
begin
 if cxNameEdit.Text='' then
 begin
  agMessageDlg(NOM_STR_MSG_ERROR, NOM_STR_MSG_ERROR_EMPTY_NAME, mtError, [mbOk]);
  cxNameEdit.SetFocus;
  Exit;
 end;
 if ID_UNIT<=0 then
 begin
  agMessageDlg(NOM_STR_MSG_ERROR, NOM_STR_MSG_ERROR_EMPTY_UNIT, mtError, [mbOk]);
  cxUnit.SetFocus;
  Exit;
 end;
 SaveAndSelect:=true;
 ModalResult:=mrOk;
end;

procedure TSpNomItemEditForm.FormCreate(Sender: TObject);
begin
 LabelName.Caption:=NOM_STR_GRID_CAP_NAME;
 LabelNomn.Caption:=NOM_STR_GRID_CAP_NOMN;
 LabelUnit.Caption:=NOM_STR_GRID_CAP_UNIT;
 LabelPrice.Caption:=NOM_STR_GRID_CAP_PRICE;
 LabelNTypeNDS.Caption:=NOM_STR_LABEL_TYPE_NDS;
 LabelNDSPercent.Caption:=NOM_STR_LABEL_NDS_PERCENT;
 LabelPriceNDS.Caption:=NOM_STR_LABEL_PRICE_NDS;
 LabelNDS.Caption:=NOM_STR_LABEL_NDS;
 cxTypeNDS.Properties.Items.Clear;
 cxTypeNDS.Properties.Items.Add(NOM_STR_TYPE_NDS1);
 cxTypeNDS.Properties.Items.Add(NOM_STR_TYPE_NDS2);
 cxTypeNDS.Properties.Items.Add(NOM_STR_TYPE_NDS3);
 cxTypeNDS.Properties.Items.Add(NOM_STR_TYPE_NDS4);
 SelButton.Caption:=NOM_STR_BUTTON_CHOOSE_CONST;
 OkButton.Caption:=NOM_STR_BUTTON_OK_CONST;
 CancelButton.Caption:=NOM_STR_BUTTON_CANCEL_CONST;
end;

procedure TSpNomItemEditForm.FormShow(Sender: TObject);
var
 nds_percent: double;
begin
 case NTYPE of
  1:  cxComboBoxNType.Text:=NOM_STR_NTYPE_TMC;
  2:  cxComboBoxNType.Text:=NOM_STR_NTYPE_USL;
 end;
 if cxNDSPercentEdit.Text<>'' then
  nds_percent:=cxNDSPercentEdit.EditValue
 else
  nds_percent:=100;
 cxPriceNDSEdit.EditValue:=(cxPriceEdit.EditValue*(nds_percent+100))/100;
 cxNDSEdit.EditValue:=cxPriceNDSEdit.EditValue-cxPriceEdit.EditValue;
end;

procedure TSpNomItemEditForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_ESCAPE	then
  CancelButton.SetFocus;
 if (Key=VK_F10) or ((Key=VK_END) and (Shift=[ssCtrl])) then
  if SelButton.Visible then
   SelButton.Click
  else
   OkButton.SetFocus;
end;

procedure TSpNomItemEditForm.cxPriceEditExit(Sender: TObject);
var
 nds_percent: double;
begin
 if cxNDSPercentEdit.Text<>'' then
  nds_percent:=cxNDSPercentEdit.EditValue
 else
  nds_percent:=100;
 cxPriceNDSEdit.EditValue:=(cxPriceEdit.EditValue*(nds_percent+100))/100;
 cxNDSEdit.EditValue:=cxPriceNDSEdit.EditValue-cxPriceEdit.EditValue;
end;

procedure TSpNomItemEditForm.cxPriceNDSEditExit(Sender: TObject);
var
 nds_percent: double;
begin
 if cxNDSPercentEdit.Text<>'' then
  nds_percent:=cxNDSPercentEdit.EditValue
 else
  nds_percent:=100;
 cxPriceEdit.EditValue:=(cxPriceNDSEdit.EditValue/(nds_percent+100))*100;
 cxNDSEdit.EditValue:=cxPriceNDSEdit.EditValue-cxPriceEdit.EditValue;
end;

procedure TSpNomItemEditForm.cxUnitPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 hPack     : HModule;
 SpravFunc : function (AOwner : TComponent; DBHandle : TISC_DB_HANDLE; fs : TFormStyle; id_unit_meas : int64) : Variant; stdcall;
 Res:Variant;
begin
 hPack := GetModuleHandle('SpUnitMeas.bpl');
 if hPack < 32 then hPack := LoadPackage('SpUnitMeas.bpl');
 if hPack > 0 then begin
  @SpravFunc := GetProcAddress(hPack, PCHAR('ShowSprav2'));
  if @SpravFunc <> NIL then Res := SpravFunc(self, DBHandle, fsNormal, ID_UNIT);
 end else begin
  ShowMessage(PChar(NOM_STR_MSG_ERROR + ': SpUnitMeas.bpl'));
  Res := NULL;
 end;
  if  VarType(Res) <> varEmpty then
  begin
   ID_UNIT:=Res[0];
   cxUnit.Text:=Res[2];
  end;
end;

procedure TSpNomItemEditForm.cxNDSPercentEditExit(Sender: TObject);
begin
 if cxNDSPercentEdit.EditValue=0 then
  cxTypeNDS.Enabled:=true
 else
  cxTypeNDS.Enabled:=false;
end;

procedure TSpNomItemEditForm.cxUnitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then begin
  cxUnitPropertiesButtonClick(self, 0);
  cxPriceEdit.SetFocus;
 end;
end;

procedure TSpNomItemEditForm.cxNameEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_RETURN) and (Shift<>[ssCtrl]) then
  Key:=VK_TAB;
end;

procedure TSpNomItemEditForm.cxPriceEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_RETURN) and (Shift<>[ssCtrl]) then
  Key:=VK_TAB;
end;

procedure TSpNomItemEditForm.cxPriceNDSEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_RETURN) and (Shift<>[ssCtrl]) then
  Key:=VK_TAB;
end;

procedure TSpNomItemEditForm.cxNDSEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_RETURN) and (Shift<>[ssCtrl]) then
  Key:=VK_TAB;
end;

end.
