//****************************************************************************//
//                     Ведение правил удержания налогов                       //
//               Форма для изменения правил удержания налогов                 //
//                        Серов А.Н. июль 2005 года                           //
//****************************************************************************//
unit Taxes_Nets_Zarplata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxGroupBox, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel,
  ZTypes,IBase, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, Unit_ZGlobal_Consts, ExtCtrls, ZProc, ZMessages;


type TZTaxNetsParameters = record
 ID_TAX : integer;
 ID_TAX_NET_PERIOD : integer;
 Summa_Min: extended;
 Summa_Max: extended;
 Percent: double;
 Add_Summa: extended;
 Add_Text: string[50];
 ControlFormStyle:TZControlFormStyle;
end;

type
  TFZTaxNets = class(TForm)
    Box: TcxGroupBox;
    EditMinSumma: TcxMaskEdit;
    EditMaxSumma: TcxMaskEdit;
    EditPercent: TcxMaskEdit;
    EditAddSumma: TcxMaskEdit;
    LabelMinSumma: TcxLabel;
    LabelMaxSumma: TcxLabel;
    LabelPercent: TcxLabel;
    LabelAddSumma: TcxLabel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    DB: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    Bevel1: TBevel;
    LabelAddText: TcxLabel;
    EditAddText: TcxMaskEdit;
    procedure CancelBtnClick(Sender: TObject);
    procedure YesBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditAddTextKeyPress(Sender: TObject; var Key: Char);
  private
    PParameter:TZTaxNetsParameters;
    PDB_Handle:TISC_DB_HANDLE;
    PLanguageIndex:byte;
  public
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;AParameter:TZTaxNetsParameters);reintroduce;
    property Parameter:TZTaxNetsParameters read PParameter;
  end;

function View_FZTaxNets(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;AParameter:TZTaxNetsParameters):variant;stdcall;export;

implementation

uses StrUtils;

{$R *.dfm}

//****************************************************************************//
//               Функция для изменения правил удержания налогов               //
//****************************************************************************//
function View_FZTaxNets(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;AParameter:TZTaxNetsParameters):variant;stdcall;
var ViewForm: TFZTaxNets;
    Res:variant;
begin
ViewForm:=TFZTaxNets.Create(AOwner,DB_Handle,AParameter);
if ViewForm.ModalResult=mrNone then
 ViewForm.ShowModal;
 if AParameter.ControlFormStyle=zcfsInsert then
  begin
   Res:=VarArrayCreate([0,1],varVariant);
   Res[1]:=ViewForm.Parameter.ID_TAX;
  end
 else
   Res:=VarArrayCreate([0,0],varVariant);
Res[0]:=ViewForm.ModalResult;
ViewForm.Free;
View_FZTaxNets:=res;
end;

constructor TFZTaxNets.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;AParameter:TZTaxNetsParameters);
begin
 Inherited Create(AOwner);
 PParameter:=AParameter;
 PDB_Handle:=DB_Handle;
 PLanguageIndex:=LanguageIndex;
//******************************************************************************
 EditMinSumma.Properties.EditMask := '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+ZSystemDecimalSeparator+']\d\d?)?';
 EditMaxSumma.Properties.EditMask := '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+ZSystemDecimalSeparator+']\d\d?)?';
 EditAddSumma.Properties.EditMask := '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+ZSystemDecimalSeparator+']\d\d?)?';
 EditPercent.Properties.EditMask  := '(100) | (\d\d? (['+ZSystemDecimalSeparator+']\d\d?)?)';
//******************************************************************************
 YesBtn.Caption        := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption     := CancelBtn_Caption[PLanguageIndex];
 LabelMinSumma.Caption := LabelMin_Caption[PLanguageIndex];
 LabelMaxSumma.Caption := LabelMax_Caption[PLanguageIndex];
 LabelPercent.Caption  := LabelPercent_Caption[PLanguageIndex];
 LabelAddSumma.Caption := LabelAddSumma_Caption[PLanguageIndex];
 LabelAddText.Caption  := LabelAddTextForVO_Caption[PLanguageIndex];
 case PParameter.ControlFormStyle of
  zcfsInsert:
  begin
   self.Caption             := ZTaxNets_Caption_Insert[PLanguageIndex];
  end;
  zcfsUpdate:
  begin
   self.Caption             := ZTaxNets_Caption_Update[PLanguageIndex];
   EditMinSumma.Text        := IfThen(PParameter.Summa_Min<>0,FloatToStr(PParameter.Summa_Min),'0');
   EditMaxSumma.Text        := IfThen(PParameter.Summa_Max<>0,FloatToStr(PParameter.Summa_Max),'0');
   EditPercent.Text         := IfThen(PParameter.Percent<>0,FloatToStr(PParameter.Percent),'0');
   EditAddSumma.Text        := IfThen(PParameter.Add_Summa<>0,FloatToStr(PParameter.Add_Summa),'0');
   EditAddText.Text         := PParameter.Add_Text;
  end;
  zcfsShowDetails:
  begin
   self.Caption             := ZTaxNets_Caption_Detail[PLanguageIndex];
   EditMinSumma.Text        := IfThen(PParameter.Summa_Min<>0,FloatToStr(PParameter.Summa_Min),'0');
   EditMaxSumma.Text        := IfThen(PParameter.Summa_Max<>0,FloatToStr(PParameter.Summa_Max),'0');
   EditPercent.Text         := IfThen(PParameter.Percent<>0,FloatToStr(PParameter.Percent),'0');
   EditAddSumma.Text        := IfThen(PParameter.Add_Summa<>0,FloatToStr(PParameter.Add_Summa),'0');
   EditAddText.Text         := PParameter.Add_Text;
   self.CancelBtn.Caption   := ExitBtn_Caption[PLanguageIndex];
   self.YesBtn.Visible      := False;
   Box.Enabled:=False;
  end;
 end;
