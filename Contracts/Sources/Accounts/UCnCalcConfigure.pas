unit uCnCalcConfigure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxCheckBox, StdCtrls, cxButtons, ExtCtrls, cxTextEdit, cxRadioGroup,
  cxMaskEdit, cxButtonEdit, cn_Common_Types, iBase, cn_Common_Loader,
  FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc,
  cn_Common_Funcs, cn_Common_Messages, cxDropDownEdit;

type
  TfrmCalcConfigure = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    pFIBDatabase1: TpFIBDatabase;
    StProc: TpFIBStoredProc;
    pFIBTransaction1: TpFIBTransaction;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    rbFixedKod: TcxRadioButton;
    edFixedKode: TcxButtonEdit;
    TextEdit_FIO: TcxTextEdit;
    rbFilter: TcxRadioButton;
    cxButtonFilter: TcxButton;
    DoCalc: TcxCheckBox;
    DoReversCalc: TcxCheckBox;
    DoRecalcByFilter: TcxRadioButton;
    DoRecalcWithoutFilter: TcxRadioButton;
    Recalc: TcxCheckBox;
    DoRecalcWithCheckEdit: TcxCheckBox;
    cxCheckBox1: TcxCheckBox;
    cbMonthBeg: TcxComboBox;
    cbYearBeg: TcxComboBox;
    Label1: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure rbFixedKodClick(Sender: TObject);
    procedure edFixedKodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rbFilterClick(Sender: TObject);
    procedure cxButtonFilterClick(Sender: TObject);
    procedure RecalcClick(Sender: TObject);
    procedure DoCalcClick(Sender: TObject);
  private
    aHandle : TISC_DB_HANDLE;
  public
    ID_SESSION_FILTER: Int64;
    Res: Variant;
    constructor create(aOwner : TComponent; bHandle:TISC_DB_HANDLE);overload;
  end;

implementation

{$R *.dfm}

uses UCnMainAccounts, BaseTypes, Resources_unitb, DateUtils;

constructor TfrmCalcConfigure.create(aOwner : TComponent; bHandle:TISC_DB_HANDLE);
var I:Integer;
begin
  inherited create(aOwner);
  aHandle := bHandle;

  pFIBDatabase1.Handle:=aHandle;
  pFIBDatabase1.Open;
  //start_sql_monitor;
  StProc.Transaction.StartTransaction;
  StProc.StoredProcName:='CN_DT_REPORTS_SESSION';
  StProc.Prepare;
  StProc.ExecProc;
  ID_SESSION_FILTER := StProc.ParamByName('ID_SESSION').AsInt64;
  try
   StProc.Transaction.Commit;
   except
    on E:Exception do
     begin
      cnShowMessage('Error in CN_DT_REPORTS_SESSION',e.Message,mtError,[mbOK]);
      StProc.Transaction.Rollback;
      //Send_mail(e.Message);
     end;
  end;
  cbMonthBeg.Properties.Items.Clear;

     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_01));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_02));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_03));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_04));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_05));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_06));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_07));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_08));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_09));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_10));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_11));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_12));


     for i:=0 to 25 do
     begin
          cbYearBeg.Properties.Items.Add(TRIM(IntToStr(2000+i)));
     end;

     cbMonthBeg.ItemIndex:=MonthOf(Date)-1;
     for i:=0 to cbYearBeg.Properties.Items.Count-1 do
     begin
           if pos(cbYearBeg.Properties.Items[i],IntToStr(YearOf(Date)))>0
           then begin
              cbYearBeg.ItemIndex:=i;
              break;
           end;
     end;
end;

procedure TfrmCalcConfigure.cxButton1Click(Sender: TObject);
begin
     


     if rbFixedKod.Checked then
     if edFixedKode.Text = '' then
     Begin
           ShowMessage('Необхідно ввести код!');
           exit;
     end;

     ModalResult:=mrYes;
end;

procedure TfrmCalcConfigure.cxButton2Click(Sender: TObject);
begin
  ModalResult:=mrNo;
end;

procedure TfrmCalcConfigure.rbFixedKodClick(Sender: TObject);
begin
     if rbFixedKod.Checked
     then begin
               edFixedKode.Enabled:=true;
               TextEdit_FIO.Enabled:=true;
               cxButtonFilter.Enabled:=False;
     end
     else begin
               edFixedKode.Enabled:=false;
               TextEdit_FIO.Enabled:=false;
               cxButtonFilter.Enabled:=False;
     end;
end;

procedure TfrmCalcConfigure.edFixedKodePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AParameter : TcnSimpleParamsEx;
  Res : Variant;
begin
  AParameter                              := TcnSimpleParamsEx.Create;
  AParameter.Owner                        := self;
  AParameter.Db_Handle                    := aHandle;
  AParameter.Formstyle                    := fsNormal;
  AParameter.WaitPakageOwner              := self;
  AParameter.ReturnMode                   := 'Single';

  Res := RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_ContractsList.bpl','ShowSPContractsList');
  AParameter.Free;

  If (varArrayDimCount(Res)>0) then
   Begin
    edFixedKode.Text := Res[0][1];
    TextEdit_FIO.Text := Res[0][4];
   end;
end;

procedure TfrmCalcConfigure.rbFilterClick(Sender: TObject);
begin
     if rbFilter.Checked
     then begin
               edFixedKode.Enabled:=false;
               TextEdit_FIO.Enabled:=false;
               cxButtonFilter.Enabled:=true;
     end
end;

procedure TfrmCalcConfigure.cxButtonFilterClick(Sender: TObject);
var
  AParameter:TcnSimpleParams;
begin
  //запускаю справочник отбора параметров обучения
  AParameter := TcnSimpleParams.Create;
  AParameter.Owner := self;
  AParameter.Db_Handle := aHandle;
  AParameter.Formstyle := fsNormal;
  AParameter.WaitPakageOwner := self;
  AParameter.ID_SESSION := ID_SESSION_FILTER;
  Res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_ReportsFilter.bpl','ShowReportFilter');
  AParameter.Free;
end;

procedure TfrmCalcConfigure.RecalcClick(Sender: TObject);
begin
    DoRecalcByFilter.Enabled:=Recalc.Checked;
    DoRecalcWithoutFilter.Enabled:=Recalc.Checked;
    DoRecalcWithCheckEdit.Enabled:=Recalc.Checked;
end;

procedure TfrmCalcConfigure.DoCalcClick(Sender: TObject);
begin
     DoReversCalc.Enabled:=DoCalc.Checked;
end;

end.
