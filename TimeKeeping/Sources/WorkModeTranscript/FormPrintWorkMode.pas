unit FormPrintWorkMode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, ActnList, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxControls, cxContainer, cxEdit, cxLabel,
  StdCtrls, cxButtons,PackageLoad,TuCommonLoader,TuCommonConsts,TuCommonProc;

type
  TFormPrt = class(TForm)
    Panel2: TPanel;
    ButtonYes: TcxButton;
    ButtonCancel: TcxButton;
    Panel1: TPanel;
    LabelPogod: TcxLabel;
    ButtonEditPogod: TcxButtonEdit;
    ButtonEditZatver: TcxButtonEdit;
    LabelZarver: TcxLabel;
    ButtonEditZavBuh: TcxButtonEdit;
    LabelZavBuh: TcxLabel;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    EditPogod: TcxLabel;
    EditZatver: TcxLabel;
    EditZavBuh: TcxLabel;
    procedure ActionYesExecute(Sender: TObject);
    procedure ButtonEditPogodPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditZatverPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditZavBuhPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActionCancelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    id:Integer;
    Shift:integer;
    year:Integer;
  end;

var
  FormPrt: TFormPrt;

implementation

uses SpWorkModeTranscript_DM;

{$R *.dfm}

procedure TFormPrt.ActionYesExecute(Sender: TObject);
var ResultView:Variant;
begin
  DModule.StProc.Transaction.Active:=true;
  DModule.StProc.StoredProcName:='TU_WORK_MODE_PRT_U';
  DModule.StProc.Prepare;
  DModule.StProc.ParamByName('ID_WORK_MODE').AsInteger    :=Id;
  DModule.StProc.ParamByName('FIO_COORDINATING').AsString :=ButtonEditPogod.Text;
  DModule.StProc.ParamByName('FIO_APPROVER').AsString     :=ButtonEditZatver.Text;
  DModule.StProc.ParamByName('FIO_SIGNING').AsString      :=ButtonEditZavBuh.Text;
  DModule.StProc.ParamByName('POST_COORDINATING').AsString:=EditPogod.Caption;
  DModule.StProc.ParamByName('POST_APPROVER').AsString    :=EditZatver.Caption;
  DModule.StProc.ParamByName('POST_SIGNING').AsString     :=EditZavBuh.Caption;
  DModule.StProc.ExecProc;
  DModule.StProc.Transaction.Commit;
  try
   DModule.StProc.Transaction.Active:=true;
   DModule.StProc.StoredProcName:='DT_WORK_MODE_SELECT_BY_KEY';
   DModule.StProc.Prepare;
   DModule.StProc.ParamByName('ID_WORK_MODE_IN').AsInteger :=Id;
   DModule.StProc.ExecProc;
   DModule.NameWorkMode:= DModule.StProc.ParamByName('NAME').asstring;
   if DModule.StProc.ParamByName('IS_SMENA').asstring ='T'then
    DModule.NameWorkMode:= DModule.NameWorkMode+#13#10+'«Ï≥Ì‡ '+inttostr(Shift+1);
   DModule.DataSet.Close;
   DModule.DataSet1.Close;
   DModule.DataSet.SQLs.SelectSQL.Text:='SELECT * FROM TU_WORK_MODE_PRINT('+IntToStr(Id)+','+
                                  IntToStr(year)+','+IntToStr(Shift)+')';
  DModule.DataSet1.SQLs.SelectSQL.Text:='SELECT * FROM TU_WORK_MODE_PRT_S('+inttostr(id)+')';
  Dmodule.Year_:=inttostr(year);
  DModule.DataSet.Open;
  DModule.DataSet1.Open;
  DModule.Report.Clear;
  DModule.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReports+'PrintWorkMode.fr3',True);
  if TuDesignReport then
   DModule.Report.DesignReport
  else DModule.Report.ShowReport;
except
end;
ModalResult:=mrYes;
end;

procedure TFormPrt.ButtonEditPogodPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var ResultView:Variant;
begin
  ResultView:=LoadTuSpPost(Self,DModule.DB.Handle);
  if ResultView[1]<>'' then
  begin
   ButtonEditPogod.Text    := VarToStr(ResultView[0]);
   EditPogod.Caption    := VarToStr(ResultView[1]);
  end;

end;

procedure TFormPrt.ButtonEditZatverPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var ResultView:Variant;
begin
  ResultView:=LoadTuSpPost(Self,DModule.DB.Handle);
  if ResultView[1]<>'' then
  begin
   ButtonEditZatver.Text    := VarToStr(ResultView[0]);
   EditZatver.Caption    := VarToStr(ResultView[1]);
  end;

end;

procedure TFormPrt.ButtonEditZavBuhPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var ResultView:Variant;
begin
  ResultView:=LoadTuSpPost(Self,DModule.DB.Handle);
  if ResultView[1]<>'' then
  begin
   ButtonEditZavBuh.Text    := VarToStr(ResultView[0]);
   EditZavBuh.Caption    := VarToStr(ResultView[1]);
  end;
end;

procedure TFormPrt.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel
end;

procedure TFormPrt.FormShow(Sender: TObject);
begin
 Caption:=GetConst('Print','Button');
 LabelPogod.Caption:=GetConst('Coordinating','Label');
 LabelZarver.Caption:=GetConst('Approver','Label');
 LabelZavBuh.Caption:=GetConst('Signing','Label');
 ButtonYes.Caption:=GetConst('Yes','Button');
 ButtonCancel.Caption:=GetConst('Cancel','Button');
 DModule.StProc.Transaction.Active:=true;
 DModule.StProc.StoredProcName:='TU_WORK_MODE_PRT_S';
 DModule.StProc.Prepare;
 DModule.StProc.ParamByName('ID_WORK_MODE').AsInteger    :=Id;
 DModule.StProc.ExecProc;
 ButtonEditPogod.Text   :=DModule.StProc.ParamByName('FIO_COORDINATING').AsString ;
 ButtonEditZatver.Text  :=DModule.StProc.ParamByName('FIO_APPROVER').AsString     ;
 ButtonEditZavBuh.Text  :=DModule.StProc.ParamByName('FIO_SIGNING').AsString      ;
 EditPogod.Caption      :=DModule.StProc.ParamByName('POST_COORDINATING').AsString;
 EditZatver.Caption     :=DModule.StProc.ParamByName('POST_APPROVER').AsString    ;
 EditZavBuh.Caption     :=DModule.StProc.ParamByName('POST_SIGNING').AsString     ;
 DModule.StProc.Transaction.Commit;
end;

end.