end;

procedure TFZTaxNets.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFZTaxNets.YesBtnClick(Sender: TObject);
begin
if StrToFloat(EditAddSumma.Text) > StrToFloat(EditMinSumma.Text) then
 begin
  ZShowMessage(ZeInputError_Caption[PLanguageIndex],ZeInputErrorAddSum_Text[PLanguageIndex],mtWarning,[mbOK]);
  EditMinSumma.SetFocus;
 end
else
 if StrToFloat(EditMaxSumma.Text) < StrToFloat(EditMinSumma.Text) then
  begin
   ZShowMessage(ZeInputError_Caption[PLanguageIndex],ZeInputErrorMinMax_Text[PLanguageIndex],mtWarning,[mbOK]);
   EditMinSumma.SetFocus;
  end
 else
  case PParameter.ControlFormStyle of
   zcfsInsert:
    try
     DB.Handle:=PDB_Handle;
     StoredProc.Database:=DB;
     StoredProc.Transaction:=WriteTransaction;
     StoredProc.Transaction.StartTransaction;
     StoredProc.StoredProcName:='Z_TAX_NETS_I';
     StoredProc.Prepare;
     StoredProc.ParamByName('ID_TAX_NET_PERIOD').AsInteger := PParameter.ID_TAX_NET_PERIOD;
     StoredProc.ParamByName('SUM_MIN').AsDouble:= StrToFloat(EditMinSumma.Text);
     StoredProc.ParamByName('SUM_MAX').AsDouble:= StrToFloat(EditMaxSumma.Text);
     StoredProc.ParamByName('PERCENT').AsDouble:= StrToFloat(EditPercent.Text);
     StoredProc.ParamByName('ADD_SUM').AsDouble:= StrToFloat(EditAddSumma.Text);
     StoredProc.ParamByName('ADD_TEXT').AsString:= EditAddText.Text;
     StoredProc.ExecProc;
     PParameter.ID_TAX:=StoredProc.ParamByName('ID_TAX').AsInteger;
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
     StoredProc.StoredProcName:='Z_TAX_NETS_U';
     StoredProc.Prepare;
     StoredProc.ParamByName('ID_TAX').AsInteger := PParameter.ID_TAX;
     StoredProc.ParamByName('ID_TAX_NET_PERIOD').AsInteger := PParameter.ID_TAX_NET_PERIOD;
     StoredProc.ParamByName('SUM_MIN').AsDouble:= StrToFloat(EditMinSumma.Text);
     StoredProc.ParamByName('SUM_MAX').AsDouble:= StrToFloat(EditMaxSumma.Text);
     StoredProc.ParamByName('PERCENT').AsDouble:= StrToFloat(EditPercent.Text);
     StoredProc.ParamByName('ADD_SUM').AsDouble:= StrToFloat(EditAddSumma.Text);
     StoredProc.ParamByName('ADD_TEXT').AsString:= EditAddText.Text;
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

procedure TFZTaxNets.FormCreate(Sender: TObject);
begin
if PParameter.ControlFormStyle=zcfsDelete then
begin
 if ZShowMessage(ZTaxNets_Caption_Delete[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
  try
   DB.Handle:=PDB_Handle;
   StoredProc.Database:=DB;
   StoredProc.Transaction:=WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName:='Z_TAX_NETS_D';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_TAX').AsInteger := PParameter.ID_TAX;
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

procedure TFZTaxNets.EditAddTextKeyPress(Sender: TObject; var Key: Char);
begin
if Length(EditAddText.Text)>=50 then Key:=#0;
end;

end.
