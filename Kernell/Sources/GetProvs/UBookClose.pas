 unit UBookClose;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, Ibase, StdCtrls, DB, FIBDataSet,
  pFIBDataSet, dateUtils, ExtCtrls, ComCtrls, cxLookAndFeelPainters,
  cxButtons, Menus,pFibStoredProc, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxSplitter, frxClass,
  frxDBSet, frxCross, cxContainer, cxRadioGroup, cxDropDownEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxProgressBar,Contnrs, ImgList,
  AccMGMT, Placemnt, cxCalendar, frxExportPDF, frxExportImage,
  frxExportXML, frxExportXLS, frxExportHTML, frxExportTXT;

type
  TfrmCloseBook = class(TForm)
    WorkDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    SysDataSet: TpFIBDataSet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    ErrorsDataSet: TpFIBDataSet;
    ErrorDataSource: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    ActionLog: TRichEdit;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cbMonth: TComboBox;
    cbYear: TComboBox;
    cxButton1: TcxButton;
    CurMonth: TEdit;
    CurYear: TEdit;
    frxCrossObject1: TfrxCrossObject;
    SchMainBookData: TfrxDBDataset;
    SchMainBookDataDataSet: TpFIBDataSet;
    cxButton2: TcxButton;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    SystemDataSet: TpFIBDataSet;
    SystemDataSource: TDataSource;
    ProgressBar1: TProgressBar;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    SmallImages: TImageList;
    N5: TMenuItem;
    N9: TMenuItem;
    FormStorage1: TFormStorage;
    cbWorkYear: TComboBox;
    Label3: TLabel;
    N10: TMenuItem;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxPDFExport1: TfrxPDFExport;
    frxReport1: TfrxReport;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxDateEdit1: TcxDateEdit;
    Label4: TLabel;
    SchFilterDataSource: TDataSource;
    SchFilterDataSet: TpFIBDataSet;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
  private
    MBOOK_DATE   :TDateTime;
    NEWBOOK_DATE :TDateTime;
    KEY_SESSION  :Int64;
    Pages        :array of TComponent;
    Function     GetControlOnPage(ComponentTag:Integer;ComponentClass:TClass;ObjName:String):TComponent;
    Function     GetCurrentFrame(ComponentTag:Integer):TComponent;
    Procedure    GetRight;
  public
    Constructor  Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);overload;
    Destructor   Destroy;  override;
  end;

  procedure GetMBOOK(AOwner:TComponent;DBHandle:TISC_DB_HANDLE);stdcall;
  exports GetMBOOK;

implementation

uses Resources_unitb,UProgressForm,
     GlobalSpr, UMBookSchFrame,RxMemDS;

procedure GetMBOOK(AOwner:TComponent;DBHandle:TISC_DB_HANDLE);
var f:Boolean;
    i:Integer;
begin
    f:=true;
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    begin
         if (Application.MainForm.MDIChildren[i] is TfrmCloseBook)
         then begin
              Application.MainForm.MDIChildren[i].BringToFront;
              f:=false;
         end;
    end;
    if f then TfrmCloseBook.Create(AOwner,DBHandle);
end;

{$R *.dfm}

Destructor  TfrmCloseBook.Destroy;
begin
     inherited Destroy;
end;

Constructor TfrmCloseBook.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);
var i:Integer;
    Y,M,D:WORD;
