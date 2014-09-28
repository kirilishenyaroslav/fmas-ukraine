unit uPrintKanditDog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cn_Common_Types, uPrintKanditDog_DM, cxLookAndFeelPainters,
  StdCtrls, cxButtons, ActnList, cxLabel, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls, cxGroupBox, frxDesgn,
  frxClass, frxDBSet, frxExportXLS, frxExportRTF, frxExportImage,
  frxExportPDF, frxExportHTML, frxBarcode;

type
  TfrmPrintKanditDog = class(TForm)
    Button_print: TcxButton;
    Button_cancel: TcxButton;
    cxGroupBox1: TcxGroupBox;
    Date_Beg_DateEdit: TcxDateEdit;
    Date_End_DateEdit: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    ActionList1: TActionList;
    acDebug: TAction;
    close_act: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button_cancelClick(Sender: TObject);
    procedure close_actExecute(Sender: TObject);
    procedure acDebugExecute(Sender: TObject);
    procedure Button_printClick(Sender: TObject);
  private
    IsDebugMode : Boolean;
    DM : TfrmPrintKanditDog_DM;
  public
    constructor Create(AParameter:TcnSimpleParamsEx);reintroduce;
  end;

 function ShowPrintKanditDog(AParameter:TcnSimpleParamsEx):Variant;stdcall;
  exports ShowPrintKanditDog;

var
  frmPrintKanditDog: TfrmPrintKanditDog;

implementation

uses FIBQuery;

{$R *.dfm}

function ShowPrintKanditDog(AParameter:TcnSimpleParamsEx):Variant;
var
  ViewForm:TfrmPrintKanditDog;
begin
  ViewForm := TfrmPrintKanditDog.Create(AParameter);
  ViewForm.FormStyle:= fsNormal;
  ViewForm.ShowModal;
  ViewForm.free;
end;

procedure TfrmPrintKanditDog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.free;
end;

procedure TfrmPrintKanditDog.FormCreate(Sender: TObject);
var
  day, month, year : word;
begin
  IsDebugMode := False;
  Caption:='–еЇстр кандидат≥в';
  DecodeDate(now, year, month, day);
  Date_Beg_DateEdit.EditValue := EncodeDate(year,month,1);
  Date_End_DateEdit.EditValue := EncodeDate(year,month+1,1)-1;
end;

procedure TfrmPrintKanditDog.Button_cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPrintKanditDog.close_actExecute(Sender: TObject);
begin
  Button_cancel.SetFocus; 
end;

procedure TfrmPrintKanditDog.acDebugExecute(Sender: TObject);
begin
    if IsDebugMode then
                  Begin
                   IsDebugMode:=false;
                   Caption:='–еЇстр кандидат≥в';
                  End
                 Else
                  Begin
                   IsDebugMode:=true;
                   Caption:=Caption+' *debug';
                  End;
end;

constructor TfrmPrintKanditDog.Create(AParameter:TcnSimpleParamsEx);
begin
  inherited Create(AParameter.Owner);
  DM := TfrmPrintKanditDog_DM.Create(self);

  DM.Database.Handle := AParameter.Db_Handle;
  DM.Database.Connected := True;
  DM.Transaction.StartTransaction;
End;

procedure TfrmPrintKanditDog.Button_printClick(Sender: TObject);
begin
  Screen.Cursor:=crHourGlass;

  DM.Report.Clear;
  DM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\' + 'PrintKanditDog.fr3');
  DM.Report.Variables.Clear;

  DM.DataSet.Close;
  DM.DataSet.SQLs.SelectSQL.Text := 'Select * from CN_DT_SELECT_KANDIT_TWO_DOGS(:date_beg,:date_end) Order by fio_upper';
  DM.DataSet.ParamByName('Date_Beg').AsDate := Date_Beg_DateEdit.EditValue;
  DM.DataSet.ParamByName('Date_End').AsDate := Date_End_DateEdit.EditValue;
  DM.DataSet.Open;

  DM.Report.PrepareReport(True);
  if IsDebugMode then
   Begin
    Screen.Cursor:=crDefault;
    DM.Report.DesignReport
   End
   else DM.Report.ShowReport;

  Screen.Cursor:=crDefault;
end;

end.
 