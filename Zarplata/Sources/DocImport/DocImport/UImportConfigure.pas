unit UImportConfigure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, Ibase, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  ComCtrls, ToolWin, ImgList, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxDBData, cxCheckBox, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, pFibStoredProc;

type
  TVidOplErrorValue=record
         IdVidopl:Integer;
         ErrorValue:Real;
  end;


  TVidOplErrors=class(TObject)
      private
      Values: Array of TVidOplErrorValue;
      public
            constructor Create;
            destructor Destroy;
            function GetValue(I:Integer):TVidOplErrorValue;
            procedure SetValue(IdVO:Integer;EV:Real);
            function GetIndexById(IdVO:Integer):Integer;
     end;

  TfrmImportConfigure = class(TForm)
    Panel2: TPanel;
    WorkDatabase: TpFIBDatabase;
    DocsFromBufferDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    cbMonth: TcxComboBox;
    cxLabel1: TcxLabel;
    cbKod_oper: TcxComboBox;
    cbYear: TcxComboBox;
    cxLabel2: TcxLabel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    InsertButton: TToolButton;
    CloseButton: TToolButton;
    ToolButton1: TToolButton;
    ProvButton: TToolButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    columnst: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxLabel3: TcxLabel;
    Bevel1: TBevel;
    cxLabel4: TcxLabel;
    cbMonthBuhg: TcxComboBox;
    cbYearBuhg: TcxComboBox;
    Panel1_: TPanel;
    RefreshButton: TToolButton;
    DocsFromBufferDataSource: TDataSource;
    PAnDataProgressBar: TProgressBar;
    DropButton: TToolButton;
    CancelButton: TcxButton;
    cbCalc1: TcxCheckBox;
    cbCalc2: TcxCheckBox;
    cbCalc3: TcxCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseButtonClick(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure ProvButtonClick(Sender: TObject);
    procedure DropButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbKod_operPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    ActualDate:TDateTime;
    DateReg   :TDateTime;
    date_end  :Variant;
    Id_session:Int64;
    id_user   :Int64;
    CancelFlag:Boolean;
    FIdSystem:Integer;
    procedure GrantImport;
    procedure ZarplataImport;
    procedure ClearTmpData;
    procedure GetDocReestrFromBuffer;
    procedure SetControlState(State:Boolean);
    procedure ConfigureControls(id_res:Integer;de:Variant);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;id_user:int64; id_system:Integer); reintroduce;
  end;

implementation

uses GlobalSpr,Resources_unitb,BaseTypes,DateUtils;

{$R *.dfm}

constructor TfrmImportConfigure.Create(AOwner: TComponent;DbHandle: TISC_DB_HANDLE; id_user: int64; id_system:Integer);
var I:Integer;
    CurPeriodInfo:TpFibDataSet;
    KodSetup:Integer;
begin
       inherited Create(AOwner);
       self.id_user:=id_user;
       FIdSystem:=id_system;

       WorkDatabase.Handle:=DbHandle;
       ReadTransaction.StartTransaction;

       Id_session:=WorkDatabase.Gen_Id('Z_DIMPORT_SESSION_GEN_ID',1);

       GetDocReestrFromBuffer;

       ConfigureControls(-1, date_end);

       if date_end=NULL then Date_End:=ActualDate;

       //cbKod_oper.ItemIndex:=0;

       CurPeriodInfo:=TpFibDataSet.Create(self);
       CurPeriodInfo.Database:=WorkDatabase;
       CurPeriodInfo.Transaction:=ReadTransaction;
       CurPeriodInfo.SelectSQL.Text:='SELECT * FROM Z_KOD_SETUP_RETURN';
       CurPeriodInfo.Open;
       if (CurPeriodInfo.RecordCount>0)
       then begin
                 KodSetup:=CurPeriodInfo.FieldByName('KOD_SETUP').Value;
                 CurPeriodInfo.Close;
                 CurPeriodInfo.SelectSQL.Text:='SELECT OUT_DATE FROM Z_CONVERT_KOD_TO_DATE('+IntToStr(KodSetup)+')';
                 CurPeriodInfo.Open;
                 if (CurPeriodInfo.RecordCount>0)
                 then begin
                           ActualDate:=CurPeriodInfo.FieldByName('OUT_DATE').Value;
                 end
                 else ActualDate:=Date;
                 CurPeriodInfo.Close;
       end;
       if CurPeriodInfo.Active then CurPeriodInfo.Close;
       CurPeriodInfo.Free;

       cbMonth.Properties.Items.Add(TRIM(BU_Month_01));
       cbMonth.Properties.Items.Add(TRIM(BU_Month_02));
       cbMonth.Properties.Items.Add(TRIM(BU_Month_03));
       cbMonth.Properties.Items.Add(TRIM(BU_Month_04));
       cbMonth.Properties.Items.Add(TRIM(BU_Month_05));
       cbMonth.Properties.Items.Add(TRIM(BU_Month_06));
       cbMonth.Properties.Items.Add(TRIM(BU_Month_07));
       cbMonth.Properties.Items.Add(TRIM(BU_Month_08));
       cbMonth.Properties.Items.Add(TRIM(BU_Month_09));
       cbMonth.Properties.Items.Add(TRIM(BU_Month_10));
       cbMonth.Properties.Items.Add(TRIM(BU_Month_11));
       cbMonth.Properties.Items.Add(TRIM(BU_Month_12));

       for i:=0 to YEARS_COUNT do
       begin
          cbYear.Properties.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
       end;

       cbMonth.ItemIndex:=MonthOf(Date_End)-1;
       for i:=0 to cbYear.Properties.Items.Count-1 do
       begin
           if pos(cbYear.Properties.Items[i],IntToStr(YearOf(Date_End)))>0
           then begin
              cbYear.ItemIndex:=i;
              break;
           end;
       end;

       cbMonthBuhg.Properties.Items.Add(TRIM(BU_Month_01));
       cbMonthBuhg.Properties.Items.Add(TRIM(BU_Month_02));
       cbMonthBuhg.Properties.Items.Add(TRIM(BU_Month_03));
       cbMonthBuhg.Properties.Items.Add(TRIM(BU_Month_04));
       cbMonthBuhg.Properties.Items.Add(TRIM(BU_Month_05));
       cbMonthBuhg.Properties.Items.Add(TRIM(BU_Month_06));
       cbMonthBuhg.Properties.Items.Add(TRIM(BU_Month_07));
       cbMonthBuhg.Properties.Items.Add(TRIM(BU_Month_08));
       cbMonthBuhg.Properties.Items.Add(TRIM(BU_Month_09));
       cbMonthBuhg.Properties.Items.Add(TRIM(BU_Month_10));
       cbMonthBuhg.Properties.Items.Add(TRIM(BU_Month_11));
       cbMonthBuhg.Properties.Items.Add(TRIM(BU_Month_12));

       for i:=0 to YEARS_COUNT do
       begin
          cbYearBuhg.Properties.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
       end;

       cbMonthBuhg.ItemIndex:=MonthOf(Date_End)-1;
       for i:=0 to cbYearBuhg.Properties.Items.Count-1 do
       begin
           if pos(cbYearBuhg.Properties.Items[i],IntToStr(YearOf(Date_End)))>0
           then begin
                     cbYearBuhg.ItemIndex:=i;
                     break;
           end;
       end;

