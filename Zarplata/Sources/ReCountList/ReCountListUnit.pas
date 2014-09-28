unit ReCountListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxBar, dxBarExtItems, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,Ibase,
  ManEditUnit,Dates,Zproc,Unit_ReCountConsts,zMessages,uMassiveAddRecount,
  DateUtils, cxContainer, cxProgressBar, dxStatusBar, cxTextEdit, cxMemo,PackageLoad;


type
  TReCountListForm = class(TForm)
    BarManager: TdxBarManager;
    UpdateBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    ListGridTabView: TcxGridDBTableView;
    ListGridLevel1: TcxGridLevel;
    ListGrid: TcxGrid;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    MainDatabase: TpFIBDatabase;
    ListDataSet: TpFIBDataSet;
    InsertProc: TpFIBStoredProc;
    UpdateProc: TpFIBStoredProc;
    DeleteProc: TpFIBStoredProc;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    LsitDataSource: TDataSource;
    ListDataSetTN: TFIBIntegerField;
    ListDataSetFIO: TFIBStringField;
    ListDataSetMONTH_BEG: TFIBIntegerField;
    ListDataSetYEAR_BEG: TFIBIntegerField;
    ListDataSetMONTH_END: TFIBIntegerField;
    ListDataSetYEAR_END: TFIBIntegerField;
    TNColumn: TcxGridDBColumn;
    FIOColumn: TcxGridDBColumn;
    MONTH_BEGColumn: TcxGridDBColumn;
    YEAR_BEGColumn: TcxGridDBColumn;
    MONTH_ENDColumn: TcxGridDBColumn;
    YEAR_ENDColumn: TcxGridDBColumn;
    GetSpisokQuery: TpFIBDataSet;
    ListDataSetID_MAN: TFIBIntegerField;
    ReCountProc: TpFIBStoredProc;
    AddAllBtn: TdxBarLargeButton;
    GetSpisokQueryOUT_FAMILIA: TFIBStringField;
    GetSpisokQueryOUT_TN: TFIBIntegerField;
    GetSpisokQueryID_MAN: TFIBIntegerField;
    dxBarSubItem1: TdxBarSubItem;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarLargeButton2: TdxBarLargeButton;
    InsertMenu: TdxBarPopupMenu;
    dxBarButton1: TdxBarButton;
    AddBtn: TdxBarLargeButton;
    DeleteMenu: TdxBarPopupMenu;
    DeleteAllBtn: TdxBarLargeButton;
    ListDataSetKOD_BEG: TFIBIntegerField;
    ListDataSetKOD_END: TFIBIntegerField;
    DeleteAllQuery: TpFIBQuery;
    StatusBar: TdxStatusBar;
    dxStatusBar1Container1: TdxStatusBarContainerControl;
    ProgressBar: TcxProgressBar;
    GetIdGroupAccountQuery: TpFIBQuery;
    FillSpisokQuery: TpFIBQuery;
    cxMemo1: TcxMemo;
    AccountReloadBtn: TdxBarLargeButton;
    dxBarContainerItem1: TdxBarContainerItem;
    dxbrstc1: TdxBarStatic;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitBtnClick(Sender: TObject);
    procedure InsertBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);

    procedure ListGridTabViewKeyPress(Sender: TObject; var Key: Char);
    procedure SelectBtnClick(Sender: TObject);
    procedure AddAllBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure DeleteAllBtnClick(Sender: TObject);
    procedure AccountReloadBtnClick(Sender: TObject);
  private
    pKodBeg:integer;
    pKodEnd:integer;
  public
    IdGroupAccount:Integer;
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);reintroduce;
    procedure TreadOnTerminate(Sender:TObject);
  end;

var
  ReCountListForm: TReCountListForm;
