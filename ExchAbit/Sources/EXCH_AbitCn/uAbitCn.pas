unit uAbitCn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Placemnt, ImgList, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, cxGraphics,
  cxControls, dxStatusBar, dxBar,inifiles, StdCtrls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, dxBarExtItems, Menus, dxsbar, pFIBErrorHandler,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxRadioGroup, cxCalendar, cxCheckBox, cxDBEdit, cxLabel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxGroupBox, RxMemDS, ActnList, cxSplitter,
  ibase, WinSock,StrUtils,
  ExtCtrls, AArray, WaitForm,
  ib_externals,  cxImage, ADODB, DM, cxLookAndFeelPainters, cxButtons,Clipbrd;

type
  TFormAbitCn = class(TForm)
    Database: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    FormStoragePrK: TFormStorage;
    ErrorHandlerPrK: TpFibErrorHandler;
    cxSplitterAllFilter: TcxSplitter;
    dxStatusBarVWF: TdxStatusBar;
    cxSplitterContracts: TcxSplitter;
    DataSetContrakts: TpFIBDataSet;
    DataSourceContrakts: TDataSource;
    StoredProcContracts: TpFIBStoredProc;
    ImageListViewWithFilter: TImageList;
    DataSourcePrKViewWithFilter: TDataSource;
    ActionListViewWithFilter: TActionList;
    ActionObnov: TAction;
    ActionOtmena: TAction;
    ActionAddCN: TAction;
    ActionChangeCN: TAction;
    ActionDelCN: TAction;
    ActionPrintCn: TAction;
    ActionChangeCN_Status: TAction;
    StyleRepositoryViewWithFilter: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyleHeader: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyleInactive: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyleBackGround_Content: TcxStyle;
    cxStyleSelection: TcxStyle;
    cxEditStyleControllerVWF: TcxEditStyleController;
    FormStorageViewWithFilter: TFormStorage;
    cxGroupBoxContracts: TcxGroupBox;
    cxGridPrKContracts: TcxGrid;
    cxGridPrKContractsDBTableView1: TcxGridDBTableView;
    colNUM_DOG: TcxGridDBColumn;
    colDATE_DOG: TcxGridDBColumn;
    colSUMMA: TcxGridDBColumn;
    cxGridPrKContractsLevel1: TcxGridLevel;
    cxGroupBoxDataDog: TcxGroupBox;
    cxLabelNAME_DOG_STATUS: TcxLabel;
    cxDBTextEditNAME_DOG_STATUS: TcxDBTextEdit;
    cxDBTextEditNAME_DOG_TYPE: TcxDBTextEdit;
    cxLabelNAME_DOG_TYPE: TcxLabel;
    cxLabelMFO: TcxLabel;
    cxDBTextEditMFO: TcxDBTextEdit;
    cxLabelFIO_PAYER: TcxLabel;
    cxDBTextEditFIO_PAYER: TcxDBTextEdit;
    cxGridPrKViewWithFilter: TcxGrid;
    cxGridPrKViewWithFilterDBTableView1: TcxGridDBTableView;
    colFIO: TcxGridDBColumn;
    colNOMER_DELA: TcxGridDBColumn;
    colSHORT_NAME_FAK: TcxGridDBColumn;
    colSHORT_NAME_SPEC: TcxGridDBColumn;
    colSHORT_NAME_FORM_STUD: TcxGridDBColumn;
    colSHORT_NAME_KAT_STUD: TcxGridDBColumn;
    colIS_LOCKED: TcxGridDBColumn;
    cxGridPrKViewWithFilterLevel1: TcxGridLevel;
    dxBarManagerViewWithFilter: TdxBarManager;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    dxBarLargeButtonAddCN: TdxBarLargeButton;
    dxBarLargeButtonChangeCN: TdxBarLargeButton;
    dxBarLargeButtonDelCN: TdxBarLargeButton;
    dxBarLargeButtonPrintCn: TdxBarLargeButton;
    dxBarLargeButtonChangeCN_Status: TdxBarLargeButton;
    cxGroupBoxAllFilter: TcxGroupBox;
    ADOConnection: TADOConnection;
    ADOStoredProc: TADOStoredProc;
    ADOStoredProcWrite: TADOStoredProc;
    ADOConnectionGlobalData: TADOConnection;
    ADOStoredProcGlobalData: TADOStoredProc;
    GroupBox1: TGroupBox;
    cxDateEditEnd: TcxDateEdit;
    cxDateEditBeg: TcxDateEdit;
    cxLabelDateBeg: TcxLabel;
    cxLabelDateEnd: TcxLabel;
    ADOStoredProcSpec: TADOStoredProc;
    DataSourceSpec: TDataSource;
    cxRadioButtonToday: TcxRadioButton;
    cxRadioButtonAll: TcxRadioButton;
    cxLookupComboBoxSpec: TcxLookupComboBox;
    cxLabelSpec: TcxLabel;
    cxTextFIO: TcxTextEdit;
    cxLabelFIO: TcxLabel;
    cxTextEditTIN: TcxTextEdit;
    cxLabelTIN: TcxLabel;
    cxButtonFiltr: TcxButton;
    ADOWriteConnection: TADOConnection;
    ActionLink: TAction;
    ActionPrikzObnov3: TAction;
    dxBarLargeButtonLink: TdxBarLargeButton;
    dxBarLargeButtonPrikzObnov: TdxBarLargeButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    ActionPrikzObnov12: TAction;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    ActionPodpis: TAction;
    ActionRasPodpis: TAction;
    dxBarLargeButton2: TdxBarLargeButton;
    LABEL_OWNER: TcxLabel;
    LABEL_SIGNED: TcxLabel;
    cxDBTextEditID_USER_OWNER: TcxDBTextEdit;
    cxDBTextEditID_USER_PODPIS: TcxDBTextEdit;
    cxGridPrKContractsDBTableView1DBColumn1: TcxGridDBColumn;
    DataSetContraktsID_DT_NST_DOG: TFIBBCDField;
    DataSetContraktsID_DOG: TFIBBCDField;
    DataSetContraktsNUM_DOG: TFIBStringField;
    DataSetContraktsDATE_DOG: TFIBDateField;
    DataSetContraktsID_DOG_STATUS: TFIBBCDField;
    DataSetContraktsID_TYPE_DOG: TFIBBCDField;
    DataSetContraktsSUMMA: TFIBBCDField;
    DataSetContraktsNAME_DOG_STATUS: TFIBStringField;
    DataSetContraktsNAME_DOG_TYPE: TFIBStringField;
    DataSetContraktsID_PAYER: TFIBBCDField;
    DataSetContraktsID_TYPE_PAYER: TFIBBCDField;
    DataSetContraktsID_RATE_ACCOUNT: TFIBBCDField;
    DataSetContraktsID_TYPE_STAGE: TFIBBCDField;
    DataSetContraktsPERSENT_OF_PAYER: TFIBFloatField;
    DataSetContraktsSUMMA_OF_PAYER: TFIBBCDField;
    DataSetContraktsFIO_PAYER: TFIBStringField;
    DataSetContraktsMFO: TFIBStringField;
    DataSetContraktsRATE_ACCOUNT: TFIBStringField;
    DataSetContraktsNAME_STAGE: TFIBStringField;
    DataSetContraktsISPERCENT: TFIBSmallIntField;
    DataSetContraktsID_GROUP: TFIBBCDField;
    DataSetContraktsID_NATIONAL: TFIBBCDField;
    DataSetContraktsDATE_BEG: TFIBDateField;
    DataSetContraktsDATE_END: TFIBDateField;
    DataSetContraktsIS_DOG_LOCKED: TFIBSmallIntField;
    DataSetContraktsVIDPR: TFIBStringField;
    DataSetContraktsID_USER_OWNER: TFIBBCDField;
    DataSetContraktsIS_SIGNED: TFIBSmallIntField;
    DataSetContraktsID_USER_PODPIS: TFIBBCDField;
    DataSetContraktsSIGN_TEXT: TFIBStringField;
    DataSetContraktsFIO_OWNER: TFIBStringField;
    DataSetContraktsFIO_SIGN: TFIBStringField;
    dxBarLargeButton3: TdxBarLargeButton;
    ActionPriceCurrent: TAction;
    dxBarLargeButton4: TdxBarLargeButton;
    ActionCrypt: TAction;
    ActionShowButton: TAction;
    DataSet_ini: TpFIBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionAddCNExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure ActionChangeCNExecute(Sender: TObject);
    procedure ActionDelCNExecute(Sender: TObject);
    procedure ActionPrintCnExecute(Sender: TObject);
    procedure ActionChangeCN_StatusExecute(Sender: TObject);
    procedure RxMemoryDataPrKViewWithFilterAfterScroll(DataSet: TDataSet);
    procedure cxGridPrKViewWithFilterDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure DataSetContraktsAfterOpen(DataSet: TDataSet);
    procedure ADOStoredProcAfterScroll(DataSet: TDataSet);
    procedure cxTextEditTINKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextFIOKeyPress(Sender: TObject; var Key: Char);
    procedure ActionLinkExecute(Sender: TObject);
    procedure ActionPrikzObnov3Execute(Sender: TObject);
    procedure ActionPrikzObnov12Execute(Sender: TObject);
    procedure ActionPodpisExecute(Sender: TObject);
    procedure ActionRasPodpisExecute(Sender: TObject);
    procedure ActionPriceCurrentExecute(Sender: TObject);
    procedure ActionCryptExecute(Sender: TObject);
    procedure ActionShowButtonExecute(Sender: TObject);
  private
    CanAfterScroll   :Boolean;
    IndexLanguage     :Integer;
    CN_ABITUR_STATUS_CANDIDATE  :Int64;
    CN_ABITUR_STATUS_PROJECT  :Int64;
    ID_USER_GLOBAL    :Int64;
    USER_NAME_GLOBAL  :String;
    ID_PEOPLE_GLOBAL  :Int64;
    FID_NAME: string;
    FSelectSQLTextCN: String;
    SQLWhere: string;
