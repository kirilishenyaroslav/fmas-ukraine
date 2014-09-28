unit uReportDesigner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, uSys, cxLabel, uCommon_Messages, FIBQuery, pFIBQuery,
  pFIBStoredProc, BsUnivSprav, RxMemDS, frxClass, frxDBSet, frxDesgn,
  cxSpinEdit;

type
  TfrmReportDesigner = class(TForm)
    FilterGridDBView: TcxGridDBTableView;
    FilterGridLevel: TcxGridLevel;
    FilterGrid: TcxGrid;
    FilterPanel: TPanel;
    MainPanel: TPanel;
    DisObjStyleRepository: TcxStyleRepository;
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
    DisObjectGridStyle: TcxGridTableViewStyleSheet;
    FilterDS: TDataSource;
    ProcBox: TcxLookupComboBox;
    FilterGridDBViewDBColumn1: TcxGridDBColumn;
    ProceduresDS: TDataSource;
    DesignDB: TpFIBDatabase;
    ProceduresDSet: TpFIBDataSet;
    DesTRead: TpFIBTransaction;
    DesTWrite: TpFIBTransaction;
    RepDSet: TpFIBDataSet;
    GroupBox: TcxLookupComboBox;
    lblNameProc: TcxLabel;
    lblNameGroup: TcxLabel;
    GroupDS: TDataSource;
    GroupDSet: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    FilterDSet: TRxMemoryData;
    FilterDSetID_REPORT_FILTER: TIntegerField;
    FilterDSetNAME_REPORT_FILTER: TStringField;
    frDB: TfrxDBDataset;
    BtnPanel: TPanel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    btnDesign: TcxButton;
    frReport: TfrxReport;
    frDataSet: TpFIBDataSet;
    GetParams: TpFIBDataSet;
    PathReport: TcxTextEdit;
    lblPathReport: TcxLabel;
    NumReport: TcxSpinEdit;
    lblNumReport: TcxLabel;
    btnFilterAdd: TcxButton;
    btnFilterDel: TcxButton;
    lblNameReport: TcxLabel;
    NameReport: TcxTextEdit;
    procedure ProcBoxPropertiesInitPopup(Sender: TObject);
    procedure GroupBoxPropertiesInitPopup(Sender: TObject);
    procedure btnFilterAddClick(Sender: TObject);
    procedure btnFilterDelClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnDesignClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    ConParams:TBDConParams;
    IdReport:Variant;
    FolderPath:string;
    isAskedDialog:Boolean;
    procedure SaveReportFilter(IdFilter:Integer; NameFilter:String);
    function GetFrFile:string;
    function SaveData:Boolean;
    function CheckData:Boolean;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; IdReportIn:Variant; IdGroup:Integer);reintroduce;
  end;

var
  frmReportDesigner: TfrmReportDesigner;

implementation

{$R *.dfm}

