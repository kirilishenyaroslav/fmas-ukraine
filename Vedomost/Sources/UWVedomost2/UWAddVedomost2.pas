unit UWAddVedomost2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxButtonEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxTextEdit, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ComCtrls, ToolWin, ActnList,
  ImgList, dxStatusBar, RxMemDS, cxCurrencyEdit, UWMainVedomost2, ExtCtrls,
  cxMemo, Placemnt, cxDBEdit, cxPC, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxSplitter, cxCheckBox;

type
  TfmUWAddVedomost2 = class(TForm)
    cxTextEdit1: TcxTextEdit;
    cxDateEdit1: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    Database: TpFIBDatabase;
    DSAddVedom: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    SProc: TpFIBStoredProc;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    StyleRepository: TcxStyleRepository;
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
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    ImageList1: TImageList;
    ActionList1: TActionList;
    AExit: TAction;
    AAddVedomost: TAction;
    SelectLang: TAction;
    dxStatusBar1: TdxStatusBar;
    rxMDProv: TRxMemoryData;
    DataSource1: TDataSource;
    TrW: TpFIBTransaction;
    DS: TpFIBDataSet;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Action1: TAction;
    Action3: TAction;
    cxMemo1: TcxMemo;
    cxLabel3: TcxLabel;
    FormStorage1: TFormStorage;
    DSetNastroika: TpFIBDataSet;
    DSetTypeVedomost: TpFIBDataSet;
    DSourceTypeVedom: TDataSource;
    PageControlVedomost: TcxPageControl;
    TabSheetRuchnoiRegim: TcxTabSheet;
    TabSheetFromAvanceOtchet: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn9: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid2DBTableView1DB_NUM_DOC: TcxGridDBColumn;
    cxGrid2DBTableView1DB_DATE_AO: TcxGridDBColumn;
    cxGrid2DBTableView1DB_FIO: TcxGridDBColumn;
    cxGrid2DBTableView1DB_SUM_AO: TcxGridDBColumn;
    cxGrid3DBTableView1DB_DEBET: TcxGridDBColumn;
    cxGrid3DBTableView1DB_KREDIT: TcxGridDBColumn;
    cxGrid3DBTableView1DB_ALL_KOD: TcxGridDBColumn;
    cxGrid3DBTableView1DB_KEKV_KOD: TcxGridDBColumn;
    cxGrid3DBTableView1DB_SUMMA: TcxGridDBColumn;
    cxGrid2DBTableView1DB_NUM_DOG: TcxGridDBColumn;
    cxGrid2DBTableView1DB_DATE_DOG: TcxGridDBColumn;
    DSetAvOtch: TpFIBDataSet;
    DSetBudget: TpFIBDataSet;
    DSourceAvOtch: TDataSource;
    DSourceBudget: TDataSource;
    cxLabel4: TcxLabel;
    LabelTypeVed: TLabel;
    DSet: TpFIBDataSet;
    cxSplitter2: TcxSplitter;
    procedure AExitExecute(Sender: TObject);
    procedure cxGrid1DBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure LoadCaption;
    procedure SelectLangExecute(Sender: TObject);
    procedure AAddVedomostExecute(Sender: TObject);
    function AddVedomost : int64;
    procedure AddProv(id_ved : int64);
    procedure DelProv(id_vedom : int64);
    procedure ChangeVedomost(id_vedom : int64);
    procedure Action1Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    regim, index_lang : smallint;
    sss : double;
  public
    myform : TfmUWMainVedomost2;
    id_user, id_sp_type, id_bank : int64;
    flag_no_show : boolean;
    key_session : Int64;
    id_type_vedom : Integer;
    id_type_viplat : Int64;

    constructor Create(AOwner: TComponent; mform : TfmUWMainVedomost2; reg : smallint); reintroduce; overload;
  end;


implementation
uses UWAddVedomostProv2,
     UWResourcesUnit,
     Registry,
     UWLoaderUnit,
     UWAddVedomostFromAvOtch,
     UWAddOtch;

{$R *.dfm}

{ TfmUWAddVedomost }

constructor TfmUWAddVedomost2.Create(AOwner: TComponent; mform : TfmUWMainVedomost2; reg : smallint);
var
    n : integer;