//    ResultArray             :TAArray;
    DBHANDLE         :TISC_DB_HANDLE;
    procedure SetID_NAME(const Value: string);
    procedure SetSelectSQLTextCN(const Value: String);
    procedure InicCaption;
    function ConnectToBase: integer;
    function GetCnID(ID,proc,p1,p2,v1,v2,CaptionLabel,ProcName: string):int64;
    procedure SetcxDateEditBegEnd;
    procedure PrikzObnov(prikz_info_ProcedureName,prikz_abit_sel_ProcedureName: string);
  public
     is_use_crypt : integer;
    APP_PATH :string;
    INI_FILENAME :string;
    Property ID_NAME        :string read FID_NAME write SetID_NAME;
    Property SelectSQLTextCN:String read FSelectSQLTextCN write SetSelectSQLTextCN;
    procedure Obnovit(id_obnovit: int64);
    procedure ObnovitCn(id_obnovit: int64);
    procedure GetFilterParams;
  end;

var
  FormAbitCn: TFormAbitCn;

implementation
uses
  cn_Common_Loader,cn_Common_Types, uPwdDecrypt,
  uAbitCn_Loader,  uAbitCn_Resources,registry,uConstants, MDIToolBar,
  AccMgmt,DogLoaderUnit, DateUtils,
  uLoginAbitCn, SelectForm, SynchrForm, MainCrypt, CryptDo;

{$R *.dfm}

procedure TFormAbitCn.FormCreate(Sender: TObject);
var
  reg               :TRegistry;
  RegisterValueId   :String;
  RegisterValueName :String;
begin

  //showmessage('Crypt = '+GetCrypted('Provider=SQLOLEDB.1;Password=esuap12kaerb;Persist Security Info=False;User ID=Contract;Initial Catalog=Amodelka;Data Source=195.184.198.48,1433'));
  //showmessage('UnCrypt = '+GetUnCrypted('0010700102001070010800108000650012200108001110011400114001270011500118001180012200124'));
  SQLWhere := '';
  IndexLanguage:=SelectLanguage;
  InicCaption;

  INI_FILENAME:='config.ini';
  APP_PATH := ExtractFileDir(Application.ExeName) + '\';



  if  ConnectToBase=0 then
  begin
    Application.Terminate;
    Exit;
  end;

  DM_IE.DB.Handle := DBHANDLE;

  DataSet.Active                           :=false;
  DataSet.Database                         := Database;
  DataSet.Transaction                      := ReadTransaction;


  DataSet.SelectSQL.Clear;
  DataSet.SQLs.SelectSQL.Text              :='Select * from EXCH_GET_PUB_SYS_DATA';
  DataSet.CloseOpen(false);




  CN_ABITUR_STATUS_CANDIDATE := DataSet.FieldValues['ID_DOG_STATUS_CANDIDATE'];
  CN_ABITUR_STATUS_PROJECT := DataSet.FieldValues['ID_DOG_STATUS_PROJECT'];

  ID_NAME              :='NST';

  CanAfterScroll:=False;

  ADOStoredProcSpec.close;
  ADOStoredProcSpec.ProcedureName := 'EXCH_SPEC_GET';
  ADOStoredProcSpec.Parameters.Refresh;
  ADOStoredProcSpec.ExecProc;
  ADOStoredProcSpec.Open;


  ADOStoredProc.close;
  ADOStoredProc.ProcedureName := 'EXCH_ABIT_LIST_SELECT';
  ADOStoredProc.Parameters.Refresh;
  ADOStoredProc.Parameters.ParamByName('@CN_ABITUR_STATUS_CANDIDATE').Value := CN_ABITUR_STATUS_CANDIDATE;
  ADOStoredProc.Parameters.ParamByName('@CN_ABITUR_STATUS_PROJECT').Value := CN_ABITUR_STATUS_PROJECT;
  GetFilterParams;
  ADOStoredProc.ExecProc;
  ADOStoredProc.Open;

  SelectSQLTextCN      :='Select * from EXCH_NST_DOG_INFO_SELECT(:NST,:id_dog_in)';

 // User_Name_Global       :='Abityrient';

  CanAfterScroll      :=True;
end;

function TFormAbitCn.ConnectToBase :integer;
var
  CurrentID_PCARD: integer;
  CurrentLogin,CurrentPassword: string;
  Error: integer;
  InitResult : TResultInfo;
  T:TFormLoginAbitCn;
  IniFile : TIniFile;
  s, sip, spod :string;
  wsaData: TWSAData;
  P: PHostEnt;
  Buf: array [0..127] of Char;
begin
  result:=1; // присваем 1 т.к. все хорошо, в случае боков далее присваем 0
  T:=TFormLoginAbitCn.Create(self);


  if T.ShowModal=MrOk then
  begin
    CurrentLogin    := T.cxTextEditLogin.Text;
    CurrentPassword := T.cxTextEditPassword.Text;
  end
  else
  begin
    T.Free;
    T:=Nil;
    result:=0;
    exit;
  end;

  //connect to firebird
  InitResult.DBHandle := nil;
  InitResult.ErrorCode:=-1;
	try
    InitResult := fibInitConnection(CurrentLogin, CurrentPassword);
	except on e: Exception do
		begin
			  Dialogs.MessageDlg('Фатальна помилка у системі безпеки : ' +
				e.Message, mtError,[mbOk],0);
			  ModalResult := mrCancel;
        result:=0;
        Exit;
		end;
	end;

	if InitResult.ErrorCode <> ACCMGMT_OK then		// ошибка
	begin
    Dialogs.MessageDlg(AcMgmtErrMsg(InitResult.ErrorCode),mtError,[mbOk],0);
    result:=0;
	end
	else begin	// все пучком

	 	  CurrentID_PCARD       := AccMgmt.GetCurrentUserIDExt;  // забрать PCARD
      ID_USER_GLOBAL        :=AccMgmt.GetUserId;
      ID_PEOPLE_GLOBAL      :=AccMgmt.GetUserIdMan;//  передача  Id_People в главную форму
{*}   Database.Handle       :=InitResult.DBHandle;
      DBHANDLE              :=InitResult.DBHandle;
      LoadSysData(ReadTransaction);
			// на случай совсем злых багов
		  if CurrentID_PCARD = 0 then
  		begin
	  	    Dialogs.MessageDlg('Помилка у системі безпеки!',mtError,[mbOk],0);
		  	  ModalResult := mrCancel; // или  MrNone
          result:=0;
          Exit;
  		end
      else
      begin
          Error :=fibCheckPermission('/ROOT/Contracts/Cn_abit', 'Belong');
          if  Error <> 0 then
          begin
              MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar('Помилка'), 16);
              ModalResult := mrCancel;
              result:=0;
          end;
      end;
	end;
  Database.Connected := true;
  DataSet_ini.Database                         := Database;
  DataSet_ini.Transaction                      := ReadTransaction;

  DataSet_ini.Close;
  DataSet_ini.SQLs.SelectSQL.Text          :='Select * from EXCH_INI';
  DataSet_ini.Open;
  is_use_crypt       := DataSet_ini.FieldValues['use_crypt'];

  DataSet_ini.Close;
  DataSet_ini.SelectSQL.Text              := 'Select name from USERS where id_user='+inttostr(id_user_global);
  DataSet_ini.Open;
  User_Name_Global := DataSet_ini.fieldbyname('NAME').AsString+'(Abit)' ;
  


  //----------------------------------------------------------------------------

  T.Free;
  T:=Nil;

  if not FileExists(APP_PATH + INI_FILENAME)
  then
  begin
    Dialogs.MessageDlg('INI-файл не знайдено!', mtError,[mbOk],0);
    ModalResult := mrCancel;
    result:=0;
    Exit;
  end
  else
  begin
    /////////////////// считываем ip адрес ////////////////////////////
    sip := '';
    spod := '';
    if WSAStartup($101, wsaData) = 0 then begin
      if GetHostName(@Buf, 128) = 0 then begin
        P := GetHostByName(@Buf);
        if P <> nil then sip := iNet_ntoa(PInAddr(p^.h_addr_list^)^);
      end;
      WSACleanup;
    end;

    if (sip <> '') then
    begin
      spod := RightStr(sip,Length(sip)-Pos('.',sip));
      spod := RightStr(spod,Length(spod)-Pos('.',spod));
      spod := LeftStr(spod,Pos('.',spod)-1);
    end;

    /////////////////// Коннектимся к Abiturien на MSSQL 2000 ////////////////////////////
    IniFile          := TIniFile.Create(APP_PATH + INI_FILENAME);

    if ((sip = '') or (sip = '127.0.0.1')) then // не подключен к сети
      s := 'ConnectionAbiturient'
    else if (spod = '56') then  // находимся в 56 подсети
      s := 'Connection56Abiturient'
    else
      s := 'Connection77Abiturient';
      //s := 'Connection77Abiturient';
     s:= IniFile.ReadString('MSSERVER', s, '');
   
    try
    if is_use_crypt= 1 then
        ADOConnection.ConnectionString := GetUnCrypted(s)
    else
        ADOConnection.ConnectionString := s;
    ADOConnection.Connected:= true;
    except
    showmessage('Error ');
    end;

    if is_use_crypt= 1 then
        ADOWriteConnection.ConnectionString := GetUnCrypted(s)
    else
        ADOWriteConnection.ConnectionString := s;

    ADOWriteConnection.Connected:= true;
    /////////////////// Коннектимся к Amodelka на MSSQL 2000 ////////////////////////////

    if ((sip = '') or (sip = '127.0.0.1')) then // не подключен к сети
      s := 'ConnectionAmodelka'
    else if (spod = '56') then   // находимся в 56 подсети
      s := 'Connection56Amodelka'
    else
      s := 'Connection77Amodelka';
     //s := 'Connection77Amodelka';
    s := IniFile.ReadString('MSSERVER', s, '');
    try
    if is_use_crypt= 1 then
        DM_IE.AmodelkaR.ConnectionString := GetUnCrypted(s)
    else
        DM_IE.AmodelkaR.ConnectionString := s;
    //DM_IE.AmodelkaR.ConnectionString := GetUnCrypted(s);
    DM_IE.AmodelkaR.Connected:= true;
    except
    showmessage('Error ');
    end;

    if is_use_crypt= 1 then
        DM_IE.AmodelkaRW.ConnectionString := GetUnCrypted(s)
    else
        DM_IE.AmodelkaRW.ConnectionString := s;
   // DM_IE.AmodelkaRW.ConnectionString := GetUnCrypted(s);
    DM_IE.AmodelkaRW.Connected:= true;

    /////////////////// Коннектимся к GlobalData на MSSQL 2005 ////////////////////////////

    if ((sip = '') or (sip = '127.0.0.1')) then // не подключен к сети
      s := 'ConnectionGlobalData'
    else if (spod = '56') then   // находимся в 56 подсети
      s := 'Connection56GlobalData'
    else
      s := 'Connection77GlobalData';
       // s := 'Connection77GlobalData';
    s := IniFile.ReadString('MSSERVER', s, '');
    try
    if is_use_crypt= 1 then
        ADOConnectionGlobalData.ConnectionString := GetUnCrypted(s)
    else
        ADOConnectionGlobalData.ConnectionString := s;
    //ADOConnectionGlobalData.ConnectionString := GetUnCrypted(s);
    ADOConnectionGlobalData.Connected:= true;
    except
    showmessage('Error ');
    end;

    if is_use_crypt= 1 then
        DM_IE.GlobalDataRW.ConnectionString := GetUnCrypted(s)
    else
        DM_IE.GlobalDataRW.ConnectionString := s;
    //DM_IE.GlobalDataRW.ConnectionString := GetUnCrypted(s);
    DM_IE.GlobalDataRW.Connected:= true;


    if is_use_crypt= 1 then
        DM_IE.GlobalDataR.ConnectionString := GetUnCrypted(s)
    else
        DM_IE.GlobalDataR.ConnectionString := s;
    //DM_IE.GlobalDataR.ConnectionString := GetUnCrypted(s);
    DM_IE.GlobalDataR.Connected:= true;

    DM_IE.GetPeopleID_dset.Close;
    DM_IE.GetPeopleID_dset.ProcedureName := 'Person.G_dt_fiz_lica_main_exch_GetPeopleID';
    DM_IE.GetPeopleID_dset.Parameters.Refresh;

    IniFile.Free;
    ///////////////////////////////////////////////////////////
  end;


