unit uUpReportBirthDateHead;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,uCommonSp,DB, FIBDatabase, pFIBDatabase,IBase, ComCtrls,
  cxLookAndFeelPainters, StdCtrls, cxButtons,Gauges,pFIBStoredProc,
  FIBQuery, pFIBQuery, frxDesgn, frxClass, frxDBSet, frxExportXLS,
  FIBDataSet, pFIBDataSet, frxExportHTML, frxExportRTF, ActnList,
  cxControls, cxContainer, cxEdit, cxRadioGroup, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxDBData, cxCheckBox, cxGridTableView,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid;

    type
    TUP_UpReportBirthDateHead= class(TSprav)
    public
        constructor Create;
        procedure Show; override;
        destructor Destroy;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

type
  TfmMain = class(TForm)
    StatusBar1: TStatusBar;
    cxButtonFilter: TcxButton;
    cxButtonPrint: TcxButton;
    ActionList1: TActionList;
    FilterAction: TAction;
    PrintAction: TAction;
    DesAction: TAction;
    cxButtonClose: TcxButton;
    cxButtonDraft: TcxButton;
    FontAction: TAction;
    FontDialogs: TFontDialog;
    ItemsGrid: TcxGrid;
    ReportDataView: TcxGridDBTableView;
    cxGridLevels: TcxGridLevel;
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
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    CreateAction: TAction;
    AddAction: TAction;
    DelAction: TAction;
    ReportDataViewDBColumn1: TcxGridDBColumn;
    ReportDataViewDBColumn2: TcxGridDBColumn;
    ReportDataViewDBColumn3: TcxGridDBColumn;
    ReportDataViewDBColumn4: TcxGridDBColumn;
    ReportDataViewDBColumn5: TcxGridDBColumn;
    Constructor Create(aOwner : TComponent;HandleDb:Integer); reintroduce;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure FilterActionExecute(Sender: TObject);
    procedure PrintActionExecute(Sender: TObject);
    procedure FontActionExecute(Sender: TObject);
    procedure CreateActionExecute(Sender: TObject);
    procedure DelActionExecute(Sender: TObject);
    procedure AddActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
    ReportTHerited = class (TThread)
      DataBase:TpFIBDatabase;
      Transaction:TpFIBTransaction;
      bar:TGauge;
      pos:Integer;
      ID_SESSION:Variant;
      ReportParam:Variant;
      Constructor Create (InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;RepParam:Variant);
      procedure Execute;override;
      destructor Destroy;override;
      procedure UpdateBar;
    end;

var
  fmMain: TfmMain;
  id_sp_report,id_session:Int64;
  IsDesign:Boolean;
  report:ReportTHerited;
  PFontNames:string;
  PFontSizes:integer;
  PFontColors:TColor;
  PFontStyles:TFontStyles;

implementation

uses dmReportBirthDateHead, NagScreenUnit, BaseTypes;

{$R *.dfm}

Constructor ReportTHerited.Create(InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;RepParam:Variant);
begin
{  inherited Create(False);
  DataBase:=InDataBase;
  Transaction:=InTransaction;
  bar:=prog;
  ID_SESSION:=ID_TRAN;
  ReportParam:=RepParam;
 }
end;


destructor TUP_UpReportBirthDateHead.Destroy;
begin
    inherited Destroy;
end;


procedure ReportTHerited.Execute;
begin
end;

procedure ReportTHerited.UpdateBar;
begin

end;


destructor ReportTHerited.Destroy;
begin
end;

function CreateSprav: TSprav;stdcall;
begin
    Result := TUP_UpReportBirthDateHead.Create;
end;

constructor TUP_UpReportBirthDateHead.Create;
begin
    inherited Create;
    Input.FieldDefs.Add('id_session', ftVariant);
    Input.FieldDefs.Add('id_sp_report', ftVariant);
    Input.FieldDefs.Add('DesignReport', ftBoolean);

    PrepareMemoryDatasets;
end;

procedure TUP_UpReportBirthDateHead.Show;
var
    hnd: Integer;
    Print: TfmMain;
begin
    hnd := Input['DBHandle'];
    id_sp_report := Input['id_sp_report'];
    IsDesign := Input['DesignReport'];

    PFontNames:='Times New Roman';
    PFontSizes:=10;
    PFontColors:=clDefault;

    DM := TDM.Create(nil);
    DM.DB.Handle := TISC_DB_HANDLE(hnd);
    Print:=TfmMain.Create(Application.MainForm,hnd);
    Print.ShowModal;
    Print.Free;
    Dm.Free;
end;