constructor TfrmReportDesigner.Create(AOwner:TComponent; IdReportIn:Variant; IdGroup:Integer);
begin
   inherited Create(AOwner);
   ConParams:=DBGetParamsFromIni('LOCAL_CONNECTION');
   DesignDB.DBName:=DBGetConnectionStr('LOCAL_CONNECTION', True);
   with DesignDB, ConParams do
   begin
      ConnectParams.UserName:=tdbUser;
      ConnectParams.Password:=tdbPassword;
      ConnectParams.CharSet:=tdbCharSet;
      SQLDialect:=tdbSQLDialect;
      try
         DesignDB.Open;
      except on E:Exception do
             begin
                bsShowMessage('Внимание!', E.Message, mtInformation, [mbOK]);
                DesignDB.Close;
             end;
      end;
   end;
   if GroupDSet.Active then GroupDSet.Close;
   GroupDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_DT_REPORT_GROUP';
   GroupDSet.Open;
   GroupBox.EditValue:=IdGroup;
   if ProceduresDSet.Active then ProceduresDSet.Close;
   ProceduresDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_REPORTS_PROCEDURES';
   ProceduresDSet.Open;
   FolderPath:=DBGetConnectionStr('FR_SOURCE', False);
   IdReport:=IdReportIn;
   if not VarIsNull(IdReport) then
   begin
      if RepDSet.Active then RepDSet.Close;
      RepDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_DT_REPORTS WHERE ID_REPORT=:ID_REP';
      RepDSet.ParamByName('ID_REP').AsInteger:=IdReport;
      RepDSet.Open;
      PathReport.Text:=FolderPath+'\'+RepDSet['NAME_FR3'];
      GroupBox.EditValue:=RepDSet['ID_REPORT_GROUP'];
      ProcBox.EditText:=RepDSet['NAME_PROCEDURE'];
      NameReport.Text:=RepDSet['NAME_REPORT'];
      NumReport.Value:=RepDSet['NUM_REPORT'];
      if GetParams.Active then GetParams.Close;
      GetParams.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_REPORT_FILTERS(:ID_REP)';
      GetParams.ParamByName('ID_REP').AsInteger:=IdReport;
      GetParams.Open;
      if not GetParams.IsEmpty then
      begin
         GetParams.FetchAll;
         GetParams.First;
         while not GetParams.Eof do
         begin
            SaveReportFilter(GetParams['ID_REPORT_FILTER'], GetParams['NAME_REPORT_FILTER']);
            GetParams.Next;
         end;
      end;
   end;
   isAskedDialog:=False;
end;

procedure TfrmReportDesigner.ProcBoxPropertiesInitPopup(Sender: TObject);
begin
   if ProceduresDSet.Active then ProceduresDSet.Close;
   ProceduresDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_REPORTS_PROCEDURES';
   ProceduresDSet.Open;
end;

procedure TfrmReportDesigner.SaveReportFilter(IdFilter:Integer; NameFilter:String);
begin
   if FilterDSet.Locate('ID_REPORT_FILTER', IdFilter, []) then
   begin
      bsShowMessage(Application.Title, 'Фильтр "'+NameFilter+'" уже был добавлен!d', mtInformation, [mbOK]);
      Exit;
   end;
   FilterDSet.Insert;
   FilterDSet.FieldByName('ID_REPORT_FILTER').AsInteger:=IdFilter;
   FilterDSet.FieldByName('NAME_REPORT_FILTER').AsString:=NameFilter;
   FilterDSet.Post;
end;

procedure TfrmReportDesigner.GroupBoxPropertiesInitPopup(Sender: TObject);
begin
   if GroupDSet.Active then GroupDSet.Close;
   GroupDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_DT_REPORT_GROUP';
   GroupDSet.Open;
end;

procedure TfrmReportDesigner.btnFilterAddClick(Sender: TObject);
var frm:TfrmSprav;
    sParam:TSpravParams;
begin
    sParam.FormCaption := 'Список фильтров';
    sParam.SelectText := 'SELECT DISTINCT * FROM Bs_Sp_Report_Filter';
    sParam.NameFields := 'NAME_REPORT_FILTER,ID_REPORT_FILTER';
    sParam.FieldsCaption := 'Название';
    sParam.KeyField := 'ID_REPORT_FILTER';
    sParam.ReturnFields := 'ID_REPORT_FILTER,NAME_REPORT_FILTER';
    sParam.FilterFields:= 'NAME_REPORT_FILTER';
    sParam.FilterCaptions:='Название';
    sParam.DbHandle:=DesignDB.Handle;
    sParam.NameClass:='TfrmEditCountry';
    sParam.DeleteProcName:='ADR_COUNTRY_D';
    sParam.frmButtons:=[fbSelect,fbExit];
    sParam.IsMultiSelect:=True;
    frm:=TfrmSprav.Create(Self, sParam);
    if frm.ShowModal=mrOk then
    begin
          frm.OutPutDS.First;
          while not frm.OutPutDS.Eof do
          begin
             SaveReportFilter(frm.OutPutDS['ID_REPORT_FILTER'], frm.OutPutDS['NAME_REPORT_FILTER']);
             frm.OutPutDS.Next;
          end;
    end;
    frm.Free;
end;

