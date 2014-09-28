unit SpPeople_EditForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet,
  pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxCheckBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ToolWin, ComCtrls, DBCtrls,
  StdCtrls, cxButtons, cxButtonEdit, cxDropDownEdit, cxCalendar,
  cxContainer, cxMaskEdit, Buttons, ExtCtrls, IBase, SpPeople_Types, z_dmCommonStyles,
  FIBDatabase, pFIBDatabase;

type
  TfManEdit = class(TForm)
    PeoplePageControl: TPageControl;
    MainPage: TTabSheet;
    Panel1: TPanel;
    GenearlInfoGroupBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CopyFIOBtn: TSpeedButton;
    FamiliaEdit: TcxMaskEdit;
    ImyaEdit: TcxMaskEdit;
    OtchestvoEdit: TcxMaskEdit;
    RusFamEdit: TcxMaskEdit;
    RusImyaEdit: TcxMaskEdit;
    RusOtchEdit: TcxMaskEdit;
    SexBox: TcxComboBox;
    BirthDateEdit: TcxDateEdit;
    AdditionalBox: TGroupBox;
    CardNumItemLabel: TLabel;
    Label9: TLabel;
    TinEdit: TcxMaskEdit;
    SocCardNumEdit: TcxMaskEdit;
    AdressGroupBox: TGroupBox;
    Label10: TLabel;
    BirthPlaceLabel: TLabel;
    AdressEdit: TcxButtonEdit;
    BirthPlaceEdit: TcxButtonEdit;
    ClearCurAdrBtn: TcxButton;
    ClearBirthAdrBtn: TcxButton;
    PassPage: TTabSheet;
    Label12: TLabel;
    VidanDBText: TDBText;
    ToolBar1: TToolBar;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    ViewButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    PasportGrid: TcxGrid;
    PasportGridDBTableView1: TcxGridDBTableView;
    PasportGridDBTableView1DBColumn1: TcxGridDBColumn;
    PasportGridDBTableView1DBColumn2: TcxGridDBColumn;
    PasportGridDBTableView1DBColumn3: TcxGridDBColumn;
    PasportGridDBTableView1DBColumn4: TcxGridDBColumn;
    PasportGridDBTableView1DBColumn5: TcxGridDBColumn;
    PasportGridLevel1: TcxGridLevel;
    Panel2: TPanel;
    ActualPaspCheckBox: TcxCheckBox;
    FamiliPage: TTabSheet;
    FamilyToolBar: TToolBar;
    FamilyAddBtn: TSpeedButton;
    FamilyModifyBtn: TSpeedButton;
    FamilyDelBtn: TSpeedButton;
    FamilyGrid: TcxGrid;
    FamilyTV: TcxGridDBTableView;
    FamilyTVFIO: TcxGridDBColumn;
    FamilyTVNAME_RELATION: TcxGridDBColumn;
    FamilyTVBIRTH_DATE: TcxGridDBColumn;
    FamilyGridLevel1: TcxGridLevel;
    AdditionalPAge: TTabSheet;
    PhonePage: TGroupBox;
    WorkPhoneNum: TLabel;
    HomePhoneLabel: TLabel;
    WorkPhoneEdit: TcxTextEdit;
    HomePhoneEdit: TcxTextEdit;
    NationalityBox: TGroupBox;
    Label11: TLabel;
    NationalityComboBox: TcxLookupComboBox;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    ManModProc: TpFIBStoredProc;
    GetIdManQuery: TpFIBDataSet;
    GetIdManQueryIDMAN: TFIBIntegerField;
    DetailsQuery: TpFIBDataSet;
    DetailsQueryID_MAN: TFIBIntegerField;
    DetailsQueryID_SEX: TFIBIntegerField;
    DetailsQueryFAMILIA: TFIBStringField;
    DetailsQueryIMYA: TFIBStringField;
    DetailsQueryOTCHESTVO: TFIBStringField;
    DetailsQueryRUS_FAMILIA: TFIBStringField;
    DetailsQueryRUS_IMYA: TFIBStringField;
    DetailsQueryRUS_OTCHESTVO: TFIBStringField;
    DetailsQueryBIRTH_DATE: TFIBDateField;
    DetailsQueryID_BIRTH_PLACE: TFIBIntegerField;
    DetailsQueryID_ADRESS: TFIBIntegerField;
    DetailsQueryTIN: TFIBStringField;
    DetailsQuerySOC_CARD_NUMBER: TFIBStringField;
    DetailsQueryWORK_PHONE: TFIBStringField;
    DetailsQueryHOME_PHONE: TFIBStringField;
    DetailsQueryID_NATIONALITY: TFIBIntegerField;
    PassDataQuery: TpFIBDataSet;
    PassDataQueryID_MAN: TFIBIntegerField;
    PassDataQueryNUMBER: TFIBStringField;
    PassDataQuerySERIA: TFIBStringField;
    PassDataQueryDATE_BEG: TFIBDateField;
    PassDataQueryVIDAN: TFIBStringField;
    PassDataQueryRUS_FAMILIA: TFIBStringField;
    PassDataQueryRUS_IMYA: TFIBStringField;
    PassDataQueryRUS_OTCHESTVO: TFIBStringField;
    PassDataQueryDATE_END: TFIBDateField;
    PassDataQueryID_PASS_TYPE: TFIBIntegerField;
    PassDataQueryFAMILIA: TFIBStringField;
    PassDataQueryIMYA: TFIBStringField;
    PassDataQueryOTCHESTVO: TFIBStringField;
    PaspDataSourse: TDataSource;
    ProcPassDataInsert: TpFIBStoredProc;
    FamilyDataSet: TpFIBDataSet;
    FamilyDataSetID_RELATION: TFIBIntegerField;
    FamilyDataSetFIO: TFIBStringField;
    FamilyDataSetBIRTH_DATE: TFIBDateField;
    FamilyDataSetID_MAN_INT: TFIBIntegerField;
    FamilyDataSetNAME_RELATION: TFIBStringField;
    FamilyDataSource: TDataSource;
    NationalityDataSet: TpFIBDataSet;
    NationalityDataSetID_NATIONALITY: TFIBIntegerField;
    NationalityDataSetNAME_NATIONALITY: TFIBStringField;
    NationalityDataSource: TDataSource;
    GetAdressDataSet: TpFIBDataSet;
    GetAdressDataSetZIPCODE: TFIBStringField;
    GetAdressDataSetID_CITY_AREA: TFIBIntegerField;
    GetAdressDataSetID_STREET: TFIBIntegerField;
    GetAdressDataSetKORPUS: TFIBStringField;
    GetAdressDataSetHOUSE: TFIBStringField;
    GetAdressDataSetFLAT: TFIBStringField;
    GetAdressDataSetDATE_BEG: TFIBDateField;
    GetAdressDataSetDATE_END: TFIBDateField;
    GetAdressDataSetSTREET_NAME: TFIBStringField;
    GetAdressDataSetPLACE_NAME: TFIBStringField;
    GetAdressDataSetCOUNTRY_NAME: TFIBStringField;
    GetAdressDataSetDISTRICT_NAME: TFIBStringField;
    GetAdressDataSetREGION_NAME: TFIBStringField;
    GetAdressDataSetID_ADR_PK: TFIBIntegerField;
    GetAdressDataSetCITY_AREA_NAME: TFIBStringField;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
  private
    { Private declarations }
    pLanguageIndex:Integer;
    pStylesDM:TStylesDM;
    function CheckData:Boolean;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AEditMode:TEditMode;IdMan:Integer=-1); reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfManEdit.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AEditMode:TEditMode;IdMan:Integer=-1);
