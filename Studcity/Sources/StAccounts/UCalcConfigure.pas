unit uCalcConfigure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxCheckBox, StdCtrls, cxButtons, ExtCtrls, cxTextEdit, cxRadioGroup,
  cxMaskEdit, cxButtonEdit, iBase,
  FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc,
  LoadPackegeStudCity, St_Loader_Unit;

type
  TfrmCalcConfigure = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    Calc: TcxCheckBox;
    Recalc: TcxCheckBox;
    cxButton2: TcxButton;
    rbAll: TcxRadioButton;
    rbFixedKod: TcxRadioButton;
    edFixedKode: TcxButtonEdit;
    rbFilter: TcxRadioButton;
    cxButtonFilter: TcxButton;
    pFIBDatabase1: TpFIBDatabase;
    StProc: TpFIBStoredProc;
    pFIBTransaction1: TpFIBTransaction;
    CheckCalc: TcxCheckBox;
    CheckBox_revers: TcxCheckBox;
    Panel3: TPanel;
    Panel4: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure rbFixedKodClick(Sender: TObject);
    procedure rbAllClick(Sender: TObject);
    procedure edFixedKodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rbFilterClick(Sender: TObject);
    procedure cxButtonFilterClick(Sender: TObject);
  private
    aHandle : TISC_DB_HANDLE;
  public
    ID_SESSION_FILTER: Int64;
    IdFixedKod:Int64;
    Res: Variant;
    constructor create(aOwner : TComponent; bHandle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

{$R *.dfm}

uses UMainAccounts;

constructor TfrmCalcConfigure.create(aOwner : TComponent; bHandle:TISC_DB_HANDLE);
begin
  inherited create(aOwner);
  aHandle := bHandle;

  pFIBDatabase1.Handle:=aHandle;
  pFIBTransaction1.StartTransaction;
  pFIBDatabase1.Open;
  StProc.StoredProcName:='ST_DT_REPORTS_TRANSACTION';
  StProc.Prepare;
  try
    StProc.ExecProc;
  except
    begin
      pFIBTransaction1.Rollback;
      Exit;
    end;
   end;
  ID_SESSION_FILTER := StProc.FieldByName('ID_TRANSACTION').AsInt64;
  try
   StProc.Transaction.Commit;
   except
    on E:Exception do
     begin
      ShowMessage(e.Message);
      StProc.Transaction.Rollback;
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
               cxButtonFilter.Enabled:=False;
     end
     else begin
               edFixedKode.Enabled:=false;
               cxButtonFilter.Enabled:=False;
     end;
end;

procedure TfrmCalcConfigure.rbAllClick(Sender: TObject);
begin
     if rbAll.Checked
     then begin
               edFixedKode.Enabled:=false;
               cxButtonFilter.Enabled:=false;
     end;
end;

procedure TfrmCalcConfigure.edFixedKodePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var Res:Variant;
begin
     Res:=St_Loader_Unit.Load_st_BuildLivers(self,
                                        aHandle,
                                        true,'','',0.001,true);
     if (VarArrayDimCount(Res)>0)
     then begin
               self.IdFixedKod      :=Res[0][0];
               self.edFixedKode.Text:=Res[0][10];
     end;
end;

procedure TfrmCalcConfigure.rbFilterClick(Sender: TObject);
begin
     if rbFilter.Checked
     then begin
               edFixedKode.Enabled:=false;
               cxButtonFilter.Enabled:=true;
     end
end;

procedure TfrmCalcConfigure.cxButtonFilterClick(Sender: TObject);
begin
  LoadPackegeStudCity.LoadReportsFilter(self,aHandle,ID_SESSION_FILTER);
end;

end.