end;

procedure TfrmImportConfigure.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmImportConfigure.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmImportConfigure.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     ClearTmpData;
     Action:=caFree;
end;

procedure TfrmImportConfigure.CloseButtonClick(Sender: TObject);
begin
     CancelFlag:=true;

     Close;
end;

procedure TfrmImportConfigure.InsertButtonClick(Sender: TObject);
begin
     try
           //Устанавливаем состояние элементов управления
           SetControlState(false);

           //Предварительно очищаем данные
           CancelFlag:=false;
           ClearTmpData;

           //Осуществляем импорт аналитической информации
           if (cbKod_oper.ItemIndex=1)
           then GrantImport
           else ZarplataImport;

           //Если произошла отмена имопрта-очищаем временные данные
           if CancelFlag
           then  ClearTmpData;

           //Отбираем данные для просмотра
           GetDocReestrFromBuffer;

           //Устанавливаем состояние элементов управления
           SetControlState(true);

     except on E:Exception do
                 begin
                      ShowMessage('Помилка під час імпорту інформації: '+E.Message);
                      SetControlState(true);
                 end;
     end;
end;

procedure TfrmImportConfigure.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
     if (DocsFromBufferDataSet.RecordCount>0)
     then begin
               GlobalSpr.GetDocBySession(self,
                                         WorkDatabase.Handle,
                                         id_user,
                                         'user',
                                         'login',
                                         FIdSystem,
                                         DateReg,
                                         StrToInt64(DocsFromBufferDataSet.FBN('KEY_SESSION').AsString));
     end;
end;

procedure TfrmImportConfigure.GrantImport;
  var GetZData:TpFibDataSet;
      AddProvSP:TpFibStoredProc;