function  ShowReCountList(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;stdcall;
exports   ShowReCountList;


implementation

uses URecalThread;

{$R *.dfm}

function ShowReCountList(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;
var
form: TReCountListForm;

begin
  form:=TReCountListForm.Create(AOwner,DB_HANDLE);
  form.Show;
end;

procedure TReCountListForm.RefreshBtnClick(Sender: TObject);
var
IdMan:Integer;
begin
 // if not ListDataSet.IsEmpty
   // then
      begin
        //IdMan:=ListDataSet['ID_MAN'];
        ListDataSet.CloseOpen(True);
       // ListDataSet.Locate('ID_MAN',IdMan,[]);
      end;
        

end;



constructor TReCountListForm.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  Self.Caption:=FormCaption;
  Self.InsertBtn.Caption:=InsertBtn_Caption;
  Self.UpdateBtn.Caption:=UpdateBtn_Caption;
  Self.DeleteBtn.Caption:=DeleteBtn_Caption;
  Self.RefreshBtn.Caption:=RefreshBtn_Caption;
  Self.SelectBtn.Caption:=ReCountBtn_Caption;
  Self.ExitBtn.Caption:=ExitBtn_Caption;

  Self.TNColumn.Caption:=TnColumn_Caption;
  Self.FIOColumn.Caption:=FIOColumn_Caption;
  Self.MONTH_BEGColumn.Caption:=MonthBegColumn_Caption;
  Self.MONTH_ENDColumn.Caption:=MonthEndColumn_Caption;

  Self.YEAR_BEGColumn.Caption:=YearBegCOlumn_Caption;
  Self.YEAR_ENDColumn.Caption:=YearEndColumnCaption;


  MainDataBase.Connected:=False;
  MainDatabase.Handle:=DB_HANDLE;
  ListDataSet.Open;

  pKodBeg := CurrentKodSetup(DB_HANDLE)-1;
  pKodEnd := pKodBeg;
  
  GetSpisokQuery.SQLs.SelectSQL.Text := 'select distinct z.FAMILIA as OUT_FAMILIA,z.TN as OUT_TN,Z.ID_MAN from Z_SPISOK_FOR_COUNT Z ORDER BY Z.TN';
end;


procedure TReCountListForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
    if (ReadTransaction.InTransaction)
        then ReadTransaction.Commit;
        
end;

procedure TReCountListForm.ExitBtnClick(Sender: TObject);
begin
    Close;
end;

procedure TReCountListForm.InsertBtnClick(Sender: TObject);
var
    form:  TManEditForm;
begin

  form:=TManEditForm.Create(Self,MainDatabase.handle);
  form.KodBeg := pKodBeg;
  form.KodEnd := pKodEnd;
  if form.ShowModal=mrOk
      then
          begin

              pKodBeg := form.KodBeg;
              pKodEnd := form.KodEnd;

              InsertProc.ParamByName('ID_MAN').Value:=form.FIdMan;
              InsertProc.ParamByName('ID_DEP').Value:=form.PId_department;
              InsertProc.ParamByName('KOD_BEG').Value:=pKodBeg;
              InsertProc.ParamByName('KOD_END').Value:=pKodEnd;


              WriteTransaction.StartTransaction;
                 try
                    InsertProc.ExecProc;
                 except
                    on E:Exception
                      do
                       begin
                       ZShowMessage('Помилка!',PChar(E.Message),mtInformation,[mbOk]);
                       WriteTransaction.Rollback;
                       Exit;
                      end;
                 end;
               WriteTransaction.Commit;
               ListDataSet.CloseOpen(True);
          end;
end;

procedure TReCountListForm.UpdateBtnClick(Sender: TObject);
var
form:  TManEditForm;
MonthBeg:Integer;
MonthEnd:Integer;
YearBeg:Integer;
YearEnd:Integer;
IdMan:Integer;
DateBeg:TDateTime;
DateEnd:TDateTime;
FIO:string;
Tn:integer;
KodBeg:Integer;
KodEnd:Integer;

begin
if not ListDataSet.IsEmpty
  then
    begin
    IdMan:=ListDataSet['ID_MAN'];
    FIO:=ListDataSet['FIO'];
    if VarIsNull(ListDataSet['TN']) then TN:=0
                                     else TN:=ListDataSet['TN'];

    MonthBeg:=ListDataSet['Month_Beg'];
    MonthEnd:=ListDataSet['Month_End'];
    YearBeg:=ListDataSet['Year_Beg'];
    YearEnd:=ListDataSet['Year_End'];

    DateBeg:=StrToDate('01.'+IntToStr(MonthBeg)+'.'+IntToStr(YearBeg));
    DateEnd:=StrToDate('01.'+IntToStr(MonthEnd)+'.'+IntToStr(YearEnd));

    KodBeg:=ConvertDateToKod(DateBeg);
    KodEnd:=ConvertDateToKod(DateEnd);

    UpdateProc.ParamByName('OLD_ID_MAN').Value:=IdMan;
    UpdateProc.ParamByName('OLD_KOD_BEG').Value:=KodBeg;
    UpdateProc.ParamByName('OLD_KOD_END').Value:=KodEnd;


    form:=TManEditForm.Create(Self,MainDataBase.Handle,IdMan,FIO,TN);
    form.KodBeg := PeriodToKodSetup(YearBeg,MonthBeg);
    form.KodEnd := PeriodToKodSetup(YearEnd,MonthEnd);

    if form.ShowModal=mrOk
        then
            begin
              IdMan:=form.FIdMan;

              UpdateProc.ParamByName('NEW_ID_MAN').Value:=IdMan;
              UpdateProc.ParamByName('NEW_KOD_BEG').Value:=form.KodBeg;
              UpdateProc.ParamByName('NEW_KOD_END').Value:=form.KodEnd;

              WriteTransaction.StartTransaction;
              try
                  UpdateProc.ExecProc;

              except
                on E:Exception
                  do
                  begin
                    ZShowMessage('Помилка!',PChar(E.Message),mtInformation,[mbOk]);
                    WriteTransaction.Rollback;
                    Exit;
                  end;
               end;

               WriteTransaction.Commit;
               ListDataSet.CloseOpen(True);

               ListDataSet.Locate('ID_MAN',IdMan,[]);

            end;
    end;
end;

procedure TReCountListForm.DeleteBtnClick(Sender: TObject);
var

IdMan:Integer;

begin
  if not ListDataSet.IsEmpty
      then
        begin
          if ZShowMessage('Підтвердження','Ви справді бажаєте вилучити цей запис?',
                     mtConfirmation,[mbOk,mbCancel])=mrOk
              then
                begin
                  IdMan:=ListDataSet['ID_MAN'];

                  DeleteProc.ParamByName('ID_MAN').value:=IdMan;
                  DeleteProc.ParamByName('KOD_BEG').value:=ListDataSet['KOD_BEG'];
                  DeleteProc.ParamByName('KOD_END').value:=ListDataSet['KOD_END'];

                  WriteTransaction.StartTransaction;

              try
                DeleteProc.ExecProc;
              except
                on E:Exception
                  do
                    begin
                      ZShowMessage('Помилка!',PChar(E.Message),mtInformation,[mbOk]);
                      WriteTransaction.RollBack;
                      Exit;
                    end;

               end;

        WriteTransaction.Commit;

        ListDataSet.CloseOpen(True);
        end;
        end;
end;

procedure TReCountListForm.ListGridTabViewKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (not (Key  in ['0'..'9']))
            then
                ListGridTabView.OptionsBehavior.IncSearchItem:=FIOColumn
              else
                  ListGridTabView.OptionsBehavior.IncSearchItem:=TNColumn;
end;

procedure TReCountListForm.SelectBtnClick(Sender: TObject);
var RecalcThread:TRecalcThread;
begin
   GetIdGroupAccountQuery.ExecQuery;
   ProgressBar.Position := 0;
   IdGroupAccount:=GetIdGroupAccountQuery['ID_GROUP_ACCOUNT'].Value;
   GetIdGroupAccountQuery.Close;
   //RecountProc.ParamByName('STORED_PROC_NAME').Value:='Z_PAYMENT_COUNT_DNEPR';

   if (ZShowMessage('Підтвердження','Здійснити перерахунок згідно списка?',
                mtConfirmation,[mbOk,MbCancel])=mrOk)
   then begin
                    SelectBtn.Enabled:=False;

                    RecalcThread:=TRecalcThread.Create(True,self);
                    RecalcThread.FreeOnTerminate:=True;
                    RecalcThread.OnTerminate:=TreadOnTerminate;
                    RecalcThread.Priority:=tpNormal;
                    RecalcThread.Resume;
   end;

end;

procedure TReCountListForm.AddAllBtnClick(Sender: TObject);
var
    form:          TMassiveAddForm;
    DateBeg:       TDateTime;
    DateEnd:       TDateTime;
    Days:          Integer;
    KodBeg:        Integer;
begin
    form:=TMassiveAddForm.Create(Self,MainDatabase.Handle);

    if (form.ShowModal=mrOk)
    then
        begin
            DateBeg:=StrToDate('01.'+IntToStr(form.FMonthBeg)+'.'+
                                    IntToStr(form.FYearBeg));
            Days:=DaysInAMonth(form.FYearBeg,form.FMonthBeg);
            DateEnd:=EncodeDate(form.FYearBeg,form.FMonthBeg,Days);
            KodBeg:=ConvertDateToKod(DateBeg);

            FillSpisokQuery.ParamByName('DATE_BEG').Value:=DateToStr(DateBeg);
            FillSpisokQuery.ParamByName('DATE_END').Value:=DateToStr(DateEnd);
            FillSpisokQuery.ParamByName('KOD_SETUP2').Value:=KodBeg;

            WriteTransaction.StartTransaction;
            try
                FillSpisokQuery.ExecQuery;
                WriteTransaction.Commit;
            except on E:Exception
            do
            begin
                ZShowMessage('Помилка!',E.Message,mtError,[mbOk]);
                WriteTransaction.Rollback;
            end
            end;

            GetSpisokQuery.CloseOpen(True);

            WriteTransaction.StartTransaction;
         try

            while (not GetSpisokQuery.Eof)
            do
                begin
                    InsertProc.ParamByName('ID_MAN').Value:=
                        GetSpisokQuery['ID_MAN'];
                    InsertProc.ParamByName('KOD_BEG').Value:=KodBeg;
                    InsertProc.ParamByName('KOD_END').Value:=KodBeg;
                    InsertProc.ExecProc;

                    GetSpisokQuery.Next;
                    Application.ProcessMessages;
                end;
         except on E:Exception
         do
            begin

                ShowMessage(E.Message);
                WriteTransaction.Rollback;
                Exit;

            end;
        end;
       WriteTransaction.Commit;
       ListDataSet.CloseOpen(True);

    end;

end;

procedure TReCountListForm.AddBtnClick(Sender: TObject);
var
    form:          TMassiveAddForm;
    DateBeg:       TDateTime;
    DateEnd:       TDateTime;
    Days:          Integer;
    KodBeg:        Integer;
begin
    form:=TMassiveAddForm.Create(Self,MainDatabase.Handle);

    if (form.ShowModal=mrOk)
    then
        begin
            DateBeg:=StrToDate('01.'+IntToStr(form.FMonthBeg)+'.'+
                                    IntToStr(form.FYearBeg));
            Days:=DaysInAMonth(form.FYearBeg,form.FMonthBeg);
            DateEnd:=EncodeDate(form.FYearBeg,form.FMonthBeg,Days);
            KodBeg:=ConvertDateToKod(DateBeg);

            WriteTransaction.StartTransaction;

            FillSpisokQuery.ParamByName('DATE_BEG').Value:=DateToStr(DateBeg);
            FillSpisokQuery.ParamByName('DATE_END').Value:=DateToStr(DateEnd);
            FillSpisokQuery.ParamByName('KOD_SETUP2').Value:=KodBeg;

            try
               FillSpisokQuery.ExecQuery;
               WriteTransaction.Commit;
            except on E:Exception
            do
              begin
                   ShowMessage(E.Message);
                   WriteTransaction.Rollback;
                   Exit;
              end;
            end;

            GetSpisokQuery.CloseOpen(True);


         WriteTransaction.StartTransaction;
         try

            while (not GetSpisokQuery.Eof)
            do
                begin
                    InsertProc.ParamByName('ID_MAN').Value:=
                        GetSpisokQuery['ID_MAN'];
                    InsertProc.ParamByName('KOD_BEG').Value:=KodBeg;
                    InsertProc.ParamByName('KOD_END').Value:=KodBeg;
                    InsertProc.ExecProc;

                    GetSpisokQuery.Next;
                    Application.ProcessMessages;
                end;
         except on E:Exception
         do
            begin

                ShowMessage(E.Message);
                WriteTransaction.Rollback;
                Exit;

            end;
        end;
       WriteTransaction.Commit;
       ListDataSet.CloseOpen(True);

    end;

end;

procedure TReCountListForm.DeleteAllBtnClick(Sender: TObject);
begin
 if (ZShowMessage('Підтвердження','Вилучити список?',
                mtConfirmation,[mbOk,MbCancel])=mrOk) then
 begin

    WriteTransaction.StartTransaction;
    try
        DeleteAllQuery.ExecQuery;
    except on E:Exception
    do
        begin
            ShowMessage(E.Message);
            WriteTransaction.Rollback;
            Exit;
        end;
    end;

    WriteTransaction.Commit;
    ListDataSet.CloseOpen(True);


 end;



end;

procedure TReCountListForm.TreadOnTerminate(Sender: TObject);
begin
      ZShowMessage('Вдале завершення',
      'Перерахунок вдало завершено!',mtInformation,[mbOk]);
      SelectBtn.Enabled:=true;
end;

procedure TReCountListForm.AccountReloadBtnClick(Sender: TObject);
begin
    LoadAccountReloadPackage(self,MainDatabase.Handle,'Zarplata\AccountReload.bpl','View_AccountReload','T');
    RefreshBtn.Click;
end;

end.