begin
    inherited Create(AOwner);
    id_user                     := mform.id_user_;
    regim                       := reg;
    myform                      := mform;
    Database                    := myform.DB;
    Transaction.DefaultDatabase := Database;
    TrW.DefaultDatabase         := Database;
    Database.DefaultTransaction := Transaction;
    SProc.Transaction           := TrW;

    DS.Database                  := Database;
    DS.Transaction               := Transaction;
    DSetNastroika.Database       := Database;
    DSetTypeVedomost.Database    := Database;
    DSetTypeVedomost.Transaction := Transaction;

    DSetAvOtch.Database    := Database;
    DSetAvOtch.Transaction := Transaction;
    DSetBudget.Database    := Database;
    DSetBudget.Transaction := Transaction;
    id_type_vedom := mform.id_type_vedom_for_edit;


    //настройка комментария

    Transaction.StartTransaction;
    if reg = 1 then
    begin
      DSetNastroika.Close;
      DSetNastroika.SelectSQL.Text := 'select * from J4_INI';
      DSetNastroika.Open;
      if (DSetNastroika['J4_IS_DEFAULT_COMMENT_VEDOMOST'] = 1)then
      begin
        cxMemo1.Text := DSetNastroika['J4_DEFAULT_COMMENT_VEDOMOST'];
      end
      else
      begin
        FormStorage1.RestoreFormPlacement;
      end;
      cxDateEdit1.Date := date;