begin
     //Отбор данных по аналитической информации
     DateSeparator:='.';
     ActualDate:=StrToDate('01.'+IntToStr(cbMonth.ItemIndex+1)    +'.'+cbYear.Properties.Items[cbYear.ItemIndex]);
     DateReg   :=StrToDate('01.'+IntToStr(cbMonthBuhg.ItemIndex+1)+'.'+cbYear.Properties.Items[cbYearBuhg.ItemIndex]);

     Screen.Cursor:=crHourGlass;
     Panel1_.Visible:=true;
     Application.ProcessMessages;

     GetZData:=TpFibDataSet.Create(self);
     GetZData.Database:=WorkDatabase;
     GetZData.Transaction:=ReadTransaction;
     GetZData.SelectSQL.Text:='SELECT * FROM Z_DIMPORT_GET_DATA_FOR_GRANT('+''''+DateToStr(ActualDate)+''''+','+IntToStr(cbKod_oper.ItemIndex+1)+','+IntToStr(FIdSystem)+')';

     GetZData.Open;

     if (GetZData.RecordCountFromSrv>0)
     then begin
               PAnDataProgressBar.Max :=GetZData.RecordCountFromSrv;
               PAnDataProgressBar.Min :=0;
               PAnDataProgressBar.Step:=1;
               PAnDataProgressBar.Position:=0;
               PAnDataProgressBar.Update;
               self.Update;
               Application.ProcessMessages;

               AddProvSP:=TpFibStoredProc.Create(self);
               AddProvSP.Database:=WorkDatabase;
               AddProvSP.Transaction:=WriteTransaction;
               AddProvSP.StoredProcName:='Z_DIMPORT_GET_BUHG_VALUES_GRANT';

               while (not GetZData.Eof) and (not CancelFlag) do
               begin
                     WriteTransaction.StartTransaction;

                     if AddProvSP.Open then AddProvSP.Close;

                     try

                                   AddProvSP.Prepare;
                                   AddProvSP.ParamByName('ID_SESSION').asInt64  :=Id_session;
                                   AddProvSP.ParamByName('TYPE_OPERATION').Value:=2;
                                   AddProvSP.ParamByName('TYPE_COMMENT').Value  :='Основна інформція по стипендії';
                                   AddProvSP.ParamByName('DATE_REG').Value      :=DateReg;

                                   AddProvSP.ParamByName('COMPUTER').Value      :=GlobalSpr.GetComputerNetName;
                                   AddProvSP.ParamByName('ID_SMETA').Value      :=GetZData.FieldByName('ID_SMETA').Value;
                                   AddProvSP.ParamByName('ID_VID_OPL').Value    :=GetZData.FieldByName('ID_VIDOPL').Value;
                                   AddProvSP.ParamByName('P1').Value            :=GetZData.FieldByName('P1').Value;
                                   AddProvSP.ParamByName('SUMMA').Value         :=GetZData.FieldByName('SUMMA').Value;
                                   AddProvSP.ParamByName('ID_SYSTEM').Value     :=FIdSystem;

                                   AddProvSP.ExecProc;

                                   if (AddProvSP.ParamByName('RESULT').Value=0)
                                   then begin
                                             if agMessageDlg('Увага!','Під час імпорту даних по стипендії виникла помилка: '+#13+
                                                             AddProvSP.ParamByName('RESULT_MESSAGE').AsString+'!'+#13+
                                                             'Поточні параметри:'+#13+#13+
                                                             ' бюджет:     '+GetZData.FieldByName('SMETA_KOD').AsString+' "'+GetZData.FieldByName('SMETA_TITLE').AsString+'"'+#13+
                                                             ' вид оплати: '+GetZData.FieldByName('VIDOPL_KOD').AsString+' "'+GetZData.FieldByName('VIDOPL_TITLE').AsString+'"'+#13+#13+
                                                             'Обробити цей запис знову[Так], Завершити процес імпорту[Ні]?'+#13,
                                                             mtError, [mbYes, mbNo])=mrYes
                                             then begin
                                                       WriteTransaction.Rollback;
                                                       Continue;
                                             end
                                             else begin
                                                       WriteTransaction.Rollback;
                                                       ClearTmpData;
                                                       Break;
                                             end;
                                   end
                                   else WriteTransaction.Commit;

                     except on E:Exception do
                               begin
                                             if agMessageDlg('Увага!','Під час імпорту даних по стипендії виникла помилка: ' +E.Message+' '+#13+
                                                             AddProvSP.ParamByName('RESULT_MESSAGE').AsString+'!'+#13+
                                                             'Поточні параметри:'+#13+#13+
                                                             ' бюджет:     '+GetZData.FieldByName('SMETA_KOD').AsString+' "'+GetZData.FieldByName('SMETA_TITLE').AsString+'"'+#13+
                                                             ' вид оплати: '+GetZData.FieldByName('VIDOPL_KOD').AsString+' "'+GetZData.FieldByName('VIDOPL_TITLE').AsString+'"'+#13+#13+
                                                             'Обробити цей запис знову[Так], Завершити процес імпорту[Ні]?'+#13,
                                                             mtError, [mbYes, mbNo])=mrYes
                                             then begin
                                                       WriteTransaction.Rollback;
                                                       Continue;
                                             end
                                             else begin
                                                       WriteTransaction.Rollback;
                                                       ClearTmpData;
                                                       Break;
                                             end;
                               end;
                     end;

                     AddProvSP.Close;

                     PAnDataProgressBar.StepIt;
                     PAnDataProgressBar.Update;
                     self.Update;
                     Application.ProcessMessages;
                     GetZData.Next;
               end;
     end;



     if (not CancelFlag)
     then begin
                 AddProvSP.StoredProcName:='Z_DIMPORT_COLLAPSE_DOC';
                 if not WriteTransaction.InTransaction then WriteTransaction.StartTransaction;
                 AddProvSP.Prepare;
                 AddProvSP.ParamByName('ID_SESSION').asInt64  :=Id_session;
                 AddProvSP.ParamByName('TYPE_OPERATION').Value:=2;
                 AddProvSP.ParamByName('DATE_REG').Value      :=DateReg;
                 AddProvSP.ExecProc;
                 WriteTransaction.Commit;
                 AddProvSP.Close;
     end;
     AddProvSP.Free;

     PAnDataProgressBar.Position:=PAnDataProgressBar.Max;
     PAnDataProgressBar.Update;
     self.Update;
     Application.ProcessMessages;

     Panel1_.Visible:=false;
     Application.ProcessMessages;
     GetZData.Close;
     GetZData.Free;
     Screen.Cursor:=crDefault;
end;

procedure TfrmImportConfigure.ZarplataImport;
 var GetZData:TpFibDataSet;
     AddProvSP:TpFibStoredProc;
     ErrorValue   : array [1..4] of Real;
     VidOplErrors:TVidOplErrors;
     I,j,Flag, idvo:Integer;