end;

procedure TFormAbitCn.InicCaption;
begin
   TFormAbitCn(self).Caption    :=nFormAbitCn_Caption[IndexLanguage];

    ActionCrypt.Enabled    := False;
  ActionCrypt.Visible    := False;

    dxBarManagerViewWithFilter.Bars[0].BorderStyle    :=bbsNone;
    dxBarManagerViewWithFilter.Bars[0].ShowMark       :=false;
    dxBarManagerViewWithFilter.CanCustomize           :=false;
    dxBarManagerViewWithFilter.Bars[0].AllowClose       :=false;
    dxBarManagerViewWithFilter.Bars[0].AllowCustomizing    :=false;
    dxBarManagerViewWithFilter.Bars[0].AllowQuickCustomizing  :=false;
    dxBarManagerViewWithFilter.Bars[0].AllowReset                :=false;

    ActionObnov.Caption                  :=nActiont_Obnov[IndexLanguage];
    ActionOtmena.Caption                 :=nAction_Exit[IndexLanguage];

    ActionObnov.Hint                     :=nHintAction_Obnov[IndexLanguage];
    ActionOtmena.Hint                    :=nHintAction_Exit[IndexLanguage];

//    dxStatusBarVWF.Panels[0].Text          :=nStatBarAdd[IndexLanguage];
//    dxStatusBarVWF.Panels[1].Text          :=nStatBarChange[IndexLanguage];
//    dxStatusBarVWF.Panels[2].Text          :=nStatBarDel[IndexLanguage];
//    dxStatusBarVWF.Panels[3].Text          :=nStatBarVibrat[IndexLanguage];
    dxStatusBarVWF.Panels[4].Text          :=nStatBarObnov[IndexLanguage];
    dxStatusBarVWF.Panels[5].Text          :=nStatBarExit[IndexLanguage];

    colFIO.Caption                         :=ncolFIO[IndexLanguage];
    colNOMER_DELA.Caption                  :=ncolNOMER_DELA[IndexLanguage];
    colSHORT_NAME_FAK.Caption              :=ncolNAME_FAK[IndexLanguage];
    colSHORT_NAME_SPEC.Caption             :=ncolNAME_SPEC[IndexLanguage];
    colSHORT_NAME_FORM_STUD.Caption        :=ncolSHORT_NAME_CN_FORM_STUD[IndexLanguage];
    colSHORT_NAME_KAT_STUD.Caption         :=ncolSHORT_NAME_CN_KAT_STUD[IndexLanguage];
    colIS_LOCKED.Caption                   :=ncolIS_LOCKED[IndexLanguage];

    cxButtonFiltr.Caption                   :=nLabelButtonFilter[IndexLanguage];
    cxLabelTIN.Caption                     :=nLabelTIN[IndexLanguage];
    cxLabelSpec.Caption                    :=LabelSpec[IndexLanguage];
    cxLabelFIO.Caption                     :=nLabelFIO[IndexLanguage];
    cxRadioButtonToday.Caption             :=nLabelOnToday[IndexLanguage];
    cxRadioButtonAll.Caption               :=nLabelOnAll[IndexLanguage];

    ActionAddCN.Caption                    :=nActionAddCN[IndexLanguage];
    ActionChangeCN.Caption                 :=nActionChangeCN[IndexLanguage];
    ActionDelCN.Caption                    :=nActionDelCN[IndexLanguage];
    ActionPrintCn.Caption                  :=nActiontPrint[IndexLanguage];
    ActionChangeCN_Status.Caption          :=nActionChangeCN_Status[IndexLanguage];

    ActionLink.Caption                     :=nActionLink[IndexLanguage];
    ActionPrikzObnov3.Caption              :=nActionPrikzObnov3[IndexLanguage];
    ActionPrikzObnov12.Caption             :=nActionPrikzObnov12[IndexLanguage];
    ActionPodpis.Caption                   :=nHintActiontSign[IndexLanguage];
    ActionRasPodpis.Caption                :=nHintActiontUnsign[IndexLanguage];
    ActionPriceCurrent.Caption             :=nHintActiontPriceCurrent[IndexLanguage];

    ActionAddCN.Hint                       :=nHintAction_Add[IndexLanguage];
    ActionChangeCN.Hint                    :=nHintAction_Change[IndexLanguage];
    ActionDelCN.Hint                       :=nHintAction_Del[IndexLanguage];
    ActionPrintCn.Hint                     :=nHintActiontPrint[IndexLanguage];
    ActionChangeCN_Status.Hint             :=nHintActionChangeCN_Status[IndexLanguage];
    ActionLink.Hint                        :=nActionLink[IndexLanguage];
    ActionPrikzObnov3.Hint                 :=nActionPrikzObnov3[IndexLanguage];
    ActionPrikzObnov12.Hint                :=nActionPrikzObnov12[IndexLanguage];
    ActionPodpis.Hint                      :=nHintActiontSign[IndexLanguage];
    ActionRasPodpis.Hint                   :=nHintActiontUnsign[IndexLanguage];
    ActionPriceCurrent.Hint                :=nHintActiontPriceCurrent[IndexLanguage];

    cxGroupBoxContracts.Caption            :=ncxGroupBoxContracts[IndexLanguage];
    cxGroupBoxAllFilter.Caption            :=ncxGroupBoxFilter[IndexLanguage];

    colNUM_DOG.Caption                     :=ncolNUM_DOG[IndexLanguage];
    colDATE_DOG.Caption                    :=ncolDATE_DOG[IndexLanguage];
    colSUMMA.Caption                       :=ncolSUMMA[IndexLanguage];

    cxLabelNAME_DOG_STATUS.Caption         :=nLabelNAME_DOG_STATUS[IndexLanguage];
    cxLabelNAME_DOG_TYPE.Caption           :=nLabelNAME_DOG_TYPE[IndexLanguage];
    cxLabelMFO.Caption                     :=nLabelMFO[IndexLanguage];
    cxLabelFIO_PAYER.Caption               :=nLabelFIO_PAYER[IndexLanguage];

    cxLabelDateBeg.Caption                 :=nLabelBeg[IndexLanguage];
    cxLabelDateEnd.Caption                 :=nLabelEnd[IndexLanguage];
end;

procedure TFormAbitCn.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i,j : integer;
  CountMDIChildForm : integer;
  CountActiveTrans  : integer;
begin
   CountMDIChildForm:=Application.MainForm.MDIChildCount;
   for i := 0 to CountMDIChildForm - 1 do
   begin
     Application.MainForm.MDIChildren[CountMDIChildForm-i-1].Close; // то есть будем начинать закрывать с последней
   end;
   ErrorHandlerPrK.Free;
   ErrorHandlerPrK:=nil;
