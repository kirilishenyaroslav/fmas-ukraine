//****************************************************************************//
//                     Ведение правил удержания налогов                       //
//               Форма  для изменения периода функционирования                //
//                        Серов А.Н. июль 2005 года                           //
//****************************************************************************//

unit TaxesTerms_Zarplata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxSpinEdit, cxDropDownEdit, cxLabel, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, ExtCtrls, cxControls, cxGroupBox, ZProc,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ZTypes, IBase,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, Dates,
  Unit_ZGlobal_Consts, ZMessages;

type TZTaxesTermsParameters = record
 ID_TAX_NET : integer;
 ID_TAX_NET_PERIOD : integer;
 KodSetup1: Integer;
 KodSetup2: Integer;
 ControlFormStyle:TZControlFormStyle;
end;

type
  TFZTaxesTerms = class(TForm)
    Box: TcxGroupBox;
    PeriodBegLabel: TcxLabel;
    MonthesListBeg: TcxComboBox;
    YearSpinEditBeg: TcxSpinEdit;
    PeriodEndLabel: TcxLabel;
    MonthesListEnd: TcxComboBox;
    YearSpinEditEnd: TcxSpinEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    DB: TpFIBDatabase;
    procedure CancelBtnClick(Sender: TObject);
    procedure YesBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure YearSpinEditBegKeyPress(Sender: TObject; var Key: Char);
    procedure YearSpinEditEndKeyPress(Sender: TObject; var Key: Char);
    procedure YearSpinEditBegKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure YearSpinEditEndKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    PParameter:TZTaxesTermsParameters;
    PDB_Handle:TISC_DB_HANDLE;
    PLanguageIndex:byte;
  public
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;AParameter:TZTaxesTermsParameters); reintroduce;
    property Parameter:TZTaxesTermsParameters read PParameter;
  end;


function View_FZTaxesTerms(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;AParameter:TZTaxesTermsParameters):variant;stdcall;export;

implementation

uses StrUtils;

{$R *.dfm}
//****************************************************************************//
//                        Функция редактирования                              //
//****************************************************************************//
function View_FZTaxesTerms(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;AParameter:TZTaxesTermsParameters):variant;stdcall;
var ViewForm:TFZTaxesTerms;
    Res:Variant;
begin
 ViewForm:=TFZTaxesTerms.Create(AOwner,DB_Handle,AParameter);
if ViewForm.ModalResult=mrNone then
 ViewForm.ShowModal;
 if AParameter.ControlFormStyle=zcfsInsert then
  begin
   Res:=VarArrayCreate([0,1],varVariant);
   Res[1]:=ViewForm.Parameter.ID_TAX_NET_PERIOD;
  end
 else
   Res:=VarArrayCreate([0,0],varVariant);
Res[0]:=ViewForm.ModalResult;
ViewForm.Free;
View_FZTaxesTerms:=Res;
end;

constructor TFZTaxesTerms.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;AParameter:TZTaxesTermsParameters);
begin
 inherited Create(AOwner);
 PParameter:=AParameter;
 PLanguageIndex                            := LanguageIndex;
//******************************************************************************
 CancelBtn.Caption                    := CancelBtn_Caption[PLanguageIndex];
 YesBtn.Caption                       := YesBtn_Caption[PLanguageIndex];
 PeriodBegLabel.Caption               := GridClBegPeriod_Caption[PLanguageIndex];
 PeriodEndLabel.Caption               := GridClEndPeriod_Caption[PLanguageIndex];
 MonthesListBeg.Properties.Items.Text := MonthesList_Text[PLanguageIndex];
 MonthesListEnd.Properties.Items.Text := MonthesList_Text[PLanguageIndex];
 MonthesListBeg.ItemIndex:=0;
 MonthesListEnd.ItemIndex:=0;
 PDB_Handle:=DB_Handle;
 case PParameter.ControlFormStyle of
  zcfsInsert:
  begin
   self.Caption := ZTaxesTerms_Caption_Insert[PLanguageIndex];
   MonthesListBeg.ItemIndex:=YearMonthFromKodSetup(DateToKodSetup(date),False)-1;
   YearSpinEditBeg.Value :=YearMonthFromKodSetup(DateToKodSetup(date));
   MonthesListEnd.ItemIndex:=YearMonthFromKodSetup(DateToKodSetup(date),False)-1;
   YearSpinEditEnd.Value :=YearMonthFromKodSetup(DateToKodSetup(date));
  end;
  zcfsUpdate:
  begin
   self.Caption := ZTaxesTerms_Caption_Update[PLanguageIndex];
   MonthesListBeg.ItemIndex:=YearMonthFromKodSetup(PParameter.KodSetup1,False)-1;
   YearSpinEditBeg.Value :=YearMonthFromKodSetup(PParameter.KodSetup1);
   MonthesListEnd.ItemIndex:=YearMonthFromKodSetup(PParameter.KodSetup2,False)-1;
   YearSpinEditEnd.Value :=YearMonthFromKodSetup(PParameter.KodSetup2);
  end;
  zcfsShowDetails:
  begin
   self.Caption := ZTaxesTerms_Caption_Detail[PLanguageIndex];
   MonthesListBeg.ItemIndex:=YearMonthFromKodSetup(PParameter.KodSetup1,False)-1;
   YearSpinEditBeg.Value :=YearMonthFromKodSetup(PParameter.KodSetup1);
   MonthesListEnd.ItemIndex:=YearMonthFromKodSetup(PParameter.KodSetup2,False)-1;
   YearSpinEditEnd.Value :=YearMonthFromKodSetup(PParameter.KodSetup2);
   YesBtn.Visible:=False;
   CancelBtn.Caption:=ExitBtn_Caption[PLanguageIndex];
   Box.Enabled:=False;
  end;
 end;