begin
     //Отбор данных по аналитической информации
     Flag:=1;
     Label2.Caption:='Чекайте. Йде імпорт основних проводок по зарплаті.';

     DateSeparator:='.';
     ActualDate:=StrToDate('01.'+IntToStr(cbMonth.ItemIndex+1)    +'.'+cbYear.Properties.Items[cbYear.ItemIndex]);
     DateReg   :=StrToDate('01.'+IntToStr(cbMonthBuhg.ItemIndex+1)+'.'+cbYear.Properties.Items[cbYearBuhg.ItemIndex]);

     Screen.Cursor:=crHourGlass;
     Panel1_.Visible:=true;
     Application.ProcessMessages;

     GetZData:=TpFibDataSet.Create(self);
     GetZData.Database:=WorkDatabase;
     GetZData.Transaction:=ReadTransaction;

     {**************************************************************************************************************************************************}
     {***************Основная заработная плата (начисления и удержания)*********************************************************************************}
     {**************************************************************************************************************************************************}

     GetZData.SelectSQL.Text:='SELECT * FROM Z_DIMPORT_GET_DATA_FOR_ZAR_2011('+''''+DateToStr(ActualDate)+''''+','+IntToStr(FIdSystem)+')';
     GetZData.Open;

     if cbCalc1.Checked
     then begin
         if (GetZData.RecordCountFromSrv>0)
         then begin
                   PAnDataProgressBar.Max :=GetZData.RecordCountFromSrv;
                   PAnDataProgressBar.Min :=0;
                   PAnDataProgressBar.Step:=1;
                   PAnDataProgressBar.Position:=0;
                   PAnDataProgressBar.Update;
                   self.Update;
                   Application.ProcessMessages;

                   AddProvSP:=TpFibStoredProc.Create(self);
                   AddProvSP.Database:=WorkDatabase;
                   AddProvSP.Transaction:=WriteTransaction;
                   AddProvSP.StoredProcName:='Z_DIMPORT_NACH_AND_UDER_2011';

                   while (not GetZData.Eof) and (not CancelFlag) do
                   begin
                         WriteTransaction.StartTransaction;

                         if AddProvSP.Open then AddProvSP.Close;

                         AddProvSP.Prepare;
                         AddProvSP.ParamByName('ID_SESSION').asInt64  :=Id_session;
                         AddProvSP.ParamByName('TYPE_OPERATION').Value:=1;
                         AddProvSP.ParamByName('TYPE_COMMENT').Value  :='Основні проводки (нарахування/утримання) по зарплаті за '+DateToStr(DateReg);
                         AddProvSP.ParamByName('DATE_REG').Value      :=DateReg;

                         AddProvSP.ParamByName('COMPUTER').Value      :=GlobalSpr.GetComputerNetName;
                         AddProvSP.ParamByName('ID_SMETA').Value      :=GetZData.FieldByName('ID_SMETA').Value;
                         AddProvSP.ParamByName('ID_VID_OPL').Value    :=GetZData.FieldByName('ID_VIDOPL').Value;
                         AddProvSP.ParamByName('PROP_ST').Value       :=GetZData.FieldByName('PROP_ST').Value;
                         AddProvSP.ParamByName('KOD_TOPER').Value     :=GetZData.FieldByName('KOD_TOPER').Value;
                         AddProvSP.ParamByName('P1').Value            :=GetZData.FieldByName('P1').Value;
                         AddProvSP.ParamByName('SUMMA').Value         :=GetZData.FieldByName('SUMMA').Value;
                         AddProvSP.ParamByName('ID_SYSTEM').Value     :=FIdSystem;

                         AddProvSP.ExecProc;

                         if (AddProvSP.ParamByName('RESULT').Value=0)
                         then begin
                                   if agMessageDlg('Увага!','Під час імпорту аналітичних даних по розрахунку зарплати виникла помилка: '+#13+
                                                   AddProvSP.ParamByName('RESULT_MESSAGE').AsString+'!'+#13+
                                                   'Поточні параметри запису :'+#13+#13+
                                                   ' бюджет:     '+GetZData.FieldByName('SMETA_KOD').AsString+' "'+GetZData.FieldByName('SMETA_TITLE').AsString+'"'+#13+
                                                   ' вид оплати: '+GetZData.FieldByName('VIDOPL_KOD').AsString+' "'+GetZData.FieldByName('VIDOPL_TITLE').AsString+'"'+#13+
                                                   ' правило для визначення балансу (prop_st): '+GetZData.FieldByName('PROP_ST').AsString+#13+
                                                   ' рахунок заробітної плати (kod_toper): '+ GetZData.FieldByName('sch_number').AsString+' "'+GetZData.FieldByName('sch_title').AsString+'"'+#13+#13+
                                                   'Обробити цей запис знову[Так], Завершити процес імпорту[Ні]?'+#13,
                                                   mtError, [mbYes, mbNo])=mrYes
                                   then begin
                                             WriteTransaction.Rollback;
                                             Continue;
                                   end
                                   else begin
                                             WriteTransaction.Rollback;
                                             Flag:=0;
                                             ClearTmpData;
                                             Break;
                                   end;
                         end
                         else WriteTransaction.Commit;

                         AddProvSP.Close;

                         PAnDataProgressBar.StepIt;
                         PAnDataProgressBar.Update;
                         self.Update;
                         Application.ProcessMessages;
                         GetZData.Next;
                   end;
         end;
     end;

     {**************************************************************************************************************************************************}
     {***************Дополнительные начисления на заработную плату(единый социальный налог по видам сеток)******************************}
     {**************************************************************************************************************************************************}

     if cbCalc2.Checked
     then begin

         if GetZData.Active then GetZData.Close;

         GetZData.SelectSQL.Text:='SELECT * FROM Z_DIMPORT_GET_NDATA_2011('+''''+DateToStr(ActualDate)+''''+','+IntTOStr(FIdSystem)+') ';
         GetZData.Open;

         for i:=1 to 3 do
         begin
               if CancelFlag then break;

               if (flag=1)
               then begin
                         if (i=1) then Label2.Caption:='  по єдиному соціальному податку (робітники + робітники НДЧ) 36,3%';
                         if (i=2) then Label2.Caption:='  по єдиному соціальному податку (листи непрацездатності) 8,41%';
                         if (i=3) then Label2.Caption:='  по єдиному соціальному податку (договори ГПХ) 34,7%';

                         GetZData.FetchAll;
                         GetZData.First;


                         if (GetZData.RecordCount>0)
                         then begin
                                   PAnDataProgressBar.Max :=GetZData.RecordCount;
                                   PAnDataProgressBar.Min :=0;
                                   PAnDataProgressBar.Step:=1;
                                   PAnDataProgressBar.Position:=0;
                                   PAnDataProgressBar.Update;
                                   self.Update;
                                   Application.ProcessMessages;

                                   AddProvSP:=TpFibStoredProc.Create(self);
                                   AddProvSP.Database:=WorkDatabase;
                                   AddProvSP.Transaction:=WriteTransaction;
                                   AddProvSP.StoredProcName:='Z_DIMPORT_GET_DOP_PROVS_2011';

                                   ErrorValue[i]:=0;

                                   for j:=0 to GetZData.RecordCount-1 do
                                   begin
                                        if CancelFlag then Break;

                                        try
                                               WriteTransaction.StartTransaction;

                                               if AddProvSP.Open then AddProvSP.Close;

                                               AddProvSP.Prepare;
                                               AddProvSP.ParamByName('ID_SESSION').asInt64  :=Id_session;
                                               AddProvSP.ParamByName('TYPE_OPERATION').Value:=GetZData.FieldByName('ID_TAX_ESV').Value*10;
                                               AddProvSP.ParamByName('TYPE_COMMENT').Value  :='Додаткові нарахування на зарплату ' +Label2.Caption+' за '+DateToStr(DateReg);
                                               AddProvSP.ParamByName('DATE_REG').Value      :=DateReg;
                                               AddProvSP.ParamByName('COMPUTER').Value      :=GlobalSpr.GetComputerNetName;
                                               AddProvSP.ParamByName('ID_SMETA').Value      :=GetZData.FieldByName('ID_SMETA').Value;
                                               AddProvSP.ParamByName('ID_TAX_ESV').Value    :=GetZData.FieldByName('ID_TAX_ESV').Value;
                                               AddProvSP.ParamByName('ID_VID_OPL').Value    :=GetZData.FieldByName('ID_VIDOPL').Value;
                                               AddProvSP.ParamByName('ATYPE').Value         :=i;
                                               AddProvSP.ParamByName('SUMMA').Value         :=GetZData.FieldByName('SUMMA').Value;
                                               AddProvSP.ParamByName('IN_NERROR').Value     :=ErrorValue[i];
                                               AddProvSP.ParamByName('ID_SYSTEM').Value     :=FIdSystem;

                                               AddProvSP.ExecProc;

                                               if (AddProvSP.ParamByName('RESULT').Value=0)
                                               then begin
                                                           if agMessageDlg('Увага!','Під час імпорту аналітичних даних по розрахунку зарплати виникла помилка: '+#13+
                                                                           AddProvSP.ParamByName('RESULT_MESSAGE').AsString+'!'+#13+
                                                                           'Поточні параметри:'+#13+#13+
                                                                           ' бюджет:     '+GetZData.FieldByName('SMETA_KOD').AsString+' "'+GetZData.FieldByName('SMETA_TITLE').AsString+'"'+#13+
                                                                           ' вид оплати: '+GetZData.FieldByName('VIDOPL_KOD').AsString+' "'+GetZData.FieldByName('VIDOPL_TITLE').AsString+'"'+#13+
                                                                           ' вид тарифної сітки (ID_TAX_ESV): '+GetZData.FieldByName('ID_TAX_ESV').AsString+#13+#13+
                                                                           'Обробити цей запис знову[Так], Завершити процес імпорту[Ні]?'+#13,
                                                                           mtError, [mbYes, mbNo])=mrYes
                                                           then begin
                                                                     WriteTransaction.Rollback;
                                                                     Continue;
                                                           end
                                                           else begin
                                                                     WriteTransaction.Rollback;
                                                                     flag:=0;
                                                                     ClearTmpData;
                                                                     Break;
                                                           end;
                                               end
                                               else begin
                                                         try
                                                               if not VarIsNull(AddProvSP.ParamByName('OUT_NERROR').Value)
                                                               then ErrorValue[i]:= AddProvSP.ParamByName('OUT_NERROR').AsDouble;

                                                               WriteTransaction.Commit;
                                                         except on E:Exception do
                                                                     begin
                                                                          ShowMessage('out_err '+E.Message);
                                                                     end;

                                                         end;
                                               end;

                                               AddProvSP.Close;

                                        except on E:Exception do
                                                   begin
                                                        ShowMessage(E.Message);
                                                   end;
                                        end;


                                        PAnDataProgressBar.StepIt;
                                        PAnDataProgressBar.Update;
                                        self.Update;
                                        Application.ProcessMessages;
                                        GetZData.Next;

                                   end; {while not eof getzdata}
                         end; {record coununt>0}
                 end;{flag=1}
         end;{for i}

         if WriteTransaction.InTransaction then WriteTransaction.Commit;

         //Исправляем погрешность
         if (flag=1)
         then begin
                   AddProvSP:=TpFibStoredProc.Create(self);
                   AddProvSP.Database:=WorkDatabase;
                   AddProvSP.Transaction:=WriteTransaction;
                   if not WriteTransaction.InTransaction then WriteTransaction.StartTransaction;
                   AddProvSP.StoredProcName:='Z_DIMPORT_GET_NACH_VALUE_2011';
                   AddProvSP.Prepare;
                   AddProvSP.ParamByName('ACTUAL_DATE').Value     :=ActualDate;
                   AddProvSP.ParamByName('KOD_TOPER').Value       :=cbKod_oper.ItemIndex+1;
                   AddProvSP.ParamByName('ID_SESSION').asInt64    :=Id_session;
                   AddProvSP.ParamByName('TYPE_OPERATION').Value  :=1;
                   AddProvSP.ParamByName('ID_SYSTEM').Value       :=FIdSystem;
                   AddProvSP.ExecProc;
                   AddProvSP.Close;
                   AddProvSP.Free;

                  if WriteTransaction.InTransaction then WriteTransaction.Commit;
          end;
     end;



     {**************************************************************************************************************************************************}
     {***************Сторнирование лишних начислений по заработную плату(пенсионный,ф.с.с.,ф.с.с.(зайнятысть),ф.с.с.(несч.вип.)*************************}
     {**************************************************************************************************************************************************

     if (flag=1) and cbCalc3.Checked
     then begin
               VidOplErrors:=TVidOplErrors.Create;

               if GetZData.Active then GetZData.Close;
               Label2.Caption:=' Чекайте. Йде імпорт корегуючих проводок!';
               GetZData.SelectSQL.Text:='SELECT Z.ATYPE,        Z.ID_VIDOPL,       Z.ID_SMETA,                          '+
                                        '       Z.SMETA_KOD,    Z.SMETA_TITLE,     Z.VIDOPL_KOD,                        '+
                                        '       Z.VIDOPL_TITLE, SUM(Z.SUMMA) AS SUMMA, SUM(Z.SUMMA_EXT) AS SUMMA_EXT    '+
                                        '  FROM Z_DIMPORT_GET_ADDITIONAL_ZDATA('+''''+DateToStr(ActualDate)+''''+','+IntToStr(FIdSystem)+') Z   '+

                                        ' GROUP BY Z.ATYPE,        Z.ID_VIDOPL,       Z.ID_SMETA,                       '+
                                        '          Z.SMETA_KOD,    Z.SMETA_TITLE,     Z.VIDOPL_KOD,                     '+
                                        '          Z.VIDOPL_TITLE                                                       ';
               GetZData.Open;
               GetZData.First;

               if (GetZData.RecordCountFromSrv>0)
               then begin
                         PAnDataProgressBar.Max :=GetZData.RecordCountFromSrv;
                         PAnDataProgressBar.Min :=0;
                         PAnDataProgressBar.Step:=1;
                         PAnDataProgressBar.Position:=0;
                         PAnDataProgressBar.Update;
                         self.Update;
                         Application.ProcessMessages;

                         AddProvSP:=TpFibStoredProc.Create(self);
                         AddProvSP.Database:=WorkDatabase;
                         AddProvSP.Transaction:=WriteTransaction;
                         AddProvSP.StoredProcName:='Z_DIMPORT_GET_BUHG_AVALUES_S';

                         while (not GetZData.Eof) and (not CancelFlag) do
                         begin
                               WriteTransaction.StartTransaction;

                               if AddProvSP.Open then AddProvSP.Close;

                               idvo:=GetZData.FieldByName('ID_VIDOPL').Value;
                               if idvo<0 then idvo:=0;

                               if VidOplErrors.GetIndexById(idvo)=-1
                               then VidOplErrors.SetValue(idvo,0);

                               AddProvSP.Prepare;
                               AddProvSP.ParamByName('ID_SESSION').asInt64  :=Id_session;

                               if (GetZData.FieldByName('ID_VIDOPL').Value>0)
                               then begin
                                           AddProvSP.ParamByName('TYPE_OPERATION').Value:=GetZData.FieldByName('ID_VIDOPL').Value;
                                           AddProvSP.ParamByName('TYPE_COMMENT').Value  :=GetZData.FieldByName('VIDOPL_TITLE').AsString+' за '+datetostr(DateReg);
                               end
                               else begin
                                           AddProvSP.ParamByName('TYPE_OPERATION').Value:=0;
                                           AddProvSP.ParamByName('TYPE_COMMENT').Value  :='Виплати по листам непрацездатності за '+datetostr(DateReg);
                               end;
                               AddProvSP.ParamByName('DATE_REG').Value      :=DateReg;
                               AddProvSP.ParamByName('COMPUTER').Value      :=GlobalSpr.GetComputerNetName;

                               AddProvSP.ParamByName('ID_SMETA').Value      :=GetZData.FieldByName('ID_SMETA').Value;
                               AddProvSP.ParamByName('ID_VID_OPL').Value    :=Abs(GetZData.FieldByName('ID_VIDOPL').Value);
                               AddProvSP.ParamByName('ATYPE').Value         :=GetZData.FieldByName('ATYPE').Value;
                               AddProvSP.ParamByName('SUMMA').Value         :=GetZData.FieldByName('SUMMA').Value;
                               AddProvSP.ParamByName('SUMMA_EXT').Value     :=GetZData.FieldByName('SUMMA_EXT').Value;
                               AddProvSP.ParamByName('ID_SYSTEM').Value     :=FIdSystem;
                               AddProvSP.ParamByName('IN_NERROR').Value     :=VidOplErrors.GetValue(VidOplErrors.GetIndexById(idvo)).ErrorValue;

                               AddProvSP.ExecProc;

                               if (AddProvSP.ParamByName('RESULT').Value=0)
                               then begin
                                         if agMessageDlg('Увага!','Під час імпорту даних по зарплаті виникла помилка: '+#13+
                                                         AddProvSP.ParamByName('RESULT_MESSAGE').AsString+'!'+#13+
                                                         'Поточні параметри:'+#13+#13+
                                                         ' бюджет:     '+GetZData.FieldByName('SMETA_KOD').AsString+' "'+GetZData.FieldByName('SMETA_TITLE').AsString+'"'+#13+
                                                         ' вид оплати: '+GetZData.FieldByName('VIDOPL_KOD').AsString+' "'+GetZData.FieldByName('VIDOPL_TITLE').AsString+'"'+#13+#13+
                                                         'Обробити цей запис знову[Так], Завершити процес імпорту[Ні]?'+#13,
                                                         mtError, [mbYes, mbNo])=mrYes
                                         then begin
                                                   WriteTransaction.Rollback;
                                                   Continue;
                                         end
                                         else begin
                                                   WriteTransaction.Rollback;
                                                   Flag:=0;
                                                   ClearTmpData;
                                                   Break;
                                         end;
                               end
                               else begin
                                         VidOplErrors.SetValue(idvo, AddProvSP.ParamByName('out_nerror').Value);

                                         WriteTransaction.Commit;
                               end;

                               AddProvSP.Close;

                               PAnDataProgressBar.StepIt;
                               PAnDataProgressBar.Update;
                               self.Update;
                               Application.ProcessMessages;
                               GetZData.Next;
                         end;
               end;

               VidOplErrors.Free;
     end; }

     {**************************************************************************************************************************************************}
     {***********Подготовка документа к записи в бухгалтерскую систему**********************************************************************************}
     {**************************************************************************************************************************************************}
     if (flag=1) and (not CancelFlag)
     then begin
               {Компактизация документа}
               AddProvSP.StoredProcName:='Z_DIMPORT_COLLAPSE_DOC';
               if not WriteTransaction.InTransaction then WriteTransaction.StartTransaction;
               AddProvSP.Prepare;
               AddProvSP.ParamByName('ID_SESSION').asInt64  :=Id_session;
               AddProvSP.ParamByName('TYPE_OPERATION').Value:=1;
               AddProvSP.ParamByName('DATE_REG').Value      :=DateReg;
               AddProvSP.ExecProc;
               WriteTransaction.Commit;
     end;
     AddProvSP.Close;
     //AddProvSP.Free;

     PAnDataProgressBar.Position:=PAnDataProgressBar.Max;
     PAnDataProgressBar.Update;
     self.Update;
     Application.ProcessMessages;

     Panel1_.Visible:=false;
     Application.ProcessMessages;
     GetZData.Close;
     GetZData.Free;


     PAnDataProgressBar.Position:=0;
     PAnDataProgressBar.Update;
     self.Update;
     Application.ProcessMessages;

     Screen.Cursor:=crDefault;