begin
      inherited Create(AOwner);
      cxDateEdit1.Date:=Date;
      PageControl1.ActivePageIndex:=0;
      Screen.Cursor:=crHourGlass;
      WorkDatabase.Handle:=DB_HANDLE;
      SystemDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_SYSTEM';
      SystemDataSet.Open;

      SchFilterDataSet.SelectSQL.Text:='SELECT * FROM MBOOK_PRINT_ITEMS_EXCL_SEL';
      SchFilterDataSet.Open;


      KEY_SESSION:=WorkDatabase.Gen_Id('MBOOK_SESSION',1);
      ErrorsDataSet.SelectSQL.Text:='SELECT * FROM MBOOK_ERRORS WHERE KEY_SESSION='+IntToStr(KEY_SESSION);
      //ErrorsDataSet.OPen;
      SysDataSet.Open;
      MBOOK_DATE:=SysDataSet.FieldByName('MAIN_BOOK_DATE').AsDateTime;
      DecodeDate(MBOOK_DATE,Y,M,D);
      //Panel3.Caption:='Ðîáîòà ç ãîëîâíîþ êíèãîþ. Ðîáî÷³é ïåð³îä - '+GlobalSpr.MonthTitle(MBOOK_DATE)+' '+IntToStr(Y);

      DecodeDate(MBOOK_DATE,Y,M,D);
      if (M=12)
      then NEWBOOK_DATE:=EncodeDate(Y+1,1,1)
      else NEWBOOK_DATE:=EncodeDate(Y,M+1,1);
      SysDataSet.Close;

      cbMonth.Items.Add(TRIM(BU_Month_01));
      cbMonth.Items.Add(TRIM(BU_Month_02));
      cbMonth.Items.Add(TRIM(BU_Month_03));
      cbMonth.Items.Add(TRIM(BU_Month_04));
      cbMonth.Items.Add(TRIM(BU_Month_05));
      cbMonth.Items.Add(TRIM(BU_Month_06));
      cbMonth.Items.Add(TRIM(BU_Month_07));
      cbMonth.Items.Add(TRIM(BU_Month_08));
      cbMonth.Items.Add(TRIM(BU_Month_09));
      cbMonth.Items.Add(TRIM(BU_Month_10));
      cbMonth.Items.Add(TRIM(BU_Month_11));
      cbMonth.Items.Add(TRIM(BU_Month_12));

      for i:=0 to YEARS_COUNT do
      begin
          cbYear.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
      end;

      for i:=0 to YEARS_COUNT do
      begin
          cbWorkYear.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
      end;

      cbMonth.ItemIndex:=MonthOf(MBOOK_DATE)-1;
      CurMonth.Text:=cbMonth.Items[cbMonth.ItemIndex];
      cbMonth.ItemIndex:=MonthOf(NEWBOOK_DATE)-1;

      for i:=0 to cbYear.Items.Count-1 do
      begin
           if pos(cbYear.Items[i],IntToStr(YearOf(MBOOK_DATE)))>0
           then begin
              cbYear.ItemIndex:=i;
              break;
           end;
      end;
      CurYear.Text:=cbYear.Items[cbYear.ItemIndex];

      for i:=0 to cbWorkYear.Items.Count-1 do
      begin
           if pos(cbWorkYear.Items[i],IntToStr(YearOf(MBOOK_DATE)))>0
           then begin
              cbWorkYear.ItemIndex:=i;
              break;
           end;
      end;


      for i:=0 to cbYear.Items.Count-1 do
      begin
           if pos(cbYear.Items[i],IntToStr(YearOf(NEWBOOK_DATE)))>0
           then begin
              cbYear.ItemIndex:=i;
              break;
           end;
      end;

      ActionLog.Lines.Add('Ðîáîòà ç ãîëîâíîþ êíèãîþ...'+TimeToStr(Time));
      Screen.Cursor:=crDefault;

      GetRight;
end;

procedure TfrmCloseBook.cxButton1Click(Sender: TObject);
var  ActualDate:TDateTime;
     date_str:String;
     i:Integer;
     Result:INteger;
     Y,M,D:Word;
     CloseStoredProc:TpFibStoredProc;
