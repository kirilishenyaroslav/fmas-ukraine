unit ImportCurrentPremiya_Filter;

interface

uses
  Windows, Messages, IBase, DB, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxGroupBox, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxLabel, cxDropDownEdit, cxCalendar, cxCheckBox, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, ExtCtrls,ImportCurrentPremiya_Type,ImportCurrentPremiya_DM;

type TimportFilter = record
 is_period_P:Boolean;
 is_period_N:Boolean;
 is_type:Boolean;
 oldFilterDataBegN:TDate;
 oldFilterDataEndN:TDate;
 oldFilterDataBegP:TDate;
 oldFilterDataEndP:TDate;
 FilterDataBegN:TDate;
 FilterDataEndN:TDate;
 FilterDataBegP:TDate;
 FilterDataEndP:TDate;
 Filter_session:Int64;
end;

type
  TfmFilterForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    CheckBoxPeriodP: TcxCheckBox;
    CheckBoxPeriodN: TcxCheckBox;
    DateEditBegP: TcxDateEdit;
    DateEditEndP: TcxDateEdit;
    DateEditBegN: TcxDateEdit;
    DateEditEndN: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxButtonOk: TcxButton;
    cxButtonCancel: TcxButton;
    cxLabel2: TcxLabel;
    ButtonType: TcxButton;
    CheckBoxType: TcxCheckBox;
    procedure CheckBoxTypeClick(Sender: TObject);
    procedure CheckBoxPeriodPClick(Sender: TObject);
    procedure CheckBoxPeriodNClick(Sender: TObject);
    procedure cxButtonCancelClick(Sender: TObject);
    procedure cxButtonOkClick(Sender: TObject);
    procedure ButtonTypeClick(Sender: TObject);
  private
    PParameter:TimportFilter;
    PDb_Handle:TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;FParameter:TimportFilter);reintroduce;
    property Parameter:TimportFilter read PParameter;
  end;

var
  fmFilterForm: TfmFilterForm;

implementation
uses ZProc,ImportCurrentPremiya_MainForm;
{$R *.dfm}

constructor TfmFilterForm.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;FParameter:TimportFilter);
begin
 inherited Create(AOwner);
 PParameter := FParameter;
 PDb_Handle := ADB_Handle;

 DateEditBegP.Date       := PParameter.oldFilterDataBegP;
 DateEditEndP.Date       := PParameter.oldFilterDataEndP;
 DateEditBegN.Date       := PParameter.oldFilterDataBegN;
 DateEditEndN.Date       := PParameter.oldFilterDataEndN;
 CheckBoxPeriodP.Checked := PParameter.is_period_P;
 CheckBoxPeriodN.Checked := PParameter.is_period_N;
 CheckBoxType.Checked    := PParameter.is_type;

//******************************************************************************

end;

procedure TfmFilterForm.CheckBoxTypeClick(Sender: TObject);
begin
    ButtonType.Enabled   := CheckBoxType.Checked;
end;

procedure TfmFilterForm.CheckBoxPeriodPClick(Sender: TObject);
begin
    DateEditBegP.Enabled   := CheckBoxPeriodP.Checked;
    DateEditEndP.Enabled   := CheckBoxPeriodP.Checked;
end;

procedure TfmFilterForm.CheckBoxPeriodNClick(Sender: TObject);
begin
    DateEditBegN.Enabled   := CheckBoxPeriodN.Checked;
    DateEditEndN.Enabled   := CheckBoxPeriodN.Checked;
end;

procedure TfmFilterForm.cxButtonCancelClick(Sender: TObject);
begin
Close;
end;

procedure TfmFilterForm.cxButtonOkClick(Sender: TObject);
begin
 if (CheckBoxPeriodP.Checked)   then
   begin
    PParameter.is_period_P       := true;
    PParameter.FilterDataBegP    := DateEditBegP.Date;
    PParameter.FilterDataEndP    := DateEditEndP.Date;
    PParameter.oldFilterDataBegP := DateEditBegP.Date;
    PParameter.oldFilterDataEndP := DateEditEndP.Date;
   end
 else
  begin
   PParameter.is_period_P    := False;
   PParameter.FilterDataBegP := StrToDate('01.01.1900');
   PParameter.FilterDataEndP := StrToDate('31.12.9999');
  end;

  if (CheckBoxPeriodN.Checked)   then
   begin
    PParameter.is_period_N       := true;
    PParameter.FilterDataBegN    := DateEditBegN.Date;
    PParameter.FilterDataEndN    := DateEditEndN.Date;
    PParameter.oldFilterDataBegN := DateEditBegN.Date;
    PParameter.oldFilterDataEndN := DateEditEndN.Date;
   end
  else
   begin
    PParameter.is_period_N    := False;
    PParameter.FilterDataBegN := StrToDate('01.01.1900');
    PParameter.FilterDataEndN := StrToDate('31.12.9999');
   end;

  if (CheckBoxType.Checked)   then
    begin
      PParameter.is_type    := true;
    end ;

  if not(CheckBoxType.Checked) then
    begin
      PParameter.is_type       := False;

     { DM.WriteTransaction.StartTransaction;
      {DM.DSet_.Close;
      ShowMessage(IntToStr(PParameter.Filter_session));
      DM.DSet_.SelectSQL.Text := 'DELETE FROM Z_IMP_CUR_PREMIYA_TYPE where ID_SESSION='+IntToStr(PParameter.Filter_session)+';';
      DM.DSet_.Open;
      DM.pFIBStoredProc.StoredProcName                    := 'Z_IMP_CUR_PREM_TYPE_DEL';
      DM.pFIBStoredProc.ParamByName('ID_TYPE').Value      := null;
      DM.pFIBStoredProc.ParamByName('ID_SESSION').AsInt64 := PParameter.Filter_session;
      DM.pFIBStoredProc.ExecProc;
      DM.WriteTransaction.Commit;   }

      DM.pFIBStoredProc.Transaction.StartTransaction;
      DM.pFIBStoredProc.StoredProcName                    := 'Z_IMP_CUR_PREM_TYPE_DEL';
      DM.pFIBStoredProc.ParamByName('ID_SESSION').AsInt64 := PParameter.Filter_session;
      DM.pFIBStoredProc.ParamByName('ID_TYPE').AsVariant  := null;
      DM.pFIBStoredProc.ExecProc;
      DM.pFIBStoredProc.Transaction.Commit;
    end;

 ModalResult := mrYes;

end;

procedure TfmFilterForm.ButtonTypeClick(Sender: TObject);
var
  id:Integer;
  ViewForm : TfmImpType;
begin
  id:=PParameter.Filter_session;
  ViewForm := TfmImpType.Create(Self,DM.DB.Handle,id);
  ViewForm.ShowModal;
end;

end.