end;

procedure TfrmImportConfigure.ClearTmpData;
var ClearSP:TpFibStoredProc;
begin
     ClearSP:=TpFibStoredProc.Create(self);
     ClearSP.Database:=WorkDatabase;
     ClearSP.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     ClearSP.StoredProcName:='Z_DIMPORT_CLEAR';
     ClearSP.Prepare;
     ClearSP.ParamByName('ID_SESSION').AsInt64:=Id_session;
     ClearSP.ExecProc;
     WriteTransaction.Commit;
     ClearSP.Free;
end;

procedure TfrmImportConfigure.GetDocReestrFromBuffer;
var LKS:Int64;
begin
     LKS:=-1;
     if DocsFromBufferDataSet.Active
     then begin
               if (DocsFromBufferDataSet.RecordCount>0)
               then LKS:=StrToInt64(DocsFromBufferDataSet.FBN('KEY_SESSION').asString);
               DocsFromBufferDataSet.Close;
     end;
     DocsFromBufferDataSet.SelectSQL.Text:='SELECT * FROM Z_DIMPORT_GET_DOCS_FROM_BUFFER('+IntToStr(Id_session)+')';
     DocsFromBufferDataSet.Open;

     DocsFromBufferDataSet.Locate('KEY_SESSION',LKS,[]);
