unit MainUpReportFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,uCommonSp,DB, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxCheckBox, FIBDataSet,
  pFIBDataSet, ImgList, cxGridTableView, FIBDatabase, pFIBDatabase,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ComCtrls, ExtCtrls,IBase,
  RxMemDS, FIBQuery, pFIBQuery, pFIBStoredProc, uUnivSprav, StdCtrls,
  FilterPeriod,FilterDate,FilterAge, FilterMonth, Registry;

  type
    TUP_PrintFilter = class(TSprav)
    public
        constructor Create;
        procedure Show; override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

type
  TfrmMainReportFilter = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    FilterGrid: TcxGrid;
    View: TcxGridDBTableView;
    ViewDBColumn1: TcxGridDBColumn;
    ViewDBColumn2: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DS_Signers: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
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
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    IL_Orders: TImageList;
    StyleRepository: TcxStyleRepository;
    stBackground: TcxStyle;
    stContent: TcxStyle;
    stContentEven: TcxStyle;
    stContentOdd: TcxStyle;
    stFilterBox: TcxStyle;
    stFooter: TcxStyle;
    stGroup: TcxStyle;
    stGroupByBox: TcxStyle;
    stHeader: TcxStyle;
    stInactive: TcxStyle;
    stIncSearch: TcxStyle;
    stIndicator: TcxStyle;
    stPreview: TcxStyle;
    stSelection: TcxStyle;
    stHotTrack: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    pFIBDataSetCreateFilter: TpFIBDataSet;
    RxMemoryData1: TRxMemoryData;
    StoredProc: TpFIBStoredProc;
    ButtonClear: TButton;
    ButtonExit: TButton;
  Constructor Create(aOwner : TComponent;HandleDb:Integer);
    procedure ViewDblClick(Sender: TObject);
    procedure SaveFilter(Type_filter:Integer;Values:Int64);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    OutPut : TRxMemoryData;
    { Public declarations }
  end;

var
  frmMainReportFilter: TfrmMainReportFilter;
  id_sp_report,id_session:Int64;
  CorrFilter,view_short_department:Integer;
implementation

{$R *.dfm}

function CreateSprav: TSprav;stdcall;
begin
    Result := TUP_PrintFilter.Create;
end;

constructor TUP_PrintFilter.Create;
begin
    inherited Create;
    Input.FieldDefs.Add('id_session', ftVariant);
    Input.FieldDefs.Add('id_sp_report', ftVariant);
    Input.FieldDefs.Add('view_short_department', ftVariant);

    Output.FieldDefs.Add('CorrFilter', ftInteger);
    
    PrepareMemoryDatasets;
end;

procedure TUP_PrintFilter.Show;
var
    hnd: Integer;
    Filter: TfrmMainReportFilter;
begin
  hnd := Input['DBHandle'];
  id_sp_report := Input['id_sp_report'];
  id_session := Input['id_session'];
  if VarIsNull(Input['view_short_department']) then
    begin
      view_short_department := 0;     
    end
    else
    begin
      view_short_department :=  Input['view_short_department'];
    end;
  Filter:=TfrmMainReportFilter.Create(Application.MainForm,hnd);
  Filter.ShowModal;

  Output.Open;
  Output.Append;
  Output['CorrFilter']:=CorrFilter;
  Output.Post;

  Filter.Free;
end;

constructor TfrmMainReportFilter.Create(aOwner : TComponent;HandleDb:Integer);
begin
  inherited Create(aOwner);
  DB.Handle := TISC_DB_Handle(HandleDb);
  pFIBDataSetCreateFilter.Database:=DB;
  pFIBDataSetCreateFilter.Transaction:=ReadTransaction;
  pFIBDataSetCreateFilter.ParamByName('IN_ID_REPORT_SESSION').AsInt64:= id_session;
  pFIBDataSetCreateFilter.ParamByName('IN_ID_SP_REPORT').AsInt64:=id_sp_report;
  pFIBDataSetCreateFilter.Active:=true;
  CorrFilter:=0;
end;



procedure TfrmMainReportFilter.ViewDblClick(Sender: TObject);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
  sp: TSprav;
  i: integer;
  Period:TfrmPeriod;
  resultVar:Variant;
  FilterDate:TfrmFilterDate;
  FilterAge:TfrmFilterAge;
  Month:TfrmFilterMonth;
  IdFilter:Integer;
