unit uPrintRegDog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cn_Common_Types, uPrintRegDog_DM, cxLookAndFeelPainters,
  StdCtrls, cxButtons, ActnList, cxLabel, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls, cxGroupBox, frxDesgn,
  frxClass, frxDBSet, frxExportXLS, frxExportRTF, frxExportImage,
  frxExportPDF, frxExportHTML, frxBarcode;

type
  TfrmPrintRegDog = class(TForm)
    ActionList1: TActionList;
    acDebug: TAction;
    close_act: TAction;
    Button_print: TcxButton;
    Button_cancel: TcxButton;
    cxGroupBox1: TcxGroupBox;
    Date_Beg_DateEdit: TcxDateEdit;
    Date_End_DateEdit: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button_cancelClick(Sender: TObject);
    procedure close_actExecute(Sender: TObject);
    procedure acDebugExecute(Sender: TObject);
    procedure Button_printClick(Sender: TObject);
  private
    IsDebugMode : Boolean;
    DM : TfrmPrintRegDog_DM; 
  public
    constructor Create(AParameter:TcnSimpleParamsEx);reintroduce;
  end;

 function ShowPrintRegDog(AParameter:TcnSimpleParamsEx):Variant;stdcall;
  exports ShowPrintRegDog;

var
  frmPrintRegDog: TfrmPrintRegDog;

implementation

{$R *.dfm}

function ShowPrintRegDog(AParameter:TcnSimpleParamsEx):Variant;
var
  ViewForm:TfrmPrintRegDog;
begin
  ViewForm := TfrmPrintRegDog.Create(AParameter);
  ViewForm.FormStyle:= fsNormal;
  ViewForm.ShowModal;
  ViewForm.free;
end;

procedure TfrmPrintRegDog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.free;
end;

procedure TfrmPrintRegDog.FormCreate(Sender: TObject);
var
  day, month, year : word;
begin
  IsDebugMode := False;
  Caption:='–еЇстр договор≥в';
  DecodeDate(now, year, month, day);
  Date_Beg_DateEdit.EditValue := EncodeDate(year,month,1);
  Date_End_DateEdit.EditValue := EncodeDate(year,month+1,1)-1;
end;

procedure TfrmPrintRegDog.Button_cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPrintRegDog.close_actExecute(Sender: TObject);
begin
  Button_cancel.SetFocus; 
end;

procedure TfrmPrintRegDog.acDebugExecute(Sender: TObject);
begin
    if IsDebugMode then
                  Begin
                   IsDebugMode:=false;
                   Caption:='–еЇстр договор≥в';
                  End
                 Else
                  Begin
                   IsDebugMode:=true;
                   Caption:=Caption+' *debug';
                  End;
end;

constructor TfrmPrintRegDog.Create(AParameter:TcnSimpleParamsEx);
begin
  inherited Create(AParameter.Owner);
  DM := TfrmPrintRegDog_DM.Create(self);

  DM.Database.Handle := AParameter.Db_Handle;
  DM.Database.Connected := True;
  DM.Transaction.StartTransaction;
End;

procedure TfrmPrintRegDog.Button_printClick(Sender: TObject);
begin
  Screen.Cursor:=crHourGlass;

  DM.Report.Clear;
  DM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\' + 'PrintRegDog.fr3');
  DM.Report.Variables.Clear;

  DM.DataSet.Close;
  DM.DataSet.SQLs.SelectSQL.Text := 'Select * from cn_get_info_about_dog(:date_beg,:date_end) Order by date_reg,FIO_Creator, FIO';
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
 