end;

procedure TFormAbitCn.Obnovit(id_obnovit: int64);
var wf:TForm;
begin
  wf:=ShowWaitForm(Self);
  try
    CanAfterScroll:=false;
    ADOStoredProc.Active := false;
    ADOStoredProc.Parameters.Refresh;
    ADOStoredProc.Parameters.ParamByName('@CN_ABITUR_STATUS_CANDIDATE').Value := CN_ABITUR_STATUS_CANDIDATE;
  ADOStoredProc.Parameters.ParamByName('@CN_ABITUR_STATUS_PROJECT').Value := CN_ABITUR_STATUS_PROJECT;
    GetFilterParams;
    ADOStoredProc.ExecProc;
    ADOStoredProc.Open;
    ADOStoredProc.Locate(ID_NAME,id_obnovit,[]);
    CanAfterScroll:=true;
  finally
    CloseWaitForm(wf);
  end;
end;

procedure TFormAbitCn.ObnovitCn(id_obnovit: int64);
begin
   DataSetContrakts.Active:=false;
   DataSetContrakts.ParamByName('id_dog_in').AsInt64:=-1;

   if ADOStoredProc.fieldValues['NST']<> null
    then DataSetContrakts.ParamByName('NST').AsInt64:=ADOStoredProc.fieldValues['NST']
    else DataSetContrakts.ParamByName('NST').AsInt64:=-1;

   DataSetContrakts.CloseOpen(false);

   if DataSetContrakts.FieldValues['id_dt_nst_dog']<>null
    then DataSetContrakts.Locate('id_dt_nst_dog',id_obnovit,[]);

   SetcxDateEditBegEnd;
end;

procedure TFormAbitCn.SetID_NAME(const Value: string);
begin
  if Trim(Value)='' then ShowMessage('Пустое имя id!!!'+CHR(13)+
                   'Дальнейшая работа программы будет неверной!');
  FID_NAME := Value;
end;

procedure TFormAbitCn.SetcxDateEditBegEnd;
var
  dbeg, dend: TDateTime;
  srok_ob: Extended;
  srok_month,sroc_year: integer;
begin
    if ADOStoredProc.fieldValues['date_beg']<>null then
      cxDateEditBeg.Date := ADOStoredProc.fieldValues['date_beg']
    else
    begin
      if ADOStoredProc.fieldValues['date_beg']<>null then
        dbeg := ADOStoredProc.fieldValues['DATAZAP']
      else
        dbeg := date();

      dbeg := EncodeDateTime(YearOf(dbeg), 09, 01, 0, 0, 0, 0);
      cxDateEditBeg.Date := dbeg;
    end;

    if ADOStoredProc.fieldValues['date_end']<>null then
      cxDateEditEnd.Date := ADOStoredProc.fieldValues['date_end']
    else
    begin
      if ADOStoredProc.fieldValues['SROK_OB']<>null then
      begin
        srok_ob := ADOStoredProc.fieldValues['SROK_OB'];
        srok_month := trunc(12*frac(srok_ob)) + trunc(MonthOf(dbeg));
        sroc_year := YearOf(dbeg) + trunc(srok_ob);

        if frac(srok_ob) > 0 then
          dend := EncodeDateTime(sroc_year + 1, 02, 01, 0, 0, 0, 0)
        else
          dend := EncodeDateTime(sroc_year, 07, 01, 0, 0, 0, 0);
      end
      else
        dend := dbeg;

      cxDateEditEnd.Date := dend;
    end;
end;

procedure TFormAbitCn.SetSelectSQLTextCN(
  const Value: String);
begin
  FSelectSQLTextCN := Value;
    DataSetContrakts.Active                           :=false;
    DataSetContrakts.Database                         := Database;
    DataSetContrakts.Transaction                      := ReadTransaction;
    DataSetContrakts.SelectSQL.Clear;
    DataSetContrakts.SQLs.SelectSQL.Text              :=FSelectSQLTextCN;
    DataSetContrakts.ParamByName('id_dog_in').AsInt64:=-1;

    if ADOStoredProc.fieldValues['NST']<>null
     then DataSetContrakts.ParamByName('NST').AsInt64:=ADOStoredProc.fieldValues['NST']
     else DataSetContrakts.ParamByName('NST').AsInt64:=-1;

    SetcxDateEditBegEnd;
    DataSetContrakts.CloseOpen(false);
end;

procedure TFormAbitCn.ActionObnovExecute(Sender: TObject);
var
  i:Int64;
  id_dog_obnov:int64;
begin

   cxGridPrKViewWithFilter.SetFocus;
     if ADOStoredProc.FieldValues[ID_NAME]<>null
      then i:= StrToInt64(ADOStoredProc.FieldValues[ID_NAME]);
   if DataSetContrakts.FieldValues['id_dt_nst_dog']<>null
     then id_dog_obnov:=DataSetContrakts.FieldValues['id_dt_nst_dog'];
   Obnovit(i);
   ObnovitCn(id_dog_obnov);
end;

function TFormAbitCn.GetCnID(ID,proc,p1,p2,v1,v2,CaptionLabel,ProcName: string):int64;
var res: int64;
begin
  ADOStoredProcGlobalData.Close;
  ADOStoredProcGlobalData.ProcedureName := proc;
  ADOStoredProcGlobalData.Parameters.Refresh;
  ADOStoredProcGlobalData.Parameters.ParamByName(p1).Value := ADOStoredProc.FieldValues[v1];

  if p2 <> '' then
    ADOStoredProcGlobalData.Parameters.ParamByName(p2).Value := ADOStoredProc.FieldValues[v2];

  try
    ADOStoredProcGlobalData.ExecProc;
    ADOStoredProcGlobalData.Open;
  except on e: Exception do
    MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
               nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
               e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
  end;

  if (ADOStoredProcGlobalData.RecordCount > 1) then
  begin
    res := SelCNid(self, ADOConnectionGlobalData, CaptionLabel,ProcName,p1, ADOStoredProc.FieldValues[v1]);
    if (res < 0) then GetCnID := -777 else GetCnID := res;
  end
  else if (VarIsNull(ADOStoredProcGlobalData.FieldValues[ID])) then
    GetCnID := -777
  else
    GetCnID := ADOStoredProcGlobalData.FieldValues[ID];
end;

procedure TFormAbitCn.ActionAddCNExecute(Sender: TObject);
 var
  AParameter      :TcnSimpleParamsAbiturient; // класс параметров для создания подключения
  cnParamsRecord  :TcnParamsToAddContract; // тип-запись для входящих параметров по обучению
  res: Variant; //результат работы справочника
  id_dog_obnov,ID_DOG_CN,ID_DEPARTMENT,ID_CN_SPEC,ID_FORM_STUD,ID_KAT_STUD,ID_NATIONAL,KOD_KURS,ID_GROUP,ID_MAN :int64;
  wf:TForm;
  s: string;
  error : integer;
//  cl: TClipboard;
begin

    error := fibCheckPermission('/ROOT/Contracts/Cn_abit/Cn_abit_work','Add');
    if error <> 0 then
    begin
        showmessage(nMsgDeny[IndexLanguage]);
        exit;
    end;

    if(DataSetContrakts.FieldValues['is_signed']=0) then
    begin
        showmessage(nMsgIsSigned[IndexLanguage]);
        exit;
    end;
      //showmessage(inttostr(ADOStoredProc.FieldValues['NST']));
  if ADOStoredProc.FieldValues['NST']<>Null then
  begin
    
//  cl:=Clipboard();
//  cl.Clear;

      // запуск справочника
      AParameter:= TcnSimpleParamsAbiturient.Create; // создать класс подключения
      AParameter.Owner           :=self;// владелец
      AParameter.Db_Handle       := Database.Handle;// хендл базы
      AParameter.ID_User         := ID_User_Global;  //иде-р пользователя в системе ?
      AParameter.User_Name       := User_Name_Global;//имя пользователя  ?
      AParameter.Formstyle       := fsNormal;        // тип формы
      AParameter.WaitPakageOwner := self;            // владелец окна ожидания загрузки
      AParameter.WorkMode        := 'extra';         // тип вызова - "extra" означает для системы абитуриент
      AParameter.ActionMode      := 'add';           // режим работы в системе - "добавление контракта"
      // входящие параметры

      wf:=ShowWaitForm(Self);
      try
        s := '';
        DM_IE.Synchronize_People;
        ID_MAN := DM_IE.GetPeopleID(ADOStoredProc.FieldValues['NFIZL'],2,1);
        if (ID_MAN < 0) then s := s + 'Не найдено соответствие в физлицах!'+ #13#10;
//        s := 'cnParamsRecord.ID_MAN := ' + inttostr(ID_MAN) + #13#10;
     //showmessage(inttostr(ID_MAN));
        cnParamsRecord.ID_MAN := ID_MAN;

        if DataSetContrakts.RecordCount=0
          then cnParamsRecord.ID_DOG_STATUS := CN_ABITUR_STATUS_CANDIDATE
        else cnParamsRecord.ID_DOG_STATUS := CN_ABITUR_STATUS_PROJECT;

        ID_DEPARTMENT := GetCnID('ID_DEPARTMENT','ABIT_GET_SP_DEPARTMENT','@FAK','','FAK','','','');
        if (ID_DEPARTMENT < 0) then s := s + 'Не найдено соответствие в факультетах/центрах!'+ #13#10;