begin
     Screen.Cursor:=crHourGlass;
     DateSeparator:='.';
     ActualDate:=StrToDate('01.'+IntToStr(cbMonth.ItemIndex+1)+'.'+cbYear.Items[cbYear.ItemIndex]);
     DateTimeToString(date_str,'dd.mm.yyyy',ActualDate);


     CloseStoredProc:=TpFibStoredProc.Create(self);
     CloseStoredProc.Database:=WorkDatabase;
     CloseStoredProc.Transaction:=WriteTransaction;
     CloseStoredProc.StoredProcName:='MBOOK_CLOSE';
     WriteTransaction.StartTransaction;
     CloseStoredProc.Prepare;
     CloseStoredProc.ParamByName('MODE').Value:=1;
     CloseStoredProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
     CloseStoredProc.ParamByName('ID_USER').AsInt64:=0;
     ActionLog.Lines.Add('Çàêðèòòÿ ãîëîâíî¿ êíèãè...'+TimeToStr(Time));
     CloseStoredProc.ExecProc;
     Result:=CloseStoredProc.ParamByName('RESULT').AsInteger;
     ActionLog.Lines.Add(CloseStoredProc.ParamByName('LOG_MESSAGE').AsString);

     ErrorsDataSet.Open;
     ErrorsDataSet.FetchAll;
     ErrorsDataSet.First;
     for i:=0 to ErrorsDataSet.RecordCount -1 do
     begin
          ActionLog.Lines.Add(ErrorsDataSet.FieldByName('ERROR_MSG').AsString);
          ErrorsDataSet.Next;
     end;

     ErrorsDataSet.Close;

     if Result=0
     then WriteTransaction.Rollback
     else WriteTransaction.Commit;
     CloseStoredProc.Free;


     Screen.Cursor:=crDefault;

     if Result=1
     then begin
               if SysDataSet.Active then SysDataSet.Close;
               SysDataSet.Open;
               MBOOK_DATE:=SysDataSet.FieldByName('MAIN_BOOK_DATE').AsDateTime;
               DecodeDate(MBOOK_DATE,Y,M,D);
               if (M=12)
               then NEWBOOK_DATE:=EncodeDate(Y+1,1,1)
               else NEWBOOK_DATE:=EncodeDate(Y,M+1,1);
               SysDataSet.Close;
               for i:=0 to YEARS_COUNT do
               begin
                   cbYear.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
               end;

               cbMonth.ItemIndex:=MonthOf(MBOOK_DATE)-1;
               CurMonth.Text:=cbMonth.Items[cbMonth.ItemIndex];
               cbMonth.ItemIndex:=MonthOf(NEWBOOK_DATE)-1;

               for i:=0 to cbYear.Items.Count-1 do
               begin
                    if pos(cbYear.Items[i],IntToStr(YearOf(MBOOK_DATE)))>0
                    then begin
                       cbYear.ItemIndex:=i;
                       break;
                    end;
               end;
               CurYear.Text:=cbYear.Items[cbYear.ItemIndex];
               for i:=0 to cbYear.Items.Count-1 do
               begin
                    if pos(cbYear.Items[i],IntToStr(YearOf(NEWBOOK_DATE)))>0
                    then begin
                       cbYear.ItemIndex:=i;
                       break;
                    end;
               end;
               //ShowSchPages(MBOOK_DATE,true);
     end;
end;

procedure TfrmCloseBook.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmCloseBook.N1Click(Sender: TObject);
begin
    cxButton1Click(self);
end;

procedure TfrmCloseBook.N2Click(Sender: TObject);
var  date_str:String;
     i:Integer;
     Result:INteger;
     Y,M,D:Word;
     CloseStoredProc:TpFibStoredProc;
