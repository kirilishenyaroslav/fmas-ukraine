unit uPrint_Reestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  st_common_funcs, st_ConstUnit, iBase, st_Common_types, DM_account;

type
  TfrmPrint_reestr = class(TForm)
    Button_print: TcxButton;
    Button_cancel: TcxButton;
    ActionList1: TActionList;
    Act_debug: TAction;
    act_exit: TAction;
    act_print: TAction;
    procedure Button_cancelClick(Sender: TObject);
    procedure Act_debugExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure act_exitExecute(Sender: TObject);
    procedure act_printExecute(Sender: TObject);
    procedure Button_printClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    PLanguageIndex : integer;
    is_debug : Boolean;
    DM : TDM_acc;
    id_account : Int64;
  public
    constructor Create(aParametr : TstSimpleParams);reintroduce;
  end;

var
  frmPrint_reestr: TfrmPrint_reestr;

implementation

{$R *.dfm}

procedure TfrmPrint_reestr.Button_cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPrint_reestr.Act_debugExecute(Sender: TObject);
begin
  if is_debug then
   begin
    Caption := 'Реєстр нарахувань';
    is_debug := False;
   end
  else
   begin              
    Caption := 'Реєстр нарахувань *Debug';
    is_debug := True;
   end;
end;

procedure TfrmPrint_reestr.FormShow(Sender: TObject);
begin
  PLanguageIndex := stLanguageIndex;

  is_debug := False;

  Button_print.Caption := st_ConstUnit.st_Print_Caption[planguageIndex];
  Button_print.Hint    := st_ConstUnit.st_PrintBtn_ShortCut[planguageIndex];

  Button_cancel.Caption := st_ConstUnit.st_ExitBtn_Caption[planguageIndex];
  Button_cancel.Hint    := st_ConstUnit.st_ExitBtn_ShortCut[planguageIndex];
end;

procedure TfrmPrint_reestr.act_exitExecute(Sender: TObject);
begin
  Button_cancelClick(Self);
end;

procedure TfrmPrint_reestr.act_printExecute(Sender: TObject);
begin
  Button_printClick(Self);
end;

procedure TfrmPrint_reestr.Button_printClick(Sender: TObject);
begin
  DM.DataSet_report_master.Close;
  DM.DataSet_report_master.SQLs.SelectSQL.Text := 'Select * from ST_DT_ACCOUNT_DATA_SELECT(:id_acc) order by FIO';
  DM.DataSet_report_master.ParamByName('id_acc').AsInt64 := id_account;
  DM.DataSet_report_master.Open;

  DM.Report_main.Clear;
  DM.Report_main.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'Acc_reestr.fr3');
  DM.Report_main.Variables.Clear;
  DM.Report_main.PrepareReport(true);

  if is_debug
   then DM.Report_main.DesignReport
   else DM.Report_main.ShowReport;
end;

constructor TfrmPrint_reestr.Create(aParametr: TstSimpleParams);
begin
  inherited Create(aParametr.Owner);

  DM := TDM_acc.Create(self);
  DM.DB.Handle := aParametr.Db_Handle;
  DM.DB.Connected := true;
  DM.Transaction_read.StartTransaction;

  id_account := aParametr.ID_Locate; 
end;

procedure TfrmPrint_reestr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.Free;
end;

end.