//        s := s + 'cnParamsRecord.ID_DEPARTMENT := ' + inttostr(ID_DEPARTMENT) + #13#10;

        cnParamsRecord.ID_DEPARTMENT := ID_DEPARTMENT;
        ID_CN_SPEC := GetCnID('ID_CN_SPEC','ABIT_GET_CN_SPEC','@SPEC','@MOVA','SPEC','MOVA','','');
        if (ID_CN_SPEC < 0) then s := s + 'Не найдено соответствие в специальностях!'+ #13#10;
//        s := s + 'cnParamsRecord.ID_CN_SPEC := ' + inttostr(ID_CN_SPEC) + #13#10;
        cnParamsRecord.ID_SPEC       := ID_CN_SPEC;
        ID_FORM_STUD := GetCnID('ID_FORM_STUD','ABIT_GET_CN_FORM_STUD','@KOD_FORM','','KOD_FORM','','Оберіть форму навчання','ABIT_CN_SP_FORM_STUD_NAMES_S');
        if (ID_FORM_STUD < 0) then s := s + 'Не найдено соответствие в формах обучения!'+ #13#10;
//        s := s + 'cnParamsRecord.ID_FORM_STUD := ' + inttostr(ID_FORM_STUD) + #13#10;
        cnParamsRecord.ID_FORM_STUD  := ID_FORM_STUD;
        ID_KAT_STUD := GetCnID('ID_KAT_STUD','ABIT_GET_CN_KAT_STUD','@VIDSP','','VIDSP','','','');
        if (ID_KAT_STUD < 0) then s := s + 'Не найдено соответствие в ОКР!'+ #13#10;
//        s := s + 'cnParamsRecord.ID_KAT_STUD := ' + inttostr(ID_KAT_STUD) + #13#10;
        cnParamsRecord.ID_KAT_STUD   := ID_KAT_STUD;
        ID_NATIONAL := GetCnID('ID_NATIONAL','ABIT_GET_CN_ID_NATIONAL','@MESTO','','MESTO','','','');
        if (ID_NATIONAL < 0) then s := s + 'Не найдено соответствие в национальностях!'+ #13#10;
//        s := s + 'cnParamsRecord.ID_NATIONAL := ' + inttostr(ID_NATIONAL) + #13#10;
        cnParamsRecord.ID_NATIONAL   := ID_NATIONAL;
        KOD_KURS := GetCnID('KOD_KURS','ABIT_GET_KOD_KURS','@kurs','','KURS_Z','','','');
        if (KOD_KURS < 0) then s := s + 'Не найдено соответствие в курсах!'+ #13#10;
//        s := s + 'cnParamsRecord.KURS := ' + inttostr(KOD_KURS) + #13#10;
        cnParamsRecord.KURS          := KOD_KURS;

        ADOStoredProcGlobalData.Active := false;

        DataSet.Close;
        DataSet.SelectSQL.Clear;
        DataSet.SQLs.SelectSQL.Text              :='Select * from EXCH_GET_GROUP_ABITUR(:ID_DEPARTMENT)';

        DataSet.ParamByName('ID_DEPARTMENT').AsInt64 := ID_DEPARTMENT;
        DataSet.CloseOpen(false);
        ID_GROUP := DataSet.FieldValues['gruppa'];
        if (ID_GROUP < 0) then s := s + 'Не найдено соответствие в группах!'+ #13#10;
//        s := s + 'cnParamsRecord.ID_GROUP := ' + inttostr(ID_GROUP) + #13#10;
        cnParamsRecord.ID_GROUP      := ID_GROUP;

//        s := s + 'cnParamsRecord.DATE_BEG := ' + datetostr(cxDateEditBeg.Date) + #13#10;
        cnParamsRecord.DATE_BEG      := cxDateEditBeg.Date;
//        s := s + 'cnParamsRecord.DATE_END := ' + datetostr(cxDateEditEnd.Date) + #13#10;
        cnParamsRecord.DATE_END      := cxDateEditEnd.Date;

        if(s <> '') then showmessage(s);
//  cl.AsText := s;
        AParameter.cnParamsToAddContract := cnParamsRecord;
      finally
        CloseWaitForm(wf);
      end;


      res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_Contracts.bpl','ShowContracts'); // вызов

   {   wf:=ShowWaitForm(Self);
      try
        DM_IE.Synchronize_People;
      finally
        CloseWaitForm(wf);
      end;  }

        //если есть результат - вывожу
        if VarArrayDimCount(Res)>0 then
        begin
         if ((Res[0]<>0) and (Res[0]<>-1)) then
          begin
            try
              StoredProcContracts.Transaction.StartTransaction;
             // showmessage(inttostr(ID_USER_GLOBAL));
              StoredProcContracts.StoredProcName:='EXCH_DT_NST_DOG_CHANGE';
              StoredProcContracts.Prepare;
              StoredProcContracts.ParamByName('id_dt_nst_dog').AsInt64   := -1;
              StoredProcContracts.ParamByName('NST').AsInt64       :=ADOStoredProc.FieldValues['NST'];
              StoredProcContracts.ParamByName('ID_DOG').AsInt64           :=Res[0];
              StoredProcContracts.ParamByName('ID_DEPARTMENT').AsInt64 := ID_DEPARTMENT;
              StoredProcContracts.ParamByName('id_man').AsInt64 := ID_MAN;
              StoredProcContracts.ParamByName('id_cn_sp_national').AsInt64 := ID_NATIONAL;
              StoredProcContracts.ParamByName('date_beg').AsDate := cxDateEditBeg.Date;
              StoredProcContracts.ParamByName('date_end').AsDate := cxDateEditEnd.Date;
              StoredProcContracts.ParamByName('id_owner').AsInt64 := ID_USER_GLOBAL;
              //showmessage(inttostr(ID_USER_GLOBAL));
              StoredProcContracts.ExecProc;
              StoredProcContracts.Transaction.Commit;

              id_dog_obnov:=StoredProcContracts.FieldByName('ID_OUT').AsInt64;

              // читаем EXCH_NST_DOG_INFO_SELECT (firebird)
              DataSetContrakts.ParamByName('id_dog_in').AsInt64:=Res[0];

              if ADOStoredProc.fieldValues['NST']<>null then
                DataSetContrakts.ParamByName('NST').AsInt64:=ADOStoredProc.fieldValues['NST']
              else
                DataSetContrakts.ParamByName('NST').AsInt64:=-1;

              DataSetContrakts.CloseOpen(false);

              // пишем exch_dt_nst_dog_change (mssql)
//              ADOWriteConnection.BeginTrans;

              ADOStoredProcWrite.Close;
              ADOStoredProcWrite.ProcedureName := 'exch_dt_nst_dog_change';
              ADOStoredProcWrite.Parameters.Refresh;

              ADOStoredProcWrite.Parameters.ParamByName('@id_dt_nst_dog').Value :=-1;
              ADOStoredProcWrite.Parameters.ParamByName('@nst').Value :=ADOStoredProc.FieldValues[ID_NAME];
              ID_DOG_CN := DataSetContrakts.FieldValues['id_dog'];
              ADOStoredProcWrite.Parameters.ParamByName('@ID_DOG_CN').Value := inttostr(ID_DOG_CN);
              ADOStoredProcWrite.Parameters.ParamByName('@NUM_DOG').Value := DataSetContrakts.FieldValues['NUM_DOG'];
              ADOStoredProcWrite.Parameters.ParamByName('@date_dog').Value :=DataSetContrakts.FieldValues['date_dog'];
              ADOStoredProcWrite.Parameters.ParamByName('@id_dog_status').Value :=DataSetContrakts.FieldValues['id_dog_status'];
              ADOStoredProcWrite.Parameters.ParamByName('@id_type_dog').Value :=DataSetContrakts.FieldValues['id_type_dog'];
              ADOStoredProcWrite.Parameters.ParamByName('@summa').Value :=DataSetContrakts.FieldValues['summa'];
              ADOStoredProcWrite.Parameters.ParamByName('@id_group').Value :=DataSetContrakts.FieldValues['id_group'];
              ADOStoredProcWrite.Parameters.ParamByName('@date_beg').Value :=DataSetContrakts.FieldValues['date_beg'];
              ADOStoredProcWrite.Parameters.ParamByName('@date_end').Value :=DataSetContrakts.FieldValues['date_end'];
              ADOStoredProcWrite.Parameters.ParamByName('@vidpr').Value :=DataSetContrakts.FieldValues['vidpr'];
              ADOStoredProcWrite.ExecProc;
//              ADOWriteConnection.CommitTrans;

              // делаем добавленнй кандидатом, а остальные проектами
              StoredProcContracts.Transaction.StartTransaction;
              StoredProcContracts.StoredProcName:='CN_DT_DOG_STATUS_CHANGE';
              StoredProcContracts.Prepare;
              StoredProcContracts.ParamByName('id_dog_status').AsInt64  :=CN_ABITUR_STATUS_PROJECT;
              StoredProcContracts.ParamByName('id_dog').AsInt64      :=Res[0];
              StoredProcContracts.ParamByName('note').AsString      :=' ';
              StoredProcContracts.ExecProc;
              StoredProcContracts.Transaction.Commit;

              StoredProcContracts.Transaction.StartTransaction;
              StoredProcContracts.StoredProcName:='EXCH_NST_DOG_SET_CANDIDATE';
              StoredProcContracts.Prepare;
              StoredProcContracts.ParamByName('nst').AsInt64  :=ADOStoredProc.FieldValues[ID_NAME];
              StoredProcContracts.ParamByName('ID_DOG').AsInt64      :=Res[0];
              StoredProcContracts.ExecProc;
              StoredProcContracts.Transaction.Commit;

              // делаем добавленнй кандидатом, а остальные проектами