begin
  inherited Create(AOwner);
//******************************************************************************
  pStylesDM:=TStylesDM.Create(Self);
  PasportGridDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
  FamilyTV.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
end;

function TfManEdit.CheckData:Boolean;
begin
CheckData:=True;
   if FamiliaEdit.Text='' then
        begin
        MessageDlg('Не задано необхідно поле'+''' Фамілія''',mtError,[mbOk],0);
        CheckData:=False;
        FamiliaEdit.SetFocus;
        Exit;
        end;
   if ImyaEdit.Text='' then
        begin
        MessageDlg('Не задано необхідно поле'+''' Ім''я''',mtError,[mbOk],0);
        CheckData:=False;
        ImyaEdit.SetFocus;
        Exit;
        end;
   if OtchestvoEdit.Text='' then
        begin
        MessageDlg('Не задано необхідно поле'+''' По батькові''',mtError,[mbOk],0);
        CheckData:=False;
        OtchestvoEdit.SetFocus;
        Exit;
        end;
   if RusFamEdit.Text='' then
        begin
        MessageDlg('Не задано необхідно поле'+''' Фамилия''',mtError,[mbOk],0);
        CheckData:=False;
        RusFamEdit.SetFocus;
        Exit;
        end;
   if RusImyaEdit.Text='' then
        begin
        MessageDlg('Не задано необхідно поле'+''' Имя''',mtError,[mbOk],0);
        CheckData:=False;
        RusImyaEdit.SetFocus;
        Exit;
        end;
   if RusOtchEdit.Text='' then
        begin
        MessageDlg('Не задано необхідно поле'+''' Отчество''',mtError,[mbOk],0);
        CheckData:=False;
        RusOtchEdit.SetFocus;
        Exit;
        end;
end;


end.