begin
     Screen.Cursor:=crHourGlass;
     DecodeDate(MBOOK_DATE,y,m,d);
     if (M=1)
     then NEWBOOK_DATE:=EncodeDate(Y-1,12,1)
     else NEWBOOK_DATE:=EncodeDate(Y,M-1,1);
     DateTimeToString(date_str,'dd.mm.yyyy',NEWBOOK_DATE);

     CloseStoredProc:=TpFibStoredProc.Create(self);
     CloseStoredProc.Database:=WorkDatabase;
     CloseStoredProc.Transaction:=WriteTransaction;
     CloseStoredProc.StoredProcName:='MBOOK_CLOSE';
     WriteTransaction.StartTransaction;
     CloseStoredProc.Prepare;
     CloseStoredProc.ParamByName('MODE').Value:=2;
     CloseStoredProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
     CloseStoredProc.ParamByName('ID_USER').AsInt64:=KEY_SESSION;
     ActionLog.Lines.Add('Â²ÄÊÀÒ ÃÎÃËÎÂÍÎ¯ ÊÍÈÃÈ.'+TimeToStr(Time));
     CloseStoredProc.ExecProc;
     Result:=CloseStoredProc.ParamByName('RESULT').AsInteger;
     ActionLog.Lines.Add(CloseStoredProc.ParamByName('LOG_MESSAGE').AsString);

     ErrorsDataSet.Open;
     ErrorsDataSet.FetchAll;
     ErrorsDataSet.First;
     for i:=0 to ErrorsDataSet.RecordCount -1 do
     begin
          ActionLog.Lines.Add(ErrorsDataSet.FieldByName('ERROR_MSG').AsString);
          ErrorsDataSet.Next;
     end;

     ErrorsDataSet.Close;

     if Result=0
     then WriteTransaction.Rollback
     else WriteTransaction.Commit;
     CloseStoredProc.Free;

     Screen.Cursor:=crDefault;

     if Result=1
     then begin
               if SysDataSet.Active then SysDataSet.Close;
               SysDataSet.Open;
               MBOOK_DATE:=SysDataSet.FieldByName('MAIN_BOOK_DATE').AsDateTime;
               DecodeDate(MBOOK_DATE,Y,M,D);
               if (M=12)
               then NEWBOOK_DATE:=EncodeDate(Y+1,1,1)
               else NEWBOOK_DATE:=EncodeDate(Y,M+1,1);
               SysDataSet.Close;
               for i:=0 to YEARS_COUNT do
               begin
                    cbYear.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
               end;

               cbMonth.ItemIndex:=MonthOf(MBOOK_DATE)-1;
               CurMonth.Text:=cbMonth.Items[cbMonth.ItemIndex];
               cbMonth.ItemIndex:=MonthOf(NEWBOOK_DATE)-1;

               for i:=0 to cbYear.Items.Count-1 do
               begin
                    if pos(cbYear.Items[i],IntToStr(YearOf(MBOOK_DATE)))>0
                    then begin
                       cbYear.ItemIndex:=i;
                       break;
                    end;
               end;
               CurYear.Text:=cbYear.Items[cbYear.ItemIndex];

               for i:=0 to cbYear.Items.Count-1 do
               begin
                    if pos(cbYear.Items[i],IntToStr(YearOf(NEWBOOK_DATE)))>0
                    then begin
                       cbYear.ItemIndex:=i;
                       break;
                    end;
               end;
               //ShowSchPages(MBOOK_DATE,true);
     end;
end;

procedure TfrmCloseBook.cxButton2Click(Sender: TObject);
  var TempSchQuery:TpFibDataSet;
      i:Integer;
      WorkYear:Integer;