end;

procedure TFZTaxesTerms.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFZTaxesTerms.YesBtnClick(Sender: TObject);
begin
if PeriodToKodSetup(YearSpinEditBeg.Value,MonthesListBeg.ItemIndex+1)>
   PeriodToKodSetup(YearSpinEditEnd.Value,MonthesListEnd.ItemIndex+1) then
 begin
  ZShowMessage(ZeInputError_Caption[PLanguageIndex],ZeInputTerms_ErrorText[PLanguageIndex],mtWarning,[mbOK]);
  MonthesListBeg.SetFocus;
 end
else
 case PParameter.ControlFormStyle of
  zcfsInsert:
   try
    DB.Handle:=PDB_Handle;
    StoredProc.Database:=DB;
    StoredProc.Transaction:=WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='Z_TAX_NET_PERIOD_I';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_TAX_NET').AsInteger := PParameter.ID_TAX_NET;
    StoredProc.ParamByName('KOD_SETUP_1').AsInteger:= PeriodToKodSetup(YearSpinEditBeg.Value,MonthesListBeg.ItemIndex+1);
    StoredProc.ParamByName('KOD_SETUP_2').AsInteger:= PeriodToKodSetup(YearSpinEditEnd.Value,MonthesListEnd.ItemIndex+1);
    StoredProc.ExecProc;
    PParameter.ID_TAX_NET_PERIOD:=StoredProc.ParamByName('ID_TAX_NET_PERIOD').AsInteger;
    StoredProc.Transaction.Commit;
    ModalResult:=mrYes;
   except
    on e:Exception do
     begin
      StoredProc.Transaction.Rollback;
      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
     end;
   end;
   zcfsUpdate:
   try
    DB.Handle:=PDB_Handle;
    StoredProc.Database:=DB;
    StoredProc.Transaction:=WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='Z_TAX_NET_PERIOD_U';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_TAX_NET_PERIOD').AsInteger := PParameter.ID_TAX_NET_PERIOD;
    StoredProc.ParamByName('ID_TAX_NET').AsInteger := PParameter.ID_TAX_NET;
    StoredProc.ParamByName('KOD_SETUP_1').AsInteger:= PeriodToKodSetup(YearSpinEditBeg.Value,MonthesListBeg.ItemIndex+1);
    StoredProc.ParamByName('KOD_SETUP_2').AsInteger:= PeriodToKodSetup(YearSpinEditEnd.Value,MonthesListEnd.ItemIndex+1);
    StoredProc.ExecProc;
    StoredProc.Transaction.Commit;
    ModalResult:=mrYes;
   except
    on e:Exception do
     begin
      StoredProc.Transaction.Rollback;
      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
     end;
   end;
 end;
end;

procedure TFZTaxesTerms.FormCreate(Sender: TObject);
begin
if PParameter.ControlFormStyle=zcfsDelete then
begin
 if ZShowMessage(ZTaxesTerms_Caption_Delete[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
  try
   DB.Handle:=PDB_Handle;
   StoredProc.Database:=DB;
   StoredProc.Transaction:=WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName:='Z_TAX_NET_PERIOD_D';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_TAX_NET_PERIOD').AsInteger := PParameter.ID_TAX_NET_PERIOD;
   StoredProc.ExecProc;
   StoredProc.Transaction.Commit;
   ModalResult:=mrYes;
  except
   on e:Exception do
    begin
     StoredProc.Transaction.Rollback;
     ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
    end;
   end
 else
  ModalResult:=mrCancel;
end;
end;

procedure TFZTaxesTerms.YearSpinEditBegKeyPress(Sender: TObject;
  var Key: Char);
begin
Key:=#0;
end;

procedure TFZTaxesTerms.YearSpinEditEndKeyPress(Sender: TObject;
  var Key: Char);
begin
Key:=#0;
end;

procedure TFZTaxesTerms.YearSpinEditBegKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key=VK_DELETE then Key:=VK_ESCAPE;
end;

procedure TFZTaxesTerms.YearSpinEditEndKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key=VK_DELETE then Key:=VK_ESCAPE;
end;

end.