begin
//удаляем предыдущий параметр
  WriteTransaction.StartTransaction;
  StoredProc.StoredProcName:='UP_DT_REPORT_VAL_PARAM_DEL';
  StoredProc.Prepare;
  StoredProc.ParamByName('IN_ID_REPORT_SESSION').AsInt64:=id_session;
  StoredProc.ParamByName('IN_ID_SP_FILTER').AsInteger:=pFIBDataSetCreateFilter.FieldByName('OUT_ID_SP_FILTER').AsInteger;
  try
    StoredProc.ExecProc;
  except
    begin
      WriteTransaction.Rollback;
      Exit;
    end;
   end;
  WriteTransaction.Commit;

if pFIBDataSetCreateFilter.FieldByName('OUT_CHECKED').AsInteger=1 then
  begin
    pFIBDataSetCreateFilter.Active:=false;
    pFIBDataSetCreateFilter.Transaction:=ReadTransaction;
    pFIBDataSetCreateFilter.ParamByName('IN_ID_REPORT_SESSION').AsInt64:= id_session;
    pFIBDataSetCreateFilter.ParamByName('IN_ID_SP_REPORT').AsInt64:=id_sp_report;
    pFIBDataSetCreateFilter.Active:=true;
  end
  else
  begin
     if pFIBDataSetCreateFilter.FieldByName('OUT_USE_BPL').AsInteger=1 then
       begin
          if pFIBDataSetCreateFilter.FieldByName('OUT_ID_SP_FILTER').AsInteger<>2 then
            begin
              Params.FormCaption:=pFIBDataSetCreateFilter.FieldByName('OUT_FORMCAPTION').AsString;
              Params.ShowMode:=fsmMSelect;
              Params.ShowButtons:=[fbExit];
              Params.TableName:=pFIBDataSetCreateFilter.FieldByName('OUT_TABLENAME').AsString;
              Params.Fields:=pFIBDataSetCreateFilter.FieldByName('OUT_FIELDS').AsString;
              Params.FieldsName:=pFIBDataSetCreateFilter.FieldByName('OUT_FIELDSNAME').AsString;
              Params.KeyField:=pFIBDataSetCreateFilter.FieldByName('OUT_KEYFIELD').AsString;
              Params.ReturnFields:=pFIBDataSetCreateFilter.FieldByName('OUT_RETURNFIELDS').AsString;
              Params.DBHandle:=Integer(DB.Handle);

              IdFilter:=pFIBDataSetCreateFilter.FieldByName('OUT_ID_SP_FILTER').AsInteger;

              OutPut:=TRxMemoryData.Create(self);

              if GetUnivSprav(Params,OutPut)then
                begin
                 Output.First;
                  while not Output.Eof do
                  begin
                      SaveFilter(IdFilter, Output[Params.ReturnFields]);
                      Output.Next;
                  end
              end;
            end
            else
            begin
                      // создать справочник
              sp :=  GetSprav('SpDepartment');
              if sp <> nil then
              begin
                      // заполнить входные параметры
                  with sp.Input do
                  begin
                      Append;
                      FieldValues['DBHandle'] := Integer(DB.Handle);
                          // модальный показ
                      FieldValues['ShowStyle'] := 1;
                          // модальная выборка
                      FieldValues['Select'] := 2;
                      if view_short_department=1 then
                        begin
                          FieldValues['Id_Property'] := 1;
                        end;  
                      Post;
                  end;
              end;
                  // показать справочник и проанализировать результат (выбор одного подр.)
              sp.Show;
              i:=0;
              if sp.Output = nil then
                begin
                  //ShowMessage('Output is NIL!!!')
                end
              else
              begin
                  i:=0;
                  sp.Output.First;
                  while not sp.Output.Eof do
                  begin
                      SaveFilter(2,sp.Output['Id_Department']);
                      sp.Output.Next;
                  end
              end;
            end;
       end
       else
       begin
         if pFIBDataSetCreateFilter.FieldByName('OUT_ID_SP_FILTER').AsInteger=9 then
           begin
             FilterAge:=TfrmFilterAge.Create(self);
             resultVar:=FilterAge.GetAge();
             if  (VarIsNull(resultVar)=false ) then
               begin

                  WriteTransaction.StartTransaction;
                  StoredProc.Prepare;
                  StoredProc.StoredProcName:='UP_DT_REPORT_VAL_PARAM_INIT';
                  StoredProc.ParamByName('IN_ID_REPORT_SESSION').AsInt64:=id_session;
                  StoredProc.ParamByName('IN_ID_SP_FILTER').AsInt64:=pFIBDataSetCreateFilter.FieldByName('OUT_ID_SP_FILTER').AsInteger;
                  StoredProc.ParamByName('IN_MIN_AGE').AsInt64:=FilterAge.cxSpinEditBegin.Value;
                  StoredProc.ParamByName('IN_MAX_AGE').AsInt64:=FilterAge.cxSpinEditEnd.Value;              
                  try
                    StoredProc.ExecProc;
                  except
                    begin
                      WriteTransaction.Rollback;
                      Exit;
                    end;
                   end;
                  WriteTransaction.Commit;

                  pFIBDataSetCreateFilter.Active:=false;
                  pFIBDataSetCreateFilter.Transaction:=ReadTransaction;
                  pFIBDataSetCreateFilter.ParamByName('IN_ID_REPORT_SESSION').AsInt64:= id_session;
                  pFIBDataSetCreateFilter.ParamByName('IN_ID_SP_REPORT').AsInt64:=id_sp_report;
                  pFIBDataSetCreateFilter.Active:=true;

                  CorrFilter:=1;
               end;
                FilterAge.free;
           end;

         if pFIBDataSetCreateFilter.FieldByName('OUT_ID_SP_FILTER').AsInteger=20 then
           begin
             FilterDate:=TfrmFilterDate.Create(self);
             resultVar:=FilterDate.GetPeriod();
             if  (VarIsNull(resultVar)=false ) then
               begin

                  WriteTransaction.StartTransaction;
                  StoredProc.Prepare;
                  StoredProc.StoredProcName:='UP_DT_REPORT_VAL_PARAM_INIT';
                  StoredProc.ParamByName('IN_ID_REPORT_SESSION').AsInt64:=id_session;
                  StoredProc.ParamByName('IN_ID_SP_FILTER').AsInt64:=pFIBDataSetCreateFilter.FieldByName('OUT_ID_SP_FILTER').AsInteger;
                  StoredProc.ParamByName('IN_DATE_BEG').AsDateTime:=FilterDate.cxDateEditbegin.Date;
                  try
                    StoredProc.ExecProc;
                  except
                    begin
                      WriteTransaction.Rollback;
                      Exit;
                    end;
                   end;
                  WriteTransaction.Commit;

                  pFIBDataSetCreateFilter.Active:=false;
                  pFIBDataSetCreateFilter.Transaction:=ReadTransaction;
                  pFIBDataSetCreateFilter.ParamByName('IN_ID_REPORT_SESSION').AsInt64:= id_session;
                  pFIBDataSetCreateFilter.ParamByName('IN_ID_SP_REPORT').AsInt64:=id_sp_report;
                  pFIBDataSetCreateFilter.Active:=true;

                  CorrFilter:=1;
               end;
                FilterDate.free;
           end;
         if (pFIBDataSetCreateFilter.FieldByName('OUT_ID_SP_FILTER').AsInteger in [10, 32, 36, 37 ]) then
           begin
             Period:=TfrmPeriod.Create(self);
             resultVar:=Period.GetPeriod();
             if  (VarIsNull(resultVar)=false ) then
               begin

                  WriteTransaction.StartTransaction;
                  StoredProc.Prepare;
                  StoredProc.StoredProcName:='UP_DT_REPORT_VAL_PARAM_INIT';
                  StoredProc.ParamByName('IN_ID_REPORT_SESSION').AsInt64:=id_session;
                  StoredProc.ParamByName('IN_ID_SP_FILTER').AsInt64:=pFIBDataSetCreateFilter.FieldByName('OUT_ID_SP_FILTER').AsInteger;
                  StoredProc.ParamByName('IN_DATE_BEG').AsDateTime:=Period.cxDateEditbegin.Date;
                  StoredProc.ParamByName('IN_DATE_END').AsDateTime:=Period.cxDateEditEnd.Date;
                  try
                    StoredProc.ExecProc;
                  except
                    begin
                      WriteTransaction.Rollback;
                      Exit;
                    end;
                   end;
                  WriteTransaction.Commit;

                  pFIBDataSetCreateFilter.Active:=false;
                  pFIBDataSetCreateFilter.Transaction:=ReadTransaction;
                  pFIBDataSetCreateFilter.ParamByName('IN_ID_REPORT_SESSION').AsInt64:= id_session;
                  pFIBDataSetCreateFilter.ParamByName('IN_ID_SP_REPORT').AsInt64:=id_sp_report;
                  pFIBDataSetCreateFilter.Active:=true;

                  CorrFilter:=1;
               end;
                Period.free;
           end;
         if pFIBDataSetCreateFilter.FieldByName('OUT_ID_SP_FILTER').AsInteger=25 then
           begin
             Month:=TfrmFilterMonth.Create(self);
             //resultVar:=Month.GetMonth();
             if  (Month.ShowModal=mrOk ) then
               begin

                  WriteTransaction.StartTransaction;
                  StoredProc.Prepare;
                  StoredProc.StoredProcName:='UP_DT_REPORT_VAL_PARAM_INIT';
                  StoredProc.ParamByName('IN_ID_REPORT_SESSION').AsInt64:=id_session;
                  StoredProc.ParamByName('IN_ID_SP_FILTER').AsInt64:=pFIBDataSetCreateFilter.FieldByName('OUT_ID_SP_FILTER').AsInteger;
                  StoredProc.ParamByName('IN_VALUE_PARAM').AsInt64:=Month.MonthComboBox.ItemIndex+1;
                  try
                    StoredProc.ExecProc;
                  except
                    begin
                      WriteTransaction.Rollback;
                      Exit;
                    end;
                   end;
                  WriteTransaction.Commit;

                  pFIBDataSetCreateFilter.Active:=false;
                  pFIBDataSetCreateFilter.Transaction:=ReadTransaction;
                  pFIBDataSetCreateFilter.ParamByName('IN_ID_REPORT_SESSION').AsInt64:= id_session;
                  pFIBDataSetCreateFilter.ParamByName('IN_ID_SP_REPORT').AsInt64:=id_sp_report;
                  pFIBDataSetCreateFilter.Active:=true;

                  CorrFilter:=1;
               end;
                Month.free;
           end;

       end;
    end       