//              ADOWriteConnection.BeginTrans;
              ADOStoredProcWrite.Close;
              ADOStoredProcWrite.ProcedureName := 'exch_dt_nst_dog_SET_CANDIDATE';
              ADOStoredProcWrite.Parameters.Refresh;
//              ADOWriteConnection.CommitTrans;

//              ADOWriteConnection.BeginTrans;
              ADOStoredProcWrite.Parameters.ParamByName('@nst').Value :=ADOStoredProc.FieldValues[ID_NAME];
              ID_DOG_CN := DataSetContrakts.FieldValues['id_dog'];
              ADOStoredProcWrite.Parameters.ParamByName('@ID_DOG_CN').Value := inttostr(ID_DOG_CN);
              ADOStoredProcWrite.Parameters.ParamByName('@CN_ABITUR_STATUS_CANDIDATE').Value := CN_ABITUR_STATUS_CANDIDATE;
              ADOStoredProcWrite.Parameters.ParamByName('@CN_ABITUR_STATUS_PROJECT').Value := CN_ABITUR_STATUS_PROJECT;
              ADOStoredProcWrite.ExecProc;
//              ADOWriteConnection.CommitTrans;

              ADOStoredProcWrite.Close;

            except on e :Exception do
              begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                        nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
                  if (ADOWriteConnection.InTransaction) then ADOWriteConnection.RollbackTrans;
                  if (StoredProcContracts.Transaction.Active) then StoredProcContracts.Transaction.Rollback;
              end;
            end;

            Obnovit(ADOStoredProc.FieldValues[ID_NAME]);
            ObnovitCn(id_dog_obnov);

            ADOStoredProcWrite.Active := false;
          end;
       end;
      AParameter.Free;
   end;

end;

procedure TFormAbitCn.GetFilterParams;
var
  id_rec: integer;
begin
  if (cxRadioButtonToday.Checked) then
    ADOStoredProc.Parameters.ParamByName('@DATAZAP').Value := today
  else
    ADOStoredProc.Parameters.ParamByName('@DATAZAP').Value := null;

  ADOStoredProcSpec.Locate(cxLookupComboBoxSpec.Properties.ListFieldNames,
                            cxLookupComboBoxSpec.Text,
                            [loCaseInsensitive]);

  if ADOStoredProcSpec.FieldValues['SPEC']<>Null then
  begin
    ADOStoredProc.Parameters.ParamByName('@SPEC').Value := ADOStoredProcSpec.FieldValues['SPEC'];
    ADOStoredProc.Parameters.ParamByName('@MOVA').Value := ADOStoredProcSpec.FieldValues['MOVA'];
  end
  else
  begin
    ADOStoredProc.Parameters.ParamByName('@SPEC').Value := '';
    ADOStoredProc.Parameters.ParamByName('@MOVA').Value := 0;
  end;

  ADOStoredProc.Parameters.ParamByName('@TIN').Value := cxTextEditTIN.Text;

  if (trim(cxTextFIO.Text) <> '') then
    ADOStoredProc.Parameters.ParamByName('@FIO_UK').Value := uppercase(trim(cxTextFIO.Text)) + '%'
  else
    ADOStoredProc.Parameters.ParamByName('@FIO_UK').Value := '';
end;

procedure TFormAbitCn.ActionOtmenaExecute(Sender: TObject);
begin
   close;
end;

procedure TFormAbitCn.ActionChangeCNExecute(Sender: TObject);
var
  AParameter      :TcnSimpleParamsAbiturient;
  cnParamsRecord  :TcnParamsToAddContract;
  cnParamsIds     :TcnParamsToPakage; //тип-запись для вх.параметров по контракту
  res             :Variant;
  id_dog_obnov, id_dt_nst_dog,ID_DOG_CN    :int64;
  wf:TForm;
  error, er : integer;
begin

    er := fibCheckPermission('/ROOT/Contracts/Cn_abit/Cn_abit_work','Edit');
    error := fibCheckPermission('/ROOT/Contracts/Cn_abit/Cn_abit_all_edit','Belong');
    if (error <> 0) then
    begin
        if ((DataSetContrakts.FieldValues['id_user_owner']<>id_user_global) or (er <> 0))then
        begin
            showmessage(nMsgEditDenied[IndexLanguage]);
            exit;
        end;
    end;


  if(DataSetContrakts.FieldValues['is_signed']=0) then
  begin
      showmessage(nMsgIsSigned[IndexLanguage]);
      exit;
  end;
  
  if DataSetContrakts.FieldValues['ID_DOG']<>Null then
   begin
      // запуск справочника
      AParameter:= TcnSimpleParamsAbiturient.Create;
      AParameter.Owner          :=self;
      AParameter.Db_Handle      := Database.Handle;
      AParameter.ID_User        := ID_User_Global;
      AParameter.User_Name      := User_Name_Global;
      AParameter.Formstyle      := fsNormal;
      AParameter.WaitPakageOwner:= self;
      AParameter.WorkMode       := 'extra';
      AParameter.ActionMode     := 'edit'; // редактирование

      wf:=ShowWaitForm(Self);
      try
        DM_IE.Synchronize_People;
      finally
        cnParamsIds.ID_DOG := DataSetContrakts.FieldValues['ID_DOG']; // вх. параметр
        AParameter.cnParamsToPakage := cnParamsIds;
        AParameter.cnParamsToAddContract := cnParamsRecord;

        CloseWaitForm(wf);
      end;


      RunFunctionFromPackage(AParameter, 'Contracts\cn_Contracts.bpl','ShowContracts');
      AParameter.Free;

      wf:=ShowWaitForm(Self);
      try
//        DM_IE.Synchronize_People;

        // пишем exch_dt_nst_dog_change (mssql)
//        ADOWriteConnection.BeginTrans;

        ADOStoredProcWrite.Close;
        ADOStoredProcWrite.ProcedureName := 'exch_dt_nst_dog_get_id';
        ADOStoredProcWrite.Parameters.Refresh;
        ADOStoredProcWrite.Parameters.ParamByName('@nst').Value :=ADOStoredProc.FieldValues[ID_NAME];
        ID_DOG_CN := DataSetContrakts.FieldValues['id_dog'];
        ADOStoredProcWrite.Parameters.ParamByName('@ID_DOG_CN').Value := inttostr(ID_DOG_CN);
        ADOStoredProcWrite.ExecProc;
//        ADOWriteConnection.CommitTrans;

        ADOStoredProcWrite.Open;
        id_dt_nst_dog := ADOStoredProcWrite.FieldValues['id_dt_nst_dog'];

//        ADOWriteConnection.BeginTrans;
        ADOStoredProcWrite.Close;
        ADOStoredProcWrite.ProcedureName := 'exch_dt_nst_dog_change';
        ADOStoredProcWrite.Parameters.Refresh;

        ADOStoredProcWrite.Parameters.ParamByName('@id_dt_nst_dog').Value := id_dt_nst_dog;
        ADOStoredProcWrite.Parameters.ParamByName('@nst').Value :=ADOStoredProc.FieldValues[ID_NAME];
        ID_DOG_CN := DataSetContrakts.FieldValues['id_dog'];
        ADOStoredProcWrite.Parameters.ParamByName('@ID_DOG_CN').Value :=inttostr(ID_DOG_CN);
        ADOStoredProcWrite.Parameters.ParamByName('@NUM_DOG').Value :=DataSetContrakts.FieldValues['NUM_DOG'];
        ADOStoredProcWrite.Parameters.ParamByName('@date_dog').Value :=DataSetContrakts.FieldValues['date_dog'];
        ADOStoredProcWrite.Parameters.ParamByName('@id_dog_status').Value :=DataSetContrakts.FieldValues['id_dog_status'];
        ADOStoredProcWrite.Parameters.ParamByName('@id_type_dog').Value :=DataSetContrakts.FieldValues['id_type_dog'];
        ADOStoredProcWrite.Parameters.ParamByName('@summa').Value :=DataSetContrakts.FieldValues['summa'];
        ADOStoredProcWrite.Parameters.ParamByName('@id_group').Value :=DataSetContrakts.FieldValues['id_group'];
        ADOStoredProcWrite.Parameters.ParamByName('@date_beg').Value :=DataSetContrakts.FieldValues['date_beg'];
        ADOStoredProcWrite.Parameters.ParamByName('@date_end').Value :=DataSetContrakts.FieldValues['date_end'];
        ADOStoredProcWrite.Parameters.ParamByName('@vidpr').Value :=DataSetContrakts.FieldValues['vidpr'];
        ADOStoredProcWrite.ExecProc;
        ADOStoredProcWrite.Close;

//        ADOWriteConnection.CommitTrans;
      except on e: Exception do
        begin
          MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                   nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                   e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
          if (ADOWriteConnection.InTransaction) then ADOWriteConnection.RollbackTrans;
        end;
     end;

      CloseWaitForm(wf);
      id_dog_obnov:=DataSetContrakts.FieldValues['id_dog'];
      Obnovit(ADOStoredProc.FieldValues[ID_NAME]);
      ObnovitCn(id_dog_obnov);
   end;
end;

procedure TFormAbitCn.ActionDelCNExecute(Sender: TObject);
var
 id_dog_obnov, id_dt_nst_dog,ID_DOG_CN :int64;
 error : integer;
begin

    error := fibCheckPermission('/ROOT/Contracts/Cn_abit/Cn_abit_work','Del');
    if error <> 0 then
    begin
        showmessage(nMsgDeny[IndexLanguage]);
        exit;
    end;

    if(DataSetContrakts.FieldValues['is_signed']=0) then
    begin
        showmessage(nMsgIsSigned[IndexLanguage]);
        exit;
    end;

  if DataSetContrakts.FieldValues['ID_DOG']<>Null then
   begin
     if uAbitCnMessageDlg(nMsgBoxTitle[IndexLanguage],nMsgDelContract[IndexLanguage],
                        mtInformation,mbOKCancel,IndexLanguage)=mrOK then
         begin
          try
