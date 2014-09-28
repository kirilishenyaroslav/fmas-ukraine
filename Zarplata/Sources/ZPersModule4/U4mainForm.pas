unit U4mainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ibase, dates, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCalendar,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxControls, cxGridCustomView, cxGrid, cxGridBandedTableView, cxClasses,
  dxBar, dxBarExtItems,Pers4DModule,U4FormInsert,ZMessages, cxContainer,
  cxProgressBar, ComCtrls, dxStatusBar, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxDBEdit, StdCtrls, cxCheckBox;

type
  TfrmZPersModule4 = class(TForm)
    Styles: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    Grid: TcxGrid;
    GridDBTableView1: TcxGridDBTableView;
    GridDateBeg: TcxGridDBColumn;
    GridDateEnd: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    GridFam: TcxGridDBColumn;
    GridName: TcxGridDBColumn;
    GridOtch: TcxGridDBColumn;
    TIN: TcxGridDBColumn;
    ProgressBar: TProgressBar;
    BarManager: TdxBarManager;
    ButtonRefresh: TdxBarLargeButton;
    ButtonExit: TdxBarLargeButton;
    ButtonInsert: TdxBarLargeButton;
    ButtonDelete: TdxBarLargeButton;
    ExportBtn: TdxBarLargeButton;
    GroupBtn: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    ButtonUpdate: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton5: TdxBarLargeButton;
    ButtonForm: TdxBarLargeButton;
    dxStatusBar1: TdxStatusBar;
    GridDBTableView1DBColumn1: TcxGridDBColumn;
    dxBarLargeButton1: TdxBarLargeButton;
    ButtonSign: TdxBarLargeButton;
    ButtonNotSign: TdxBarLargeButton;
    cxDBComboBox1: TcxDBComboBox;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    PeriodsCB: TComboBox;
    GridDBTableView1DBColumn2: TcxGridDBColumn;
    GridDBTableView1DBColumn3: TcxGridDBColumn;
    GridDBTableView1DBColumn4: TcxGridDBColumn;
    GridDBTableView1DBColumn5: TcxGridDBColumn;
    clDOG_CPH: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonInsertClick(Sender: TObject);
    procedure ButtonUpdateClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure ButtonFormClick(Sender: TObject);

    procedure ButtonRefreshClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure GridDBTableView1DataControllerDataChanged(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ButtonSignClick(Sender: TObject);
    procedure ButtonNotSignClick(Sender: TObject);
    procedure GetPeriodsListBox;
  private
    FKodSetup:Integer;
    FIdReport:Integer;
    FIdAnketa:Variant;
    FId_person_doc:Integer;
    status:variant;
    ID_PERSON_FORM:integer;
    ID_PERSON_DOCUMENT:integer;
    id_form_status:Variant;
  public
    function getKodSetup:Integer;
    constructor Create(AOwner:TComponent;DBHanlde:TISC_DB_HANDLE;id_user:Int64;kodsetup:Integer;IdReport:integer;IdAnketa:Variant);reintroduce;
  end;



implementation

uses pFIBDataSet, FIBQuery, pFIBStoredProc, pFIBQuery;

{$R *.dfm}

procedure TfrmZPersModule4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DModule.Destroy;
  DModule:=nil;
  Action:=caFree;
end;

function TfrmZPersModule4.getKodSetup: Integer;
begin
     Result:=FKodSetup;
end;

constructor TfrmZPersModule4.Create(AOwner: TComponent; DBHanlde: TISC_DB_HANDLE;
  id_user: Int64; kodsetup:Integer;IdReport:integer;IdAnketa:variant);
  var T,year,mon,f:Word;
       st:string;
begin
     inherited Create(AOwner);
     FKodSetup:=kodsetup;
     FIdReport:=IdReport;
     if IdAnketa <> null then
      FIdAnketa:=IdAnketa
     else
      FIdAnketa:=null;
     DModule:=TDModule.Create(AOwner);
     DModule.DB.Handle:=DBHanlde;

     DModule.DSourceWorkDog.DataSet:=DModule.DSetWorkDog;
     GetPeriodsListBox;

     if (PeriodsCB.Items.Count>=1)
     then begin
       DModule.DSetWorkDog.SelectSQL.Text:='select * from  Z_PERSON_WORK_DOG_S('+IntToStr(FIdReport)+','+IntToStr(Integer(PeriodsCB.Items.Objects[PeriodsCB.ItemIndex]))+')';
       DModule.DSetWorkDog.Active:=True;
     end;

       DModule.DSetWorkDog.First;
if DModule.DSetWorkDog.RecordCountFromSrv=0 then
begin
  ButtonDelete.Enabled:=False;
  ButtonUpdate.Enabled:=False;
  ButtonInsert.Enabled:=False;


end
else
begin
  ButtonDelete.Enabled:=True;
  ButtonUpdate.Enabled:=True;
  ButtonInsert.Enabled:=True;

end;

  self.Caption:=Self.Caption+' за період '+KodSetupToPeriod(kodsetup,1);
  self.Update;

with DModule.SProc do
begin
Transaction.StartTransaction;

StoredProcName:='PERSON_FORM_STATUS_S';                                   //    !!!!!!!!!!!!!!!!!
Prepare;
ParamByName('ID_PERSON_FORM_IN').AsInteger:=5;
ParamByName('KOD_SETUP').AsInteger:=FKodSetup;
ParamByName('ID_PERSON_DOC_IN').AsInteger:=FIdReport;
ExecProc;
 status:= ParamByName('STATUS').AsVariant;
 ID_PERSON_FORM:= ParamByName('ID_PERSON_FORM').AsInteger;
 ID_PERSON_DOCUMENT:= ParamByName('ID_PERSON_DOCUMENT').AsInteger;
 id_form_status:= ParamByName('ID_FORM_STATUS').AsVariant;
 if ParamByName('STATUS').AsVariant=0 then
begin

  ButtonDelete.Enabled:=True;
  ButtonUpdate.Enabled:=True;
  ButtonInsert.Enabled:=True;
   ButtonForm.Enabled:=True;
  Transaction.Commit;
  Exit;
end;
if ParamByName('STATUS').AsVariant=1 then
begin
  ButtonDelete.Enabled:=False;
  ButtonUpdate.Enabled:=False;
  ButtonInsert.Enabled:=False;
   ButtonForm.Enabled:=False;
  Transaction.Commit;
  Exit;
end;

 Transaction.Commit;
 Transaction.StartTransaction;
 StoredProcName:='PERSON_FORM_STATUS_INS';
 Prepare;
 ParamByName('ID_PERSON_FORM').AsInteger:=5;
 ParamByName('ID_PERSON_DOCUMENT').AsInteger:=ID_PERSON_DOCUMENT;
 ParamByName('STATUS').AsInteger:=1;
 ParamByName('KOD_SETUP').AsInteger:=FKodSetup;
 ExecProc;
 Transaction.Commit;
 Transaction.StartTransaction;
 StoredProcName:='PERSON_FORM_STATUS_S';                                   //    !!!!!!!!!!!!!!!!!
 Prepare;
 ParamByName('ID_PERSON_FORM_IN').AsInteger:=5;
 ParamByName('KOD_SETUP').AsInteger:=FKodSetup;
 ParamByName('ID_PERSON_DOC_IN').AsInteger:=FIdReport;
 ExecProc;
 id_form_status:= ParamByName('ID_FORM_STATUS').AsVariant;
 Transaction.Commit;
 ButtonDelete.Enabled:=False;
 ButtonUpdate.Enabled:=False;
 ButtonInsert.Enabled:=False;
  ButtonForm.Enabled:=False;




end;



end;



procedure TfrmZPersModule4.ButtonInsertClick(Sender: TObject);
var Param:TZPersModule4Param;
begin
  Param:=TZPersModule4Param.Create;
Param.AOwner:=Self;
Param.Id_report:=FIdReport;
Param.KodSetup:=FKodSetup;
Param.FStyle:=tcfsInsert;
if Viev_ZFormEdit(param) then
begin

      DModule.DSetWorkDog.Close;
      DModule.DSetWorkDog.SelectSQL.Text:='select * from  Z_PERSON_WORK_DOG_S('+IntToStr(FIdReport)+','+IntToStr(Integer(PeriodsCB.Items.Objects[PeriodsCB.ItemIndex]))+')';
      DModule.DSetWorkDog.Active:=True;
      DModule.DSetWorkDog.Locate('ID_RECORD',Param.Id_record,[]) ;
end ;
Param.Destroy;
end;

procedure TfrmZPersModule4.ButtonUpdateClick(Sender: TObject);
var Param:TZPersModule4Param;
begin
   Param:=TZPersModule4Param.Create;
Param.AOwner:=Self;
Param.Id_report:=FIdReport;
Param.Id_record:=DModule.DSetWorkDog['ID_RECORD'];
Param.KodSetup:=FKodSetup;
Param.FStyle:=tcfsUpdate;
if Viev_ZFormEdit(param) then
begin
      DModule.DSetWorkDog.Close;
      DModule.DSetWorkDog.SelectSQL.Text:='select * from  Z_PERSON_WORK_DOG_S('+IntToStr(FIdReport)+','+IntToStr(Integer(PeriodsCB.Items.Objects[PeriodsCB.ItemIndex]))+')';
      DModule.DSetWorkDog.Active:=True;
      DModule.DSetWorkDog.Locate('ID_RECORD',Param.Id_record,[]) ;
end ;
Param.Destroy;
end;

procedure TfrmZPersModule4.ButtonDeleteClick(Sender: TObject);
var Param:TZPersModule4Param;
begin
   Param:=TZPersModule4Param.Create;
Param.AOwner:=Self;
Param.Id_report:=FIdReport;
Param.Id_record:=DModule.DSetWorkDog['ID_RECORD'];
Param.KodSetup:=FKodSetup;
Param.FStyle:=tcfsDelete;
if Viev_ZFormEdit(param) then
begin
  DModule.DSetWorkDog.DeleteSQL.Text:='execute procedure z_empty_proc';
  DModule.DSetWorkDog.Delete;
end;
Param.Destroy;
end;

procedure TfrmZPersModule4.ButtonFormClick(Sender: TObject);
var n,k:Integer;
begin
     if  DModule.DSetWorkDog.Active then
     if ZShowMessage('Формування','Ви дійсно бажаєте переформувати?',mtWarning,[mbYes,mbNo])<>6 then  Exit else
     else
     if ZShowMessage('Формування','Ви дійсно бажаєте сформувати?',mtWarning,[mbYes,mbNo])<>6 then Exit;

     with DModule do
     begin
      if  DModule.DSetForm.Active then DModule.DSetWorkDog.Transaction.Commit;
      DSetForm.Close;
      DSetForm.SelectSQL.Text:= 'select * from Z_PERSONIFICATION_WORK_DOG_S('+inttostr(FIdReport)+','+inttostr(FKodSetup)+')';
      DSetForm.Active:=True;
      if  FIdAnketa =null then
       begin

        n:=DSetForm.RecordCountFromSrv;
        ProgressBar.max:=n;
        ProgressBar.min:=1;
        ProgressBar.Step:=1;
        DSetForm.First;
        for k:=1 to n  do
        begin
          SProc.Transaction.StartTransaction;
          SProc.StoredProcName:='Z_PERSONIFICATION_2010_5';
          SProc.Prepare;
          SProc.ParamByName('ID_REPORT').AsInteger:=FIdReport;
          SProc.ParamByName('ID_ANKETA').AsInteger:=DSetForm['ID_ANKETA'];
          SProc.ParamByName('KOD_SETUP').AsInteger:=FKodSetup;
          SProc.ExecProc;
          SProc.Transaction.Commit;
          ProgressBar.StepIt;
          Application.ProcessMessages;
          DSetForm.Next;
        end;
       end
       else
       begin
        SProc.Transaction.StartTransaction;
        SProc.StoredProcName:='Z_PERSONIFICATION_2010_5';
        SProc.Prepare;
        SProc.ParamByName('ID_REPORT').AsInteger:=FIdReport;
        SProc.ParamByName('ID_ANKETA').AsInteger:=FIdAnketa;
        SProc.ParamByName('KOD_SETUP').AsInteger:=FKodSetup;
        SProc.ExecProc;
        SProc.Transaction.Commit;
       end;
       DSetForm.Transaction.Commit;
       DModule.DSetWorkDog.Close;
       DModule.DSetWorkDog.SelectSQL.Text:='select * from  Z_PERSON_WORK_DOG_S('+IntToStr(FIdReport)+','+IntToStr(Integer(PeriodsCB.Items.Objects[PeriodsCB.ItemIndex]))+')';
       DModule.DSetWorkDog.Active:=True;

     end;


end;

procedure TfrmZPersModule4.ButtonRefreshClick(Sender: TObject);
var t:Integer;
begin
  t:=0;
  IF DModule.DSetWorkDog['ID_RECORD']<>null THEN
      T:=DModule.DSetWorkDog['ID_RECORD'] ;
      DModule.DSetWorkDog.Close;
       DModule.DSetWorkDog.SelectSQL.Text:='select * from  Z_PERSON_WORK_DOG_S('+IntToStr(FIdReport)+','+IntToStr(Integer(PeriodsCB.Items.Objects[PeriodsCB.ItemIndex]))+')';
       DModule.DSetWorkDog.Active:=True;
      DModule.DSetWorkDog.Locate('ID_RECORD',T,[]) ;
end;

procedure TfrmZPersModule4.ButtonExitClick(Sender: TObject);
begin
Close
end;

procedure TfrmZPersModule4.GridDBTableView1DataControllerDataChanged(
  Sender: TObject);
begin
  if  DModule = nil  then Exit;
if DModule.DSetWorkDog.RecordCountFromSrv=0 then
begin
  ButtonDelete.Enabled:=False;
  ButtonUpdate.Enabled:=False;
end
else
begin
  ButtonDelete.Enabled:=True;
  ButtonUpdate.Enabled:=True;
  ButtonInsert.Enabled:=True;
end;

if status=1 then
begin
  ButtonDelete.Enabled:=False;
  ButtonUpdate.Enabled:=False;
  ButtonInsert.Enabled:=False;
  ButtonForm.Enabled:=False;
end
else
begin
  ButtonDelete.Enabled:=True;
  ButtonUpdate.Enabled:=True;
  ButtonInsert.Enabled:=True;
   ButtonForm.Enabled:=true;
end;
end;

procedure TfrmZPersModule4.FormResize(Sender: TObject);
var T :Integer;
begin
T:= Trunc( Width/5);
 dxStatusBar1.Panels[0].Width:=T;
 dxStatusBar1.Panels[1].Width:=T;
 dxStatusBar1.Panels[2].Width:=T;
 dxStatusBar1.Panels[3].Width:=T;
 dxStatusBar1.Panels[4].Width:=T;
end;

procedure TfrmZPersModule4.ButtonSignClick(Sender: TObject);
begin
with DModule.SProc do
begin
Transaction.StartTransaction;
StoredProcName:='PERSON_FORM_STATUS_UPD';                                   //    !!!!!!!!!!!!!!!!!
Prepare;
ParamByName('ID_FORM_STATUS').AsInteger:=id_form_status;
ParamByName('STATUS').AsInteger:=1;
status:=1;
ExecProc;
Transaction.Commit;
ButtonDelete.Enabled:=False;
ButtonUpdate.Enabled:=False;
ButtonInsert.Enabled:=False;
 ButtonForm.Enabled:=False;
end;
end;

procedure TfrmZPersModule4.ButtonNotSignClick(Sender: TObject);
begin
with DModule.SProc do
begin
Transaction.StartTransaction;
StoredProcName:='PERSON_FORM_STATUS_UPD';                                   //    !!!!!!!!!!!!!!!!!
Prepare;
ParamByName('ID_FORM_STATUS').AsInteger:=id_form_status;
ParamByName('STATUS').AsInteger:=0;
status:=0;
ExecProc;
Transaction.Commit;
ButtonDelete.Enabled:=true;
ButtonUpdate.Enabled:=true;
ButtonInsert.Enabled:=true;
 ButtonForm.Enabled:=true;

end;
end;


procedure TfrmZPersModule4.GetPeriodsListBox;
var ItemsDs:TpFIBDataSet;
    i:Integer;
    ks:Integer;
    ek:Boolean;
begin
     PeriodsCB.Items.Clear;
     PeriodsCB.Clear;
     ek:=False;

     ItemsDs               :=TpFIBDataSet.Create(self);
     ItemsDs.Database      :=DModule.DB;
     ItemsDs.Transaction   :=DModule.TransactionR;
     ItemsDs.SelectSQL.Text:='SELECT * FROM Z_PERS_GET_SETUPS_BY_REPORT67('+IntToStr(Self.FidReport)+')';
     ItemsDs.Open;
     ItemsDs.FetchAll;
     ItemsDs.First;
     for i:=0 to ItemsDs.RecordCount-1 do
     begin
          ks:=ItemsDs.FieldByName('kod_setup').Value;
          PeriodsCB.Items.AddObject(ItemsDs.FieldByName('kod_setup_string').AsString,TObject(ks));
          if ks=Self.FKodSetup
          then begin
                    PeriodsCB.ItemIndex:=i;
                    ek:=true;
          end;

          ItemsDs.Next;
     end;

     if not ek
     then PeriodsCB.ItemIndex:=0;

     ItemsDs.Close;
     ItemsDs.Free;
end;
end.