end;

procedure TfrmMainReportFilter.SaveFilter(Type_filter:Integer;Values:Int64);
var reg:TRegistry;
    Kod:integer;
begin
  WriteTransaction.StartTransaction;
  StoredProc.StoredProcName:='UP_DT_REPORT_VAL_PARAM_INIT';
  StoredProc.Prepare;
  StoredProc.ParamByName('IN_ID_REPORT_SESSION').AsInt64:=id_session;
  StoredProc.ParamByName('IN_ID_SP_FILTER').AsInt64:=Type_filter;
  StoredProc.ParamByName('IN_VALUE_PARAM').AsInt64:=Values;
  try
    StoredProc.ExecProc;
  except
    begin
      WriteTransaction.Rollback;
      Exit;
    end;
   end;
  WriteTransaction.Commit;

  pFIBDataSetCreateFilter.Active:=false;
  pFIBDataSetCreateFilter.Transaction:=ReadTransaction;
  pFIBDataSetCreateFilter.ParamByName('IN_ID_REPORT_SESSION').AsInt64:= id_session;
  pFIBDataSetCreateFilter.ParamByName('IN_ID_SP_REPORT').AsInt64:=id_sp_report;
  pFIBDataSetCreateFilter.Active:=true;

  CorrFilter:=1;

  if Type_filter=1 then
    begin
      reg := TRegistry.Create;
      reg.RootKey:=HKEY_CURRENT_USER;
      reg.OpenKey('\Software\FMAS\UP\Report\',true);
      reg.WriteInteger('DefUpIdLevel',Values);
      reg.Free;
    end;
end;


procedure TfrmMainReportFilter.ButtonClearClick(Sender: TObject);
begin
  WriteTransaction.StartTransaction;
  StoredProc.StoredProcName:='UP_DT_REPORT_VAL_PARAM_DEL';
  StoredProc.Prepare;
  StoredProc.ParamByName('IN_ID_REPORT_SESSION').AsInt64:=id_session;
  try
    StoredProc.ExecProc;
  except
    begin
      WriteTransaction.Rollback;
      Exit;
    end;
   end;
  WriteTransaction.Commit;

  pFIBDataSetCreateFilter.Active:=false;
  pFIBDataSetCreateFilter.Transaction:=ReadTransaction;
  pFIBDataSetCreateFilter.ParamByName('IN_ID_REPORT_SESSION').AsInt64:= id_session;
  pFIBDataSetCreateFilter.ParamByName('IN_ID_SP_REPORT').AsInt64:=id_sp_report;
  pFIBDataSetCreateFilter.Active:=true;

  CorrFilter:=0;
end;

procedure TfrmMainReportFilter.ButtonExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMainReportFilter.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  select: TpFIBDataSet;
begin
  pFIBDataSetCreateFilter.Locate('OUT_ID_SP_FILTER',1,[]);
  if pFIBDataSetCreateFilter.FieldByName('OUT_CHECKED').AsInteger=0 then
    begin
      select:=TpFIBDataSet.Create(nil);
      select.Database:=DB;
      select.Transaction:=ReadTransaction;
      select.SQLs.SelectSQL.Text:='select DEFAULT_WORK_LEVEL from UP_SYS_INI_CONSTS';
      select.Active:=true;
      SaveFilter(1,select.FieldByName('DEFAULT_WORK_LEVEL').AsVariant);
      select.Destroy;
    end;
end;

end.