//            ADOWriteConnection.BeginTrans;
            ADOStoredProcWrite.Close;
            ADOStoredProcWrite.ProcedureName := 'exch_dt_nst_dog_get_id';
            ADOStoredProcWrite.Parameters.Refresh;
            ADOStoredProcWrite.Parameters.ParamByName('@nst').Value :=ADOStoredProc.FieldValues[ID_NAME];
            ID_DOG_CN := DataSetContrakts.FieldValues['id_dog'];
            ADOStoredProcWrite.Parameters.ParamByName('@ID_DOG_CN').Value := inttostr(ID_DOG_CN);
            ADOStoredProcWrite.ExecProc;
            ADOStoredProcWrite.Open;
            id_dt_nst_dog := ADOStoredProcWrite.FieldValues['id_dt_nst_dog'];
//            ADOWriteConnection.CommitTrans;

            StoredProcContracts.Transaction.StartTransaction;

            StoredProcContracts.StoredProcName:='CN_DELETE_CONTRACT_BY_ID_DOG';
            StoredProcContracts.Prepare;
            StoredProcContracts.ParamByName('ID_DOG').AsInt64:=DataSetContrakts.FieldValues['ID_DOG'];
            StoredProcContracts.ExecProc;

            StoredProcContracts.StoredProcName:='EXCH_DT_NST_DOG_DEL';
            StoredProcContracts.Prepare;
            StoredProcContracts.ParamByName('id_dt_nst_dog').AsInt64  :=DataSetContrakts.FieldValues['id_dt_nst_dog'];
            StoredProcContracts.ExecProc;

            cxGridPrKContractsDBTableView1.NavigatorButtons.Prior.Click;
            id_dog_obnov:=DataSetContrakts.FieldValues['id_dog'];

//            ADOWriteConnection.BeginTrans;
            ADOStoredProcWrite.Close;
            ADOStoredProcWrite.ProcedureName := 'exch_dt_nst_dog_del';
            ADOStoredProcWrite.Parameters.Refresh;
//            ADOWriteConnection.CommitTrans;
            StoredProcContracts.Transaction.Commit;

//            ADOWriteConnection.BeginTrans;
            ADOStoredProcWrite.Parameters.ParamByName('@id_dt_nst_dog').Value := id_dt_nst_dog;
            ADOStoredProcWrite.ExecProc;
            ADOStoredProcWrite.Close;
//            ADOWriteConnection.CommitTrans;

           except on e: Exception do
            begin
              MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                   nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                   e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
              if (ADOWriteConnection.InTransaction) then ADOWriteConnection.RollbackTrans;
              if (StoredProcContracts.Transaction.Active) then StoredProcContracts.Transaction.Rollback;
            end
           end;
         end;

        Obnovit(ADOStoredProc.FieldValues[ID_NAME]);
        ObnovitCn(id_dog_obnov);
   end;
end;

procedure TFormAbitCn.ActionPrintCnExecute(Sender: TObject);
var
   AParam: TcnSimpleParamsEx;
   priznak_signed : smallint;
   error : integer;
begin
    error := fibCheckPermission('/ROOT/Contracts/Cn_abit/Cn_abit_work','Print');
    if error <> 0 then
    begin
        showmessage(nMsgDeny[IndexLanguage]);
        exit;
    end;

  if DataSetContrakts.FieldValues['is_signed']= null then priznak_signed:=1
  else
  priznak_signed := DataSetContrakts.FieldValues['is_signed'];
  if DataSetContrakts.FieldValues['ID_DOG']=Null
   then exit;
  AParam := TcnSimpleParamsEx.Create;
  AParam.Owner                   := self;
  AParam.Db_Handle               := Database.Handle;
  AParam.cnParamsToPakage.ID_DOG :=DataSetContrakts.FieldValues['ID_DOG'];
  AParam.WaitPakageOwner         :=self;
  
  AParam.cnParamsToPakage.Is_collect :=priznak_signed;
  RunFunctionFromPackage(AParam, 'Contracts\cn_PrintDogovor.bpl','PrintDogovor');
  AParam.Free;
end;

procedure TFormAbitCn.ActionChangeCN_StatusExecute(Sender: TObject);
var
 id_dog_obnov,ID_DOG_CN :int64;
begin

    if(DataSetContrakts.FieldValues['is_signed']=0) then
    begin
        showmessage(nMsgIsSigned[IndexLanguage]);
        exit;
    end;

  if DataSetContrakts.FieldValues['ID_DOG']<>Null then
   begin
     if uAbitCnMessageDlg(nMsgBoxTitle[IndexLanguage],nMsgChangeCN_Status[IndexLanguage],
                        mtInformation,mbOKCancel,IndexLanguage)=mrOK then
         begin
          try
            id_dog_obnov:=DataSetContrakts.FieldValues['ID_DOG'];

            StoredProcContracts.Transaction.StartTransaction;
            StoredProcContracts.StoredProcName:='EXCH_NST_DOG_SET_CANDIDATE';
            StoredProcContracts.Prepare;
            StoredProcContracts.ParamByName('nst').AsInt64  :=ADOStoredProc.FieldValues[ID_NAME];
            StoredProcContracts.ParamByName('ID_DOG').AsInt64      :=DataSetContrakts.FieldValues['ID_DOG'];
            StoredProcContracts.ExecProc;

//            ADOWriteConnection.BeginTrans;

            ADOStoredProcWrite.Close;
            ADOStoredProcWrite.ProcedureName := 'exch_dt_nst_dog_SET_CANDIDATE';
            ADOStoredProcWrite.Parameters.Refresh;

            ADOStoredProcWrite.Parameters.ParamByName('@CN_ABITUR_STATUS_CANDIDATE').Value := CN_ABITUR_STATUS_CANDIDATE;
            ADOStoredProcWrite.Parameters.ParamByName('@CN_ABITUR_STATUS_PROJECT').Value := CN_ABITUR_STATUS_PROJECT;
            ADOStoredProcWrite.Parameters.ParamByName('@nst').Value := ADOStoredProc.FieldValues[ID_NAME];
            ID_DOG_CN := DataSetContrakts.FieldValues['ID_DOG'];
            ADOStoredProcWrite.Parameters.ParamByName('@ID_DOG_CN').Value := inttostr(ID_DOG_CN);
            ADOStoredProcWrite.ExecProc;
            ADOStoredProcWrite.Close;

//            ADOWriteConnection.CommitTrans;
            StoredProcContracts.Transaction.Commit;
           except on e: Exception do
            begin
              MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                   nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                   e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
              if (ADOWriteConnection.InTransaction) then ADOWriteConnection.RollbackTrans;
              if (StoredProcContracts.Transaction.Active) then StoredProcContracts.Transaction.Rollback;
            end;  
           end;
         end;
       end;
       ObnovitCn(id_dog_obnov);
end;

procedure TFormAbitCn.RxMemoryDataPrKViewWithFilterAfterScroll(
  DataSet: TDataSet);
begin
     if CanAfterScroll=true then
     begin
      DataSetContrakts.Active                           :=false;
      if ADOStoredProc.fieldValues['NST']<>Null then
        DataSetContrakts.ParamByName('NST').AsInt64:={RxMemoryDataPrKViewWithFilter}ADOStoredProc.fieldValues['NST']
      else
        DataSetContrakts.ParamByName('NST').AsInt64:=-1;
      DataSetContrakts.CloseOpen(false);
     // Проверяем, можно ли работать с договорами
     end;

end;

procedure TFormAbitCn.cxGridPrKViewWithFilterDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 if (AViewInfo.GridRecord.Values[6]>0)then
  begin
   ACanvas.Brush.Color := clSilver;
  end;

end;

procedure TFormAbitCn.DataSetContraktsAfterOpen(DataSet: TDataSet);
begin
  if ADOStoredProc.RecordCount < 1 then Exit;
     if ADOStoredProc['IS_DOG_LOCKED']=0 then
       begin
         ActionAddCN.Enabled          :=True;
         ActionChangeCN.Enabled       :=True;
         ActionChangeCN_Status.Enabled:=True;
         ActionDelCN.Enabled          :=True;
       end
     else
       begin
         ActionAddCN.Enabled          :=False;
         ActionChangeCN.Enabled       :=False;
         ActionChangeCN_Status.Enabled:=False;
         ActionDelCN.Enabled          :=False;
       end;

end;

procedure TFormAbitCn.ADOStoredProcAfterScroll(DataSet: TDataSet);
begin
    SetcxDateEditBegEnd;
    
     if CanAfterScroll=true then
     begin
      DataSetContrakts.Active                           :=false;
      if ADOStoredProc.fieldValues['NST']<>Null then
        DataSetContrakts.ParamByName('NST').AsInt64:={RxMemoryDataPrKViewWithFilter}ADOStoredProc.fieldValues['NST']
      else
        DataSetContrakts.ParamByName('NST').AsInt64:=-1;
      DataSetContrakts.CloseOpen(false);
     // Проверяем, можно ли работать с договорами
     end;

end;



procedure TFormAbitCn.cxTextEditTINKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then ActionObnovExecute(self);
end;

procedure TFormAbitCn.cxTextFIOKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then ActionObnovExecute(self);
end;

