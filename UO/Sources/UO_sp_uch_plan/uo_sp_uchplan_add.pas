unit uo_sp_uchplan_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uo_sp_uchplan_main, cxMaskEdit, cxButtonEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, StdCtrls,
  cxButtons, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, AArray, ibase, ib_externals,
  cxLabel, ActnList, ImgList, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxDBData, ExtCtrls, ComCtrls, ToolWin, cxSplitter,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, FIBQuery, pFIBQuery,
  pFIBStoredProc, cxCalc, dxStatusBar, Buttons;

type
  Tfmuo_sp_uchplan_add = class(TForm)
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    DataSet: TpFIBDataSet;
    DB: TpFIBDatabase;
    TWr: TpFIBTransaction;
    ActionList1: TActionList;
    Action1: TAction;
    ImageList1: TImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    cxLabel1: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxButtonEdit1: TcxButtonEdit;
    cxLabel3: TcxLabel;
    cxButtonEdit2: TcxButtonEdit;
    cxLabel4: TcxLabel;
    cxButtonEdit3: TcxButtonEdit;
    cxLabel5: TcxLabel;
    cxButtonEdit4: TcxButtonEdit;
    cxLabel7: TcxLabel;
    cxButtonEdit6: TcxButtonEdit;
    Panel1: TPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    AAddL: TAction;
    AAddR: TAction;
    ADelL: TAction;
    ADelR: TAction;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn4: TcxGridDBColumn;
    DSLeft: TpFIBDataSet;
    DSSem: TpFIBDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Tr: TpFIBTransaction;
    Stored: TpFIBStoredProc;
    ToolButton6: TToolButton;
    AAddSem: TAction;
    ADelHours: TAction;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel3: TPanel;
    cxTextEdit2: TcxTextEdit;
    cxLabel8: TcxLabel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    DSSemID_SP_UCH_PL_SEM: TFIBBCDField;
    DSSemTRIVALIST: TFIBSmallIntField;
    DSSemID_SP_UCH_PLAN: TFIBBCDField;
    DSSemID_SP_KURS: TFIBBCDField;
    DSSemID_SP_SEMESTR: TFIBBCDField;
    DSSemKOD_KURS: TFIBIntegerField;
    DSSemNAME_KURS: TFIBStringField;
    DSSemSHORT_NAME_KURS: TFIBStringField;
    DSSemSHORT_NAME_SEM: TFIBStringField;
    DSSemNAME_SEM: TFIBStringField;
    DSSemKOD_SEM: TFIBSmallIntField;
    DSSave: TpFIBDataSet;
    ToolButton9: TToolButton;
    ARefSem: TAction;
    ToolBar3: TToolBar;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    cxGrid3: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    DataSource3: TDataSource;
    DS: TpFIBDataSet;
    AAddH: TAction;
    AChangeH: TAction;
    ADelH: TAction;
    ARefH: TAction;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    DSH: TpFIBDataSet;
    AChangeSem: TAction;
    Inss: TAction;
    F2s: TAction;
    Dels: TAction;
    ToolButton5: TToolButton;
    dxStatusBarSP: TdxStatusBar;
    DSHID_SP_TYPE_DISC_LESSON: TFIBBCDField;
    DSHID_SP_SEMESTR: TFIBBCDField;
    DSHID_SP_PL_PERELIC: TFIBBCDField;
    DSHID_SPUCH_PL_HOURS: TFIBBCDField;
    DSHVAL_HOURS: TFIBSmallIntField;
    DSHKOD_TYPE: TFIBIntegerField;
    DSHNAME_TYPE: TFIBStringField;
    DSHSHORT_NAME_TYPE: TFIBStringField;
    DSHTRIVALIST: TFIBSmallIntField;
    DSHKOD_SEM: TFIBIntegerField;
    DSHNAME_SEM: TFIBStringField;
    DSHSHORT_NAME_SEM: TFIBStringField;
    DSHID_SP_KURS: TFIBBCDField;
    DSHKOD_KURS: TFIBIntegerField;
    DSHNAME_KURS: TFIBStringField;
    DSHSHORT_NAME_KURS: TFIBStringField;
    DSHSHORT_NAME_DISC: TFIBStringField;
    DSHNAME_DISC: TFIBStringField;
    DSHKOD_DISC: TFIBIntegerField;
    DSHSHORT_NAME_CIKL: TFIBStringField;
    DSHNAME_CIKL: TFIBStringField;
    DSHKOD_CIKL: TFIBIntegerField;
    DSHID_SP_DISC: TFIBBCDField;
    DSHID_SP_CIKL_PDG: TFIBBCDField;
    DSHID_SP_SEMESTR_PL: TFIBBCDField;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    AGroup: TAction;
    TabSheet5: TTabSheet;
    ToolBar4: TToolBar;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    cxGrid4: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    AAddC: TAction;
    AChangeC: TAction;
    ADelC: TAction;
    AGroupC: TAction;
    DSControl: TpFIBDataSet;
    DataSource4: TDataSource;
    ARefControl: TAction;
    cxGridDBTableView2DBColumn1: TcxGridDBColumn;
    cxGridDBTableView2DBColumn2: TcxGridDBColumn;
    cxGridDBTableView2DBColumn3: TcxGridDBColumn;
    cxGridDBTableView2DBColumn4: TcxGridDBColumn;
    DSLeftID_SP_CIKL_PDG: TFIBBCDField;
    DSLeftNAME_CIKL: TFIBStringField;
    DSLeftSHORT_NAME_CIKL: TFIBStringField;
    DSLeftKOD_CIKL: TFIBIntegerField;
    DSLeftNAME_DISC: TFIBStringField;
    DSLeftSHORT_NAME_DISC: TFIBStringField;
    DSLeftKOD_DISC: TFIBIntegerField;
    DSLeftID_SP_TYPE_DISC: TFIBBCDField;
    DSLeftNAME_TYPE: TFIBStringField;
    DSLeftKOD_TYPE: TFIBIntegerField;
    DSLeftSHORT_NAME_TYPE: TFIBStringField;
    DSLeftID_SP_DISC: TFIBBCDField;
    DSLeftID_SP_UCH_PL_PERELIK: TFIBBCDField;
    DSLeftID_SP_SPECIALIZATION: TFIBBCDField;
    DSLeftSHORT_NAME_SPECIALIZATION: TFIBStringField;
    DSLeftNAME_SPECIALIZATION: TFIBStringField;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    ToolButton18: TToolButton;
    AAddSpec: TAction;
    DSLeftECTS: TFIBFloatField;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    ToolButton19: TToolButton;
    AChangeECTS: TAction;
    DSelFilter: TpFIBDataSet;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel4: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel5: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    DSControlID_SP_SEMESTR: TFIBBCDField;
    DSControlID_SP_PL_PERELIC: TFIBBCDField;
    DSControlVAL_KONT: TFIBFloatField;
    DSControlKOD_TYPE: TFIBIntegerField;
    DSControlNAME_TYPE: TFIBStringField;
    DSControlSHORT_NAME_TYPE: TFIBStringField;
    DSControlTRIVALIST: TFIBSmallIntField;
    DSControlKOD_SEM: TFIBIntegerField;
    DSControlNAME_SEM: TFIBStringField;
    DSControlSHORT_NAME_SEM: TFIBStringField;
    DSControlID_SP_KURS: TFIBBCDField;
    DSControlKOD_KURS: TFIBIntegerField;
    DSControlNAME_KURS: TFIBStringField;
    DSControlSHORT_NAME_KURS: TFIBStringField;
    DSControlSHORT_NAME_DISC: TFIBStringField;
    DSControlNAME_DISC: TFIBStringField;
    DSControlKOD_DISC: TFIBIntegerField;
    DSControlSHORT_NAME_CIKL: TFIBStringField;
    DSControlNAME_CIKL: TFIBStringField;
    DSControlKOD_CIKL: TFIBIntegerField;
    DSControlID_SP_DISC: TFIBBCDField;
    DSControlID_SP_CIKL_PDG: TFIBBCDField;
    DSControlID_SP_SEMESTR_PL: TFIBBCDField;
    DSControlID_TYPE_CONTROL: TFIBBCDField;
    DSControlID_SP_DISC_CONTROL: TFIBBCDField;
    DSControlID_SP_SPECIALIZATION: TFIBIntegerField;
    DSControlSHOT_NAME_SPECIALIZATION: TFIBStringField;
    DSControlNAME_SPECIALIZATION: TFIBStringField;
    DSControlVAL_GROUP: TFIBFloatField;
    DSControlVAL_PERCENT: TFIBFloatField;
    cxGridDBTableView2DBColumn5: TcxGridDBColumn;
    cxGridDBTableView2DBColumn6: TcxGridDBColumn;
    procedure LoadCaption;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit4PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit6PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Action1Execute(Sender: TObject);
    procedure Refresh;
    procedure ADelLExecute(Sender: TObject);
    procedure ADelRExecute(Sender: TObject);
    procedure AAddLExecute(Sender: TObject);
    procedure AAddRExecute(Sender: TObject);
    procedure CleanTemp;
    procedure insert_temp(id_uch_plan, link : int64);
    procedure AddDisc (id_cikl : int64);
    procedure AddSpec (id_cikl : int64);
    procedure cxGrid1DBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Cell;
    procedure cxGrid1DBTableView1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ADelHoursExecute(Sender: TObject);
    procedure ARefSemExecute(Sender: TObject);
    procedure AAddHExecute(Sender: TObject);
    procedure ARefHExecute(Sender: TObject);
    procedure ADelHExecute(Sender: TObject);
    procedure AChangeHExecute(Sender: TObject);
    procedure AAddSemExecute(Sender: TObject);
    procedure AChangeSemExecute(Sender: TObject);
    procedure InssExecute(Sender: TObject);
    procedure F2sExecute(Sender: TObject);
    procedure DelsExecute(Sender: TObject);
    procedure AGroupExecute(Sender: TObject);
    procedure AGroupCExecute(Sender: TObject);
    procedure AAddCExecute(Sender: TObject);
    procedure AChangeCExecute(Sender: TObject);
    procedure ADelCExecute(Sender: TObject);
    procedure ARefControlExecute(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure cxGrid2DBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridDBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridDBTableView2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AAddSpecExecute(Sender: TObject);
    procedure AChangeECTSExecute(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    m : Tfmuo_sp_uchplan_main;
    reg : smallint;
  public
    ID_SP_SPEC, ID_SP_FORM_STUD, ID_SP_KAT_STUD, ID_SP_GOD_NABORA, ID_SP_STANDARD, ID_SP_SROK_OP : int64;
    id_session, id : int64;
    constructor Create(AO : TComponent; id_linkto : int64;  myform : Tfmuo_sp_uchplan_main; regim : smallint); reintroduce; overload;
  end;


implementation
    uses cn_Common_Loader,
         cn_Common_Types,
         uPrk_Loader,
         uPrK_Resources,
         uUO_Loader,
         uo_hours_add,
         uo_sp_ucplan_semhours,
         uo_control_add,
         uSpecKlassSprav,
         uo_sp_uchplan_ects;

{$R *.dfm}

{ Tfmuo_sp_uchplan_add }

constructor Tfmuo_sp_uchplan_add.Create(AO: TComponent; id_linkto: int64;
  myform: Tfmuo_sp_uchplan_main; regim : smallint);
begin
    inherited Create(AO);
    m                     := myform;
    reg                   := regim;

    DB                    := m.db;
    Tr.DefaultDatabase    := DB;
    DB.DefaultTransaction := Tr;

    DSLeft.Database       := DB;
    DSLeft.Transaction    := Tr;

    DS.Database           := DB;
    DS.Transaction        := Tr;

    DSH.Database          := DB;
    DSH.Transaction       := Tr;

    DSSem.Database        := DB;
    DSSem.Transaction     := Tr;

    DSelFilter.Database   := DB;
    DSelFilter.Transaction:= Tr;

    DSControl.Database    := DB;
    DSControl.Transaction := Tr;

    Tr.StartTransaction;

    id_session            := DB.Gen_Id('GEN_UO_TEMP_UCH_PL_PERELIK_SEL_', 1);

    if regim = 1 then
    begin
        if id_linkto = -2
            then ID_SP_STANDARD := -1
            else ID_SP_STANDARD := id_linkto;

        if id_linkto <> -1 then
        begin
            ID_SP_SPEC              := StrToInt64(m.DS.fbn('ID_SP_SPEC').AsString);
            ID_SP_FORM_STUD         := StrToInt64(m.DS.fbn('ID_SP_FORM_STUD').AsString);
            ID_SP_KAT_STUD          := StrToInt64(m.DS.fbn('ID_SP_KAT_STUD').AsString);
            ID_SP_GOD_NABORA        := StrToInt64(m.DS.fbn('ID_SP_GOD_NABORA').AsString);
            ID_SP_SROK_OP           := StrToInt64(m.DS.fbn('ID_SP_SROK_OP').AsString);
            cxTextEdit1.Text        := m.DS.fbn('NAME').AsString;
            cxButtonEdit1.Text      := m.DS.fbn('SPEC_NAME').AsString;
            cxButtonEdit2.Text      := m.DS.fbn('FORM_STUD_NAME').AsString;
            cxButtonEdit3.Text      := m.DS.fbn('KAT_NAME').AsString;
            cxButtonEdit4.Text      := m.DS.fbn('GOD_NAME').AsString;
            cxButtonEdit6.Text      := m.DS.fbn('SROK_NAME').AsString + ' (' + m.DS.fbn('YEAR_SROK').AsString + 'р. ' + m.DS.fbn('MONTH_SROK').AsString + 'м.)';
            id                      := -1;
            if id_linkto = -2
                then insert_temp(id, StrToInt64(m.DS.fbn('ID_SP_UCH_PLAN').AsString))
                else insert_temp(id, id_linkto);
        end;
    end;
    if regim = 2 then
    begin
        ID_SP_SPEC              := StrToInt64(m.DS.fbn('ID_SP_SPEC').AsString);
        ID_SP_FORM_STUD         := StrToInt64(m.DS.fbn('ID_SP_FORM_STUD').AsString);
        ID_SP_KAT_STUD          := StrToInt64(m.DS.fbn('ID_SP_KAT_STUD').AsString);
        ID_SP_GOD_NABORA        := StrToInt64(m.DS.fbn('ID_SP_GOD_NABORA').AsString);
        if StrToInt64(m.DS.fbn('ID_SP_STANDARD').AsString) = -1
            then ID_SP_STANDARD          := StrToInt64(m.DS.fbn('ID_SP_UCH_PLAN').AsString)
            else ID_SP_STANDARD          := StrToInt64(m.DS.fbn('ID_SP_STANDARD').AsString);
        ID_SP_SROK_OP           := StrToInt64(m.DS.fbn('ID_SP_SROK_OP').AsString);
        cxTextEdit1.Text        := m.DS.fbn('NAME').AsString;
        cxButtonEdit1.Text      := m.DS.fbn('SPEC_NAME').AsString;
        cxButtonEdit2.Text      := m.DS.fbn('FORM_STUD_NAME').AsString;
        cxButtonEdit3.Text      := m.DS.fbn('KAT_NAME').AsString;
        cxButtonEdit4.Text      := m.DS.fbn('GOD_NAME').AsString;
        cxButtonEdit6.Text      := m.DS.fbn('SROK_NAME').AsString + ' (' + m.DS.fbn('YEAR_SROK').AsString + 'р. ' + m.DS.fbn('MONTH_SROK').AsString + 'м.)';
        id                      := StrToInt64(m.DS.fbn('ID_SP_UCH_PLAN').AsString);
        insert_temp(id, -1);
    end;
    if regim = 3 then
    begin
        ID_SP_SPEC              := StrToInt64(m.DS.fbn('ID_SP_SPEC').AsString);
        ID_SP_FORM_STUD         := StrToInt64(m.DS.fbn('ID_SP_FORM_STUD').AsString);
        ID_SP_KAT_STUD          := StrToInt64(m.DS.fbn('ID_SP_KAT_STUD').AsString);
        ID_SP_GOD_NABORA        := StrToInt64(m.DS.fbn('ID_SP_GOD_NABORA').AsString);
        if StrToInt64(m.DS.fbn('ID_SP_STANDARD').AsString) = -1
            then ID_SP_STANDARD          := StrToInt64(m.DS.fbn('ID_SP_UCH_PLAN').AsString)
            else ID_SP_STANDARD          := StrToInt64(m.DS.fbn('ID_SP_STANDARD').AsString);
        ID_SP_SROK_OP           := StrToInt64(m.DS.fbn('ID_SP_SROK_OP').AsString);
        cxTextEdit1.Text        := m.DS.fbn('NAME').AsString;
        cxButtonEdit1.Text      := m.DS.fbn('SPEC_NAME').AsString;
        cxButtonEdit2.Text      := m.DS.fbn('FORM_STUD_NAME').AsString;
        cxButtonEdit3.Text      := m.DS.fbn('KAT_NAME').AsString;
        cxButtonEdit4.Text      := m.DS.fbn('GOD_NAME').AsString;
        cxButtonEdit6.Text      := m.DS.fbn('SROK_NAME').AsString + ' (' + m.DS.fbn('YEAR_SROK').AsString + 'р. ' + m.DS.fbn('MONTH_SROK').AsString + 'м.)';
        id                      := StrToInt64(m.DS.fbn('ID_SP_UCH_PLAN').AsString);
        insert_temp(id, -1);
    end;

    DSSem.Close;
    DSSem.Sqls.SelectSQL.Text := 'select * from UO_TEMP_HOURS_SEM_SELECT('+IntToStr(id_session)+', '+IntToStr(id)+')';
    DSSem.Open;

    DSLeft.Close;
    DSLeft.Sqls.SelectSQL.Text  := 'select * from UO_TEMP_UCH_PL_PERELIK_SEL_L('+IntToStr(id_session)+', '+IntToStr(id)+')';
    DSLeft.Open;

    if not DSLeft.IsEmpty then
    begin
        AAddR.Enabled  := true;
        ToolButton18.Enabled := true;
        cxGrid1DBTableView1.DataController.GotoFirst;
        while not cxGrid1DBTableView1.DataController.IsEOF do
        begin
            cxGrid1DBTableView1.Controller.FocusedRecord.Expand(true);
            cxGrid1DBTableView1.DataController.GotoNext;
        end;
        cxGrid1DBTableView1.Controller.FocusedRecord.Expand(true);
    end else
    begin
        AAddR.Enabled  := false;
        ToolButton18.Enabled := false;
    end;

    DSH.Close;
    DSH.Sqls.SelectSQL.Text  := 'select * from UO_TEMP_HOURS_SELECT('+IntToStr(id_session)+')';
    DSH.Open;

    if not DSH.IsEmpty then
    begin
        cxGridDBTableView1.DataController.GotoFirst;
        while not cxGridDBTableView1.DataController.IsEOF do
        begin
            cxGridDBTableView1.Controller.FocusedRecord.Expand(true);
            cxGridDBTableView1.DataController.GotoNext;
        end;
        cxGridDBTableView1.Controller.FocusedRecord.Expand(true);
    end;

    DSControl.Close;
    DSControl.Sqls.SelectSQL.Text := 'select * from UO_TEMP_CONTROL_SELECT('+IntToStr(id_session)+')';
    DSControl.Open;

    if not DSControl.IsEmpty then
    begin
        cxGridDBTableView2.DataController.GotoFirst;
        while not cxGridDBTableView2.DataController.IsEOF do
        begin
            cxGridDBTableView2.Controller.FocusedRecord.Expand(true);
            cxGridDBTableView2.DataController.GotoNext;
        end;
        cxGridDBTableView2.Controller.FocusedRecord.Expand(true);
    end;

    LoadCaption;
    PageControl1.ActivePageIndex := 0;

    ToolButton2.Enabled  := false;
    ToolButton19.Enabled := false;

    if regim = 3 then
    begin
        cxButton2.Enabled     := false;
        cxButtonEdit1.Enabled := false;
        cxButtonEdit2.Enabled := false;
        cxButtonEdit3.Enabled := false;
        cxButtonEdit4.Enabled := false;
        cxButtonEdit6.Enabled := false;
        cxTextEdit1.Enabled   := false;

        AAddSem.Enabled       := false;
        AChangeSem.Enabled    := false;
        ADelHours.Enabled     := false;
        AAddL.Enabled         := false;
        AAddSpec.Enabled      := false;
        AAddR.Enabled         := false;
        ADelR.Enabled         := false;
        AChangeECTS.Enabled   := false;
        AAddH.Enabled         := false;
        AChangeH.Enabled      := false;
        ADelH.Enabled         := false;
        AAddC.Enabled         := false;
        AChangeC.Enabled      := false;
        ADelC.Enabled         := false;
    end;
end;

procedure Tfmuo_sp_uchplan_add.LoadCaption;
begin
    Caption           := 'Вікно редагування учбового плану';
    Action1.Caption   := 'Зберегти';
    cxButton1.Caption := 'Відмінити';

    cxLabel1.Caption  := 'Назва';
    cxLabel2.Caption  := 'Спеціальність';
    cxLabel3.Caption  := 'Форма навчання';
    cxLabel4.Caption  := 'Категорія навчання';
    cxLabel5.Caption  := 'Рік набору';
    cxLabel7.Caption  := 'Срок навчання';

    cxLabel8.Caption  := 'Назва дисциплини';

    ADelL.Caption     := 'Видалити цикл';
    ADelR.Caption     := 'Видалити дисц.';
    AAddL.Caption     := 'Додати цикл';
    AAddR.Caption     := 'Додати дисц.';
    AAddSem.Caption   := 'Додати';
    AAddSpec.Caption  := 'Додати спеціалізацію';
    AChangeSem.Caption:= 'Змінити семестр';
    ARefSem.Caption   := 'Відновити семестри';
    TabSheet1.Caption := 'Шапка';
    TabSheet2.Caption := 'Семестри';
    TabSheet3.Caption := 'Цикли підг. + дисціплини';
    TabSheet4.Caption := 'Години';
    TabSheet5.Caption := 'Контроль';

    AAddH.Caption     := 'Додати години';
    AChangeH.Caption  := 'Змінити години';
    ADelH.Caption     := 'Видалити години';

    AAddC.Caption     := 'Додати контроль';
    AChangeC.Caption  := 'Змінити контроль';
    ADelC.Caption     := 'Видалити контроль';

    AGroup.Caption    := 'Панель групування';
    AGroupC.Caption   := 'Панель групування';

    cxGrid1DBTableView1DBColumn1.Caption := 'Коротка назва дисц.';
    cxGrid1DBTableView1DBColumn2.Caption := 'Коротка назва типу';
    cxGrid1DBTableView1DBColumn3.Caption := 'Код дисц.';
    cxGrid1DBTableView1DBColumn4.Caption := '';//'Назва циклу';
    cxGrid1DBTableView1DBColumn5.Caption := '';//'Назва спеціалізації';

    cxGrid2DBTableView1DBColumn1.Caption := 'Назва курсу';
    cxGrid2DBTableView1DBColumn2.Caption := 'Назва семестру';
//    cxGrid2DBTableView1DBColumn3.Caption := 'Назва типу';
    cxGrid2DBTableView1DBColumn4.Caption := 'Тривалість';
//    cxGrid2DBTableView1DBColumn5.Caption := 'Кіл-ть годин';

    cxGridDBTableView1DBColumn1.Caption  := 'Назва семестру';
    cxGridDBTableView1DBColumn2.Caption  := '';//'Назва дисципліни';
    cxGridDBTableView1DBColumn3.Caption  := 'Назва типу';
    cxGridDBTableView1DBColumn4.Caption  := 'Кількість годин';

    dxStatusBarSP.Panels[0].Text          := 'Ins - Додати';
    dxStatusBarSP.Panels[1].Text          := 'F2 - Змінити';
    dxStatusBarSP.Panels[2].Text          := 'Del - Видалити';
    dxStatusBarSP.Panels[3].Text          := 'F10 - Зберегти';
    dxStatusBarSP.Panels[4].Text          := 'Esc - Вийти';

end;

procedure Tfmuo_sp_uchplan_add.cxButton1Click(Sender: TObject);
begin
    CleanTemp;
    Close;
end;

procedure Tfmuo_sp_uchplan_add.cxButton2Click(Sender: TObject);
begin
    if cxTextEdit1.Text = '' then
    begin
        showmessage('Введіть назву учбового плану');
        cxTextEdit1.SetFocus;
        exit;
    end;
    if ID_SP_SPEC <= 0 then
    begin
        showmessage('Виберіть спеціальність!');
        cxButtonEdit1.SetFocus;
        exit;
    end;
    if ID_SP_FORM_STUD <= 0 then
    begin
        showmessage('Виберіть форму навчання!');
        cxButtonEdit2.SetFocus;
        exit;
    end;
    if ID_SP_KAT_STUD <= 0 then
    begin
        showmessage('Виберіть категорію студентів!');
        cxButtonEdit3.SetFocus;
        exit;
    end;
    if ID_SP_GOD_NABORA <= 0 then
    begin
        showmessage('Виберіть рік набору!');
        cxButtonEdit4.SetFocus;
        exit;
    end;
    if ID_SP_SROK_OP <= 0 then
    begin
        showmessage('Виберіть сроки навчання!');
        cxButtonEdit6.SetFocus;
        exit;
    end;

{    if DSLeft.IsEmpty then
    begin
        showmessage('Ви не ввели жодного циклу підготовки!');
        exit;
    end;

{    if not DSSem.isEmpty then
    begin
        DSSem.First;
        while not DSSem.Eof do
        begin
            if ((DSSem.fbn('ID_SP_TYPE_DISC_LESSON').isNull) or (StrToInt64(DSSem.fbn('ID_SP_TYPE_DISC_LESSON').AsString) = -1)) then
            begin
                showmessage('У семестрі ' + DSSem.fbn('ID_SP_TYPE_DISC_LESSON').AsString + ' не введено часівіснує семестрВи не ввели жодного циклу підготовки!');
                exit;
            end;
            DSSem.Next;
        end;
    end;}
    db                          := m.DB;
    TWr.DefaultDatabase         := DB;
//    db.DefaultTransaction       := TWr;
    DataSet.Database            := DB;
    DataSet.Transaction         := TWr;

    TWr.StartTransaction;

    if reg = 1 then
    begin
        try
            DataSet.Close;
            DataSet.SQLs.SelectSQL.Text := 'select * from UO_SP_UCH_PLAN_INSERT('+InttoStr(ID_SP_SPEC)+', '+InttoStr(ID_SP_FORM_STUD)+', '+InttoStr(ID_SP_KAT_STUD)+', '+InttoStr(ID_SP_GOD_NABORA)+', '+InttoStr(ID_SP_STANDARD)+', '''+cxTextEdit1.Text+''', '+InttoStr(ID_SP_SROK_OP)+', '+IntToStr(id_session)+')';
            DataSet.Open;
            if DataSet.fbn('RES').AsInteger = 0 then
            begin
                TWr.Rollback;
                showmessage('Існує цикл без дисциплини! Данні не збережені!');
                exit;
            end;
            id := StrToint64(DataSet.fbn('ID_SP_UCH_PLAN').AsString);
            DataSet.Close;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
            exit;
        end;
        end;

    end;
    if reg = 2 then
    begin
        try
            DataSet.Close;
            DataSet.SQLs.SelectSQL.Text := 'select * from UO_SP_UCH_PLAN_UPDATE('+IntToStr(id)+', '+InttoStr(ID_SP_SPEC)+', '+InttoStr(ID_SP_FORM_STUD)+', '+InttoStr(ID_SP_KAT_STUD)+', '+InttoStr(ID_SP_GOD_NABORA)+', '+InttoStr(ID_SP_STANDARD)+', '''+cxTextEdit1.Text+''', '+InttoStr(ID_SP_SROK_OP)+', '+IntToStr(id_session)+')';
            DataSet.Open;
            if DataSet.fbn('RES').AsInteger = 0 then
            begin
                TWr.Rollback;
                showmessage('Існує цикл без дисциплини! Данні не збережені!');
                exit;
            end;
            DataSet.Close;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
            exit;
        end;
        end;
    end;

    if id > 0 then
    begin
        CleanTemp;    
        m.ActionRefreshExecute(nil);
        m.DS.Locate('ID_SP_UCH_PLAN', id, []);
        Close;
    end;
end;

procedure Tfmuo_sp_uchplan_add.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
//    AParameter : TcnSimpleParams;
    Res : variant;
    fl : boolean;
begin
{    AParameter                := TcnSimpleParams.Create;
    AParameter.Owner          := self;
    AParameter.Db_Handle      := DB.Handle;
    AParameter.Formstyle      := fsNormal;
    AParameter.WaitPakageOwner:= self;

    AParameter.DontShowGroups := True;
    Res := RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FacultySpecGroup.bpl', 'ShowSPFacSpecGroup');
    AParameter.Free;
    if VarArrayDimCount(res) > 0 then
    begin
        if ((Res[0]<>Null) and (Res[1]<>Null))  then
        begin
//            DataVL['ID_CN_SP_FAK'].AsInt64        := Res[0];   // id_faculty;
            ID_SP_SPEC       := Res[1];   // id_spec;
//            DataVL['SHORT_NAME_FAK'].AsString     := Res[3];   //DM.DataSet['NAME'];
//            DataVL['ID_CN_JN_FACUL_SPEC'].AsInt64 := Res[6];
            cxButtonEdit1.Text        := VarToStr(Res[3])+'/'+VarToStr(Res[4]);
        end;
    end;}

    res := uSpecKlassSprav.ShowSprav(Self, DB.Handle, PUB_SP_USPEC, fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
        DSelFilter.Close;
        DSelFilter.Sqls.SelectSql.Text := 'select * from UO_FILTER_SPEC where ID_SESSION='+intTostr(0)+' and ID_USER='+intToStr(m.id_user);
        DSelFilter.Open;
        DSelFilter.FetchAll;
        if DSelFilter.recordCount > 0 then
        begin
            DSelFilter.First;
            fl := true;
            while not DSelFilter.Eof do
            begin
                if (strToInt64(DSelFilter.fbn('ID_SPEC').AsString)= Res[0]) then fl := false;
                DSelFilter.Next;
            end;
            if fl then
                if MessageBox(Handle, Pchar('Цього значення не добавлено до фільтру. Ви бажаєте додати це значення до фільтру? У випадку відмови значення не буде вибрано!'), Pchar('Увага!'), MB_YESNO + MB_DEFBUTTON2)=mrNo then
                begin
                    exit;
                end
        end;
                ID_SP_SPEC              := Res[0];
                cxButtonEdit1.Text      := VarToStr(Res[1])+' ('+VarToStr(Res[2]) + ')';

        if DSelFilter.recordCount > 0 then
        begin
                TWr.DefaultDatabase := DB;
                Stored.Transaction  := TWr;
                try
                    TWr.StartTransaction;
                    Stored.StoredProcName := 'UO_FILTER_SPEC_INS';
                    Stored.ParamByName('ID_SESSION').AsInt64          := 0;
                    Stored.ParamByName('ID_USER').AsInt64             := m.id_user;
                    Stored.ParamByName('ID_SPEC').AsInt64             := ID_SP_SPEC;
                    Stored.ExecProc;
                    TWr.Commit;
                except on E:Exception do begin
                    TWr.Rollback;
                    ShowMessage(E.Message);
                end end;
            end{ else
            begin
                ID_SP_SPEC              := -1;
                cxButtonEdit1.Text      := '';//VarToStr(Res[1])+' ('+VarToStr(Res[2]) + ')';
             exit;
            end;}
//        end;
    end;
end;

procedure Tfmuo_sp_uchplan_add.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    AParameter : TcnSimpleParams;
    Res : variant;
    fl : boolean;
begin
    AParameter                := TcnSimpleParams.Create;
    AParameter.Owner          := self;
    AParameter.Db_Handle      := DB.Handle;
    AParameter.Formstyle      := fsNormal;
    AParameter.WaitPakageOwner:= self;
    res := RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FormStud.bpl','ShowSPFormStud');
    AParameter.Free;
    if VarArrayDimCount(res) > 0 then
    begin
        if Res[0] <> Null then
        begin
            DSelFilter.Close;
            DSelFilter.Sqls.SelectSql.Text := 'select * from UO_FILTER_FORMA where ID_SESSION='+intTostr(0)+' and ID_USER='+intToStr(m.id_user);
            DSelFilter.Open;
            DSelFilter.FetchAll;
            if DSelFilter.recordCount > 0 then
            begin
                DSelFilter.First;
                fl := true;
                while not DSelFilter.Eof do
                begin
                    if (strToInt64(DSelFilter.fbn('ID_FORMA').AsString)= Res[0]) then fl := false;
                    DSelFilter.Next;
                end;
                if fl then
                    if MessageBox(Handle, Pchar('Цього значення не добавлено до фільтру. Ви бажаєте додати це значення до фільтру? У випадку відмови значення не буде вибрано!'), Pchar('Увага!'), MB_YESNO + MB_DEFBUTTON2)=mrNo then
                    begin
                        exit;
                    end
            end;
                    ID_SP_FORM_STUD         := Res[0];
                    cxButtonEdit2.Text      := VarToStr(Res[1])+' ('+VarToStr(Res[2]) + ')';

            if DSelFilter.recordCount > 0 then
            begin
                    TWr.DefaultDatabase := DB;
                    Stored.Transaction  := TWr;
                    try
                        TWr.StartTransaction;
                        Stored.StoredProcName := 'UO_FILTER_FORMA_INS';
                        Stored.ParamByName('ID_SESSION').AsInt64          := 0;
                        Stored.ParamByName('ID_USER').AsInt64             := m.id_user;
                        Stored.ParamByName('ID_FORMA').AsInt64            := ID_SP_FORM_STUD;
                        Stored.ExecProc;
                        TWr.Commit;
                    except on E:Exception do begin
                        TWr.Rollback;
                        ShowMessage(E.Message);
                    end end;
                end{ else
                begin
                    ID_SP_FORM_STUD         := -1;
                    cxButtonEdit2.Text      := '';//VarToStr(Res[1])+' ('+VarToStr(Res[2]) + ')';
                 exit;
                end;}
//            end;
        end;
    end;
end;

procedure Tfmuo_sp_uchplan_add.cxButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    AParameter : TcnSimpleParams;
    Res : variant;
    fl : boolean;
begin
    AParameter                := TcnSimpleParams.Create;
    AParameter.Owner          := self;
    AParameter.Db_Handle      := DB.Handle;
    AParameter.Formstyle      := fsNormal;
    AParameter.WaitPakageOwner:= self;
    res := RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_CategoryStudy.bpl','ShowSPCategoryStudy');
    AParameter.Free;
    if VarArrayDimCount(res) > 0 then
    begin
        if Res[0] <> Null then
        begin
            DSelFilter.Close;
            DSelFilter.Sqls.SelectSql.Text := 'select * from uo_filter_kat where ID_SESSION='+intTostr(0)+' and ID_USER='+intToStr(m.id_user);
            DSelFilter.Open;
            DSelFilter.FetchAll;
            if DSelFilter.recordCount > 0 then
            begin
                DSelFilter.First;
                fl := true;
                while not DSelFilter.Eof do
                begin
                    if (strToInt64(DSelFilter.fbn('ID_KAT').AsString)= Res[0]) then fl := false;
                    DSelFilter.Next;
                end;
                if fl then
                    if MessageBox(Handle, Pchar('Цього значення не добавлено до фільтру. Ви бажаєте додати це значення до фільтру? У випадку відмови значення не буде вибрано!'), Pchar('Увага!'), MB_YESNO + MB_DEFBUTTON2)=mrNo then
                    begin
                        exit;
                    end
            end;
                    ID_SP_KAT_STUD          := Res[0];
                    cxButtonEdit3.Text      := VarToStr(Res[1]);

            if DSelFilter.recordCount > 0 then
            begin
                    TWr.DefaultDatabase := DB;
                    Stored.Transaction  := TWr;
                    try
                        TWr.StartTransaction;
                        Stored.StoredProcName := 'UO_FILTER_KAT_INS';
                        Stored.ParamByName('ID_SESSION').AsInt64          := 0;
                        Stored.ParamByName('ID_USER').AsInt64             := m.id_user;
                        Stored.ParamByName('ID_KAT').AsInt64              := ID_SP_KAT_STUD;
                        Stored.ExecProc;
                        TWr.Commit;
                    except on E:Exception do begin
                        TWr.Rollback;
                        ShowMessage(E.Message);
                    end end;
                end {else
                begin
                    ID_SP_KAT_STUD         := -1;
                    cxButtonEdit3.Text      := '';//VarToStr(Res[1])+' ('+VarToStr(Res[2]) + ')';
                 exit;
                end; }
//            end;
        end;
    end;
end;

procedure Tfmuo_sp_uchplan_add.cxButtonEdit4PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Res : variant;
    fl : boolean;
begin
    Res := uPrK_Loader.ShowPrkSprav(self, DB.Handle, PrK_SP_GOD_NABORA, fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
        if Res[0] <> Null then
        begin
            DSelFilter.Close;
            DSelFilter.Sqls.SelectSql.Text := 'select * from uo_filter_year_nabor where ID_SESSION='+intTostr(0)+' and ID_USER='+intToStr(m.id_user);
            DSelFilter.Open;
            DSelFilter.FetchAll;
            if DSelFilter.recordCount > 0 then
            begin
                DSelFilter.First;
                fl := true;
                while not DSelFilter.Eof do
                begin
                    if (strToInt64(DSelFilter.fbn('id_year').AsString)= Res[0]) then fl := false;
                    DSelFilter.Next;
                end;
                if fl then
                    if MessageBox(Handle, Pchar('Цього значення не добавлено до фільтру. Ви бажаєте додати це значення до фільтру? У випадку відмови значення не буде вибрано!'), Pchar('Увага!'), MB_YESNO + MB_DEFBUTTON2)=mrNo then
                    begin
                        exit;
                    end
            end;
                    ID_SP_GOD_NABORA        := Res[0];
                    cxButtonEdit4.Text      := VarToStr(Res[1]);

            if DSelFilter.recordCount > 0 then
            begin
                    TWr.DefaultDatabase := DB;
                    Stored.Transaction  := TWr;
                    try
                        TWr.StartTransaction;
                        Stored.StoredProcName := 'UO_FILTER_YEAR_NABOR_INS';
                        Stored.ParamByName('ID_SESSION').AsInt64          := 0;
                        Stored.ParamByName('ID_USER').AsInt64             := m.id_user;
                        Stored.ParamByName('ID_YEAR').AsInt64             := ID_SP_GOD_NABORA;
                        Stored.ExecProc;
                        TWr.Commit;
                    except on E:Exception do begin
                        TWr.Rollback;
                        ShowMessage(E.Message);
                    end end;
                end{ else
                begin
                    ID_SP_GOD_NABORA        := -1;
                    cxButtonEdit4.Text      := '';//VarToStr(Res[1])+' ('+VarToStr(Res[2]) + ')';
                    exit;
                end;}
//            end;
        end;
    end;
end;

procedure Tfmuo_sp_uchplan_add.cxButtonEdit6PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Res : Variant;
begin
    Res := uPrK_Loader.ShowPrkSprav(self, DB.Handle, PrK_SP_SROK_OB, fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
        if Res[0] <> Null then
        begin
            ID_SP_SROK_OP       := Res[0];
            cxButtonEdit6.Text  := Res[1] + ' (' + VarToStr(Res[5]) + ' p. ' + VarToStr(Res[6]) +'м.)';
        end;
    end;
end;

procedure Tfmuo_sp_uchplan_add.Action1Execute(Sender: TObject);
begin
    cxButton2Click(Sender);
end;

procedure Tfmuo_sp_uchplan_add.Refresh;
var
    id_dd : int64;
begin
    try id_dd := StrToINt64(DSLeft.fbn('ID_SP_UCH_PL_PERELIK').AsString); except id_dd :=  -1; end;

    DSLeft.Close;
    DSLeft.Sqls.SelectSQL.Text  := 'select * from UO_TEMP_UCH_PL_PERELIK_SEL_L('+IntToStr(id_session)+', '+IntToStr(id)+')';
    DSLeft.Open;

    if not DSLeft.IsEmpty then
    begin
        cxGrid1DBTableView1.DataController.GotoFirst;
        while not cxGrid1DBTableView1.DataController.IsEOF do
        begin
            cxGrid1DBTableView1.Controller.FocusedRecord.Expand(true);
            cxGrid1DBTableView1.DataController.GotoNext;
        end;
        cxGrid1DBTableView1.Controller.FocusedRecord.Expand(true);
    end;

    if not DSLeft.Locate('ID_SP_UCH_PL_PERELIK', id_dd, []) then DSLeft.Last;
end;

procedure Tfmuo_sp_uchplan_add.ADelLExecute(Sender: TObject);
//var
//    id_del_l : int64;
begin
    if not DSLeft.IsEmpty then
    begin
        if MessageBox(Handle, Pchar('Ви дійсно бажаєте видалити цикл ' + DSLeft.FieldByName('NAME_CIKL').AsString), Pchar('Увага!'), MB_YESNO + MB_DEFBUTTON2)=mrYes then
        begin
//            id_del_l           := StrToInt64(DSLeft.FieldByName('ID_SP_STANDARD').AsString);
            TWr.DefaultDatabase := DB;
            Stored.Transaction  := TWr;
            try
                TWr.StartTransaction;
                Stored.StoredProcName := 'UO_TEMP_UCH_PL_PERELIK_DEL_L';
                Stored.ParamByName('D_ID_SP_CIKL_PDG').AsInt64  := StrToInt64(DSLeft.FieldByName('ID_SP_CIKL_PDG').AsString);
                Stored.ParamByName('D_ID_UCH_PLAN').AsInt64     := id;
                Stored.ParamByName('D_ID_SESSION').AsInt64      := id_session;
                Stored.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            Refresh;
        end;
    end;
end;

procedure Tfmuo_sp_uchplan_add.ADelRExecute(Sender: TObject);
begin
    if not DSLeft.IsEmpty then
    begin
        if MessageBox(Handle, Pchar('Ви дійсно бажаєте видалити дисциплину ' + DSLeft.FieldByName('SHORT_NAME_DISC').AsString), Pchar('Увага!'), MB_YESNO + MB_DEFBUTTON2)=mrYes then
        begin
            if DSH.Locate('ID_SP_DISC', StrToInt64(DSLeft.FieldByName('ID_SP_DISC').AsString), []) then
            begin
                showmessage('Неможливо видалити, бо вже заповнені години на цей семестр!');
                exit;
            end;
            if DSControl.Locate('ID_SP_DISC', StrToInt64(DSLeft.FieldByName('ID_SP_DISC').AsString), []) then
            begin
                showmessage('Неможливо видалити, бо вже заповнен контроль на цей семестр!');
                exit;
            end;

            TWr.DefaultDatabase := DB;
            Stored.Transaction  := TWr;
            try
                TWr.StartTransaction;
                Stored.StoredProcName := 'UO_TEMP_UCH_PL_PERELIK_DEL_R';
                Stored.ParamByName('D_ID_SP_CIKL_PDG').AsInt64    := StrToInt64(DSLeft.FieldByName('ID_SP_CIKL_PDG').AsString);
                Stored.ParamByName('D_ID_SP_DISC').AsInt64        := StrToInt64(DSLeft.FieldByName('ID_SP_DISC').AsString);
                Stored.ParamByName('D_ID_SPECIALIZATION').AsInt64 := StrToInt64(DSLeft.FieldByName('ID_SP_SPECIALIZATION').AsString);
                Stored.ParamByName('D_ID_UCH_PLAN').AsInt64       := id;
                Stored.ParamByName('D_ID_SESSION').AsInt64        := id_session;
                Stored.ParamByName('D_ECTS').AsFloat              := DSLeft.FieldByName('ECTS').AsFloat;
                Stored.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            Refresh;
        end;
    end;
end;

procedure Tfmuo_sp_uchplan_add.AAddLExecute(Sender: TObject);
var
    InputParam : TAArray;
    id_cikl, id_disc, id_special : int64;
    ects : double;
    is_spec : integer;
begin
    InputParam := TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'UO_SP_CIKL_PIDG.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DB.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
    ShowAllUoBpl(self, InputParam);
    id_cikl := InputParam['OutPut']['ID_SP_CIKL_PIDG'].AsInt64;
    is_spec := InputParam['OutPut']['IS_SPECIALIZATION'].AsInteger;
    InputParam.Free;
    if id_cikl <> -1 then
    begin
        if is_spec = 0 then
        begin
            id_special := -1;
        end else
        begin
            InputParam := TAArray.Create;
            InputParam['Name_Bpl'].AsString                     := 'UO_SP_SPECIALIZATION.bpl';
            InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DB.Handle);
            InputParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
            ShowAllUoBpl(self, InputParam);
            id_special := InputParam['OutPut']['ID_SP_SPECIALIZATION'].AsInt64;
            InputParam.Free;
            if id_special <= 0 then exit;
        end;
//        if id_special <> -1 then
        begin
            InputParam := TAArray.Create;
            InputParam['Name_Bpl'].AsString                     := 'UO_SP_DISC.bpl';
            InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DB.Handle);
            InputParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
            ShowAllUoBpl(self, InputParam);
            id_disc := InputParam['OutPut']['ID_SP_DISC'].AsInt64;
            InputParam.Free;
            if id_disc <> -1 then
            begin
                ects := 0;
                if uo_show_ects(ects) then
                begin
                    TWr.DefaultDatabase := DB;
                    Stored.Transaction  := TWr;
                    try
                        TWr.StartTransaction;
                        Stored.StoredProcName := 'UO_TEMP_UCH_PL_PERELIK_INS';
                        Stored.ParamByName('D_ID_CIKL').AsInt64            := id_cikl;
                        Stored.ParamByName('D_ID_SP_UCH_PLAN').AsInt64     := id;
                        Stored.ParamByName('D_ID_SESSION').AsInt64         := id_session;
                        Stored.ParamByName('D_ID_DISC').AsInt64            := id_disc;
                        Stored.ParamByName('D_ID_SPECIALIZATION').AsInt64  := id_special;
                        Stored.ParamByName('D_ECTS').asFloat               := ects;
                        Stored.ExecProc;
                        TWr.Commit;
                    except on E:Exception do begin
                        TWr.Rollback;
                        ShowMessage(E.Message);
                    end end;
                    Refresh;
                end;
            end;
        end;
    end;
end;

procedure Tfmuo_sp_uchplan_add.AAddRExecute(Sender: TObject);
var
    InputParam : TAArray;
    id_disc : int64;
    ects : double;
begin
  if not DSLeft.isEmpty then
  begin
    InputParam := TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'UO_SP_DISC.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DB.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
    ShowAllUoBpl(self, InputParam);

    id_disc := InputParam['OutPut']['ID_SP_DISC'].AsInt64;

    InputParam.Free;

    if id_disc <> -1 then
    begin
        if uo_show_ects(ects) then
        begin
            TWr.DefaultDatabase := DB;
            Stored.Transaction  := TWr;
            try
                TWr.StartTransaction;
                Stored.StoredProcName := 'UO_TEMP_UCH_PL_PERELIK_INS';
                Stored.ParamByName('D_ID_CIKL').AsInt64              := StrToInt64(DSLeft.fbn('ID_SP_CIKL_PDG').AsString);
                Stored.ParamByName('D_ID_SPECIALIZATION').AsInt64    := StrToInt64(DSLeft.fbn('ID_SP_SPECIALIZATION').AsString);
                Stored.ParamByName('D_ID_SP_UCH_PLAN').AsInt64       := id;
                Stored.ParamByName('D_ID_SESSION').AsInt64           := id_session;
                Stored.ParamByName('D_ID_DISC').AsInt64              := id_disc;
                Stored.ParamByName('D_ECTS').AsFloat                 := ects;
                Stored.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            Refresh;
        end;
    end;
  end;
//    DSLeft.Locate('ID_SP_CIKL_PDG', id_cikl, []);
end;

procedure Tfmuo_sp_uchplan_add.CleanTemp;
begin
    TWr.DefaultDatabase := DB;
    Stored.Transaction  := TWr;
    try
        TWr.StartTransaction;
        Stored.StoredProcName := 'UO_TEMP_UCH_PL_PERELIK_DEL';
        Stored.ParamByName('D_ID_SESSION').AsInt64     := id_session;
        Stored.ExecProc;
        TWr.Commit;
    except
        TWr.Rollback;
    end;
end;

procedure Tfmuo_sp_uchplan_add.insert_temp(id_uch_plan, link : int64);
begin
    TWr.DefaultDatabase := DB;
    Stored.Transaction  := TWr;
    try
        TWr.StartTransaction;
        Stored.StoredProcName := 'UO_TEMP_UCH_PL_INSERT';
        Stored.ParamByName('D_ID_SESSION').AsInt64     := id_session;
        Stored.ParamByName('D_ID_UCH_PLAN').AsInt64    := id_uch_plan;
        Stored.ParamByName('D_LINK').AsInt64           := link;
        Stored.ExecProc;
        TWr.Commit;
    except
        TWr.Rollback;
    end;
end;

procedure Tfmuo_sp_uchplan_add.AddDisc(id_cikl: int64);
var
    InputParam : TAArray;
    id_disc : int64;
begin
    InputParam := TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'UO_SP_DISC.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DB.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
    ShowAllUoBpl(self, InputParam);

    id_disc := InputParam['OutPut']['ID_SP_DISC'].AsInt64;

    InputParam.Free;

    if id_disc <> -1 then
    begin
        TWr.DefaultDatabase := DB;
        Stored.Transaction  := TWr;
        try
            TWr.StartTransaction;
            Stored.StoredProcName := 'UO_TEMP_UCH_PL_PERELIK_INS_D';
            Stored.ParamByName('D_ID_CIKL').AsInt64        := id_cikl;
            Stored.ParamByName('D_ID_SP_UCH_PLAN').AsInt64 := id;
            Stored.ParamByName('D_ID_SESSION').AsInt64     := id_session;
            Stored.ParamByName('D_ID_DISC').AsInt64        := id_disc;
            Stored.ExecProc;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
        end end;
        Refresh;
    end;
//    DSLeft.Locate('ID_SP_CIKL_PDG', id_cikl, []);
end;

procedure Tfmuo_sp_uchplan_add.cxGrid1DBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    Cell;
    if reg <> 3 then
        if key = Vk_DELETE then ADelRExecute(Sender);
end;

procedure Tfmuo_sp_uchplan_add.Cell;
begin
    if reg <> 3 then
    begin
        if not DSLeft.IsEmpty then
        if cxGrid1DBTableView1.Controller.FocusedRecord.Expandable then
        begin
            AAddR.Enabled               := true;
            ToolButton2.Enabled         := false;
            ToolButton19.Enabled        := false;
//        ARightReestr.Enabled    := true;
            cxTextEdit2.Text            := '';
            ToolButton18.Enabled        := true;

        end else
        begin
            AAddR.Enabled               := false;
            ToolButton2.Enabled         := true;
            ToolButton19.Enabled        := true;

            ToolButton18.Enabled        := false;
//        ARightReestr.Enabled    := false;
            cxTextEdit2.Text            := DSLeft.fbn('NAME_DISC').AsString;

        end;
    end;
end;

procedure Tfmuo_sp_uchplan_add.cxGrid1DBTableView1MouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
    Cell;
end;

procedure Tfmuo_sp_uchplan_add.ADelHoursExecute(Sender: TObject);
var
    id_sss : int64;
begin
    if not DSSem.IsEmpty then
    begin
        if MessageBox(Handle, Pchar('Ви дійсно бажаєте видалити запис ' + DSSem.FieldByName('SHORT_NAME_SEM').AsString + ' семестр?'), Pchar('Увага!'), MB_YESNO + MB_DEFBUTTON2)=mrYes then
        begin
            id_sss := StrToInt64(DSSem.fbn('ID_SP_SEMESTR').AsString);
            if DSH.Locate('ID_SP_SEMESTR', id_sss, []) then
            begin
                showmessage('Неможливо видалити, бо вже заповнені години на цей семестр!');
                exit;
            end;
            if DSControl.Locate('ID_SP_SEMESTR', id_sss, []) then
            begin
                showmessage('Неможливо видалити, бо вже заповнен контроль на цей семестр!');
                exit;
            end;

            TWr.DefaultDatabase := DB;
            Stored.Transaction  := TWr;
            try
                TWr.StartTransaction;
                Stored.StoredProcName := 'UO_TEMP_HOURS_SEM_DELETE';
                Stored.ParamByName('D_ID_SESSION').AsInt64          := id_session;
                Stored.ParamByName('D_ID_SP_UCH_PL_SEM').AsInt64    := StrToInt64(DSSem.fbn('ID_SP_UCH_PL_SEM').AsString);
                Stored.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            ARefSemExecute(Sender);
        end;
    end;
end;

procedure Tfmuo_sp_uchplan_add.ARefSemExecute(Sender: TObject);
var
    id_r : int64;
begin
    id_r := -1;
    if not DSSem.IsEmpty then
    begin
        try id_r := StrToInt64(DSSem.fbn('ID_SP_UCH_PL_SEM').AsString); except id_r := -1; end;
    end;
    DSSem.CloseOpen(false);
    if not DSSem.Locate('ID_SP_UCH_PL_SEM', id_r, []) then DSSem.Last;
end;

procedure Tfmuo_sp_uchplan_add.AAddHExecute(Sender: TObject);
var
    id_type, id_sem, id_disc, id_semest_poz : int64;
    triv : integer;
    s1, s2, s4 : string;
begin
    id_type   := -1;
    id_sem    := -1;
    id_disc   := -1;
    triv      := 0;
    s1        := '';
    s2        := '';
    s4        := '';
    if show_hours(Self, Self, id_type, id_sem, id_disc, triv, s1, s2, s4) then
    begin
        TWr.DefaultDatabase := DB;
        DSSave.Database     := DB;
        DSSave.Transaction  := TWr;
        id_semest_poz       := -1;
        try
            TWr.StartTransaction;
            DSSave.Close;
            DSSave.Sqls.SelectSQL.Text := 'select * from UO_TEMP_HOURS_INSERT('+IntToStr(id_session)+', '+IntToStr(id_disc)+', '+IntToStr(id_sem)+', '+IntToStr(id_type)+', '+IntToStr(triv)+') ';
            DSSave.Open;
            id_semest_poz := StrToInt64(DSSave.fbn('ID_SP_UCH_PL_HOURS').AsString);
            DSSave.Close;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
        end end;
        ARefHExecute(sender);
        if not DSH.Locate('ID_SPUCH_PL_HOURS', id_semest_poz, []) then DSH.Last; 
    end;
end;

procedure Tfmuo_sp_uchplan_add.ARefHExecute(Sender: TObject);
var
    id_r : int64;
begin
    id_r := -1;
    if not DSH.IsEmpty then
    begin
        try id_r := StrToInt64(DSH.fbn('ID_SPUCH_PL_HOURS').AsString); except id_r := -1; end;
    end;
    DSH.CloseOpen(false);
    if not DSH.IsEmpty then
    begin
        cxGridDBTableView1.DataController.GotoFirst;
        while not cxGridDBTableView1.DataController.IsEOF do
        begin
            cxGridDBTableView1.Controller.FocusedRecord.Expand(true);
            cxGridDBTableView1.DataController.GotoNext;
        end;
        cxGridDBTableView1.Controller.FocusedRecord.Expand(true);
    end;

    DSH.locate('ID_SPUCH_PL_HOURS', id_r, []);
end;

procedure Tfmuo_sp_uchplan_add.ADelHExecute(Sender: TObject);
begin
    if not DSH.IsEmpty then
    begin
        if MessageBox(Handle, Pchar('Ви дійсно бажаєте видалити часи ' + DSH.FieldByName('VAL_HOURS').AsString + '?'), Pchar('Увага!'), MB_YESNO + MB_DEFBUTTON2)=mrYes then
        begin
            TWr.DefaultDatabase := DB;
            Stored.Transaction  := TWr;
            try
                TWr.StartTransaction;
                Stored.StoredProcName := 'UO_TEMP_HOURS_DELETE';
                Stored.ParamByName('D_ID_SESSION').AsInt64      := id_session;
                Stored.ParamByName('D_ID_HOURS').AsInt64        := StrToInt64(DSH.fbn('ID_SPUCH_PL_HOURS').AsString);
                Stored.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            ARefHExecute(sender);
        end;
    end;
end;

procedure Tfmuo_sp_uchplan_add.AChangeHExecute(Sender: TObject);
var
    id_type, id_sem, id_disc : int64;
    triv : integer;
    s1, s2, s4 : string;
begin
    if not DSH.IsEmpty then
    begin
        id_type   := StrToInt64(DSH.fbn('ID_SP_TYPE_DISC_LESSON').AsString);
        id_sem    := StrToInt64(DSH.fbn('ID_SP_SEMESTR_PL').AsString);
        id_disc   := StrToInt64(DSH.fbn('ID_SP_PL_PERELIC').AsString);
        triv      := DSH.fbn('VAL_HOURS').AsInteger;
        s1        := DSH.fbn('NAME_DISC').AsString;
        s2        := DSH.fbn('NAME_SEM').AsString;
        s4        := DSH.fbn('NAME_TYPE').AsString;
        if show_hours(Self, Self, id_type, id_sem, id_disc, triv, s1, s2, s4) then
        begin
            TWr.DefaultDatabase := DB;
            Stored.Transaction  := TWr;
            try
                TWr.StartTransaction;
                Stored.StoredProcName := 'UO_TEMP_HOURS_UPDATE';
                Stored.ParamByName('D_ID_SESSION').AsInt64            := id_session;
                Stored.ParamByName('ID_SP_UCH_PL_HOURS').AsInt64      := StrToInt64(DSH.fbn('ID_SPUCH_PL_HOURS').AsString);
                Stored.ParamByName('ID_SP_PL_PERELIK').AsInt64        := id_disc;
                Stored.ParamByName('ID_SP_SEMESTR').AsInt64           := id_sem;
                Stored.ParamByName('ID_SP_TYPE_DISC_LESSON').AsInt64  := id_type;
                Stored.ParamByName('VAL_HOURS').AsInteger             := triv;
                Stored.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            ARefHExecute(sender);
        end;
    end;
end;

procedure Tfmuo_sp_uchplan_add.AAddSemExecute(Sender: TObject);
var
    id_kurs, id_sem, id_semest_poz : int64;
    triv : integer;
begin
        if sem_show(self, Self, 1, id_kurs, id_sem, triv, '', '', '') then
        begin
            TWr.DefaultDatabase := DB;
            DSSave.Database     := DB;
            DSSave.Transaction  := TWr;
            id_semest_poz       := -1;
            try
                TWr.StartTransaction;
                DSSave.Close;
                DSSave.Sqls.SelectSQL.Text := 'select * from UO_TEMP_HOURS_SEM_INSERT('+IntToStr(id_session)+', '+IntToStr(triv)+', '+IntToStr(id)+', '+IntToStr(id_kurs)+', '+IntToStr(id_sem)+')';
                DSSave.Open;
                if DSSave.fbn('RESULT').AsInteger=0 then
                begin
                    TWr.Rollback;
                    showmessage('Запис з такими параметрами вже _снує!');
                    exit;
                end;
                id_semest_poz := StrToInt64(DSSave.fbn('ID_SP_UCH_PL_SEM').AsString);
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            ARefSemExecute(sender);
            DSSem.Locate('ID_SP_UCH_PL_SEM', id_semest_poz, []);
        end;
end;

procedure Tfmuo_sp_uchplan_add.AChangeSemExecute(Sender: TObject);
var
    s1, s2, s4 : string;
    id_kurs, id_sem, id_sss : int64;
    triv : integer;
begin
    if not DSSem.IsEmpty then
    begin
        id_sss := StrToInt64(DSSem.fbn('ID_SP_SEMESTR').AsString);
        if DSH.Locate('ID_SP_SEMESTR', id_sss, []) then
        begin
            showmessage('Неможливо змінити, бо вже заповнені години на цей семестр!');
            exit;
        end;
        if DSControl.Locate('ID_SP_SEMESTR', id_sss, []) then
        begin
            showmessage('Неможливо змінити, бо вже заповнен контроль на цей семестр!');
            exit;
        end;

        s1 := DSSem.fbn('NAME_KURS').AsString + '(' + DSSem.fbn('SHORT_NAME_KURS').AsString + ')';
        s2 := DSSem.fbn('NAME_SEM').AsString + '(' + DSSem.fbn('SHORT_NAME_KURS').AsString + ')';
        s4 := DSSem.fbn('TRIVALIST').AsString;
        id_kurs     := StrToInt64(DSSem.fbn('ID_SP_KURS').AsString);
        id_sem      := StrToInt64(DSSem.fbn('ID_SP_SEMESTR').AsString);
        triv        := DSSem.fbn('TRIVALIST').AsInteger;
        if sem_show(self, Self, 2, id_kurs, id_sem, triv, s1, s2, s4) then
        begin
            TWr.DefaultDatabase := DB;
            Stored.Transaction  := TWr;
            try
                TWr.StartTransaction;
                Stored.StoredProcName := 'UO_TEMP_HOURS_SEM_UPDATE';
                Stored.ParamByName('ID_SESSION').AsInt64              := id_session;
                Stored.ParamByName('ID_SP_KURS').AsInt64              := id_kurs;
                Stored.ParamByName('ID_SP_SEMESTR').AsInt64           := id_sem;
                Stored.ParamByName('ID_SP_UCH_PL_SEM').AsInt64        := StrToInt64(DSSem.fbn('ID_SP_UCH_PL_SEM').AsString);
                Stored.ParamByName('TRIVALIST').AsInteger             := triv;
                Stored.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            ARefSemExecute(Sender);
        end;
    end;
end;

procedure Tfmuo_sp_uchplan_add.InssExecute(Sender: TObject);
begin
    if reg <> 3 then
    begin
        if PageControl1.ActivePage = TabSheet2 then AAddSemExecute(Sender);
        if PageControl1.ActivePage = TabSheet3 then AAddLExecute(Sender);
        if PageControl1.ActivePage = TabSheet4 then AAddHExecute(Sender);
        if PageControl1.ActivePage = TabSheet5 then AAddCExecute(Sender);
    end;
end;

procedure Tfmuo_sp_uchplan_add.F2sExecute(Sender: TObject);
begin
    if reg <> 3 then
    begin
        if PageControl1.ActivePage = TabSheet2 then AChangeSemExecute(Sender);
        if PageControl1.ActivePage = TabSheet4 then AChangeHExecute(Sender);
        if PageControl1.ActivePage = TabSheet5 then AChangeCExecute(Sender);
    end;
end;

procedure Tfmuo_sp_uchplan_add.DelsExecute(Sender: TObject);
begin
//    if PageControl1.ActivePage = TabSheet2 then ADelHoursExecute(Sender);
//    if PageControl1.ActivePage = TabSheet3 then ADelRExecute(Sender);
//    if PageControl1.ActivePage = TabSheet4 then ADelHExecute(Sender);
end;

procedure Tfmuo_sp_uchplan_add.AGroupExecute(Sender: TObject);
begin
    cxGridDBTableView1.OptionsView.GroupByBox := not cxGridDBTableView1.OptionsView.GroupByBox;
end;

procedure Tfmuo_sp_uchplan_add.AGroupCExecute(Sender: TObject);
begin
    cxGridDBTableView2.OptionsView.GroupByBox := not cxGridDBTableView2.OptionsView.GroupByBox;
end;

procedure Tfmuo_sp_uchplan_add.AAddCExecute(Sender: TObject);
var
    id_type, id_sem, id_disc, id_semest_poz : int64;
    s1, s2, s4 : string;
    f1, f2, f3 : double;
begin
    id_type   := -1;
    id_sem    := -1;
    id_disc   := -1;
    f1        := 0;
    f2        := 0;
    f3        := 0;
    s1        := '';
    s2        := '';
    s4        := '';
    if show_control(Self, Self, id_type, id_sem, id_disc, s1, s2, s4, f1, f2, f3) then
    begin
        TWr.DefaultDatabase := DB;
        DSSave.Database     := DB;
        DSSave.Transaction  := TWr;
        id_semest_poz       := -1;
        try
            TWr.StartTransaction;
            DSSave.Close;
            DSSave.Sqls.SelectSQL.Text := 'select * from UO_TEMP_CONTROL_INSERT('+IntToStr(id_session)+', '+IntToStr(id_disc)+', '+IntToStr(id_sem)+', '+IntToStr(id_type)+', '+FloatToStr(f1)+', '+FloatToStr(f2)+', '+FloatToStr(f3)+') ';
            DSSave.Open;
            id_semest_poz := StrToInt64(DSSave.fbn('ID_SP_DISC_CONTROL').AsString);
            DSSave.Close;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
        end end;
        ARefControlExecute(sender);
        if not DSControl.Locate('ID_SP_DISC_CONTROL', id_semest_poz, []) then DSH.Last;
    end;
end;

procedure Tfmuo_sp_uchplan_add.AChangeCExecute(Sender: TObject);
var
    id_type, id_sem, id_disc : int64;
    s1, s2, s4 : string;
    f1, f2, f3 : double;
begin
    if not DSControl.IsEmpty then
    begin
        id_type   := StrToInt64(DSControl.fbn('ID_TYPE_CONTROL').AsString);
        id_sem    := StrToInt64(DSControl.fbn('ID_SP_SEMESTR_PL').AsString);
        id_disc   := StrToInt64(DSControl.fbn('ID_SP_PL_PERELIC').AsString);
        f1        := DSControl.fbn('VAL_KONT').AsFloat;
        f2        := DSControl.fbn('VAL_GROUP').AsFloat;
        f3        := DSControl.fbn('VAL_PERCENT').AsFloat;
        s1        := DSControl.fbn('NAME_DISC').AsString;
        s2        := DSControl.fbn('NAME_SEM').AsString;
        s4        := DSControl.fbn('NAME_TYPE').AsString;
        if show_control(Self, Self, id_type, id_sem, id_disc, s1, s2, s4, f1, f2, f3) then
        begin
            TWr.DefaultDatabase := DB;
            Stored.Transaction  := TWr;
            try
                TWr.StartTransaction;
                Stored.StoredProcName := 'UO_TEMP_CONTROL_UPDATE';
                Stored.ParamByName('D_ID_SESSION').AsInt64            := id_session;
                Stored.ParamByName('id_sp_disc_control').AsInt64      := StrToInt64(DSControl.fbn('ID_SP_DISC_CONTROL').AsString);
                Stored.ParamByName('ID_SP_PL_PERELIK').AsInt64        := id_disc;
                Stored.ParamByName('ID_SP_SEMESTR').AsInt64           := id_sem;
                Stored.ParamByName('ID_SP_TYPE_CONTROL').AsInt64      := id_type;
                Stored.ParamByName('VAL_KONT').AsFloat                := f1;
                Stored.ParamByName('VAL_GROUP').AsFloat               := f2;
                Stored.ParamByName('VAL_PERCENT').AsFloat             := f3;
                Stored.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            ARefControlExecute(sender);
        end;
    end;
end;

procedure Tfmuo_sp_uchplan_add.ADelCExecute(Sender: TObject);
begin
    if not DSControl.IsEmpty then
    begin
        if MessageBox(Handle, Pchar('Ви дійсно бажаєте видалити часи ' + DSControl.FieldByName('VAL_HOURS').AsString + '?'), Pchar('Увага!'), MB_YESNO + MB_DEFBUTTON2)=mrYes then
        begin
            TWr.DefaultDatabase := DB;
            Stored.Transaction  := TWr;
            try
                TWr.StartTransaction;
                Stored.StoredProcName := 'UO_TEMP_CONTROL_DELETE';
                Stored.ParamByName('D_ID_SESSION').AsInt64      := id_session;
                Stored.ParamByName('D_ID_SP_CONTROL').AsInt64   := StrToInt64(DSControl.fbn('ID_SP_DISC_CONTROL').AsString);
                Stored.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            ARefControlExecute(sender);
        end;
    end;
end;

procedure Tfmuo_sp_uchplan_add.ARefControlExecute(Sender: TObject);
var
    id_r : int64;
begin
    id_r := -1;
    if not DSControl.IsEmpty then
    begin
        try id_r := StrToInt64(DSControl.fbn('ID_SP_DISC_CONTROL').AsString); except id_r := -1; end;
    end;
    DSControl.CloseOpen(false);

    if not DSControl.IsEmpty then
    begin
        cxGridDBTableView2.DataController.GotoFirst;
        while not cxGridDBTableView2.DataController.IsEOF do
        begin
            cxGridDBTableView2.Controller.FocusedRecord.Expand(true);
            cxGridDBTableView2.DataController.GotoNext;
        end;
        cxGridDBTableView2.Controller.FocusedRecord.Expand(true);
    end;
    
    DSControl.locate('ID_SP_DISC_CONTROL', id_r, []);
end;

procedure Tfmuo_sp_uchplan_add.PageControl1Change(Sender: TObject);
begin
    if PageControl1.ActivePage = TabSheet2 then cxGrid2.SetFocus;
    if PageControl1.ActivePage = TabSheet3 then cxGrid1.SetFocus;
    if PageControl1.ActivePage = TabSheet4 then cxGrid3.SetFocus;
    if PageControl1.ActivePage = TabSheet5 then cxGrid4.SetFocus;
end;

procedure Tfmuo_sp_uchplan_add.cxGrid2DBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if reg <> 3 then
        if key = VK_DELETE then ADelHoursExecute(Sender);
end;

procedure Tfmuo_sp_uchplan_add.cxGridDBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if reg <> 3 then
        if key = VK_DELETE then ADelHExecute(Sender);
end;

procedure Tfmuo_sp_uchplan_add.cxGridDBTableView2KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if reg <> 3 then
        if key = VK_DELETE then ADelCExecute(Sender);
end;

procedure Tfmuo_sp_uchplan_add.AAddSpecExecute(Sender: TObject);
begin
    if not DSLeft.IsEmpty then AddSpec(StrToInt64(DSLeft.fbn('ID_SP_CIKL_PDG').AsString));
end;

procedure Tfmuo_sp_uchplan_add.AddSpec(id_cikl: int64);
var
    InputParam : TAArray;
    id_disc, id_special : int64;
    ects : double;
begin
  if not DSLeft.IsEmpty then
  begin
    InputParam := TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'UO_SP_SPECIALIZATION.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DB.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
    ShowAllUoBpl(self, InputParam);

    id_special := InputParam['OutPut']['ID_SP_SPECIALIZATION'].AsInt64;

    InputParam.Free;

    if id_special <> -1 then
    begin
        InputParam := TAArray.Create;
        InputParam['Name_Bpl'].AsString                     := 'UO_SP_DISC.bpl';
        InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DB.Handle);
        InputParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
        ShowAllUoBpl(self, InputParam);
        id_disc := InputParam['OutPut']['ID_SP_DISC'].AsInt64;
        InputParam.Free;
        if id_disc <> -1 then
        begin
            if uo_show_ects(ects) then
            begin
                TWr.DefaultDatabase := DB;
                Stored.Transaction  := TWr;
                try
                    TWr.StartTransaction;
                    Stored.StoredProcName := 'UO_TEMP_UCH_PL_PERELIK_INS';
                    Stored.ParamByName('D_ID_CIKL').AsInt64            := id_cikl;
                    Stored.ParamByName('D_ID_SP_UCH_PLAN').AsInt64     := id;
                    Stored.ParamByName('D_ID_SESSION').AsInt64         := id_session;
                    Stored.ParamByName('D_ID_DISC').AsInt64            := id_disc;
                    Stored.ParamByName('D_ID_SPECIALIZATION').AsInt64  := id_special;
                    Stored.ParamByName('D_ECTS').asFloat               := ects;
                    Stored.ExecProc;
                    TWr.Commit;
                except on E:Exception do begin
                    TWr.Rollback;
                    ShowMessage(E.Message);
                end end;
                Refresh;
            end;
        end;
    end;
  end;
end;

procedure Tfmuo_sp_uchplan_add.AChangeECTSExecute(Sender: TObject);
var
    ects : double;
begin
    if not DSLeft.IsEmpty then
    begin
        try ects := DSLeft.fbn('ECTS').AsFloat; except ects := 0 end;
        if uo_show_ects(ects) then
        begin
            TWr.DefaultDatabase := DB;
            Stored.Transaction  := TWr;
            try
                TWr.StartTransaction;
                Stored.StoredProcName := 'UO_TEMP_PERELIC_ECTS_C';
                Stored.ParamByName('D_ECTS').asFloat                  := ects;
                Stored.ParamByName('D_ID_SP_CIKL_PDG').AsInt64        := StrToInt64(DSLeft.FieldByName('ID_SP_CIKL_PDG').AsString);
                Stored.ParamByName('D_ID_SP_DISC').AsInt64            := StrToInt64(DSLeft.FieldByName('ID_SP_DISC').AsString);
                Stored.ParamByName('D_ID_SPECIALIZATION').AsInt64     := StrToInt64(DSLeft.FieldByName('ID_SP_SPECIALIZATION').AsString);
                Stored.ParamByName('D_ID_UCH_PLAN').AsInt64           := id;
                Stored.ParamByName('D_ID_SESSION').AsInt64            := id_session;
                Stored.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            Refresh;
        end;
    end;
end;

procedure Tfmuo_sp_uchplan_add.SpeedButton1Click(Sender: TObject);
begin
    if not DSLeft.IsEmpty then
    begin
        cxGrid1DBTableView1.DataController.GotoFirst;
        while not cxGrid1DBTableView1.DataController.IsEOF do
        begin
            cxGrid1DBTableView1.Controller.FocusedRecord.Expand(true);
            cxGrid1DBTableView1.DataController.GotoNext;
        end;
        cxGrid1DBTableView1.Controller.FocusedRecord.Expand(true);
    end;
end;

procedure Tfmuo_sp_uchplan_add.SpeedButton2Click(Sender: TObject);
begin
    if not DSLeft.IsEmpty then
    begin
        cxGrid1DBTableView1.DataController.GotoFirst;
        while not cxGrid1DBTableView1.DataController.IsEOF do
        begin
            cxGrid1DBTableView1.Controller.FocusedRecord.Collapse(true);
            cxGrid1DBTableView1.DataController.GotoNext;
        end;
        cxGrid1DBTableView1.Controller.FocusedRecord.Collapse(true);
    end;

end;

procedure Tfmuo_sp_uchplan_add.SpeedButton3Click(Sender: TObject);
begin
    if not DSH.IsEmpty then
    begin
        cxGridDBTableView1.DataController.GotoFirst;
        while not cxGridDBTableView1.DataController.IsEOF do
        begin
            cxGridDBTableView1.Controller.FocusedRecord.Expand(true);
            cxGridDBTableView1.DataController.GotoNext;
        end;
        cxGridDBTableView1.Controller.FocusedRecord.Expand(true);
    end;

end;

procedure Tfmuo_sp_uchplan_add.SpeedButton4Click(Sender: TObject);
begin
    if not DSH.IsEmpty then
    begin
        cxGridDBTableView1.DataController.GotoFirst;
        while not cxGridDBTableView1.DataController.IsEOF do
        begin
            cxGridDBTableView1.Controller.FocusedRecord.Collapse(true);
            cxGridDBTableView1.DataController.GotoNext;
        end;
        cxGridDBTableView1.Controller.FocusedRecord.Collapse(true);
    end;
end;

procedure Tfmuo_sp_uchplan_add.SpeedButton5Click(Sender: TObject);
begin
    if not DSControl.IsEmpty then
    begin
        cxGridDBTableView2.DataController.GotoFirst;
        while not cxGridDBTableView2.DataController.IsEOF do
        begin
            cxGridDBTableView2.Controller.FocusedRecord.Expand(true);
            cxGridDBTableView2.DataController.GotoNext;
        end;
        cxGridDBTableView2.Controller.FocusedRecord.Expand(true);
    end;
end;

procedure Tfmuo_sp_uchplan_add.SpeedButton6Click(Sender: TObject);
begin
    if not DSControl.IsEmpty then
    begin
        cxGridDBTableView2.DataController.GotoFirst;
        while not cxGridDBTableView2.DataController.IsEOF do
        begin
            cxGridDBTableView2.Controller.FocusedRecord.Collapse(true);
            cxGridDBTableView2.DataController.GotoNext;
        end;
        cxGridDBTableView2.Controller.FocusedRecord.Collapse(true);
    end;
end;

end.
