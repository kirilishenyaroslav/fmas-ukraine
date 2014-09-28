unit TuTimesheet_Sign;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  ExtCtrls,TuCommonLoader, cxImage,  RxGIF,TuMessages, gr_uCommonLoader,
  cxDropDownEdit, cxCalendar,TUCommonConsts,AccMGMT,PackageLoad;

type
  TFormTshSign = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    EditResponsible: TcxButtonEdit;
    EditHead: TcxButtonEdit;
    EditPersonnel: TcxButtonEdit;
    ButtonYes: TcxButton;
    ButtonCancel: TcxButton;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    EditResponsiblePost: TcxTextEdit;
    EditHeadPost: TcxTextEdit;
    EditPersonnelPost: TcxTextEdit;
    EditDatePrint: TcxDateEdit;
    cxLabel4: TcxLabel;
    procedure EditResponsiblePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditHeadPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditPersonnelPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    FKodSetup :integer;
    FIdManResponsible:variant;
    FIdManHead:variant;
    FIdManPersonnel:variant;
    FTYPE_ID:integer;
    FIdTshGroup:variant;
  public

  end;
function IsTshSign (AOwner:TComponent;AIdTshGroup:variant;AKodSetup:integer):Boolean;

implementation

uses TuTimesheet_DM;

{$R *.dfm}
function IsTshSign (AOwner:TComponent; AIdTshGroup:variant; AKodSetup:integer):Boolean;
var Form :TFormTshSign;
begin

      if (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work/TU_TimeSheet','Print')=0)
     or (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work','Print')=0)
     then
     else
     begin
       MessageBox(null, 'Ви не маєте права до цієї дії!','Увага!', MB_OK or MB_ICONWARNING);
       exit;
     end;
Form:=TFormTshSign.Create(AOwner);
Form.FIdTshGroup:=AIdTshGroup;
Form.FKodSetup:=AKodSetup;
with dm.StProc do
begin
  Transaction.StartTransaction;
  StoredProcName:='TU_TSH_GROUP_S';
  Prepare;
  ParamByName('ID_TSH_GROUP').AsInteger:=AIdTshGroup;
  ExecProc;
  Form.FIdManResponsible:=ParamByName('id_man_Responsible').AsInteger;
  Form.FIdManHead:=ParamByName('id_man_head').AsInteger;
  Form.FIdManPersonnel:=ParamByName('id_man_personnel').AsInteger;

  Form.EditResponsible.Text:=ParamByName('fio_responsible').AsString;
  Form.EditHead.Text:=ParamByName('fio_head').AsString;
  Form.EditPersonnel.text:=ParamByName('fio_personnel').AsString;

  Form.EditResponsiblePost.Text:=ParamByName('post_responsible').AsString;
  Form.EditHeadPost.Text:=ParamByName('post_head').AsString;
  Form.EditPersonnelPost.Text:=ParamByName('Post_personnel').AsString;
  Form.EditDatePrint.Date:=ParamByName('DATE_PRINT').AsDate;
  Transaction.commit;
end  ;
if  Form.ShowModal =mrYes then
begin
  dm.DatePrint:=Form.EditDatePrint.date;
  if dm.DsetprintInfo.Active then dm.DsetprintInfo.close;
  dm.DsetprintInfo.SQLs.SelectSQL.Text:='select * from  TU_TSH_GROUP_S('+inttostr(dm.DSetPeriodType['ID_TSH_GROUP'])+')';
  dm.DsetprintInfo.open;
  Dm.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReports+'PrintTimeSheet.fr3',True);

  DM.Report.DesignReport
 // DM.Report.ShowReport;
end
end;


procedure TFormTshSign.EditResponsiblePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin
  Res:=LoadSimplePackage(self,DM.DB.Handle,'Zarplata\SpSotr.bpl','View_SpSotr');;
  if VarIsArray(Res)  then
  begin
    FIdManResponsible:=Res[0];
    EditResponsible.Text:= Res[2];
    if EditResponsiblePost.Text='' then  EditResponsiblePost.Text:= Res[3];
  end;
end;

procedure TFormTshSign.EditHeadPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin
  Res:=LoadSimplePackage(self,DM.DB.Handle,'Zarplata\SpSotr.bpl','View_SpSotr');;
  if VarIsArray(Res)  then
  begin
    FIdManHead:=Res[0];
    EditHead.Text:= Res[2];
    if EditHeadPost.Text='' then  EditHeadPost.Text:= Res[3];
  end;
end;

procedure TFormTshSign.EditPersonnelPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var Res:Variant;
begin
  Res:=LoadSimplePackage(self,DM.DB.Handle,'Zarplata\SpSotr.bpl','View_SpSotr');;
  if VarIsArray(Res)  then
  begin
    FIdManPersonnel:=Res[0];
    EditPersonnel.Text:= Res[2];
    if EditPersonnelPost.Text='' then  EditPersonnelPost.Text:= Res[3];
  end;
end;

procedure TFormTshSign.ActionYesExecute(Sender: TObject);
begin



with Dm.StProc do
begin
  Transaction.StartTransaction;
  StoredProcName:='TU_TEMPLATE_PRINT_INFO_U';
  Prepare;
  ParamByName('id').AsInteger:=FIdTshGroup;
  ParamByName('id_man_responsible').AsInteger:=FIdManResponsible;
  ParamByName('id_man_head').AsInteger:=FIdManHead;
  ParamByName('id_man_personnel').AsInteger:=FIdManPersonnel;
  ParamByName('post_responsible').AsString:=EditResponsiblePost.Text;
  ParamByName('post_head').AsString:=EditHeadPost.Text;
  ParamByName('post_personnel').AsString:=EditPersonnelPost.Text;
  ExecProc;
  Transaction.Commit;
end;

      ModalResult:=mryes;

end;

procedure TFormTshSign.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrcancel
end;

end.