begin
    cxButton2.Enabled:=False;
    WorkYear:=StrToInt(cbWorkYear.Items[cbWorkYear.ItemIndex]);

    Screen.Cursor:=crHourGlass;

    ProgressBar1.Visible:=true;
    WriteTransaction.StartTransaction;
    TempSchQuery:=TpFibDataSet.Create(self);
    TempSchQuery.Database:=WorkDatabase;
    TempSchQuery.Transaction:=ReadTransaction;
    TempSchQuery.SelectSQL.Text:=' SELECT * FROM MBOOK_GET_SCH_FOR_PRINT('+IntToStr(WorkYear)+','+IntToStr(KEY_SESSION)+') ORDER BY sch_number ASC';
    TempSchQuery.Open;
    TempSchQuery.FetchAll;
    frxReport1.Clear;
    ProgressBar1.Visible:=true;
    ProgressBar1.Max:=TempSchQuery.RecordCount;
    ProgressBar1.Step:=1;

    for i:=0 to TempSchQuery.RecordCount-1 do
    begin
         if SchMainBookDataDataSet.Active then SchMainBookDataDataSet.Close;
         SchMainBookDataDataSet.SelectSQL.Text:='SELECT * FROM MBOOK_SCH_PRINT('+TempSchQuery.FieldByName('ID_SCH').AsString+','+
                                                                                 ''''+TempSchQuery.FieldByName('PERIOD_BEG').AsString+''''+','+
                                                                                 ''''+TempSchQuery.FieldByName('PERIOD_END').AsString+''''+','+''''+',0)';


         frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Mbook\ReportSchMainBook.fr3',true);
         try
         if i=0 then frxReport1.PrepareReport
                else frxReport1.PrepareReport(False);
         except on E:Exception do begin end;
         end;

         TempSchQuery.Next;
         ProgressBar1.StepIt;
    end;

    TempSchQuery.Close;
    TempSchQuery.Free;
    Screen.Cursor:=crDefault;

    frxReport1.ShowPreparedReport;
    ProgressBar1.Visible:=false;
    WriteTransaction.Commit;
    cxButton2.Enabled:=true;
end;

Function TfrmCloseBook.GetCurrentFrame(ComponentTag:Integer):TComponent;
var ResComponent:TComponent;
    i:Integer;
begin
    Screen.Cursor:=crHourglass;
    ResComponent:=nil;
    for  i:=0 to LENGTH(Pages)-1 do
    begin
         if (Pages[i]<>NIL) and (Pages[i].Tag=ComponentTag)
         then begin  ResComponent:=Pages[i].Components[0]; Break; end;
    end;
    Screen.Cursor:=crDefault;
    GetCurrentFrame:=ResComponent;
end;



function TfrmCloseBook.GetControlOnPage(ComponentTag:Integer;ComponentClass:TClass;ObjName:String):TComponent;
var ResComponent:TComponent;
    CurPage:TComponent;
    i:Integer;
begin
    Screen.Cursor:=crHourglass;
    ResComponent:=nil;
    CurPage:=nil;
    for  i:=0 to LENGTH(Pages)-1 do
    begin
         if (Pages[i]<>NIL) and (Pages[i].Tag=ComponentTag)
         then begin  CurPage:=Pages[i]; Break; end;
    end;
    for i:=0 to CurPage.Components[0].ComponentCount-1 do
    begin
          if  (CurPage.Components[0].Components[i] is TClass) and (CurPage.Components[0].Components[i].Name=ObjName)
          then begin
               ResComponent:=CurPage.Components[0].Components[i]; Break;
          end;
    end;
    Screen.Cursor:=crDefault;
    GetControlOnPage:=ResComponent;
end;

procedure TfrmCloseBook.N8Click(Sender: TObject);
begin
      close;
end;

procedure TfrmCloseBook.N5Click(Sender: TObject);
var  date_str:String;
     i:Integer;
     Result:INteger;
     Y,M,D:Word;
     CloseStoredProc:TpFibStoredProc;
begin
     Screen.Cursor:=crHourGlass;
     DecodeDate(MBOOK_DATE,y,m,d);
     if (M=1)
     then NEWBOOK_DATE:=EncodeDate(Y-1,12,1)
     else NEWBOOK_DATE:=EncodeDate(Y,M-1,1);
     DateTimeToString(date_str,'dd.mm.yyyy',NEWBOOK_DATE);

     CloseStoredProc:=TpFibStoredProc.Create(self);
     CloseStoredProc.Database:=WorkDatabase;
     CloseStoredProc.Transaction:=WriteTransaction;
     CloseStoredProc.StoredProcName:='MBOOK_CLOSE_EX';
     WriteTransaction.StartTransaction;
     CloseStoredProc.Prepare;
     CloseStoredProc.ParamByName('MODE').Value:=2;
     CloseStoredProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
     CloseStoredProc.ParamByName('ID_USER').AsInt64:=KEY_SESSION;
     ActionLog.Lines.Add('Â²ÄÊÀÒ ÃÎÃËÎÂÍÎ¯ ÊÍÈÃÈ.'+TimeToStr(Time));
     CloseStoredProc.ExecProc;
     Result:=CloseStoredProc.ParamByName('RESULT').AsInteger;
     ActionLog.Lines.Add(CloseStoredProc.ParamByName('LOG_MESSAGE').AsString);

     ErrorsDataSet.Open;
     ErrorsDataSet.FetchAll;
     ErrorsDataSet.First;
     for i:=0 to ErrorsDataSet.RecordCount -1 do
     begin
          ActionLog.Lines.Add(ErrorsDataSet.FieldByName('ERROR_MSG').AsString);
          ErrorsDataSet.Next;
     end;

     ErrorsDataSet.Close;

     if Result=0
     then WriteTransaction.Rollback
     else WriteTransaction.Commit;
     CloseStoredProc.Free;

     Screen.Cursor:=crDefault;

     if Result=1
     then begin
               if SysDataSet.Active then SysDataSet.Close;
               SysDataSet.Open;
               MBOOK_DATE:=SysDataSet.FieldByName('MAIN_BOOK_DATE').AsDateTime;
               DecodeDate(MBOOK_DATE,Y,M,D);
               if (M=12)
               then NEWBOOK_DATE:=EncodeDate(Y+1,1,1)
               else NEWBOOK_DATE:=EncodeDate(Y,M+1,1);
               SysDataSet.Close;
               for i:=0 to YEARS_COUNT do
               begin
                    cbYear.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
               end;

               cbMonth.ItemIndex:=MonthOf(MBOOK_DATE)-1;
               CurMonth.Text:=cbMonth.Items[cbMonth.ItemIndex];
               cbMonth.ItemIndex:=MonthOf(NEWBOOK_DATE)-1;

               for i:=0 to cbYear.Items.Count-1 do
               begin
                    if pos(cbYear.Items[i],IntToStr(YearOf(MBOOK_DATE)))>0
                    then begin
                       cbYear.ItemIndex:=i;
                       break;
                    end;
               end;
               CurYear.Text:=cbYear.Items[cbYear.ItemIndex];

               for i:=0 to cbYear.Items.Count-1 do
               begin
                    if pos(cbYear.Items[i],IntToStr(YearOf(NEWBOOK_DATE)))>0
                    then begin
                       cbYear.ItemIndex:=i;
                       break;
                    end;
               end;
     end;
end;

procedure TfrmCloseBook.GetRight;
begin
     if fibCheckPermission('/ROOT/Kernell/MBook','Close')=0
     then begin //yes
                cxButton1.Enabled:=true;

     end
     else begin
                cxButton1.Enabled:=false;
     end;

end;

procedure TfrmCloseBook.cxButton3Click(Sender: TObject);
var InsertSP:TpFibStoredProc;
    Res:Variant;
    id_sch:int64;
    i:Integer;
begin

     Res:=GlobalSpr.GetSch(self,
                           WorkDatabase.handle,
                           fsNormal,
                           cxDateEdit1.Date,
                           DEFAULT_ROOT_ID,0,0);
     If (varArrayDimCount(Res)>0)
     then begin
              for i:=0 to VarArrayHighBound(RES,1) do
              begin
                     id_sch:=RES[i][0];
                     if not SchFilterDataSet.Locate('ID_SCH',id_sch,[])
                     then begin
                               InsertSP:=TpFibStoredProc.Create(self);
                               InsertSP.Database:=WorkDatabase;
                               InsertSP.Transaction:=WriteTransaction;
                               WriteTransaction.StartTransaction;
                               InsertSP.StoredProcName:='MBOOK_PRINT_ITEMS_EXCL_INS';
                               InsertSP.Prepare;
                               InsertSP.ParamByName('ID_SCH').AsInt64  :=id_sch;
                               InsertSP.ParamByName('add_date').Value  :=cxDateEdit1.Date;
                               InsertSP.ExecProc;
                               WriteTransaction.Commit;
                               SchFilterDataSet.CloseOpen(true);
                               SchFilterDataSet.Locate('ID_SCH',ID_SCH,[]);
                               InsertSP.Free;
                     end;
              end;
      end;
end;

procedure TfrmCloseBook.cxButton4Click(Sender: TObject);
var DeleteSP:TpFibStoredProc;
begin
      if (SchFilterDataSet.RecordCount>0)
      then begin
                 DeleteSP:=TpFibStoredProc.Create(self);
                 DeleteSP.Database:=WorkDatabase;
                 DeleteSP.Transaction:=WriteTransaction;
                 WriteTransaction.StartTransaction;
                 DeleteSP.StoredProcName:='MBOOK_PRINT_ITEMS_EXCL_DEL';
                 DeleteSP.Prepare;
                 DeleteSP.ParamByName('ID_SCH').Value:=SchFilterDataSet.FieldByName('ID_SCH').Value;
                 DeleteSP.ExecProc;
                 WriteTransaction.Commit;
                 SchFilterDataSet.CacheDelete;
                 DeleteSP.Free;
      end;
end;

end.