//        cxButtonEdit1.Text := s_type_n;

        DS.Close;
        DS.SQLs.SelectSQL.Text := 'select max(u.NOMBER_VEDOMOST2) as NOMBER_VEDOMOST2 from uw_dt_vedomost2 u where  u.date_vedomost2=(select max(ud.date_vedomost2) from uw_dt_vedomost2 ud )';
        DS.Open;
        DS.FetchAll;
        try n := DS.FBN('NOMBER_VEDOMOST2').AsInteger; except n:= 0 end;
        cxTextEdit1.Text := IntToStr(n+1);
        DS.Close;
    end;
    if (reg = 2) or (reg = 3) then
    begin
      cxTextEdit1.Text := myform.DataSetVedomost.FBN('NOMBER_VEDOMOST2').AsString;
      cxDateEdit1.Date := myform.DataSetVedomost.FBN('DATE_VEDOMOST2').AsDateTime;
      cxMemo1.text     := myform.DataSetVedomost.FBN('COMMENT2').AsString;
      //изменение ручного ввода
      if (id_type_vedom = 1) then
      begin
        LabelTypeVed.Caption := 'Введення даних з клавіатури';
        DS.Close;
        DS.SQLs.SelectSQL.Text := 'select * from UW_DT_PROV_VEDOMOST2_SEL('''+mform.DataSetVedomost.fbn('ID_VEDOMOST2').AsString+''')';
        DS.Open;
        DS.FetchAll;
        DS.First;
        while not DS.Eof do
        begin
            rxMDProv.Open;
//            rxMDProv.Edit;
            rxMDProv.Insert;
            rxMDProv.FieldByName('id_prov').value       := strToInt64(DS.fbn('ID_DT_PROV_VEDOMOST2').AsString);
            rxMDProv.FieldByName('id').value            := DS.RecNo;
            rxMDProv.FieldByName('id_man').value        := strToInt64(DS.fbn('ID_MAN').AsString);
            rxMDProv.FieldByName('id_sch').value        := strToInt64(DS.fbn('ID_TYPE_VIPLAT').AsString);
            rxMDProv.FieldByName('id_smeta').value      := strToInt64(DS.fbn('ID_SMETA').AsString);
            rxMDProv.FieldByName('id_razd').value       := strToInt64(DS.fbn('ID_RAZD').AsString);
            rxMDProv.FieldByName('id_state').value      := strToInt64(DS.fbn('ID_STATE').AsString);
            rxMDProv.FieldByName('id_kekv').value       := strToInt64(DS.fbn('ID_KEKZ').AsString);
            rxMDProv.FieldByName('summa').value         := DS.FBN('SUMMA').AsCurrency;
//            rxMDProv.FieldByName('id_dog').value        := strToInt64(DS.fbn('ID_DOG').AsString);
//            rxMDProv.FieldByName('kod_dog').value       := strToInt64(DS.fbn('KOD_DOG').AsString);
            rxMDProv.FieldByName('kod_smeta').value     := DS.fbn('SMETA_KOD').AsString;
            rxMDProv.FieldByName('kod_razd').value      := DS.fbn('RAZD_NUM').AsString;
            rxMDProv.FieldByName('kod_state').value     := DS.fbn('STATE_KOD').AsString;
            rxMDProv.FieldByName('kod_kekv').value      := DS.fbn('KEKV_KOD').AsString;
            rxMDProv.FieldByName('kod_sch').value       := DS.fbn('NAME_VIPLAT').AsString;
//            rxMDProv.FieldByName('tytle_sch').value     := DS.fbn('SCH_TYTLE').AsString;
            rxMDProv.FieldByName('tytle_smeta').value   := DS.fbn('SMETA_TYTLE').AsString;
            rxMDProv.FieldByName('tytle_razd').value    := DS.fbn('RAZD_TYTLE').AsString;
            rxMDProv.FieldByName('tytle_state').value   := DS.fbn('STATE_TYTLE').AsString;
            rxMDProv.FieldByName('tytle_kekv').value    := DS.fbn('KEKV_TYTLE').AsString;
            rxMDProv.FieldByName('fio').value           := DS.fbn('FIO').AsString;
            rxMDProv.FieldByName('id_bankcard').value   := strToInt64(DS.fbn('ID_BANK_DOGOVOR').AsString);
            rxMDProv.FieldByName('id_bank_dog').Value   := strToInt64(DS.fbn('ID_REAL_BANK_DOGOVOR').AsString);
            rxMDProv.FieldByName('name_bankcard').value := ' ';//DS.fbn('LIC_BANKCARD').AsString;
            rxMDProv.FieldByName('NumOrder').value      := DS.fbn('NUM_ORDER').AsString;
            rxMDProv.FieldByName('DateOrder').value     := DS.fbn('DATE_ORDER').AsDateTime;
            rxMDProv.Post;
            DS.Next;
        end;
        DS.Close;

        PageControlVedomost.ActivePage := TabSheetRuchnoiRegim;
      end;

      //изменение через авансовые отчеты
      if (id_type_vedom = 2) then
      begin
        PageControlVedomost.ActivePage := TabSheetFromAvanceOtchet;
        LabelTypeVed.Caption := 'Введення даних з використанням авансових звітів';
      end;  


    end;

    if reg = 3 then
    begin
        cxDateEdit1.Enabled   := false;
//        cxButtonEdit1.Enabled := false;
        cxTextEdit1.Enabled   := false;
        AAddVedomost.Visible  := false;  
    end;

    LoadCaption;
end;

procedure TfmUWAddVedomost2.AExitExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmUWAddVedomost2.cxGrid1DBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = VK_INSERT then ToolButton1Click(Sender);
    if key = VK_F2     then ToolButton2Click(Sender);
    if key = VK_DELETE then ToolButton3Click(Sender);
end;

procedure TfmUWAddVedomost2.ToolButton1Click(Sender: TObject);
var
  viewform : TAddVedomostFromAvOtch;
begin
  if (id_type_vedom = 1)then
  begin
    if VedomProv(self, self, 1) then
    begin
      PageControlVedomost.ActivePage := TabSheetRuchnoiRegim;
      cxGrid1.SetFocus;
    end;
  end;

  //добавление ведомости через авансовый отчет
  if (id_type_vedom= 2)then
  begin
    viewform := TAddVedomostFromAvOtch.Create(Self);
    viewform.id_user := id_user;

    viewform.Database                   := myform.DB;
    viewform.TransRead.DefaultDatabase  := myform.DB;
    viewform.TransWrite.DefaultDatabase := myform.DB;
    viewform.DataSet.Database           := myform.DB;
    viewform.DSetAll.Database           := myform.DB;
    viewform.DSetVibr.Database          := myform.DB;
    viewform.pFIBStoredProc.Transaction := viewform.TransWrite;
    viewform.DataSet.Transaction        := viewform.TransRead;
    viewform.DSetAll.Transaction        := viewform.TransRead;
    viewform.DSetVibr.Transaction       := viewform.TransRead;
    viewform.DSourceAll.DataSet         := viewform.DSetAll;
    viewform.DSourceVibr.DataSet        := viewform.DSetVibr;
    viewform.cxGridAllOtchetDBTableView1.DataController.DataSource := viewform.DSourceAll;
    viewform.cxGridVibrOtchetDBTableView1.DataController.DataSource := viewform.DSourceVibr;

    //выбор id_system
    viewform.DataSet.Close;
    viewform.DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM J4_CHOOSE_SYS_BY_ID('+IntToStr(id_user)+')';
    viewform.DataSet.Open;
    viewform.id_system := viewform.DataSet['ID_J4_SP_JO'];

    //отбираем период фильтрации
    viewform.TransWrite.StartTransaction;
    viewform.pFIBStoredProc.StoredProcName := 'UW_PERIOD_FILTER_VEDOMOST';
    viewform.pFIBStoredProc.ParamByName('date_now').AsDate := Now;
    viewform.pFIBStoredProc.ExecProc;
    viewform.TransWrite.Commit;

    //заполнение вида формы
    viewform.cxDateBegEdit.Date := viewform.pFIBStoredProc.ParamByName('DATE_BEG').AsDate;
    viewform.cxDateEndEdit.Date := viewform.pFIBStoredProc.ParamByName('DATE_END').AsDate;
    viewform.RadioButtonFIO.Checked     := True;
    viewform.RadioButtonNumOtch.Checked := False;
    viewform.CheckBox_Is_Skrit.Checked  := False;
    viewform.cxTextEditFilter.Text      := '';
    viewform.KEY_SESSION                := key_session;
    viewform.BitBtnFilter.Click;
    viewform.id_type_viplat := id_type_viplat;
    viewform.ShowModal;

    if (viewform.ModalResult = mrok) then
    begin
      DSetAvOtch.Close;
      DSetBudget.Close;
      DSetAvOtch.SelectSQL.Text             := 'select * from UW_ADD_VEDOMOST_TMP_SEL(2) where KEY_SESSION = :key';
      DSetAvOtch.ParamByName('key').AsInt64 := viewform.KEY_SESSION;
      //DSetBudget.SQLs.SelectSQL.Text        := 'Select * from J4_SELECT_ALL_PROV(:ID_DT_DOC)';
      DSetBudget.SQLs.SelectSQL.Text        := 'Select * from UW_ADD_VEDOMOST_BUDGET_TMP_SEL where ID_DT_DOC = :ID_DT_DOC and key_session = :key';
      DSetBudget.ParamByName('key').AsInt64 := viewform.KEY_SESSION;
      DSetAvOtch.Open;
      DSetBudget.Open;
      PageControlVedomost.ActivePage := TabSheetFromAvanceOtchet;
    end;
  end;
end;

procedure TfmUWAddVedomost2.ToolButton2Click(Sender: TObject);
var
  ViewForm : TFormAddOtch;
  ID_AO : Int64;
  i : Integer;
begin
  // изменение ручной режим
  if (id_type_vedom = 1)then
  begin
    if not rxMDProv.IsEmpty then
    begin
        VedomProv(self, self, 2);
        cxGrid1.SetFocus;
    end;
  end;

  //изменение ведомости через авансовый отчет
  if (id_type_vedom= 2)then
  begin
    ViewForm                       := TFormAddOtch.Create(Self);
    viewform.Database              := Database;
    viewform.Trans.DefaultDatabase := Database;
    ViewForm.EditNumDog.Text       := DSetAvOtch['NUM_DOG'];

    if (DSetAvOtch['DATE_DOG'] = null) then
      ViewForm.cxDateDogEdit.Text := ''
    else
      ViewForm.cxDateDogEdit.date := DSetAvOtch['DATE_DOG'];

    ViewForm.LabelPIB.Caption := DSetAvOtch['FIO'];
    viewform.cxButtonEditTypeViplat.Text := DSetAvOtch['NAME_TYPE_VIPLAT'];
    viewform.id_type_viplat := Strtoint64(DSetAvOtch.fieldbyname('ID_TYPE_VIPLAT').AsString);
    //показ проводок
    viewform.DSetBudget.Database            := Database;
    viewform.DSetBudget.Transaction         := Transaction;
    viewform.DSetBudget.Close;
    viewform.DSetBudget.SQLs.SelectSQL.Text        := 'Select * from UW_ADD_VEDOMOST_BUDGET_TMP_SEL where ID_DT_DOC = :ID_DT_DOC and key_session = :key';
    viewform.DSetBudget.ParamByName('key').AsInt64 := KEY_SESSION;
    viewform.DSetBudget.ParamByName('ID_DT_DOC').AsInt64 := StrToInt64(DSetAvOtch.fieldbyname('ID_DT_DOC').AsString);
    viewform.DSetBudget.open;
    viewform.SelectAll;
    //--поиск по банковской карточке название банка и СКД
    DSet.Database := Database;
    DSet.Transaction := Transaction;

    DSet.Close;
    DSet.SelectSQL.Text := 'select * from UW_SELECT_INFO_CARD_MAN(:id_man,:id_bank_dogovor,:id_real_bank_dogovor)';
    DSet.ParamByName('id_bank_dogovor').AsInt64 := DSetAvOtch['id_bank_dogovor'];
    DSet.ParamByName('id_real_bank_dogovor').AsInt64 := DSetAvOtch['id_real_bank_dogovor'];
    DSet.ParamByName('id_man').AsInt64 := StrToInt64(DSetAvOtch.fieldbyname('ID_MAN').AsString);
    DSet.Open;
    viewform.LabelCard.Caption := DSet['SHORT_NAME_TYPE_PAYMENT']+' СКД '+ DSet['NUM_LIC_ACCAUNT'];


    ViewForm.ShowModal;
    if (ViewForm.ModalResult = mrok)then
    begin
      ID_AO := DSetAvOtch['ID_AO'];
      TrW.StartTransaction;
      SProc.StoredProcName                             := 'UW_ADD_VEDOMOST_TMP_UPD';
      SProc.ParamByName('KEY_SESSION').AsInt64         := DSetAvOtch['KEY_SESSION'];
      SProc.ParamByName('ID_AO').AsInt64               := DSetAvOtch['ID_AO'];
      SProc.ParamByName('ID_DT_DOC').AsInt64           := StrToInt64(DSetAvOtch.fbn('ID_DT_DOC').asstring);
      if (viewform.cxDateDogEdit.Text = '')then
        SProc.ParamByName('DATE_DOG').Value := null
      else
        SProc.ParamByName('DATE_DOG').Value              := viewform.cxDateDogEdit.Date;

      SProc.ParamByName('NUM_DOG').Value               := viewform.EditNumDog.Text;
      SProc.ParamByName('ID_TYPE_VIPLAT').AsInt64      := viewform.id_type_viplat;
      SProc.ExecProc;

      //********************изменение бюджетов*********************************/

      //удаление старых бюджетов
      SProc.StoredProcName                     := 'UW_DEL_OLD_BUDGET_FROM_VED_TMP';
      SProc.ParamByName('KEY_SESSION').AsInt64 := DSetAvOtch['KEY_SESSION'];
      SProc.ParamByName('ID_AO').AsInt64       := DSetAvOtch['ID_AO'];
      SProc.ExecProc;

      //вставка новых бюджетов
      for i :=0 to viewform.cxGridBudgetiTableView1.DataController.RecordCount - 1 do
      begin
        SProc.StoredProcName := 'UW_ADD_VEDOMOST_BUDGET_TMP_INS';
        SProc.ParamByName('ID_DT_DOC').AsInt64   := StrToInt64(DSetAvOtch.fieldbyname('id_dt_doc').AsString);
        SProc.ParamByName('key_session').AsInt64 := key_session;
        SProc.ParamByName('id_sm').AsInt64       := viewform.cxGridBudgetiTableView1_id_sm.DataBinding.DataController.Values[i, 4];
        SProc.ParamByName('id_razd').AsInt64     := viewform.cxGridBudgetiTableView1_id_razd.DataBinding.DataController.Values[i, 5];
        SProc.ParamByName('id_st').AsInt64       := viewform.cxGridBudgetiTableView1_id_st.DataBinding.DataController.Values[i, 6];
        SProc.ParamByName('id_kekv').AsInt64     := viewform.cxGridBudgetiTableView1_ID_KEKV.DataBinding.DataController.Values[i, 7];
        SProc.ParamByName('summa').value         := viewform.cxGridBudgetiTableView1_SUMMA.DataBinding.DataController.Values[i, 2];
        SProc.ParamByName('id_ao').AsInt64       := StrToInt64(DSetAvOtch.fieldbyname('id_ao').AsString);
        SProc.ParamByName('ID_ALL_PROV').AsInt64 := viewform.cxGridBudgetiTableView1_ID_ALL_PROV.DataBinding.DataController.Values[i, 3];
        SProc.ExecProc;
      end;
      //***********************************************************************/ 
      TrW.Commit;
      DSetAvOtch.Close;
      DSetBudget.Close;
      DSetAvOtch.Open;
      DSetAvOtch.Locate('ID_AO', IntToStr(ID_AO),[]);
      DSetBudget.Open;
    end;  
  end;

end;

procedure TfmUWAddVedomost2.ToolButton3Click(Sender: TObject);
var
    s : string;
    i, j : integer;
begin
  // удаление ручной режим
  if (id_type_vedom = 1)then
  begin
    if (not rxMDProv.IsEmpty) and (regim <> 3) then
    begin
        s := UWResourcesUnit.MY_CONST_MESSAGE_WARNING[index_lang];
        if MessageBox(Handle, Pchar(UWResourcesUnit.MY_CONST_DELETE_PROV[index_lang] + ' ' + rxMDProv.FieldByName('kod_sch').AsString+' - ' + rxMDProv.FieldByName('kod_smeta').AsString+'/'+ rxMDProv.FieldByName('kod_razd').AsString+'/'+ rxMDProv.FieldByName('kod_state').AsString+'/'+ rxMDProv.FieldByName('kod_kekv').AsString+' - '+ rxMDProv.FieldByName('summa').AsString), Pchar(s), MB_YESNO + MB_DEFBUTTON2) = mrYes then
        begin
                j := rxMDProv.FieldByName('id').AsInteger;
                cxGrid1DBTableView1.Controller.GoToPrev(false);
                i := rxMDProv.FieldByName('id').AsInteger;
                rxMDProv.Locate('id', j, [] );
                rxMDProv.Delete;
                rxMDProv.Locate('id', i, [] );
        end;
        cxGrid1.SetFocus;
    end;
  end;

  //удаление ведомости через авансовый отчет
  if (id_type_vedom= 2)then
  begin
    if (not DSetAvOtch.IsEmpty) then
    begin
      if MessageBox(Handle, 'Ви дійсно бажаєте видалити запис?', 'Увага', MB_YESNO + MB_DEFBUTTON2) = mrYes then
      begin
        TrW.StartTransaction;
        SProc.StoredProcName                             := 'UW_ADD_VEDOMOST_TMP_DEL';
        SProc.ParamByName('KEY_SESSION').AsInt64         := key_session;
        SProc.ParamByName('ID_DT_DOC').AsInt64           := StrtoInt64(DSetAvOtch.fbn('ID_DT_DOC').asstring);
        SProc.ExecProc;
        TrW.Commit;
        DSetAvOtch.Close;
        DSetBudget.Close;
        DSetAvOtch.Open;
        DSetBudget.Open;
      end;
    end;
  end;
end;

procedure TfmUWAddVedomost2.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
        if (Key < '0') or (Key > '9') then Key := Chr(0);
end;

procedure TfmUWAddVedomost2.LoadCaption;
var
    reg : TRegistry;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12303706759837\gnal\v\', False) then
        begin
            index_lang := StrToInt(reg.ReadString('index'));
        end else
            index_lang := 1;
    finally
        reg.Free;
    end;

    Caption                              := UWResourcesUnit.VEDOMOST_EDIT_CAPTION[index_lang];
    ToolButton1.Caption                  := UWResourcesUnit.MY_CONST_ADD[index_lang];
    ToolButton2.Caption                  := UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    ToolButton3.Caption                  := UWResourcesUnit.MY_CONST_DELETE[index_lang];
    cxLabel1.Caption                     := UWResourcesUnit.VEDOMOST_EDIT_NOMBER[index_lang];
    cxLabel2.Caption                     := UWResourcesUnit.VEDOMOST_EDIT_VID[index_lang];
//    cxLabel3.Caption                     := UWResourcesUnit.VEDOMOST_EDIT_PO_TYPE[index_lang];
    cxButton1.Caption                    := UWResourcesUnit.MY_CONST_BUTTON_CANCEL[index_lang];

    cxLabel3.Caption                     := UWResourcesUnit.MY_CONST_COMMENT[index_lang];

    AAddVedomost.Caption                 := UWResourcesUnit.MY_CONST_BUTTON_OK[index_lang];
    cxGrid1DBTableView1DBColumn1.Caption := UWResourcesUnit.MY_CONST_FIO[index_lang];
    cxGrid1DBTableView1DBColumn2.Caption := UWResourcesUnit.V2_TYPE_NAME[index_lang];
    cxGrid1DBTableView1DBColumn3.Caption := UWResourcesUnit.MY_CONST_SMETA[index_lang];
    cxGrid1DBTableView1DBColumn4.Caption := UWResourcesUnit.MY_CONST_RAZD[index_lang];
    cxGrid1DBTableView1DBColumn5.Caption := UWResourcesUnit.MY_CONST_STATE[index_lang];
    cxGrid1DBTableView1DBColumn6.Caption := UWResourcesUnit.MY_CONST_KEKV[index_lang];
    cxGrid1DBTableView1DBColumn7.Caption := UWResourcesUnit.MY_CONST_SUMMA[index_lang];

    dxStatusBar1.Panels[0].Text          := 'Ins- ' + UWResourcesUnit.MY_CONST_ADD[index_lang];
    dxStatusBar1.Panels[1].Text          := 'F2- '  + UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    dxStatusBar1.Panels[2].Text          := 'Del- ' + UWResourcesUnit.MY_CONST_DELETE[index_lang];
    dxStatusBar1.Panels[3].Text          := 'F10- ' + UWResourcesUnit.MY_CONST_BUTTON_OK[index_lang];
    dxStatusBar1.Panels[4].Text          := 'Esc- ' + UWResourcesUnit.MY_CONST_BUTTON_CANCEL[index_lang];

//    cxLabel4.Caption                     := UWResourcesUnit.SPBANKCARD_ADD_SELECT_DOG[index_lang];
    
end;

procedure TfmUWAddVedomost2.SelectLangExecute(Sender: TObject);
var
    reg : TRegistry;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12303706759837\gnal\v\',true) then
        begin
            if index_lang + 1 > UWResourcesUnit.IndexLang
                then reg.writeString('index', '1')
                else reg.writeString('index', IntToStr(index_lang + 1));
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;

    LoadCaption;
end;

procedure TfmUWAddVedomost2.AAddVedomostExecute(Sender: TObject);
var
    id_vedomost : int64;
begin

  // вставка через ручной режим
  if (id_type_vedom = 1) then
  begin
    id_vedomost            := -1;
    DSAddVedom.Database    := Database;
    DSAddVedom.Transaction := TrW;

    SProc.Database         := Database;
    SProc.Transaction      := TrW;

    TrW.StartTransaction;

    if not rxMDProv.isEmpty then
    begin
        rxMDProv.First;
        sss := 0;    
        while not rxMDProv.Eof do
        begin
            sss := sss + rxMDProv.FieldByName('summa').AsFloat;
            rxMDProv.Next;
        end;
    end else
    begin
        showmessage('');
        exit;
    end;

    try
        if regim = 1 then
        begin
            id_vedomost := AddVedomost;
            AddProv(id_vedomost);
        end;
        if regim = 2 then
        begin
            id_vedomost := StrToInt64(myform.DataSetVedomost.fbn('ID_VEDOMOST2').AsString);
            ChangeVedomost(id_vedomost);
            DelProv(id_vedomost);
            AddProv(id_vedomost);
        end;

        TrW.Commit;
    except on E:Exception do begin
        TrW.Rollback;
        ShowMessage(E.Message);
        exit;
    end;
    end;
    myform.ARefreshExecute(nil);
    myform.DataSetVedomost.Locate('ID_VEDOMOST2', id_vedomost, []);
    Close;
  end;

 //вставка через авансовые счета
  if (id_type_vedom = 2) then
  begin
    if regim = 1 then
    begin
      SProc.Database         := Database;
      SProc.Transaction      := TrW;

      TrW.StartTransaction;
      //-----добавление ведомости
      SProc.StoredProcName := 'UW_DT_PROV_VED2_FROM_OTCH_INS';
      SProc.ParamByName('KEY_SESSION').AsInt64    := key_session;
      SProc.ParamByName('NOMBER_VEDOMOST2').Value := cxTextEdit1.Text;
      SProc.ParamByName('DATE_VEDOMOST2').Value   := cxDateEdit1.Date;
      SProc.ParamByName('COMMENT2').Value         := cxMemo1.Text;
      SProc.ParamByName('reg').Value              := 1;
      SProc.ParamByName('ID_DT_VEDOMOST2').Value  := -1;
      SProc.ExecProc;
      TrW.Commit;
      Close;
    end;

    if regim = 2 then
    begin
      //удалим всё старое
      TrW.StartTransaction;
      id_vedomost := StrToInt64(myform.DataSetVedomost.fbn('ID_VEDOMOST2').AsString);
      ChangeVedomost(id_vedomost);
      DelProv(id_vedomost);

      //запишем новое
      SProc.Database         := Database;
      SProc.Transaction      := TrW;


      //-----добавление ведомости

      SProc.StoredProcName := 'UW_DT_PROV_VED2_FROM_OTCH_INS';
      SProc.ParamByName('KEY_SESSION').AsInt64    := key_session;
      SProc.ParamByName('NOMBER_VEDOMOST2').Value := cxTextEdit1.Text;
      SProc.ParamByName('DATE_VEDOMOST2').Value   := cxDateEdit1.Date;
      SProc.ParamByName('COMMENT2').Value         := cxMemo1.Text;
      SProc.ParamByName('REG').Value              := 2;
      SProc.ParamByName('ID_DT_VEDOMOST2').Value  := id_vedomost;
      SProc.ExecProc;
      TrW.Commit;
      Close;
    end;    

  end;
end;

function TfmUWAddVedomost2.AddVedomost : int64;
begin
    DSAddVedom.close;
    DSAddVedom.SQLs.SelectSQL.Text := 'select * from UW_DT_VEDOMOST2_INS('''+cxTextEdit1.Text+''', '''+DateToStr(cxDateEdit1.Date)+ ''', '''+cxMemo1.Text+''', ''' + StringReplace(FloattoStr(sss),',','.',[]) + ''',1)';
    DSAddVedom.Open;
    Result := StrToInt64(DSAddVedom.FBN('ID_VEDOMOST2').AsString);
    DSAddVedom.close;
end;

procedure TfmUWAddVedomost2.AddProv(id_ved: int64);
begin
    flag_no_show := false;
    rxMDProv.First;
    while not rxMDProv.eof do
    begin
        SProc.StoredProcName := 'UW_DT_PROV_VEDOMOST2_INS';
        SProc.Prepare;
        SProc.ParamByName('ID_DT_PROV_VEDOMOST2').AsInt64  := rxMDProv.FieldByName('id_prov').Value;
        SProc.ParamByName('ID_DT_VEDOMOST2').AsInt64       := id_ved;
        SProc.ParamByName('ID_MAN').AsInt64                := rxMDProv.FieldByName('id_man').Value;
        SProc.ParamByName('ID_TYPE_VIPLAT').AsInt64        := rxMDProv.FieldByName('id_sch').Value;
        SProc.ParamByName('ID_SMETA').AsInt64              := rxMDProv.FieldByName('id_smeta').Value;
        SProc.ParamByName('ID_RAZD').AsInt64               := rxMDProv.FieldByName('id_razd').Value;
        SProc.ParamByName('ID_STATE').AsInt64              := rxMDProv.FieldByName('id_state').Value;
        SProc.ParamByName('ID_KEKZ').AsInt64               := rxMDProv.FieldByName('id_kekv').Value;
        SProc.ParamByName('ID_DOG').AsInt64                := -1;
        SProc.ParamByName('SUMMA').AsCurrency              := rxMDProv.FieldByName('summa').Value;
        SProc.ParamByName('NUMBER_ORDER').AsString            := rxMDProv.FieldByName('NumOrder').Value;
        SProc.ParamByName('DATE_ORDER').AsDate             := rxMDProv.FieldByName('DateOrder').Value;
        SProc.ParamByName('ID_BANK_DOGOVOR').AsInt64       := rxMDProv.FieldByName('id_bankcard').Value;
        SProc.ParamByName('ID_REAL_BANK_DOGOVOR').AsInt64  := rxMDProv.FieldByName('id_bank_dog').Value;
//        SProc.ParamByName('ID_USER').AsInt64               := id_user;
        SProc.ExecProc;
        rxMDProv.Next;
    end;
    flag_no_show := true;
end;

procedure TfmUWAddVedomost2.DelProv(id_vedom: int64);
begin
        SProc.StoredProcName := 'UW_DT_PROV_VEDOMOST2_DEL';
        SProc.Prepare;
        SProc.ParamByName('ID_DT_VEDOMOST2').AsInt64  := id_vedom;
//        SProc.ParamByName('D_ID_USER').AsInt64       := id_user;
        SProc.ExecProc;
end;

procedure TfmUWAddVedomost2.ChangeVedomost(id_vedom: int64);
begin

        SProc.StoredProcName := 'UW_DT_VEDOMOST2_UPD';
        SProc.Prepare;
        SProc.ParamByName('ID_VEDOMOST2').AsInt64       := id_vedom;
        SProc.ParamByName('NOMBER_VEDOMOST2').AsString  := cxTextEdit1.Text;
        SProc.ParamByName('DATE_VEDOMOST2').AsDateTime  := cxDateEdit1.Date;
        SProc.ParamByName('COMMENT2').AsString          := cxMemo1.Text;
        SProc.ParamByName('SUMMA').AsCurrency           := sss;
        SProc.ExecProc;
end;

procedure TfmUWAddVedomost2.Action1Execute(Sender: TObject);
begin
    ToolButton1Click(Sender);
end;

procedure TfmUWAddVedomost2.Action3Execute(Sender: TObject);
begin
    ToolButton2Click(Sender);
end;

procedure TfmUWAddVedomost2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FormStorage1.SaveFormPlacement;
end;

end.
