unit UPers2010Docs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, dxBar, dxBarExtItems, cxGridBandedTableView, cxClasses,
  cxStyles, cxGridTableView, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxControls, cxGridCustomView,
  cxGrid, cxSplitter, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  pFibStoredProc, ExtCtrls, AppStruClasses, cxContainer, cxMemo, cxDBEdit,
  PackageLoad, ZProc, StdCtrls, Menus, frxClass, frxDBSet, frxDesgn,IniFiles;

type
  TfrmMainPers = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    AddReportBtn: TdxBarLargeButton;
    DelReportBtn: TdxBarLargeButton;
    ExportBtn: TdxBarLargeButton;
    GroupBtn: TdxBarLargeButton;
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
    cxSplitter1: TcxSplitter;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    WorkDatabase: TpFIBDatabase;
    DocsDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DocsDataSource: TDataSource;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    FormsDataSet: TpFIBDataSet;
    FormsDataSource: TDataSource;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton5: TdxBarLargeButton;
    Panel2: TPanel;
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1DBTableView1DBColumn1: TcxGridDBColumn;
    Grid1ClNumReport: TcxGridDBColumn;
    grid1ClDateReport: TcxGridDBColumn;
    Grid1DBTableView1DBColumn2: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    Panel4: TPanel;
    cxDBMemo1: TcxDBMemo;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    dxBarLargeButton6: TdxBarLargeButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    PrintBtn: TdxBarLargeButton;
    Report: TfrxReport;
    Designer: TfrxDesigner;
    frxDBDataset1: TfrxDBDataset;
    PrintDataSet: TpFIBDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitBtnClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure AddReportBtnClick(Sender: TObject);
    procedure PamResize(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure DelReportBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure GroupBtnClick(Sender: TObject);
    procedure ExportBtnClick(Sender: TObject);
    procedure Grid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
  private
    ModuleFactory:TFMASAppModuleCreator;
    procedure LoadPersModule;
    function SetNewStatus: Integer;
    //PPersonPrint:TPersonPrint;
  public
    { Public declarations }
    PDb_Handle:TISC_DB_HANDLE;
    FidUser:Int64;
    constructor Create(AOwner:TComponent;dbhandle:TISC_DB_HANDLE;id_user:Int64);reintroduce;
  end;

implementation

uses UDocEdit, UAnketa, UPersPrint;

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const SectionOfIniFile         = 'Personification';
const NameReport               = 'Reports\Zarplata\PersonificationPrint.fr3';

{ TForm1 }
function TfrmMainPers.SetNewStatus: Integer;
var UpdSP:TpFIBStoredProc;
    Res:Integer;
    id:Int64;
begin
     Res:=0;
     if DocsDataSet.RecordCount>0
     then begin
               Res:=DocsDataSet.FieldByName('id_level').Value;
               UpdSP:=TpFIBStoredProc.Create(self);
               UpdSP.Database:=WorkDatabase;
               UpdSP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;

               id:=DocsDataSet.FieldByName('ID_PERSON_DOCUMENT').Value;

               UpdSP.StoredProcName:='PERSON_DOCUMENTS_UPDL';
               UpdSP.Prepare;

               UpdSP.ParamByName('ID_PERSON_DOCUMENT').Value:=DocsDataSet.FieldByName('ID_PERSON_DOCUMENT').Value;

               if Res=0
               then begin
                         UpdSP.ParamByName('ID_LEVEL').Value          :=1;
                         Res:=1;
               end
               else begin
                         UpdSP.ParamByName('ID_LEVEL').Value          :=0;
                         Res:=0;
               end;


               UpdSP.ParamByName('ID_USER').AsInt64              :=FidUser;

               UpdSP.ExecProc;

               WriteTransaction.Commit;

               UpdSP.Close;
               UpdSP.Free;

               DocsDataSet.CloseOpen(true);
               DocsDataSet.Locate('ID_PERSON_DOCUMENT',id,[]);
     end;

     Result:=Res;
end;


constructor TfrmMainPers.Create(AOwner: TComponent; dbhandle: TISC_DB_HANDLE; id_user: Int64);
begin
     inherited Create(AOwner);
     FidUser:=id_user;


     PDb_Handle := dbhandle;
     WorkDatabase.Handle:=dbhandle;
     ReadTransaction.StartTransaction;
     DocsDataSet.SelectSQL.Text:='select * from person_documents_sel';
     DocsDataSet.Open;
     DocsDataSet.Last;

     FormsDataSet.SelectSQL.Text:='select * from PERSON_SP_FORM_SEL(?id_person_document)';

     ModuleFactory:=TFMASAppModuleCreator.Create;
end;

procedure TfrmMainPers.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmMainPers.ExitBtnClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmMainPers.dxBarLargeButton1Click(Sender: TObject);
var T:TfrmDocInfo;
    UpdSp:TpFIBStoredProc;
    id:Int64;
begin
     //можно редактировать только неподписанную заявку
     if (DocsDataSet.RecordCount>0)
     then begin
               if   (DocsDataSet.FieldByName('ID_LEVEL').Value=0)
               and  (not FormsDataSet.Locate('form_ststus',1,[]))
               then begin
                         T:=TfrmDocInfo.Create(self);
                         T.docComment.Text:=DocsDataSet.FieldByName('comments').AsString;
                         if T.ShowModal=mrYes
                         then begin
                                   UpdSp:=TpFIBStoredProc.Create(self);
                                   UpdSp.Database:=WorkDatabase;
                                   UpdSp.Transaction:=WriteTransaction;
                                   WriteTransaction.StartTransaction;

                                   UpdSp.StoredProcName:='PERSON_DOCUMENTS_UPD';
                                   UpdSp.Prepare;
                                   id:=DocsDataSet.FieldByName('ID_PERSON_DOCUMENT').Value;
                                   UpdSp.ParamByName('ID_PERSON_DOCUMENT').Value:=DocsDataSet.FieldByName('ID_PERSON_DOCUMENT').Value;
                                   UpdSp.ParamByName('COMMENTS').Value          :=t.docComment.Text;
                                   UpdSp.ParamByName('ID_MODIFY_USER').AsInt64  :=FidUser;
                                   UpdSp.ExecProc;
                                   WriteTransaction.Commit;

                                   DocsDataSet.CloseOpen(true);
                                   DocsDataSet.Locate('ID_PERSON_DOCUMENT',ID,[]);

                                   UpdSp.Close;
                                   UpdSp.Free;
                         end;
                         T.Free;
               end
               else ShowMessage('Не можна редагувати підписаний звіт!');
     end;
end;

procedure TfrmMainPers.AddReportBtnClick(Sender: TObject);
var SP:TpFibStoredProc;
    id:Int64;
begin
     if Application.MessageBox('Ви хочете додати документ?', 'Warning', MB_YESNO + MB_ICONQUESTION) = IDYES
     then begin
               Screen.Cursor:=crHourGlass;

               try


                       SP:=TpFibStoredProc.Create(self);
                       SP.Database        :=WorkDatabase;
                       SP.Transaction     :=WriteTransaction;

                       WriteTransaction.StartTransaction;
                       SP.StoredProcName:='PERSON_DOCUMENTS_INS';
                       SP.Prepare;
                       SP.ParamByName('id_user').AsInt64:=FidUser;
                       SP.ExecProc;
                       id:=SP.ParamByName('id_person_document').AsInt64;
                       WriteTransaction.Commit;
                       DocsDataSet.CloseOpen(true);
                       DocsDataSet.Locate('id_person_document',id,[]);
                       SP.Close;
                       SP.Free;
               except on E:Exception do
                       begin
                            ShowMessage(E.Message);
                       end;
               end;

               Screen.Cursor:=crDefault;
     end;

end;

procedure TfrmMainPers.PamResize(Sender: TObject);
begin
      Panel1.Width := Self.Width div 2;
      cxSplitter1.Left:=Panel1.Left-1;
      Grid1.Width  := Self.Width div 2;
end;

procedure TfrmMainPers.cxGridDBTableView1DblClick(Sender: TObject);
begin
     LoadPersModule
end;

procedure TfrmMainPers.DelReportBtnClick(Sender: TObject);
var UpdSp:TpFIBStoredProc;
begin
     if (DocsDataSet.RecordCount>0)
     then begin
               if  (DocsDataSet.FieldByName('ID_LEVEL').Value=0)
               and (not FormsDataSet.Locate('form_ststus',1,[]))
               then begin
                         if Application.MessageBox('Ви хочете видалити звіт?', 'Увага!', MB_YESNO + MB_ICONQUESTION) = IDYES
                         then begin
                                   UpdSp:=TpFIBStoredProc.Create(self);
                                   UpdSp.Database:=WorkDatabase;
                                   UpdSp.Transaction:=WriteTransaction;
                                   WriteTransaction.StartTransaction;

                                   UpdSp.StoredProcName:='PERSON_DOCUMENTS_DEL';
                                   UpdSp.Prepare;
                                   UpdSp.ParamByName('ID_PERSON_DOCUMENT').Value:=DocsDataSet.FieldByName('ID_PERSON_DOCUMENT').Value;
                                   UpdSp.ExecProc;
                                   WriteTransaction.Commit;

                                   DocsDataSet.CacheDelete;

                                   UpdSp.Close;
                                   UpdSp.Free;
                         end;
               end
               else ShowMessage('Не можна видалити підписаний звіт!');          
     end;
end;

procedure TfrmMainPers.RefreshBtnClick(Sender: TObject);
var id:Int64;
begin
     Grid1.BeginUpdate;
     if (DocsDataSet.RecordCount>0)
     then id:=DocsDataSet.FieldByName('ID_PERSON_DOCUMENT').Value
     else id:=-1;

     DocsDataSet.CloseOpen(true);
     DocsDataSet.Locate('id_person_document',id,[]);
     Grid1.EndUpdate;
end;

procedure TfrmMainPers.GroupBtnClick(Sender: TObject);
begin
     LoadPersModule;
end;

procedure TfrmMainPers.LoadPersModule;
var ZpersModule:TFMASAppModule;
    id_user:Int64;
    kod_setup:Integer;
    id_report:Int64;
    app_path, path_, mname:string;
    Index:Integer;
begin
     if (FormsDataSet.RecordCount>0)
     then begin
               if (FormsDataSet.FieldByName('APP_MODULE').Value<>null)
               then begin
                         app_path:=ExtractFilePath(Application.ExeName);
                         path_:=FormsDataSet.FieldByName('APP_MODULE').AsString+'.bpl';
                         path_:=app_path+path_;
                         app_path:=ExtractFilePath(path_);
                         path_    :=ExtractFileName(path_);
                         index:=(Length(path_)-4);
                         Delete(path_,index+1,4);
                         //ShowMessage(path_);
                         ZpersModule:=ModuleFactory.CreateFMASModule(app_path,path_);

                         if (ZpersModule=nil)
                         then MessageBox(self.Handle, PAnsiChar('Помилка при роботі з модулем '+FormsDataSet.FieldByName('APP_MODULE').AsString+'.bpl'), 'Увага!', MB_OK or MB_ICONWARNING)
                         else begin
                                    kod_setup:=FormsDataSet.FieldByName('KOD_SETUP_OUT').Value;
                                    ZpersModule.InParams.Items['AOwner']   := @self;
                                    ZpersModule.InParams.Items['DbHandle'] := PInteger(@WorkDatabase.Handle);
                                    id_user:=FidUser;
                                    ZpersModule.InParams.Items['Id_User']  := PInteger(@id_user);
                                    ZpersModule.InParams.Items['KodSetup'] := PInteger(@kod_setup);
                                    id_report:=TFibBCDField(DocsDataSet.FieldByName('id_person_document')).AsInt64;
                                    ZpersModule.InParams.Items['IdReport'] := PInteger(@id_report);
                                    (ZpersModule as IFMASModule).Run;
                         end;
               end
               else MessageBox(self.Handle, PAnsiChar('Форма '+FormsDataSet.FieldByName('PERSON_FORM_TIILE').AsString+' не сконфігурована для роботи!'), 'Увага!', MB_OK or MB_ICONWARNING);
     end;
end;

procedure TfrmMainPers.ExportBtnClick(Sender: TObject);
begin
      if DocsDataSet.FieldByName('ID_LEVEL').Value=1
      then LoadPersonification2010ExportToDbf(Self,WorkDatabase.Handle,TFibBCDField(DocsDataSet.FieldByName('id_person_document')).AsInt64,FormsDataSet.FieldByName('KOD_SETUP_OUT').Value)
      else ShowMessage('Не можна експортувати, звіт не підписано!');
end;

procedure TfrmMainPers.Grid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if(AFocusedRecord=nil)then
    ExportBtn.Enabled:=False
  else
    ExportBtn.Enabled:=True;
end;

procedure TfrmMainPers.dxBarLargeButton3Click(Sender: TObject);
begin
     if (DocsDataSet.RecordCount>0)
     then begin
               if DocsDataSet.FieldByName('id_level').Value=0
               then begin
                         if not FormsDataSet.Locate('form_ststus',0,[])
                         then SetNewStatus
                         else ShowMessage('Не можна підписати, є форми на рівні "Чернетка"!');
               end
               else ShowMessage('Документ вже підписано!');
     end;
end;

procedure TfrmMainPers.dxBarLargeButton4Click(Sender: TObject);
begin
     if (DocsDataSet.RecordCount>0)
     then begin
               if DocsDataSet.FieldByName('id_level').Value=1
               then SetNewStatus
               else ShowMessage('Документ ще не підписано!');
     end;

end;

procedure TfrmMainPers.FormActivate(Sender: TObject);
begin
     RefreshBtnClick(self);
end;

procedure TfrmMainPers.dxBarLargeButton6Click(Sender: TObject);
var T:TfrmAnketaInfo;
begin
     if DocsDataSet.RecordCount>0
     then begin
               T:=TfrmAnketaInfo.Create(Self,
                                        WorkDatabase.Handle,
                                        FidUser,
                                        DocsDataSet.FieldByName('ID_PERSON_DOCUMENT').value,
                                        DocsDataSet.FieldByName('KOD_SETUP').value,
                                        DocsDataSet.FieldByName('id_level').value
                                        );
               T.ShowModal;
               T.Free;
     end;
end;

procedure TfrmMainPers.N1Click(Sender: TObject);
var
  SP:TpFibStoredProc;
  id:Int64;
begin
     if (DocsDataSet.RecordCount>0)
     then begin
               if Application.MessageBox('Ви хочете додати додатковий документ?', 'Увага!', MB_YESNO + MB_ICONQUESTION) = IDYES
               then begin
               Screen.Cursor:=crHourGlass;

               try


                       SP:=TpFibStoredProc.Create(self);
                       SP.Database        :=WorkDatabase;
                       SP.Transaction     :=WriteTransaction;

                       WriteTransaction.StartTransaction;
                       SP.StoredProcName:='PERSON_DOCUMENTS_INS2';
                       SP.Prepare;
                       SP.ParamByName('id_user').AsInt64:=FidUser;
                       SP.ParamByName('id_report').Value:=DocsDataSet.FieldByName('ID_PERSON_DOCUMENT').Value;
                       SP.ExecProc;
                       id:=SP.ParamByName('id_person_document').AsInt64;
                       WriteTransaction.Commit;
                       DocsDataSet.CloseOpen(true);
                       DocsDataSet.Locate('id_person_document',id,[]);
                       SP.Close;
                       SP.Free;
               except on E:Exception do
                       begin
                            ShowMessage(E.Message);
                       end;
               end;

               Screen.Cursor:=crDefault;
     end;
     end
end;

procedure TfrmMainPers.PrintBtnClick(Sender: TObject);
var
  ViewForm : TfmPersonPrint;
  IniFile:TIniFile;
  ViewMode:integer;
  PathReport:string;
  DataBegReport:string;
  DataEndReport:string;
begin
  ViewForm := TfmPersonPrint.Create(Self,PDb_Handle);
  ViewForm.ShowModal;
  {if (ViewForm.flag=1)then
  begin
    //try
      DataBegReport := DateToStr(ViewForm.Parameter.dataBeg);
      DataEndReport := DateToStr(ViewForm.Parameter.dataEnd);
      PrintDataSet.Close;
      PrintDataSet.SelectSQL.Text:='select * from Z_PERSONIFICATION_PRINT(:KOD_SETUP_BEG,:KOD_SETUP_END, :id_man) order by DATE_REPORT';
      PrintDataSet.ParamByName('KOD_SETUP_BEG').Value := ViewForm.Parameter.Kod_Setup_Beg;
      PrintDataSet.ParamByName('KOD_SETUP_END').Value := ViewForm.Parameter.Kod_Setup_End;
      PrintDataSet.ParamByName('id_man').Value        := ViewForm.Parameter.ID_man;
      PrintDataSet.Open;

      if not (PrintDataSet.IsEmpty) then
      begin
        IniFile    := TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
        ViewMode   := IniFile.ReadInteger(SectionOfIniFile,'ViewMode',1);
        PathReport := IniFile.ReadString(SectionOfIniFile,'NameReport',NameReport);
        IniFile.Free;
        Report.Clear;
        Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);
        Report.Variables.AddVariable('User Category','DateBeg',''''+DataBegReport+' ''');
        Report.Variables.AddVariable('User Category','DateEng',''''+DataEndReport+' ''');
        Report.DesignReport;
       // Report.ShowReport;
      end
      else
      ShowMessage('Даних для формування справки немає');
   { except on E: Exception do
      begin
       ShowMessage('3');
      end;    }
    // end;
  //end;}
end;

end.