constructor TfmMain.Create(aOwner : TComponent;HandleDb:Integer);
begin
    inherited Create(aOwner);
    Dm.DSet.SelectSQL.Text:='select distinct NAME_REPORT from UP_DT_REPORT_SP_REPORT Where ID_SP_REPORT='+IntToStr(id_sp_report)+'';
    Dm.DSet.Active:=True;
    self.Caption:=Dm.DSet.FieldValues['NAME_REPORT'];

    Dm.DSet.Active:=False;
    //получаем идентификатор транзакции
    Dm.WriteTransaction.StartTransaction;
    Dm.StoredProc.StoredProcName:='UP_DT_REPORT_SESSION';
    Dm.StoredProc.Prepare;
    try
        Dm.StoredProc.ExecProc;
        except
        begin
            Dm.WriteTransaction.Rollback;
            Exit;
        end;
    end;
    ID_SESSION:= Dm.StoredProc.FieldByName('OUT_ID_REPORT_SESSION').AsVariant;
    Dm.WriteTransaction.Commit;
end;

procedure TfmMain.cxButtonCloseClick(Sender: TObject);
begin
    Close;
    with DM do
    begin
        if DSetData.IsEmpty then begin
            exit;
        end;

        WriteTransaction.StartTransaction;
        DataSetCreate.Active:=False;
        DataSetCreate.SelectSQL.Text := 'DELETE FROM Up_Dt_Report_Headers U where U.ID_REPORT_SESSION='+IntToStr(id_sp_report)+'';
        try
            DataSetCreate.Active:=True;
            except
            on e:exception do begin
                WriteTransaction.Rollback;
                messageBox(0,PChar('При занесенні данних у базу виникла помилка: "' + E.Message + '"'),'Помилка!',MB_OK);
                exit;
            end;
        end;

        WriteTransaction.Commit;
    end;
end;

procedure TfmMain.FilterActionExecute(Sender: TObject);
var
    sp: TSprav;
begin
    try
        sp :=  GetSprav('UP\UpReportFilter');
        if sp <> nil
        then
        begin
            with sp.Input do
            begin
                Append;
                FieldValues['DBHandle'] := Integer(Dm.DB.Handle);
                FieldValues['id_session'] := id_session;
                FieldValues['id_sp_report'] := id_sp_report;
                FieldValues['view_short_department'] :=1;                
                Post;
            end;
            sp.Show;
            if sp.Output['CorrFilter']=1 then
            PrintAction.Enabled:=true;
            sp.Free;
        end
        else ShowMessage('');
        except on e:Exception do
        MessageDlg(e.Message,mtError,[mbOk],0);
    end;
end;


procedure TfmMain.PrintActionExecute(Sender: TObject);
var
    ReportOptions:Variant;
    NameReport:TpFIBDataSet;
    m : TfrxMasterData;
    NagScreen: TNagScreen;
begin
    NagScreen := TNagScreen.Create(Application.MainForm);
    NagScreen.Show;
    NagScreen.SetStatusText('Чекайте! Йде формування звіту!');
    Screen.Cursor := crHourGlass;

    NameReport:=TpFIBDataSet.Create(Self);
    NameReport.Database:=Dm.DB;
    NameReport.Transaction:=Dm.ReadTransaction;
    NameReport.SelectSQL.Text:='select R.name_fr3 from up_dt_report_sp_report  R where R.id_sp_report=:id_sp_report';
    NameReport.ParamByName('id_sp_report').AsInt64:=id_sp_report;
    NameReport.Active:=true;

    ReportOptions:=VarArrayCreate([0,1],varVariant);
    ReportOptions[0]:=VarArrayOf([NameReport.FieldByName('name_fr3').AsString]);
    ReportOptions[1]:=VarArrayOf([IsDesign]);
    with Dm do
    begin
        Screen.Cursor := crDefault;
        NagScreen.Free;
        if  DSetData.IsEmpty then
        begin
            messageBox(0,PChar('За такими данними співробітників не знайдено'),'Увага!',MB_OK);
            Exit;
        end;

        Report.Clear;
        Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Up\'+ReportOptions[0][0]+'.fr3',True);
        Report.Variables['CUR_DATE']:=QuotedStr(DSetData['CUR_DATE']);

        m := TfrxMasterData(Report.FindObject('MasterData1'));
        if m <> nil then
        begin
            m.Font.Name := PFontNames;
            m.Font.Size := PFontSizes;
            m.Font.Color := PFontColors;
            m.Font.Style := PFontStyles;
        end;

        if ReportOptions[1][0]=true then
        begin
          Report.DesignReport;
        end
        else
        begin
          Report.ShowReport;
        end;
    end;
end;

procedure TfmMain.FontActionExecute(Sender: TObject);
begin
    if FontDialogs.Execute
    then
    begin
        PFontNames := FontDialogs.Font.Name;
        PFontSizes := FontDialogs.Font.Size;
        PFontColors := FontDialogs.Font.Color;
        PFontStyles := FontDialogs.Font.Style;
    end;
end;