end;

procedure TfrmImportConfigure.RefreshButtonClick(Sender: TObject);
begin
     GetDocReestrFromBuffer;
end;

procedure TfrmImportConfigure.ProvButtonClick(Sender: TObject);
begin
     if (DocsFromBufferDataSet.RecordCount>0)
     then begin
               GlobalSpr.GetDocBySession(self,
                                         WorkDatabase.Handle,
                                         id_user,
                                         'user',
                                         'login',
                                         FIdSystem,
                                         DateReg,
                                         StrToInt64(DocsFromBufferDataSet.FBN('KEY_SESSION').AsString));
     end;
end;

procedure TfrmImportConfigure.DropButtonClick(Sender: TObject);
var ClearSP:TpFibStoredProc;
begin
     if (DocsFromBufferDataSet.RecordCount>0)
     then begin
               ClearSP:=TpFibStoredProc.Create(self);
               ClearSP.Database:=WorkDatabase;
               ClearSP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               ClearSP.StoredProcName:='Z_DIMPORT_CLEAR_EX';
               ClearSP.Prepare;
               ClearSP.ParamByName('ID_SESSION').AsInt64 :=Id_session;
               ClearSP.ParamByName('KEY_SESSION').AsInt64:=StrToInt64(DocsFromBufferDataSet.FieldByName('KEY_SESSION').asString);
               ClearSP.ExecProc;
               WriteTransaction.Commit;
               ClearSP.Free;

               GetDocReestrFromBuffer;
     end;