procedure TfrmReportDesigner.btnFilterDelClick(Sender: TObject);
begin
   if FilterDSet.IsEmpty then Exit;
   if bsShowMessage(Application.Title, 'Удалить фильтр?', mtInformation, [mbYes, mbNo])=mrNo then Exit;
   if FilterDSet.IsEmpty then Exit;
   FilterDSet.Locate('ID_REPORT_FILTER', FilterDSet['ID_REPORT_FILTER'], []);
   FilterDSet.Delete;
end;

procedure TfrmReportDesigner.btnCancelClick(Sender: TObject);
var i:Integer;
begin
   i:=bsShowMessage(Application.Title, 'Закрыть форму без сохранения?', mtInformation, [mbYes, mbNo, mbCancel]);
   case i of
       mrYes :    begin
                     isAskedDialog:=True;
                     ModalResult:=mrOk;
                  end;
       mrNo :     begin
                     isAskedDialog:=True;
                     SaveData;
                     ModalResult:=mrOk;
                  end;
       mrCancel : begin
                     isAskedDialog:=False;
                     Exit;
                  end;
   end;
   isAskedDialog:=True;
end;

function TfrmReportDesigner.GetFrFile:string;
var i, c, j:Integer;
    NameFile, str, s:string;
begin
   Result:='';
   if PathReport.Text='' then
   begin
      bsShowMessage(Application.Title, 'Необходимо сформировать файл отчета!', mtInformation, [mbOK]);
      Exit;
   end;
   str:=PathReport.Text;
   c:=0;
   s:='';
   j:=0;
   for i:=Length(str) downto 1 do
   begin
      if str[i]='\' then
      begin
         Inc(c);
         case c of
            1 : begin
                  j:=i;
                  NameFile:=Copy(str, i+1, Length(str)-i);
                  s:='';
                end;
            2 : begin
                   s:=Copy(str, i+1, j-i-1);
                   j:=i;
                   if s<>'BsReportUser' then
                   begin
                      bsShowMessage(Application.Title, 'Файл отчета должен находиться в папке "BsReportUser"!', mtInformation, [mbOK]);
                      Result:='';
                   end
                   else Result:=s+'\'+NameFile;
                   s:='';
                end;
            3 : begin
                   s:=Copy(str, i+1, j-i-1);
                   if s<>'Reports' then
                   begin
                      bsShowMessage(Application.Title, 'Каталог "BsReportUser" должен находиться в каталоге "Reports"!', mtInformation, [mbOK]);
                      Result:='';
                   end;
                   s:='';
                   Break;
                end;
         end;
      end;
   end;
end;

function TfrmReportDesigner.CheckData:Boolean;
begin
  Result:=True;
  if NameReport.Text='' then
  begin
     bsShowMessage(Application.Title, 'Не обходимо заполнить поле "Название отчета"!', mtInformation, [mbOK]);
     Result:=False;
  end;

  if ProcBox.EditText='' then
  begin
     bsShowMessage(Application.Title, 'Необходимо выбрать процедуру!', mtInformation, [mbOK]);
     Result:=False;
  end;

  if GroupBox.EditText='' then
  begin
     bsShowMessage(Application.Title, 'Необходимо выбрать группу!', mtInformation, [mbOK]);
     Result:=False;
  end;

  if PathReport.Text='' then
  begin
     bsShowMessage(Application.Title, 'Необходимо сформировать файл отчета!', mtInformation, [mbOK]);
     Result:=False;
  end;
end;