procedure TfmMain.CreateActionExecute(Sender: TObject);
begin
    NagScreen := TNagScreen.Create(Application.MainForm);
    NagScreen.Show;
    NagScreen.SetStatusText('Чекайте! Йде формування звіту!');
    Screen.Cursor := crHourGlass;

    with Dm do
    begin

        WriteTransaction.StartTransaction;
        DataSetCreate.Active:=False;
        DataSetCreate.SelectSQL.Text:='execute procedure UP_REPORT_BIRTH_DATES_HEAD(:IN_ID_REPORT_SESSION)';
    try
        DataSetCreate.ParamByName('IN_ID_REPORT_SESSION').AsInt64:=id_session;
        DataSetCreate.Active:=True;
        except
        begin
            WriteTransaction.Rollback;
            messageBox(0,PChar('Помилка при формуванні!'),'Помилка!',MB_OK);
            Exit;
        end;
    end;
    WriteTransaction.Commit;
    Screen.Cursor := crDefault;
    NagScreen.Free;

    DSetData.Active:=False;
    DSetData.SelectSQL.Text:='select * from UP_REPORT_BIRTH_DATES_HEAD_SEL(:IN_ID_REPORT_SESSION) order by Months asc, Birth_Date asc, FIO collate win1251_ua';

    try
        DSetData.ParamByName('IN_ID_REPORT_SESSION').AsInt64:=id_session;
        DSetData.Active:=True;
        except
        on E:Exception do
        begin
            messageBox(0,PChar('Помилка при формуванні!'),'Помилка!',MB_OK);
            Exit;
        end;
    end;
   end;
end;

procedure TfmMain.DelActionExecute(Sender: TObject);
var id_head:int64;
begin
    with DM do
    begin
        if DSetData.IsEmpty then begin
            messageBox(0,PChar('Немає записів!'),'Увага!',MB_OK);
            exit;
        end;
        if (agMessageDlg('Увага!','Ви хочете видалити запис?',mtConfirmation,[mbYes,mbNo])=mrNo) then
            exit;

        WriteTransaction.StartTransaction;
        DataSetCreate.Active:=False;
        id_head:=DSetData['Id_Headers'];
        DataSetCreate.SelectSQL.Text := 'DELETE FROM Up_Dt_Report_Headers where Id_Headers=:id_head';

        try
            DataSetCreate.ParamByName('id_head').AsInt64:=id_head;
            DataSetCreate.Active:=True;
            except
            on e:exception do begin
                WriteTransaction.Rollback;
                messageBox(0,PChar('При занесенні данних у базу виникла помилка: "' + E.Message + '"'),'Помилка!',MB_OK);
                exit;
            end;
        end;

        WriteTransaction.Commit;

       DSetData.Active:=False;
       DSetData.SelectSQL.Text:='select * from UP_REPORT_BIRTH_DATES_HEAD_SEL(:IN_ID_REPORT_SESSION) order by Months asc, FIO collate win1251_ua';

       try
          DSetData.ParamByName('IN_ID_REPORT_SESSION').AsInt64:=id_session;
          DSetData.Active:=True;
          except
          on E:Exception do
          begin
              messageBox(0,PChar('Помилка при формуванні!'),'Помилка!',MB_OK);
              Exit;
          end;
       end;
    end;
end;

procedure TfmMain.AddActionExecute(Sender: TObject);
var
    sp: TSprav;
begin
    // создать справочник
    sp :=  GetSprav('asup\PCardsList');
    if sp <> nil then
    begin

        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(Dm.DB.Handle);
            FieldValues['ActualDate'] := Date;
            FieldValues['SecondDate'] := 0;
            FieldValues['ShowWorking'] := False;
            FieldValues['CanRemoveFilter'] := True;
            FieldValues['AdminMode'] := True;
            Post;
        end;

        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            with dm do
            begin
                WriteTransaction.StartTransaction;
                DataSetCreate.Active:=False;
                DataSetCreate.SelectSQL.Text := 'execute procedure UP_REPORT_BIRTH_DATES_PCARD(:IN_ID_PCARD,:IN_ID_REPORT_SESSION)';

                try
                    DataSetCreate.ParamByName('IN_ID_PCARD').AsInt64:=sp.Output['ID_PCARD'];
                    DataSetCreate.ParamByName('IN_ID_REPORT_SESSION').AsInt64:=id_session;
                    DataSetCreate.Active:=True;
                    except
                    on e:exception do begin
                        WriteTransaction.Rollback;
                        messageBox(0,PChar('При занесенні данних у базу виникла помилка: "' + E.Message + '"'),'Помилка!',MB_OK);
                        exit;
                    end;
                end;

                WriteTransaction.Commit;

                DSetData.Active:=False;
                DSetData.SelectSQL.Text:='select * from UP_REPORT_BIRTH_DATES_HEAD_SEL(:IN_ID_REPORT_SESSION)';

                try
                   DSetData.ParamByName('IN_ID_REPORT_SESSION').AsInt64:=id_session;
                   DSetData.Active:=True;
                   except
                   on E:Exception do
                   begin
                       messageBox(0,PChar('Помилка при формуванні!'),'Помилка!',MB_OK);
                       Exit;
                   end;
                end;
            end;

            {Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO']; }


        end;
        sp.Free;
    end;
end;

end.