end;

procedure TfrmImportConfigure.CancelButtonClick(Sender: TObject);
begin
     CancelFlag:=true;
end;

procedure TfrmImportConfigure.SetControlState(State: Boolean);
begin
     InsertButton.Enabled   :=State;
     ProvButton.Enabled     :=State;
     RefreshButton.Enabled  :=State;
     DropButton.Enabled     :=State;

     if (State=true)
     then begin
               PAnDataProgressBar.Position:=0;
               PAnDataProgressBar.Update;
     end;
end;

procedure TfrmImportConfigure.FormCreate(Sender: TObject);
begin
 cbCalc1.Checked := True;
 cbCalc2.Checked := True;
 cbCalc3.Checked := True;
end;

procedure TfrmImportConfigure.ConfigureControls(id_res:Integer;de:Variant);
var PropSP:TpFibStoredProc;
begin
     self.date_end:=de;
     
     if (id_res=-1)
     then begin

               PropSP:=TpFibStoredProc.Create(self);
               PropSP.Database:=WorkDatabase;
               PropSP.Transaction:=ReadTransaction;
               PropSP.StoredProcName:='JO5_GET_SYS_PROP';
               PropSP.Prepare;
               PropSP.ParamByName('ID_SYSTEM').Value:=FIdSystem;
               PropSP.ExecProc;
               id_res:=PropSP.ParamByName('RESULT').Value;
               self.date_end:=PropSP.ParamByName('DATE_END_SYS').Value;
               PropSP.Close;
               PropSP.Free;

     end;

     if id_res=0
     then begin
               //зп
               cbKod_oper.ItemIndex:=0;
               cbCalc1.Visible:=true;
               cbCalc2.Visible:=true;
               //cbCalc3.Visible:=true;

               Label1.Visible:=true;

     end;
     if id_res=1
     then begin
               //стп
               cbKod_oper.ItemIndex:=1;
               Label1.Visible:=false;

               cbCalc1.Visible:=false;
               cbCalc2.Visible:=false;
               //cbCalc3.Visible:=false;
     end;