procedure TFormAbitCn.ActionLinkExecute(Sender: TObject);
begin
  if (ADOStoredProc.fieldValues['NST'] <> null) then
    Synchr(self, ADOWriteConnection, DBHANDLE,
      ADOStoredProc.fieldValues['NAMESP'],
      ADOStoredProc.fieldValues['FULL_NAME_FAK'],
      ADOStoredProc.fieldValues['NSPEC'],
      ADOStoredProc.fieldValues['NFOR'],
      ADOStoredProc.fieldValues['FIO'],
      ADOStoredProc.fieldValues['NST']);

  ActionObnovExecute(self);
end;

procedure TFormAbitCn.ActionPrikzObnov3Execute(Sender: TObject);
begin
  PrikzObnov('exch_prikz_set_info_3pk','exch_abit_prikz_3pk_sel');
end;

procedure TFormAbitCn.ActionPrikzObnov12Execute(Sender: TObject);
begin
  PrikzObnov('exch_prikz_info_12pk','exch_abit_prikz_12pk_sel');
end;

procedure TFormAbitCn.PrikzObnov(prikz_info_ProcedureName,prikz_abit_sel_ProcedureName: string);
var i: integer;
     wf:TForm;
begin
  wf:=ShowWaitForm(Self);

  try
    StoredProcContracts.Transaction.StartTransaction;
    StoredProcContracts.StoredProcName:='EXCH_DT_PRIK_ZACH_ABIT_INS_BUFF';
    StoredProcContracts.Prepare;

    ADOStoredProcWrite.Close;
    ADOStoredProcWrite.ProcedureName := prikz_info_ProcedureName;
    ADOStoredProcWrite.Parameters.Refresh;
    ADOStoredProcWrite.ExecProc;
    ADOStoredProcWrite.Open;
    ADOStoredProcWrite.First;

    for i:= 0 to ADOStoredProcWrite.RecordCount-1 do
    begin
      StoredProcContracts.ParamByName('id_prikz').AsInt64  :=ADOStoredProcWrite.FieldValues['id_prikz'];
      StoredProcContracts.ExecProc;
      ADOStoredProcWrite.Next;
    end;

    ADOStoredProcWrite.First;

    StoredProcContracts.StoredProcName:='EXCH_DT_PRIK_ZACH_ABIT_SYNCHR';
    StoredProcContracts.Prepare;
    StoredProcContracts.ParamByName('uchgod').AsString := ADOStoredProcWrite.FieldValues['uchgod'];
    StoredProcContracts.ExecProc;

    StoredProcContracts.StoredProcName:='EXCH_DT_PRIK_ZACH_ABIT_IU';
    StoredProcContracts.Prepare;

    for i:= 0 to ADOStoredProcWrite.RecordCount-1 do
    begin
      StoredProcContracts.ParamByName('id_prikz').AsInt64  :=ADOStoredProcWrite.FieldValues['id_prikz'];
      StoredProcContracts.ParamByName('nprikz').AsString  :=ADOStoredProcWrite.FieldValues['nprikz'];
      StoredProcContracts.ParamByName('dprikz').AsDate  :=ADOStoredProcWrite.FieldValues['dprikz'];
      StoredProcContracts.ParamByName('uchgod').AsString  :=ADOStoredProcWrite.FieldValues['uchgod'];
      StoredProcContracts.ExecProc;
      ADOStoredProcWrite.Next;
    end;

    ADOStoredProcWrite.Close;
    ADOStoredProcWrite.ProcedureName := prikz_abit_sel_ProcedureName;
    ADOStoredProcWrite.Parameters.Refresh;
    ADOStoredProcWrite.ExecProc;
    ADOStoredProcWrite.Open;
    ADOStoredProcWrite.First;

    StoredProcContracts.StoredProcName:='EXCH_DT_NST_DOG_SET_PRIK_Z';
    StoredProcContracts.Prepare;

    for i:= 0 to ADOStoredProcWrite.RecordCount-1 do
    begin
      StoredProcContracts.ParamByName('id_prikz').AsInt64  :=ADOStoredProcWrite.FieldValues['id_prikz'];
      StoredProcContracts.ParamByName('id_dog').AsInt64  := ADOStoredProcWrite.FieldValues['ID_DOG_CN'];
      StoredProcContracts.ExecProc;
      ADOStoredProcWrite.Next;
    end;

  except on e: Exception do
    begin
      MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                   nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                   e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
      if (StoredProcContracts.Transaction.Active) then StoredProcContracts.Transaction.Rollback;
    end;
  end;

  ADOStoredProcWrite.Close;
  if (StoredProcContracts.Transaction.Active) then StoredProcContracts.Transaction.Commit;

  CloseWaitForm(wf);
  ShowMessage('              Все.                 ');
end;


procedure TFormAbitCn.ActionPodpisExecute(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Contracts/Cn_abit/Cn_abit_work','SIGN');
    if error <> 0 then
    begin
        showmessage(nMsgSignDeny[IndexLanguage]);
        exit;
    end;
    //if (DataSetContrakts.FieldValues['is_signed']<>null) then
    if(DataSetContrakts.FieldValues['id_dt_nst_dog']=null) then
    begin
        showmessage(nMsgUnadded[IndexLanguage]);
        exit;
    end;
  
    if(DataSetContrakts.FieldValues['is_signed']=0) then
    begin
        showmessage(nMsgIsSigned[IndexLanguage]);
        exit;
    end;

     try
        //StoredProcContracts.Database := Database;
        //StoredProcContracts.Transaction := TransactionWr;
        StoredProcContracts.Transaction.StartTransaction;
        StoredProcContracts.StoredProcName := 'EXCH_UPD_ID_USER_PODPIS';
        StoredProcContracts.Prepare;
        //showmessage(DataSetContrakts.FieldValues['id_dt_nst_dog']);
        StoredProcContracts.ParamByName('id_dt_nst_dog').AsInt64      := DataSetContrakts.FieldValues['id_dt_nst_dog'];
        StoredProcContracts.ParamByName('d_id_user_podpis').AsInt64   := id_user_global;
        StoredProcContracts.ParamByName('is_signed').AsInt64          := 0;
        StoredProcContracts.ExecProc;
        WriteTransaction.Commit;
      except on E:Exception do
      begin
          showmessage(E.Message);
          WriteTransaction.Rollback;
          exit;
      end;
     end;
     DataSetContrakts.CloseOpen(false);
     DataSetContrakts.Locate('id_dt_nst_dog', DataSetContrakts.FieldValues['id_dt_nst_dog'], []);
     showmessage(nMsgIsActSigned[IndexLanguage]);
end;

procedure TFormAbitCn.ActionRasPodpisExecute(Sender: TObject);
var
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Contracts/Cn_abit/Cn_abit_work','UNSIGN');
    if error <> 0 then
    begin
        showmessage(nMsgUnSignDeny[IndexLanguage]);
        exit;
    end;

    if(DataSetContrakts.FieldValues['id_dt_nst_dog']=null) then
    begin
        showmessage(nMsgUnadded[IndexLanguage]);
        exit;
    end;

    if(DataSetContrakts.FieldValues['is_signed']=1) then
    begin
        showmessage(nMsgIsNotSigned[IndexLanguage]);
        exit;
    end;
    try
        //StoredProcContracts.Database := Database;
        //StoredProcContracts.Transaction := TransactionWr;
        StoredProcContracts.Transaction.StartTransaction;
        StoredProcContracts.StoredProcName := 'EXCH_UPD_ID_USER_PODPIS';
        StoredProcContracts.Prepare;
        //showmessage(DataSetContrakts.FieldValues['id_dt_nst_dog']);
        StoredProcContracts.ParamByName('id_dt_nst_dog').AsInt64      := DataSetContrakts.FieldValues['id_dt_nst_dog'];
        StoredProcContracts.ParamByName('d_id_user_podpis').AsInt64   := id_user_global;
        StoredProcContracts.ParamByName('is_signed').AsInt64          := 1;
        StoredProcContracts.ExecProc;
        WriteTransaction.Commit;
      except on E:Exception do
      begin
          showmessage(E.Message);
          WriteTransaction.Rollback;
          exit;
      end;
     end;
     DataSetContrakts.CloseOpen(false);
     DataSetContrakts.Locate('id_dt_nst_dog', DataSetContrakts.FieldValues['id_dt_nst_dog'], []);
     showmessage(nMsgIsActNotSigned[IndexLanguage]);
end;

procedure TFormAbitCn.ActionPriceCurrentExecute(Sender: TObject);
var
    AParameter : TcnSimpleParams;
begin
   if fibCheckPermission('/ROOT/Contracts/Cn_Price','Belong') <> 0 then
   begin
        messagebox(handle,
        pchar(uConstants.nMsgNotHaveRights[IndexLanguage]
        +#13+ uConstants.nMsgGoToAdmin[IndexLanguage]),
        pchar(uConstants.nMsgActionDenied[IndexLanguage]), MB_ICONWARNING or mb_Ok);
        exit;
   end;

  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Database.Handle;
  AParameter.Formstyle:=fsnormal;
  AParameter.WaitPakageOwner:=self;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_prices_ex.bpl','ShowPrices');
  AParameter.Free;
end;


procedure TFormAbitCn.ActionCryptExecute(Sender: TObject);
var
    T : TfmCryptDo;
begin
    T := TfmCryptDo.Create(Self);
    T.ShowModal;
    T.Free;

end;

procedure TFormAbitCn.ActionShowButtonExecute(Sender: TObject);
begin
    if (ActionCrypt.Enabled = false) and(ActionCrypt.Visible = false) then
    begin
        ActionCrypt.Enabled    := True;
        ActionCrypt.Visible    := True;
    end
    else
    if (ActionCrypt.Enabled = True) and(ActionCrypt.Visible = True) then
    begin
        ActionCrypt.Enabled    := false;
        ActionCrypt.Visible    := false;
    end

end;

end.