function TfrmReportDesigner.SaveData:Boolean;
begin
   Result:=False;
   if CheckData then
   begin
       DesTWrite.StartTransaction;
       StoredProc.StoredProcName:='BS_DT_REPORTS_INS_UPD';
       StoredProc.Prepare;
       StoredProc.ParamByName('ID_REPORT').Value:=IdReport;
       StoredProc.ParamByName('NUM_REPORT').AsInteger:=NumReport.Value;
       StoredProc.ParamByName('NAME_REPORT').AsString:=NameReport.Text;
       StoredProc.ParamByName('ID_REPORT_GROUP').AsInteger:=GroupBox.EditValue;
       StoredProc.ParamByName('NAME_PROCEDURE').AsString:=ProcBox.EditText;
       StoredProc.ParamByName('ADD_INFO').AsString:='';
       if GetFrFile='' then
       begin
          DesTWrite.Rollback;
          Exit;
       end;
       StoredProc.ParamByName('NAME_FR3').AsString:=GetFrFile;
       StoredProc.ParamByName('IS_USER_REPORT').AsShort:=1;
       try
         StoredProc.ExecProc;
         IdReport:=StoredProc.FieldByName('RET_VALUE').AsInteger;
         if not FilterDSet.IsEmpty then
         begin
            FilterDSet.First;
            while not FilterDSet.Eof do
            begin
               StoredProc.StoredProcName:='BS_REPORT_RELATIONS_INS';
               StoredProc.Prepare;
               StoredProc.ParamByName('ID_REPORT').AsInteger:=IdReport;
               StoredProc.ParamByName('ID_REPORT_FILTER').AsInteger:=FilterDSet['ID_REPORT_FILTER'];
               StoredProc.ExecProc;
               FilterDSet.Next;
            end;
         end;
         DesTWrite.Commit;
         Result:=True;
       except on E:Exception do
              begin
                 bsShowMessage(Application.Title, E.Message, mtInformation, [mbOK]);
                 DesTWrite.Rollback;
                 ModalResult:=mrCancel;
              end;
       end;
   end;
end;

procedure TfrmReportDesigner.btnOkClick(Sender: TObject);
var i:Integer;
begin
   i:=bsShowMessage(Application.Title, 'Сохранить информацию по отчету?', mtInformation, [mbYes, mbNo, mbCancel]);
   case i of
       mrYes :    begin
                     isAskedDialog:=True;
                     if SaveData then ModalResult:=mrOk;
                  end;
       mrNo :     begin
                     isAskedDialog:=True;
                     ModalResult:=mrOk;
                  end;
       mrCancel : begin
                     isAskedDialog:=False;
                     Exit;
                  end;
   end;                
end;

procedure TfrmReportDesigner.btnDesignClick(Sender: TObject);
var i:Smallint;
    fField:TField;
    {frPage:TfrxPage;
    frMasterData:TfrxMasterData; }
begin
   if ProcBox.EditText='' then
   begin
      bsShowMessage(Application.Title, 'Необходимо выбрать процедуру!', mtInformation, [mbOK]);
   end;
   if GetParams.Active then GetParams.Close;
   GetParams.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_REPORT_OUTPUT_FIELDS(:NAME_PROC)';
   GetParams.ParamByName('NAME_PROC').AsString:=ProcBox.EditText;
   GetParams.Open;
   if GetParams.IsEmpty then
   begin
      bsShowMessage(Application.Title, 'Выбранная процедура не содержит возвращаемые параметры!', mtInformation, [mbOK]);
      Exit;
   end;
   GetParams.FetchAll;
   //ShowMessage(IntToStr(GetParams.RecordCount));
   GetParams.First;
   for i:=0 to GetParams.RecordCount-1 do
   begin
      fField:=TField.Create(Self);
      fField.FieldName:=GetParams['Parameter_Name'];
      fField.FieldKind:=fkData;
      fField.Name:='GetParams'+GetParams['Parameter_Name'];
      frDataSet.Fields.Add(fField);
      GetParams.Next;
   end;
   if frReport.DataSets.Count>0 then frReport.DataSets.Clear;
   frReport.DataSets.Add(frDB);
   frReport.DesignReport;
   PathReport.Text:=frReport.FileName;
   frDataSet.Fields.Clear;
end;

procedure TfrmReportDesigner.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var iRes:Integer;
begin
   if isAskedDialog then
   begin
      CanClose:=True;
   end
   else
   begin
     iRes:=bsShowMessage(Application.Title, 'Вы желаете сохранить информацию по отчету?', mtInformation, [mbYes, mbNo, mbCancel]);
     case iRes of
         mrYes:     begin
                       CanClose:=SaveData;
                    end;
         mrNo:      begin
                       CanClose:=True;
                    end;
         mrCancel : begin
                       CanClose:=False;
                    end;
     end;
   end;
end;

end.