end;

procedure TfrmImportConfigure.cbKod_operPropertiesChange(Sender: TObject);
begin
    ConfigureControls(cbKod_oper.ItemIndex, date_end);
end;

{ TVidOplError }

constructor TVidOplErrors.Create;
begin
      inherited Create;
      SetLength(Values, 1);
      Values[0].IdVidopl:=0;
      Values[0].ErrorValue:=0;
end;

destructor TVidOplErrors.Destroy;
begin
     if Values<>nil then FreeAndNil(Values);
end;

function TVidOplErrors.GetIndexById(IdVO: Integer): Integer;
var i:Integer;
    Index:Integer;
begin
     Index:=-1;

     for i:=0 to Length(Values)-1 do
     begin
          if Values[i].IdVidopl=idvo
          then begin
                    Index:=i;
                    Break;
          end
     end;

     Result:=Index;
end;

function TVidOplErrors.GetValue(I: Integer): TVidOplErrorValue;
begin
     Result:=self.Values[i];
end;

procedure TVidOplErrors.SetValue(IdVO: Integer; EV: Real);
var Index:Integer;
begin
     Index:=self.GetIndexById(IdVo);

     if (Index=-1)
     then begin
               SetLength(Values,Length(Values)+1);
               Values[Length(Values)-1].IdVidopl:=idVo;
               Values[Length(Values)-1].ErrorValue:=EV;
     end
     else begin
               Values[Index].IdVidopl:=idVo;
               Values[Index].ErrorValue:=EV;
     end;
end;

end.
