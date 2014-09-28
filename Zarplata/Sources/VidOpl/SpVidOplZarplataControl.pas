unit SpVidOplZarplataControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxCheckBox,
  cxTextEdit, cxMaskEdit, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxControls, cxGroupBox, Unit_Sp_VidOpl_Consts, cxButtonEdit, cxDropDownEdit,
  cxCalendar, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, PackageLoad, ZTypes, IBase,
  ActnList;

type
  TZFVidOplControl = class(TForm)
    IdentificationBox: TcxGroupBox;
    Bevel1: TBevel;
    KodLabel: TcxLabel;
    NameLabel: TcxLabel;
    KodEdit: TcxMaskEdit;
    NameEdit: TcxMaskEdit;
    OptionsBox: TcxGroupBox;
    Bevel2: TBevel;
    TypeNachislLabel: TcxLabel;
    CheckCash: TcxCheckBox;
    TypeFundLabel: TcxLabel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    CheckNachisl: TcxCheckBox;
    PeriodBox: TcxGroupBox;
    DateEnd: TcxDateEdit;
    DateBeg: TcxDateEdit;
    DateBegLabel: TcxLabel;
    DateEndLabel: TcxLabel;
    Bevel3: TBevel;
    GroupEdit: TcxButtonEdit;
    GroupLabel: TcxLabel;
    TypeNachislEdit: TcxLookupComboBox;
    TypeFundEdit: TcxLookupComboBox;
    DSourceFund: TDataSource;
    DSourceNachisl: TDataSource;
    DataBase: TpFIBDatabase;
    DSetNachisl: TpFIBDataSet;
    DSetFund: TpFIBDataSet;
    DefaultTransaction: TpFIBTransaction;
    ActionList1: TActionList;
    Action1: TAction;
    Kod1DFLabel: TcxLabel;
    Kod1DFEdit: TcxMaskEdit;
    cxLabel2: TcxLabel;
    shifr: TcxMaskEdit;
    TypeBox: TcxGroupBox;
    TypeEdit: TcxButtonEdit;
    TypeLabel: TcxLabel;
    procedure CancelBtnClick(Sender: TObject);
    procedure GroupEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Action1Execute(Sender: TObject);
    procedure TypeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    Ins_Id_VOpl_Group:LongWord;
    Ins_Id_VOpl_Type:LongWord;
  public
    constructor Create(AOwner: TComponent;ComeDB:TISC_DB_HANDLE);reintroduce;
    property Id_VOPl_Group:LongWord read Ins_Id_VOpl_Group write Ins_Id_VOpl_Group;
    property Id_VOPl_Type:LongWord read Ins_Id_VOpl_Type write Ins_Id_VOpl_Type;
  end;

implementation

{$R *.dfm}

constructor TZFVidOplControl.Create(AOwner: TComponent;ComeDB:TISC_DB_HANDLE);
begin
inherited Create(Aowner);
self.IdentificationBox.Caption            := ZFVidOplControl_IdentificatonBox_Caption;
self.OptionsBox.Caption                   := ZFVidOplControl_OptionsBox_Caption;
self.NameLabel.Caption                    := ZFVidOplControl_NameLabel_Caption;
self.KodLabel.Caption                     := ZFVidOplControl_KodLabel_Caption;
self.Kod1DFLabel.Caption                  := ZFVidOplControl_Kod1dfLabel_Caption;
self.CheckCash.Properties.Caption         := ZFVidOplControl_CheckCash_Caption;
self.CheckNachisl.Properties.Caption      := 'Нарахування:'; //ZFVidOplControl_CheckNachisl_Caption;
self.TypeNachislLabel.Caption             := 'Тип нарахування:'; //ZFVidOplControl_TypeNachislLabel_Caption;
self.TypeFundLabel.Caption                := ZFVidOplControl_TypeFundLabel_Caption;
self.YesBtn.Caption                       := YesBtn_Caption;
self.CancelBtn.Caption                    := CancelBtn_Caption;
self.PeriodBox.Caption                    := ZFVidOplControl_PeriodBox_Caption;
self.DateEndLabel.Caption                 := 'Закінчення:'; //ZFVidOplControl_DateEndLabel_Caption;
self.DateBegLabel.Caption                 := ZFVidOplControl_DateBegLabel_Caption;
self.GroupLabel.Caption                   := ZFVidOplControl_LabelGroup_Caption;
self.NameEdit.Text                        := '';
self.KodEdit.Text                         := '';
self.TypeNachislEdit.Text                 := '';
self.TypeFundEdit.Text                    := '';
//self.DateEnd.Date                         := 31/12/2099;
self.DateBeg.Date                         := Date;
self.Ins_Id_VOpl_Group                    := 0;
self.TypeLabel.Caption                    := 'Тип вида оплат для друку';
self.TypeBox.Caption                      := '';
//******************************************************************************
TypeNachislEdit.Properties.ListSource     := DSourceNachisl;
TypeNachislEdit.Properties.ListFieldNames := 'NAME_TIP_NACH';
TypeNachislEdit.Properties.KeyFieldNames  := 'ID_TIP_NACH';
DSetNachisl.SQLs.SelectSQL.Text           := 'SELECT * FROM INI_TIP_NACH';
//******************************************************************************
TypeFundEdit.Properties.ListSource        := DSourceFund;
TypeFundEdit.Properties.ListFieldNames    := 'NAME_TIP_FUND';
TypeFundEdit.Properties.KeyFieldNames     := 'ID_TIP_FUND';
DSetFund.SQLs.SelectSQL.Text              := 'SELECT * FROM INI_TIP_FUND';
//******************************************************************************
DataBase.Handle := ComeDB;
DefaultTransaction.StartTransaction;
DSetNachisl.Open;
DSetFund.Open;
end;

procedure TZFVidOplControl.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TZFVidOplControl.GroupEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var VoplGroup:variant;
begin
VoplGroup:=LoadVOplFilter(self,DataBase.Handle,zfsModal);
if VarArrayDimCount(VoplGroup)> 0 then
 if VoplGroup[0]<> NULL then
  begin
   GroupEdit.Text    := VoplGroup[1];
   Ins_Id_VOpl_Group := VOplGroup[0];
  end;
end;

procedure TZFVidOplControl.Action1Execute(Sender: TObject);
begin
If NameEdit.Text<>'' then
// if TypeNachislEdit.Text<>'' then
  if TypeFundEdit.Text<>'' then
    if DateBeg.Text<>'' then
     if DateEnd.Text<>'' then
      if DateBeg.Date<=DateEnd.Date then
       begin
        ModalResult:=mrYes;
       end
      else DateBeg.SetFocus
     else DateEnd.SetFocus
    else DateBeg.SetFocus
  else TypeFundEdit.SetFocus
// else TypeNachislEdit.SetFocus
else NameEdit.SetFocus;
end;

procedure TZFVidOplControl.TypeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var VoplType:variant;
begin
VoplType:=LoadVOplType(self,DataBase.Handle,zfsModal);
if VarArrayDimCount(VoplType)> 0 then
 if VoplType[0]<> NULL then
  begin
   TypeEdit.Text     := VoplType[1];
   Ins_Id_VOpl_Type  := VOplType[0];
  end;
end;

end.
