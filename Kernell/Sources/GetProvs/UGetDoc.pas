unit UGetDoc;

interface

uses

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBase, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, ComCtrls,
  ToolWin, ImgList, cxClasses, ExtCtrls, StdCtrls, DBCtrls,
  pFibStoredProc, cxButtonEdit, cxGridCardView, cxGridDBCardView,
  cxDropDownEdit, cxTextEdit, cxContainer,
  cxMaskEdit, cxCalendar, ActnList, cxDBEdit,
  cxMemo,  Kernel,  cxCheckBox, Menus, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Halcn6db, Registry, AccMGMT, frxClass, frxDBSet,
  frxDMPExport;

type
  TfrmDocsInfo = class(TForm)
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    ProvsDataSet: TpFIBDataSet;
    StyleRepository: TcxStyleRepository;
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
    SmallImages: TImageList;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    UpdateButton: TToolButton;
    ViewButton: TToolButton;
    RefreshButton: TToolButton;
    CloseButton: TToolButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    provsView: TcxGridDBBandedTableView;
    provsViewDBBandedColumn1: TcxGridDBBandedColumn;
    provsViewDBBandedColumn2: TcxGridDBBandedColumn;
    provsViewDBBandedColumn3: TcxGridDBBandedColumn;
    provsViewDBBandedColumn4: TcxGridDBBandedColumn;
    provsViewDBBandedColumn5: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    provsViewDBBandedColumn6: TcxGridDBBandedColumn;
    provsViewDBBandedColumn7: TcxGridDBBandedColumn;
    provsViewDBBandedColumn8: TcxGridDBBandedColumn;
    provsViewDBBandedColumn9: TcxGridDBBandedColumn;
    SUMMA: TcxGridDBBandedColumn;
    provsViewDBBandedColumn12: TcxGridDBBandedColumn;
    provsViewDBBandedColumn13: TcxGridDBBandedColumn;
    WriteTransaction: TpFIBTransaction;
    ProvsDataSource: TDataSource;
    provsViewDBBandedColumn14: TcxGridDBBandedColumn;
    cxGrid1CardView1: TcxGridCardView;
    cxGrid1CardView1CardViewRow1: TcxGridCardViewRow;
    cxGrid1CardView1CardViewRow2: TcxGridCardViewRow;
    cxGrid1CardView1CardViewRow3: TcxGridCardViewRow;
    cxGrid1CardView1CardViewRow4: TcxGridCardViewRow;
    cxGrid1CardView1CardViewRow5: TcxGridCardViewRow;
    cxGrid1CardView1CardViewRow6: TcxGridCardViewRow;
    cxGrid1CardView1CardViewRow7: TcxGridCardViewRow;
    cxGrid1CardView1CardViewRow8: TcxGridCardViewRow;
    cxGrid1CardView1CardViewRow9: TcxGridCardViewRow;
    cxGrid1CardView1CardViewRow10: TcxGridCardViewRow;
    cxGrid1DBCardView1: TcxGridDBCardView;
    cxGrid1DBCardView1DBCardViewRow1: TcxGridDBCardViewRow;
    cxGrid1DBCardView1DBCardViewRow2: TcxGridDBCardViewRow;
    cxGrid1DBCardView1DBCardViewRow3: TcxGridDBCardViewRow;
    cxGrid1DBCardView1DBCardViewRow4: TcxGridDBCardViewRow;
    cxGrid1DBCardView1DBCardViewRow5: TcxGridDBCardViewRow;
    cxGrid1DBCardView1DBCardViewRow6: TcxGridDBCardViewRow;
    cxGrid1DBCardView1DBCardViewRow7: TcxGridDBCardViewRow;
    cxGrid1DBCardView1DBCardViewRow8: TcxGridDBCardViewRow;
    cxGrid1DBCardView1DBCardViewRow9: TcxGridDBCardViewRow;
    cxGrid1DBCardView1DBCardViewRow10: TcxGridDBCardViewRow;
    DetailDataSet: TpFIBDataSet;
    DetailDataSource: TDataSource;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBCardView2: TcxGridDBCardView;
    cxGrid1DBCardView2DBCardViewRow1: TcxGridDBCardViewRow;
    cxGrid1DBCardView2DBCardViewRow2: TcxGridDBCardViewRow;
    cxGrid1DBCardView2DBCardViewRow3: TcxGridDBCardViewRow;
    cxGrid1DBCardView2DBCardViewRow4: TcxGridDBCardViewRow;
    cxGrid1DBCardView2DBCardViewRow5: TcxGridDBCardViewRow;
    cxGrid1DBCardView2DBCardViewRow6: TcxGridDBCardViewRow;
    cxGrid1DBCardView2DBCardViewRow7: TcxGridDBCardViewRow;
    cxGrid1DBCardView2DBCardViewRow8: TcxGridDBCardViewRow;
    cxGrid1DBCardView2DBCardViewRow9: TcxGridDBCardViewRow;
    cxGrid1DBCardView2DBCardViewRow10: TcxGridDBCardViewRow;
    cxGrid1DBCardView3: TcxGridDBCardView;
    cxGrid1DBCardView3DBCardViewRow1: TcxGridDBCardViewRow;
    cxGrid1DBCardView3DBCardViewRow2: TcxGridDBCardViewRow;
    cxGrid1DBCardView3DBCardViewRow3: TcxGridDBCardViewRow;
    cxGrid1DBCardView3DBCardViewRow4: TcxGridDBCardViewRow;
    cxGrid1DBCardView3DBCardViewRow5: TcxGridDBCardViewRow;
    cxGrid1DBCardView3DBCardViewRow6: TcxGridDBCardViewRow;
    cxGrid1DBCardView3DBCardViewRow7: TcxGridDBCardViewRow;
    cxGrid1DBCardView3DBCardViewRow8: TcxGridDBCardViewRow;
    cxGrid1DBCardView3DBCardViewRow9: TcxGridDBCardViewRow;
    cxGrid1DBCardView3DBCardViewRow10: TcxGridDBCardViewRow;
    provsViewDBBandedColumn10: TcxGridDBBandedColumn;
    DBTemplatesDataSet: TpFIBDataSet;
    DBTemplatesDataSource: TDataSource;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn7: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn8: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn9: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn10: TcxGridDBColumn;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn8: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn9: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn10: TcxGridDBColumn;
    provsViewDBBandedColumn15: TcxGridDBBandedColumn;
    ColAnInfoDataSet: TpFIBDataSet;
    KrTemplatesDataSet: TpFIBDataSet;
    KrTemplatesDataSource: TDataSource;
    cxGrid3: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    TypeDocDataSet: TpFIBDataSet;
    TypeDataSource: TDataSource;
    InsertAction: TAction;
    EditSumAction: TAction;
    InfoDoc: TpFIBDataSet;
    DocInfoDataSource: TDataSource;
    SaveButton: TToolButton;
    Splitter1: TSplitter;
    provsViewDBBandedColumn16: TcxGridDBBandedColumn;
    cxErrorStyle: TcxStyle;
    Action3: TAction;
    ErrorProvsDataSet: TpFIBDataSet;
    ErrorProvsDataSource: TDataSource;
    provsViewDBBandedColumn17: TcxGridDBBandedColumn;
    Panel1: TPanel;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DocDate: TcxDateEdit;
    NumDoc: TcxTextEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    TabSheet4: TTabSheet;
    Label7: TLabel;
    DateProv: TcxDateEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EdCustomer: TcxButtonEdit;
    EdAccNative: TcxButtonEdit;
    Label12: TLabel;
    ProvInfoDataSet: TpFIBDataSet;
    ProvInfoDataSource: TDataSource;
    provsViewDBBandedColumn18: TcxGridDBBandedColumn;
    provsViewDBBandedColumn19: TcxGridDBBandedColumn;
    MBIniDataSet: TpFIBDataSet;
    Panel3: TPanel;
    PageControl1: TPageControl;
    TabSheet5: TTabSheet;
    cxGrid5: TcxGrid;
    cxGrid5DBTableView1: TcxGridDBTableView;
    cxGrid5DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid5DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid5DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid5Level1: TcxGridLevel;
    TabSheet1: TTabSheet;
    ActionLog: TRichEdit;
    TabSheet2: TTabSheet;
    cxGrid4: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2DBColumn1: TcxGridDBColumn;
    cxGridDBTableView2DBColumn2: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    TabSheet6: TTabSheet;
    cxGrid6: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    provsViewDBBandedColumn20: TcxGridDBBandedColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    AddPopupMenu: TPopupMenu;
    N6: TMenuItem;
    cxStyleTitle: TcxStyle;
    DocType: TcxLookupComboBox;
    cxStyleMarked: TcxStyle;
    ToolButton2: TToolButton;
    ViewPopupMenu: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    provsViewDBBandedColumn21: TcxGridDBBandedColumn;
    cxCheckBox1: TcxCheckBox;
    N4: TMenuItem;
    EdComment: TcxMemo;
    TabSheet7: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    EdAcc: TcxTextEdit;
    N5: TMenuItem;
    N7: TMenuItem;
    N11: TMenuItem;
    saveaction: TAction;
    ToolButton3: TToolButton;
    AddDog: TAction;
    N3: TMenuItem;
    DBF1: TMenuItem;
    HalcyonDataSet1: THalcyonDataSet;
    cxCheckBox3: TcxCheckBox;
    DBF2: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    ToolButton1: TToolButton;
    frxDBDataset1: TfrxDBDataset;
    Panel4: TPanel;
    cxCheckBox2: TcxCheckBox;
    DelPopupMenu: TPopupMenu;
    N13: TMenuItem;
    id_prov: TcxGridDBBandedColumn;
    TabSheet8: TTabSheet;
    ToolButton4: TToolButton;
    cxDBMemo1: TcxDBMemo;
    provsViewDBBandedColumn11: TcxGridDBBandedColumn;
    frxReport1: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshButtonClick(Sender: TObject);
    procedure cxGrid1DBBandedTableView1DBBandedColumn1PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBBandedTableView1DBBandedColumn6PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBBandedTableView1DBBandedColumn2PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBBandedTableView1DBBandedColumn7PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBBandedTableView1DBBandedColumn14PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBBandedTableView1DBBandedColumn5PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid2DBTableView1DblClick(Sender: TObject);
    procedure provsViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure DBTemplatesDataSetAfterOpen(DataSet: TDataSet);
    procedure KrTemplatesDataSetAfterOpen(DataSet: TDataSet);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid2DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditSumActionExecute(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure cxGrid1DBBandedTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ViewButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox3Click(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure test1Click(Sender: TObject);
    procedure cxGrid1DBBandedTableView1DBBandedColumn8PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBBandedTableView1DBBandedColumn9PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBBandedTableView1DBBandedColumn3PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBBandedTableView1DBBandedColumn4PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure provsViewDblClick(Sender: TObject);
    procedure provsViewKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Panel2DblClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure InsertActionExecute(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure DBF1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBF2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DocDatePropertiesChange(Sender: TObject);
    procedure NumDocPropertiesChange(Sender: TObject);
    procedure DocTypePropertiesChange(Sender: TObject);
    procedure cxDBTextEdit1PropertiesChange(Sender: TObject);
    procedure DateProvPropertiesChange(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
  private
    { Private declarations }
    STRU:KERNEL_MODE_STRUCTURE;
    NativeCustomer:String;
    MAIN_BUHG_FIO:String;
    KEY_SESSION:Int64;
    MBOOK_DATE :TDateTime;
    MBOOK_DATE_Str :String;

    ALL_DOC_DBF_PATH:String;
    ALL_PROV_DBF_PATH:String;
    NEED_HEADER_INFO:Integer;
    CHANGE_FLAG:Boolean;
    CLEAR_TMP_INFO:Integer;

    function  GetDbfIdDoc:Int64;
    procedure loadProvsFromDBF(Id_doc:Int64);
  public
    login:string;
    user:string;
    id_user:int64;
    Mode:Boolean;
    PK_ID      :Int64;
    id_rate_acc_native:integer;
    id_rate_acc:integer;
    id_customer:integer;
    id_form_kod:integer;
    use_mo:integer;
    localWorkPeriod:TDateTime;
    { Public declarations }
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;PK_ID:int64;id_user:Int64;Mode:Boolean;id_form_kod:integer;Workperiod:TDateTime);reintroduce;overload;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Int64;login,user:string;id_form_kod:integer;WorkPeriod:TDateTime;KEY_SESSION:Int64);reintroduce;overload;
    procedure CreateNewDoc(WorkPeriod:TDateTime);
    procedure GetSysInfo;
    procedure ConfigureAnGrid;
    procedure ConfigureAnGridBySch(ID_SCH:Integer;View:TcxGridDBTableView);
    procedure UpdateAnalitic(is_credit:Boolean);
    procedure UpdateSum;
    procedure LoadDataToBuffer;
    procedure SaveDataAfterWizard(STRU:WIZARD_GET_PROV_INFO;ID_PROV:Int64);
    procedure GetRigths;
  end;

  function  GetDoc(AOwner:TComponent;
                   DBHandle:TISC_DB_HANDLE;
                   PK_ID:int64;
                   id_user:Int64;
                   Mode:Boolean;
                   login,user:string;
                   id_form_kod:integer;
                   WorkPeriod:TDateTime):Int64;stdcall;
  procedure GetDocBySession(AOwner:TComponent;
                   DBHandle:TISC_DB_HANDLE;
                   id_user:Int64;
                   login,user:string;
                   id_form_kod:integer;
                   WorkPeriod:TDateTime;
                   KEY_SESSION:Int64);stdcall;
  exports GetDoc,GetDocBySession;

implementation
uses GlobalSpr, FIBQuery, UeditSum, BaseTypes, LoadDogManedger, UExDocParams, DogLoaderUnit,
     UTemplates,   UInputProv,  UGetC_By_DT,   UGetDBFPath,  UGetDbfDoc,
  cxGridViewData, UEdComments;

{$R *.dfm}
function GetDoc(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;PK_ID:int64;id_user:Int64;Mode:Boolean;login,user:string;id_form_kod:integer;WorkPeriod:TDateTime):Int64;
     var f:Boolean;
         i:Integer;
         retPK_ID:Int64;
begin
      f:=true;
      retPK_ID:=-1;
      if not Mode
      then begin
                for i:=0 to Application.MainForm.MDIChildCount-1 do
                begin
                     if (Application.MainForm.MDIChildren[i] is TfrmDocsInfo)
                     then begin
                                    if ((Application.MainForm.MDIChildren[i] as TfrmDocsInfo).PK_ID=PK_ID)
                                    then begin
                                              Application.MainForm.MDIChildren[i].BringToFront;
                                              f:=false;
                                    end
                     end;
                 end;
      end;

      if f
      then begin
                  with  TfrmDocsInfo.Create(AOwner,DBHandle,PK_ID,id_user,Mode,id_form_kod,WorkPeriod)  do
                  begin
                        ShowModal;
                        retPK_ID:=PK_ID;
                        Free;
                  end;
      end;

      Result:=retPK_ID;
end;

procedure GetDocBySession(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Int64;login,user:string;id_form_kod:integer;WorkPeriod:TDateTime;KEY_SESSION:Int64);
begin
      with  TfrmDocsInfo.Create(AOwner,DBHandle,id_user,login,user,id_form_kod,WorkPeriod,KEY_SESSION)  do
      begin
            ShowModal;
            Free;
      end;
end;

constructor TfrmDocsInfo.Create(AOwner:TComponent;
                                DBHandle:TISC_DB_HANDLE;
                                PK_ID:int64;
                                id_user:Int64;
                                Mode:Boolean;
                                id_form_kod:integer;
                                Workperiod:TDateTime);
var i:Integer;
    SysInfo:TpFibDataSet;
begin
     inherited Create(AOwner);
     CLEAR_TMP_INFO:=1;
     localWorkPeriod:=WorkPeriod;
     self.id_form_kod:=id_form_kod;
     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;

     self.id_user:=id_user;

     PageControl2.ActivePage:=TabSheet3;
     GetSysInfo;

     TypeDocDataSet.SelectSQL.Text:='select * from pub_ini_type_doc where id_form_kod='+IntToStr(id_form_kod);
     TypeDocDataSet.Open;

     TypeDocDataSet.FetchAll;
     TypeDocDataSet.First;

     self.Mode:=Mode;
     self.PK_ID:=PK_ID;
     ConfigureAnGrid;

     MBIniDataSet.Open;
     if (MBIniDataSet.FieldByName('USE_DEFAULT_VALUES').AsInteger=1)
     then begin
                provsViewDBBandedColumn14.Visible:=false;
                provsViewDBBandedColumn2.Visible :=false;
                provsViewDBBandedColumn3.Visible :=false;
                provsViewDBBandedColumn4.Visible :=false;
                provsViewDBBandedColumn5.Visible :=false;
                provsViewDBBandedColumn7.Visible :=false;
                provsViewDBBandedColumn8.Visible :=false;
                provsViewDBBandedColumn9.Visible :=false;
                provsView.Bands[0].Width:=200;
                provsView.Bands[1].Width:=200;
                cxGrid1DBCardView2DBCardViewRow2.Visible         :=false;
                cxGrid1DBCardView2DBCardViewRow3.Visible         :=false;
                cxGrid1DBCardView2DBCardViewRow4.Visible         :=false;
                cxGrid1DBCardView2DBCardViewRow5.Visible         :=false;
                cxGrid1DBCardView2DBCardViewRow7.Visible         :=false;
                cxGrid1DBCardView2DBCardViewRow8.Visible         :=false;
                cxGrid1DBCardView2DBCardViewRow9.Visible         :=false;
                cxGrid1DBCardView2DBCardViewRow10.Visible        :=false;
     end
     else begin
                provsViewDBBandedColumn14.Visible:=true;
                provsViewDBBandedColumn2.Visible :=true;
                provsViewDBBandedColumn3.Visible :=true;
                provsViewDBBandedColumn4.Visible :=true;
                provsViewDBBandedColumn5.Visible :=true;
                provsViewDBBandedColumn7.Visible :=true;
                provsViewDBBandedColumn8.Visible :=true;
                provsViewDBBandedColumn9.Visible :=true;
                cxGrid1DBCardView2DBCardViewRow2.Visible         :=true;
                cxGrid1DBCardView2DBCardViewRow3.Visible         :=true;
                cxGrid1DBCardView2DBCardViewRow4.Visible         :=true;
                cxGrid1DBCardView2DBCardViewRow5.Visible         :=true;
                cxGrid1DBCardView2DBCardViewRow7.Visible         :=true;
                cxGrid1DBCardView2DBCardViewRow8.Visible         :=true;
                cxGrid1DBCardView2DBCardViewRow9.Visible         :=true;
                cxGrid1DBCardView2DBCardViewRow10.Visible        :=true;
     end;

     if (Mode=true)
     then begin
                CreateNewDoc(Workperiod);
                STRU.KERNEL_ACTION:=1;
                DateProv.Date:=WorkPeriod;
     end
     else begin
                label7.Caption:='Дата редагування';
                LoadDataToBuffer;
                STRU.KERNEL_ACTION:=3;
     end;

     InfoDoc.SelectSQL.Text:='SELECT * FROM MBOOK_DOC_BUFFER_SELECT('+IntToStr(self.KEY_SESSION)+')';
     InfoDoc.Open;

     if (Mode=true)
     then begin
          ActionLog.Lines.Add('Створення документа');
          Caption:='Створення нового документу';
     end
     else begin
          ActionLog.Lines.Add('Редагування документу');
          Caption:='Редагування документу № '+InfoDoc.FieldByName('NUM_DOC').AsString+ ' от '+InfoDoc.FieldByName('DATE_DOC').AsString;
     end;

     provsViewDBBandedColumn10.PropertiesClass := TcxPopupEditProperties;
     TcxPopupEditProperties(provsViewDBBandedColumn10.Properties).PopupControl:=cxGrid2;

     provsViewDBBandedColumn15.PropertiesClass := TcxPopupEditProperties;
     TcxPopupEditProperties(provsViewDBBandedColumn15.Properties).PopupControl:=cxGrid3;

     NumDoc.Text                      := InfoDoc.FieldByName('NUM_DOC').AsString;
     DocDate.Date                     := InfoDoc.FieldByName('DATE_DOC').AsDateTime;
     DocType.editValue                := InfoDoc.FieldByName('ID_TYPE_DOC').Value;
     DateProv.Date                    := InfoDoc.FieldByName('DATE_PROV').AsDateTime;
     EdCustomer.Text                  := InfoDoc.FieldByName('CUSTOMER').AsString;
     EdAcc.Text                       := InfoDoc.FieldByName('ACC_TEXT').AsString;
     EdAccNative.Text                 := InfoDoc.FieldByName('ACC_NATIVE_TEXT').AsString;
     id_rate_acc_native               := InfoDoc.FieldByName('ID_RATE_ACC_NATIVE').Value;
     id_rate_acc                      := InfoDoc.FieldByName('ID_RATE_ACC').Value;
     id_customer                      := InfoDoc.FieldByName('ID_CUSTOMER').Value;
     EdComment.Text                   := InfoDoc.FieldByName('NOTE').AsString;
     cxCheckBox1.Checked              := InfoDoc.FieldByName('PRIHOD').AsBoolean;


     STRU.KEY_SESSION                 := KEY_SESSION;
     STRU.WORKDATE                    := DocDate.Date;
     STRU.DBHANDLE                    := WorkDatabase.Handle;
     STRU.TRHANDLE                    := WriteTransaction.Handle;
     ProvsDataSet.SelectSQL.Text      :=' SELECT * FROM MBOOK_PROV_BUFFER_SELECT('+IntToStr(self.KEY_SESSION)+')';
     DetailDataSet.SelectSQL.Text     :=' SELECT * FROM MBOOK_PROV_BUFFER_SELECT_EX('+IntToStr(self.KEY_SESSION)+')';
     DBTemplatesDataSet.SelectSQL.Text:=' SELECT * FROM PUB_DT_SCH_ANALITIC_SELECT_EX2(:DB_ID_SCH)';
     KRTemplatesDataSet.SelectSQL.Text:=' SELECT * FROM PUB_DT_SCH_ANALITIC_SELECT_EX2(:KR_ID_SCH)';
     ErrorProvsDataSet.SelectSQL.Text :=' SELECT * FROM KERNEL_PROVS_ERRORS WHERE ID_PROV=:ID_PROV AND KEY_SESSION='+IntToStr(self.KEY_SESSION);
     ProvInfoDataSet.SelectSQL.Text   :=' SELECT * FROM MBOOK_GET_PROV_INFO('+IntToStr(self.KEY_SESSION)+',:ID_PROV) ORDER BY INDEX_POS';
     ProvsDataSet.Open;

     if (not self.id_form_kod in [1,9])
     then begin
               SysInfo:=TpFibDataSet.Create(self);
               SysInfo.Database:=WorkDatabase;
               SysInfo.Transaction:=ReadTransaction;
               SysInfo.SelectSQL.Text:=' SELECT * FROM PUB_SYS_DATA ';
               SysInfo.Open;
               if (SysInfo.RecordCount>0)
               then begin

                         if (SysInfo.FieldByName('ENABLE_WORK_WITH_DOCS_IN_MBOOK').Value=1)
                         then SaveButton.Enabled:=true
                         else SaveButton.Enabled:=false;
               end;
               SysInfo.Close;
               SysInfo.Free;
     end;

     if (self.id_form_kod=9) or (self.id_form_kod=99)
     then begin
               DBF1.Visible:=true;
               DBF2.Visible:=true;
     end
     else begin
                cxStyle12.Color        :=$00EBC4A4;
                cxStyle6.Color         :=$00EBC4A4;
                cxStyle13.Color        :=$00EBC4A4;
                DocDate.Style.Color    :=$00EBC4A4;
                NumDoc.Style.Color     :=$00EBC4A4;
                DateProv.Style.Color   :=$00EBC4A4;
                EdCustomer.Style.Color :=$00EBC4A4;
                EdAccNative.Style.Color:=$00EBC4A4;
                DocType.Style.Color    :=$00EBC4A4;
                cxTextEdit1.Style.Color:=$00EBC4A4;
                cxTextEdit2.Style.Color:=$00EBC4A4;
                EdAcc.Style.Color      :=$00EBC4A4;
                cxDBTextEdit1.Style.Color:=$00EBC4A4;
                EdComment.Style.Color  :=$00EBC4A4;

                for i:=0 to StyleRepository.Count-1 do
                begin
                      TcxStyle(StyleRepository.Items[i]).Font.Size:=8;
                end;
     end;


     GetRigths;
end;

procedure TfrmDocsInfo.CreateNewDoc(WorkPeriod:TDateTime);
var CP:TpFibStoredProc;
begin
     KEY_SESSION:=WorkDatabase.Gen_Id('KERNEL_GEN_ID_SESSION',1);
     CP:=TpFibStoredProc.Create(self);
     CP.Database:=WorkDatabase;
     CP.Transaction:=WriteTransaction;
     CP.Transaction.StartTransaction;
     CP.StoredProcName:='MBOOK_CREATE_DOC';
     CP.Prepare;
     CP.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
     CP.ParamByName('COMPUTER').Value:=GlobalSpr.GetComputerNetName;
     CP.ParamByName('WORK_PERIOD').Value:=WorkPeriod;
     CP.ExecProc;
     PK_ID:=CP.ParamByName('PK_ID').AsInt64;
     CP.Transaction.Commit;
     CP.Free;
end;

procedure TfrmDocsInfo.LoadDataToBuffer;
var CP:TpFibStoredProc;
begin
     CP:=TpFibStoredProc.Create(self);
     CP.Database:=WorkDatabase;
     CP.Transaction:=WriteTransaction;
     CP.Transaction.StartTransaction;
     CP.StoredProcName:='MBOOK_LOAD_DATA_TO_BUFFER';
     CP.Prepare;
     CP.ParamByName('PK_ID').AsInt64:=self.PK_ID;
     CP.ExecProc;
     self.KEY_SESSION:=CP.ParamByName('KEY_SESSION').AsInt64;
     CP.Transaction.Commit;
     CP.Free;
end;

procedure TfrmDocsInfo.FormClose(Sender:TObject;
  var Action: TCloseAction);
var CP:TpFibStoredProc;
    reg:TRegistry;
begin
      if CLEAR_TMP_INFO=1
      then begin
                CP:=TpFibStoredProc.Create(self);
                CP.Database:=WorkDatabase;
                CP.Transaction:=WriteTransaction;
                WriteTransaction.StartTransaction;
                CP.StoredProcName:='KERNEL_CLEAR_TMP';
                CP.Prepare;
                CP.ParamByName('KEY_SESSION').AsInt64:=self.KEY_SESSION;
                CP.ExecProc;
                WriteTransaction.Commit;
                CP.Free;
      end;

      Action:=caFree;


      reg:=TRegistry.Create;
      try
         reg.RootKey:=HKEY_CURRENT_USER;
         if  reg.OpenKey('\Software\Budgeting\ALL_DOC_DBF_PATH\',true)
         then begin
                   reg.WriteString('ALL_DOC_DBF_PATH',ALL_DOC_DBF_PATH);
         end;

         if  reg.OpenKey('\Software\Budgeting\NEED_HEADER_INFO\',true)
         then begin
                   reg.WriteString('NEED_HEADER_INFO',IntToStr(NEED_HEADER_INFO));
         end;

         if  reg.OpenKey('\Software\Budgeting\ALL_PROV_DBF_PATH\',true)
         then begin
                   reg.WriteString('ALL_PROV_DBF_PATH',ALL_PROV_DBF_PATH);
         end;

      finally
         reg.Free;
      end;

end;

procedure TfrmDocsInfo.RefreshButtonClick(Sender: TObject);
var ID_PROV :Integer;
begin
     CHANGE_FLAG:=true;
     provsView.Controller.BeginUpdate;
     ID_PROV:=0;
     if ProvsDataSet.RecordCount>0 then ID_PROV:=ProvsDataSet.FieldByName('ID_PROV').AsInteger;
     ProvsDataSet.CloseOpen(true);
     ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
     ConfigureAnGrid;

     InfoDoc.CloseOpen(true);
     PK_ID             :=StrToInt64(InfoDoc.FieldByName('ID_DOC').asString);
     NumDoc.Text       := InfoDoc.FieldByName('NUM_DOC').AsString;
     DocDate.Date      := InfoDoc.FieldByName('DATE_DOC').AsDateTime;
     DateProv.Date     := InfoDoc.FieldByName('DATE_PROV').AsDateTime;
     DocType.editValue := InfoDoc.FieldByName('ID_TYPE_DOC').Value;
     EdComment.Lines.Text:= InfoDoc.FieldByName('NOTE').AsString;

     if InfoDoc.FieldByName('CUSTOMER').Value<>null
     then EdCustomer.Text                  := InfoDoc.FieldByName('CUSTOMER').Value;

     if InfoDoc.FieldByName('ACC_TEXT').Value<>null
     then EdAcc.Text                       := InfoDoc.FieldByName('ACC_TEXT').Value;

     if InfoDoc.FieldByName('ACC_NATIVE_TEXT').Value<>null
     then EdAccNative.Text                 := InfoDoc.FieldByName('ACC_NATIVE_TEXT').Value;

     if InfoDoc.FieldByName('ID_RATE_ACC_NATIVE').Value<>null
     then id_rate_acc_native:=              InfoDoc.FieldByName('ID_RATE_ACC_NATIVE').Value;

     if InfoDoc.FieldByName('ID_RATE_ACC').Value<>null
     then id_rate_acc:=                     InfoDoc.FieldByName('ID_RATE_ACC').Value;

     if InfoDoc.FieldByName('ID_CUSTOMER').Value<>null
     then id_customer:=                     InfoDoc.FieldByName('ID_CUSTOMER').Value;

     MBIniDataSet.CloseOpen(true);
     if (MBIniDataSet.FieldByName('USE_DEFAULT_VALUES').AsInteger=1)
     then begin
        provsViewDBBandedColumn14.Visible:=false;
        provsViewDBBandedColumn2.Visible :=false;
        provsViewDBBandedColumn3.Visible :=false;
        provsViewDBBandedColumn4.Visible :=false;
        provsViewDBBandedColumn5.Visible :=false;
        provsViewDBBandedColumn7.Visible :=false;
        provsViewDBBandedColumn8.Visible :=false;
        provsViewDBBandedColumn9.Visible :=false;

        cxGrid1DBCardView2DBCardViewRow2.Visible         :=false;
        cxGrid1DBCardView2DBCardViewRow3.Visible         :=false;
        cxGrid1DBCardView2DBCardViewRow4.Visible         :=false;
        cxGrid1DBCardView2DBCardViewRow5.Visible         :=false;

        cxGrid1DBCardView2DBCardViewRow7.Visible         :=false;
        cxGrid1DBCardView2DBCardViewRow8.Visible         :=false;
        cxGrid1DBCardView2DBCardViewRow9.Visible         :=false;
        cxGrid1DBCardView2DBCardViewRow10.Visible        :=false;
     end
     else begin
        provsViewDBBandedColumn14.Visible:=true;
        provsViewDBBandedColumn2.Visible :=true;
        provsViewDBBandedColumn3.Visible :=true;
        provsViewDBBandedColumn4.Visible :=true;
        provsViewDBBandedColumn5.Visible :=true;
        provsViewDBBandedColumn7.Visible :=true;
        provsViewDBBandedColumn8.Visible :=true;
        provsViewDBBandedColumn9.Visible :=true;


        cxGrid1DBCardView2DBCardViewRow2.Visible         :=true;
        cxGrid1DBCardView2DBCardViewRow3.Visible         :=true;
        cxGrid1DBCardView2DBCardViewRow4.Visible         :=true;
        cxGrid1DBCardView2DBCardViewRow5.Visible         :=true;

        cxGrid1DBCardView2DBCardViewRow7.Visible         :=true;
        cxGrid1DBCardView2DBCardViewRow8.Visible         :=true;
        cxGrid1DBCardView2DBCardViewRow9.Visible         :=true;
        cxGrid1DBCardView2DBCardViewRow10.Visible        :=true;
     end;
     provsView.Controller.EndUpdate;
end;


procedure TfrmDocsInfo.GetSysInfo;
var SysQuery:TpFibDataSet;
    NativeCusiInfo:TpfibDataset;
begin
    SysQuery:=TpFibDataSet.Create(self);
    SysQuery.Database:=WorkDatabase;
    SysQuery.Transaction:=ReadTransaction;
    SysQuery.SelectSQL.Text:='SELECT * FROM PUB_SYS_DATA, MBOOK_INI_DATA ';
    SysQuery.Open;
    MBOOK_DATE:= SysQuery.FieldByName('MAIN_BOOK_DATE').AsDateTime;
    MAIN_BUHG_FIO:=SysQuery.FieldByName('MAIN_BUHG_FIO').Value;
    if SysQuery.FieldByName('USE_MO').Value<>null
    then use_mo:=SysQuery.FieldByName('USE_MO').Value
    else use_mo:=0;

    DateTimeToString(MBook_date_str,'dd.mm.yyyy',MBook_date);
    SysQuery.Close;
    SysQuery.Free;

    NativeCusiInfo:=TpfibDataset.Create(self);
    NativeCusiInfo.Database:=WorkDatabase;
    NativeCusiInfo.Transaction:=ReadTransaction;
    NativeCusiInfo.SelectSQL.Text:='select cust.SHORT_NAME as NAME from PUB_SYS_DATA s, PUB_SP_CUSTOMER cust where cust.ID_CUSTOMER = s.ORGANIZATION ';
    NativeCusiInfo.Open;
    NativeCusiInfo.FetchAll;
    if (NativeCusiInfo.RecordCount>0)
    then begin
              NativeCustomer:=NativeCusiInfo.FieldByName('NAME').AsString;
    end;
    NativeCusiInfo.Close;
    NativeCusiInfo.Free;
end;

procedure TfrmDocsInfo.cxGrid1DBBandedTableView1DBBandedColumn1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var  STRU:WIZARD_GET_PROV_INFO;
     ID_PROV:Int64;
begin
     //Работа мастера
     STRU.AOWNER        :=self;
     STRU.DBHANDLE      :=WorkDatabase.Handle;
     STRU.MODE          :=11;
     STRU.CR_BY_DT      :=ProvsDataSet.FieldByName('CR_BY_DT').AsInteger;

     STRU.DB_ID_SCH     :=-1;
     STRU.KR_ID_SCH     :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_SCH')).asInt64;

     STRU.DB_ID_SMETA   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_SM')).asInt64;
     STRU.KR_ID_SMETA   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_SM')).asInt64;

     STRU.DB_ID_RAZD    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_RZ')).asInt64;
     STRU.KR_ID_RAZD    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_RZ')).asInt64;

     STRU.DB_ID_STAT    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_ST')).asInt64;
     STRU.KR_ID_STAT    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_ST')).asInt64;

     STRU.DB_ID_KEKV    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_KEKV')).asInt64;
     STRU.KR_ID_KEKV    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_KEKV')).asInt64;

     STRU.DB_ANALIZE1   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE1')).asInt64;
     STRU.DB_ANALIZE2   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE2')).asInt64;
     STRU.DB_ANALIZE3   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE3')).asInt64;
     STRU.DB_ANALIZE4   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE4')).asInt64;
     STRU.DB_ANALIZE5   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE5')).asInt64;
     STRU.DB_ANALIZE6   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE6')).asInt64;
     STRU.DB_ANALIZE7   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE7')).asInt64;
     STRU.DB_ANALIZE8   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE8')).asInt64;
     STRU.DB_ANALIZE9   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE9')).asInt64;
     STRU.DB_ANALIZE10  :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE10')).asInt64;

     STRU.KR_ANALIZE1   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE1')).asInt64;
     STRU.KR_ANALIZE2   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE2')).asInt64;
     STRU.KR_ANALIZE3   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE3')).asInt64;
     STRU.KR_ANALIZE4   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE4')).asInt64;
     STRU.KR_ANALIZE5   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE5')).asInt64;
     STRU.KR_ANALIZE6   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE6')).asInt64;
     STRU.KR_ANALIZE7   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE7')).asInt64;
     STRU.KR_ANALIZE8   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE8')).asInt64;
     STRU.KR_ANALIZE9   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE9')).asInt64;
     STRU.KR_ANALIZE10  :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE10')).asInt64;

     STRU.ACTUAL_DATE   :=localWorkPeriod;
     STRU.WIZARD_FORM_SH:=true;
     STRU.INFO_PANEL_SH :=true;
     STRU.NOT_DIF_BDG_FG:=not cxCheckBox2.Checked;
     STRU.ID_LANGUAGE:=2;
     if Kernel.WizardGetProvInfo(@STRU)
     then begin
               SaveDataAfterWizard(STRU,ProvsDataSet.FieldByName('ID_PROV').Value);
               ID_PROV:=TFibBCDField(ProvsDataSet.FieldByName('ID_PROV')).AsInt64;
               cxGrid1DBTableView1.Controller.BeginUpdate;
               ProvsDataSet.CloseOpen(true);
               ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
               cxGrid1DBTableView1.Controller.EndUpdate;
     end;
end;

procedure TfrmDocsInfo.cxGrid1DBBandedTableView1DBBandedColumn6PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var  STRU:WIZARD_GET_PROV_INFO;
     ID_PROV:Int64;
begin
     //Работа мастера
     STRU.AOWNER        :=self;
     STRU.DBHANDLE      :=WorkDatabase.Handle;
     STRU.MODE          :=11;
     STRU.CR_BY_DT      :=ProvsDataSet.FieldByName('CR_BY_DT').AsInteger;

     STRU.DB_ID_SCH     :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_SCH')).asInt64;
     STRU.KR_ID_SCH     :=-1;

     STRU.DB_ID_SMETA   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_SM')).asInt64;
     STRU.KR_ID_SMETA   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_SM')).asInt64;

     STRU.DB_ID_RAZD    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_RZ')).asInt64;
     STRU.KR_ID_RAZD    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_RZ')).asInt64;

     STRU.DB_ID_STAT    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_ST')).asInt64;
     STRU.KR_ID_STAT    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_ST')).asInt64;

     STRU.DB_ID_KEKV    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_KEKV')).asInt64;
     STRU.KR_ID_KEKV    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_KEKV')).asInt64;

     STRU.DB_ANALIZE1   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE1')).asInt64;
     STRU.DB_ANALIZE2   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE2')).asInt64;
     STRU.DB_ANALIZE3   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE3')).asInt64;
     STRU.DB_ANALIZE4   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE4')).asInt64;
     STRU.DB_ANALIZE5   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE5')).asInt64;
     STRU.DB_ANALIZE6   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE6')).asInt64;
     STRU.DB_ANALIZE7   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE7')).asInt64;
     STRU.DB_ANALIZE8   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE8')).asInt64;
     STRU.DB_ANALIZE9   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE9')).asInt64;
     STRU.DB_ANALIZE10  :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE10')).asInt64;

     STRU.KR_ANALIZE1   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE1')).asInt64;
     STRU.KR_ANALIZE2   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE2')).asInt64;
     STRU.KR_ANALIZE3   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE3')).asInt64;
     STRU.KR_ANALIZE4   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE4')).asInt64;
     STRU.KR_ANALIZE5   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE5')).asInt64;
     STRU.KR_ANALIZE6   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE6')).asInt64;
     STRU.KR_ANALIZE7   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE7')).asInt64;
     STRU.KR_ANALIZE8   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE8')).asInt64;
     STRU.KR_ANALIZE9   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE9')).asInt64;
     STRU.KR_ANALIZE10  :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE10')).asInt64;

     STRU.ACTUAL_DATE   :=localWorkPeriod;
     STRU.WIZARD_FORM_SH:=true;
     STRU.INFO_PANEL_SH :=true;
     STRU.NOT_DIF_BDG_FG:=not cxCheckBox2.Checked;
     STRU.ID_LANGUAGE:=2;
     if Kernel.WizardGetProvInfo(@STRU)
     then begin
               SaveDataAfterWizard(STRU,ProvsDataSet.FieldByName('ID_PROV').Value);
               ID_PROV:=TFibBCDField(ProvsDataSet.FieldByName('ID_PROV')).AsInt64;
               cxGrid1DBTableView1.Controller.BeginUpdate;
               ProvsDataSet.CloseOpen(true);
               ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
               cxGrid1DBTableView1.Controller.EndUpdate;
     end;
end;


procedure TfrmDocsInfo.cxGrid1DBBandedTableView1DBBandedColumn2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var  STRU:WIZARD_GET_PROV_INFO;
     ID_PROV:Int64;
begin
     //Работа мастера
     STRU.AOWNER        :=self;
     STRU.DBHANDLE      :=WorkDatabase.Handle;
     STRU.MODE          :=11;
     STRU.CR_BY_DT      :=ProvsDataSet.FieldByName('CR_BY_DT').AsInteger;

     STRU.DB_ID_SCH     :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_SCH')).asInt64;
     STRU.KR_ID_SCH     :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_SCH')).asInt64;

     STRU.DB_ID_SMETA   :=-1;
     STRU.KR_ID_SMETA   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_SM')).asInt64;

     STRU.DB_ID_RAZD    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_RZ')).asInt64;
     STRU.KR_ID_RAZD    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_RZ')).asInt64;

     STRU.DB_ID_STAT    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_ST')).asInt64;
     STRU.KR_ID_STAT    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_ST')).asInt64;

     STRU.DB_ID_KEKV    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_KEKV')).asInt64;
     STRU.KR_ID_KEKV    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_KEKV')).asInt64;

     STRU.DB_ANALIZE1   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE1')).asInt64;
     STRU.DB_ANALIZE2   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE2')).asInt64;
     STRU.DB_ANALIZE3   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE3')).asInt64;
     STRU.DB_ANALIZE4   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE4')).asInt64;
     STRU.DB_ANALIZE5   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE5')).asInt64;
     STRU.DB_ANALIZE6   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE6')).asInt64;
     STRU.DB_ANALIZE7   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE7')).asInt64;
     STRU.DB_ANALIZE8   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE8')).asInt64;
     STRU.DB_ANALIZE9   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE9')).asInt64;
     STRU.DB_ANALIZE10  :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE10')).asInt64;

     STRU.KR_ANALIZE1   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE1')).asInt64;
     STRU.KR_ANALIZE2   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE2')).asInt64;
     STRU.KR_ANALIZE3   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE3')).asInt64;
     STRU.KR_ANALIZE4   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE4')).asInt64;
     STRU.KR_ANALIZE5   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE5')).asInt64;
     STRU.KR_ANALIZE6   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE6')).asInt64;
     STRU.KR_ANALIZE7   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE7')).asInt64;
     STRU.KR_ANALIZE8   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE8')).asInt64;
     STRU.KR_ANALIZE9   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE9')).asInt64;
     STRU.KR_ANALIZE10  :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE10')).asInt64;

     STRU.ACTUAL_DATE   :=localWorkPeriod;
     STRU.WIZARD_FORM_SH:=true;
     STRU.INFO_PANEL_SH :=true;
     STRU.NOT_DIF_BDG_FG:=not cxCheckBox2.Checked;
     STRU.ID_LANGUAGE:=2;
     if Kernel.WizardGetProvInfo(@STRU)
     then begin
               SaveDataAfterWizard(STRU,ProvsDataSet.FieldByName('ID_PROV').Value);
               ID_PROV:=TFibBCDField(ProvsDataSet.FieldByName('ID_PROV')).AsInt64;
               cxGrid1DBTableView1.Controller.BeginUpdate;
               ProvsDataSet.CloseOpen(true);
               ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
               cxGrid1DBTableView1.Controller.EndUpdate;
     end;
end;

procedure TfrmDocsInfo.cxGrid1DBBandedTableView1DBBandedColumn7PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var  STRU:WIZARD_GET_PROV_INFO;
     ID_PROV:Int64;
begin
     //Работа мастера
     STRU.AOWNER        :=self;
     STRU.DBHANDLE      :=WorkDatabase.Handle;
     STRU.MODE          :=11;
     STRU.CR_BY_DT      :=ProvsDataSet.FieldByName('CR_BY_DT').AsInteger;

     STRU.DB_ID_SCH     :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_SCH')).asInt64;
     STRU.KR_ID_SCH     :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_SCH')).asInt64;;

     STRU.DB_ID_SMETA   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_SM')).asInt64;
     STRU.KR_ID_SMETA   :=-1;

     STRU.DB_ID_RAZD    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_RZ')).asInt64;
     STRU.KR_ID_RAZD    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_RZ')).asInt64;

     STRU.DB_ID_STAT    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_ST')).asInt64;
     STRU.KR_ID_STAT    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_ST')).asInt64;

     STRU.DB_ID_KEKV    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_KEKV')).asInt64;
     STRU.KR_ID_KEKV    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_KEKV')).asInt64;

     STRU.DB_ANALIZE1   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE1')).asInt64;
     STRU.DB_ANALIZE2   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE2')).asInt64;
     STRU.DB_ANALIZE3   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE3')).asInt64;
     STRU.DB_ANALIZE4   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE4')).asInt64;
     STRU.DB_ANALIZE5   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE5')).asInt64;
     STRU.DB_ANALIZE6   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE6')).asInt64;
     STRU.DB_ANALIZE7   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE7')).asInt64;
     STRU.DB_ANALIZE8   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE8')).asInt64;
     STRU.DB_ANALIZE9   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE9')).asInt64;
     STRU.DB_ANALIZE10  :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE10')).asInt64;

     STRU.KR_ANALIZE1   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE1')).asInt64;
     STRU.KR_ANALIZE2   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE2')).asInt64;
     STRU.KR_ANALIZE3   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE3')).asInt64;
     STRU.KR_ANALIZE4   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE4')).asInt64;
     STRU.KR_ANALIZE5   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE5')).asInt64;
     STRU.KR_ANALIZE6   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE6')).asInt64;
     STRU.KR_ANALIZE7   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE7')).asInt64;
     STRU.KR_ANALIZE8   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE8')).asInt64;
     STRU.KR_ANALIZE9   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE9')).asInt64;
     STRU.KR_ANALIZE10  :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE10')).asInt64;

     STRU.ACTUAL_DATE   :=localWorkPeriod;
     STRU.WIZARD_FORM_SH:=true;
     STRU.INFO_PANEL_SH :=true;
     STRU.NOT_DIF_BDG_FG:=not cxCheckBox2.Checked;
     STRU.ID_LANGUAGE:=2;
     if Kernel.WizardGetProvInfo(@STRU)
     then begin
               SaveDataAfterWizard(STRU,ProvsDataSet.FieldByName('ID_PROV').Value);
               ID_PROV:=TFibBCDField(ProvsDataSet.FieldByName('ID_PROV')).AsInt64;
               cxGrid1DBTableView1.Controller.BeginUpdate;
               ProvsDataSet.CloseOpen(true);
               ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
               cxGrid1DBTableView1.Controller.EndUpdate;
     end;
end;


procedure TfrmDocsInfo.cxGrid1DBBandedTableView1DBBandedColumn14PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var  STRU:WIZARD_GET_PROV_INFO;
     ID_PROV:Int64;
begin
     //Работа мастера
     STRU.AOWNER        :=self;
     STRU.DBHANDLE      :=WorkDatabase.Handle;
     STRU.MODE          :=11;
     STRU.CR_BY_DT      :=ProvsDataSet.FieldByName('CR_BY_DT').AsInteger;

     STRU.DB_ID_SCH     :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_SCH')).asInt64;
     STRU.KR_ID_SCH     :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_SCH')).asInt64;

     STRU.DB_ID_SMETA   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_SM')).asInt64;
     STRU.KR_ID_SMETA   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_SM')).asInt64;

     STRU.DB_ID_RAZD    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_RZ')).asInt64;
     STRU.KR_ID_RAZD    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_RZ')).asInt64;

     STRU.DB_ID_STAT    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_ST')).asInt64;
     STRU.KR_ID_STAT    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_ST')).asInt64;

     STRU.DB_ID_KEKV    :=-1;
     STRU.KR_ID_KEKV    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_KEKV')).asInt64;

     STRU.DB_ANALIZE1   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE1')).asInt64;
     STRU.DB_ANALIZE2   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE2')).asInt64;
     STRU.DB_ANALIZE3   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE3')).asInt64;
     STRU.DB_ANALIZE4   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE4')).asInt64;
     STRU.DB_ANALIZE5   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE5')).asInt64;
     STRU.DB_ANALIZE6   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE6')).asInt64;
     STRU.DB_ANALIZE7   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE7')).asInt64;
     STRU.DB_ANALIZE8   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE8')).asInt64;
     STRU.DB_ANALIZE9   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE9')).asInt64;
     STRU.DB_ANALIZE10  :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE10')).asInt64;

     STRU.KR_ANALIZE1   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE1')).asInt64;
     STRU.KR_ANALIZE2   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE2')).asInt64;
     STRU.KR_ANALIZE3   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE3')).asInt64;
     STRU.KR_ANALIZE4   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE4')).asInt64;
     STRU.KR_ANALIZE5   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE5')).asInt64;
     STRU.KR_ANALIZE6   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE6')).asInt64;
     STRU.KR_ANALIZE7   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE7')).asInt64;
     STRU.KR_ANALIZE8   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE8')).asInt64;
     STRU.KR_ANALIZE9   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE9')).asInt64;
     STRU.KR_ANALIZE10  :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE10')).asInt64;

     STRU.ACTUAL_DATE   :=DocDate.Date;
     STRU.WIZARD_FORM_SH:=true;
     STRU.INFO_PANEL_SH :=true;
     STRU.NOT_DIF_BDG_FG:=not cxCheckBox2.Checked;
     STRU.ID_LANGUAGE:=2;
     if Kernel.WizardGetProvInfo(@STRU)
     then begin
               SaveDataAfterWizard(STRU,ProvsDataSet.FieldByName('ID_PROV').Value);
               ID_PROV:=TFibBCDField(ProvsDataSet.FieldByName('ID_PROV')).AsInt64;
               cxGrid1DBTableView1.Controller.BeginUpdate;
               ProvsDataSet.CloseOpen(true);
               ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
               cxGrid1DBTableView1.Controller.EndUpdate;
     end;
end;

procedure TfrmDocsInfo.cxGrid1DBBandedTableView1DBBandedColumn5PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var  STRU:WIZARD_GET_PROV_INFO;
     ID_PROV:Int64;
begin
     //Работа мастера
     STRU.AOWNER        :=self;
     STRU.DBHANDLE      :=WorkDatabase.Handle;
     STRU.MODE          :=11;
     STRU.CR_BY_DT      :=ProvsDataSet.FieldByName('CR_BY_DT').AsInteger;

     STRU.DB_ID_SCH     :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_SCH')).asInt64;
     STRU.KR_ID_SCH     :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_SCH')).asInt64;;

     STRU.DB_ID_SMETA   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_SM')).asInt64;
     STRU.KR_ID_SMETA   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_SM')).asInt64;

     STRU.DB_ID_RAZD    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_RZ')).asInt64;
     STRU.KR_ID_RAZD    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_RZ')).asInt64;

     STRU.DB_ID_STAT    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_ST')).asInt64;
     STRU.KR_ID_STAT    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_ST')).asInt64;

     STRU.DB_ID_KEKV    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_KEKV')).asInt64;
     STRU.KR_ID_KEKV    :=-1;

     STRU.DB_ANALIZE1   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE1')).asInt64;
     STRU.DB_ANALIZE2   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE2')).asInt64;
     STRU.DB_ANALIZE3   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE3')).asInt64;
     STRU.DB_ANALIZE4   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE4')).asInt64;
     STRU.DB_ANALIZE5   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE5')).asInt64;
     STRU.DB_ANALIZE6   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE6')).asInt64;
     STRU.DB_ANALIZE7   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE7')).asInt64;
     STRU.DB_ANALIZE8   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE8')).asInt64;
     STRU.DB_ANALIZE9   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE9')).asInt64;
     STRU.DB_ANALIZE10  :=TFibBCDField(ProvsDataSet.FieldByName('DB_ANALIZE10')).asInt64;

     STRU.KR_ANALIZE1   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE1')).asInt64;
     STRU.KR_ANALIZE2   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE2')).asInt64;
     STRU.KR_ANALIZE3   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE3')).asInt64;
     STRU.KR_ANALIZE4   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE4')).asInt64;
     STRU.KR_ANALIZE5   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE5')).asInt64;
     STRU.KR_ANALIZE6   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE6')).asInt64;
     STRU.KR_ANALIZE7   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE7')).asInt64;
     STRU.KR_ANALIZE8   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE8')).asInt64;
     STRU.KR_ANALIZE9   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE9')).asInt64;
     STRU.KR_ANALIZE10  :=TFibBCDField(ProvsDataSet.FieldByName('KR_ANALIZE10')).asInt64;

     STRU.ACTUAL_DATE   :=localWorkPeriod;
     STRU.WIZARD_FORM_SH:=true;
     STRU.INFO_PANEL_SH :=true;
     STRU.NOT_DIF_BDG_FG:=not cxCheckBox2.Checked;
     STRU.ID_LANGUAGE:=2;
     if Kernel.WizardGetProvInfo(@STRU)
     then begin
               SaveDataAfterWizard(STRU,ProvsDataSet.FieldByName('ID_PROV').Value);
               ID_PROV:=TFibBCDField(ProvsDataSet.FieldByName('ID_PROV')).AsInt64;
               cxGrid1DBTableView1.Controller.BeginUpdate;
               ProvsDataSet.CloseOpen(true);
               ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
               cxGrid1DBTableView1.Controller.EndUpdate;
     end;
end;

procedure TfrmDocsInfo.cxGrid2DBTableView1DblClick(Sender: TObject);
begin
     cxGrid1.SetFocus;
     UpdateAnalitic(false);
end;

procedure TfrmDocsInfo.ConfigureAnGrid;
var i:Integer;
begin
     if ColAnInfoDataSet.Active then ColAnInfoDataSet.Close;
     ColAnInfoDataSet.SelectSQL.Text:='SELECT  *  FROM PUB_SPR_ANALITIC';
     ColAnInfoDataSet.Open;
     ColAnInfoDataSet.FetchAll;
     ColAnInfoDataSet.First;
     for i:=0 to ColAnInfoDataSet.RecordCount-1 do
     begin
          if ColAnInfoDataSet.FieldByName('ID_TYPE_ENUM').Value=NULL
          then begin
          end
          else begin
            cxGrid2DBTableView1.Columns[i].Caption:=ColAnInfoDataSet.FieldByName('NOTE').AsString;
            cxGridDBTableView1.Columns[i].Caption:=ColAnInfoDataSet.FieldByName('NOTE').AsString;
          end;
          cxGrid2DBTableView1.Columns[i].Visible:=false;
          ColAnInfoDataSet.Next;
     end;

end;

procedure TfrmDocsInfo.ConfigureAnGridBySch(ID_SCH:Integer;View:TcxGridDBTableView);
var ConfigProc:TpFibStoredProc;
begin
                 ConfigProc:=TpFibStoredProc.Create(self);
                 ConfigProc.Database:=WorkDatabase;
                 ConfigProc.Transaction:=ReadTransaction;
                 ConfigProc.StoredProcName:='MBOOK_ANALITIC_CONFIGURE';
                 ConfigProc.Prepare;
                 ConfigProc.ParamByName('ID_SCH').AsInt64:=ID_SCH;
                 ConfigProc.ExecProc;
                 if ConfigProc.ParamByName('AN1_IS_VALID').AsInteger =1
                 then View.Columns[0].Visible:=true
                 else View.Columns[0].Visible:=false;
                 if ConfigProc.ParamByName('AN2_IS_VALID').AsInteger =1
                 then View.Columns[1].Visible:=true
                 else View.Columns[1].Visible:=false;
                 if ConfigProc.ParamByName('AN3_IS_VALID').AsInteger =1
                 then View.Columns[2].Visible:=true
                 else View.Columns[2].Visible:=false;
                 if ConfigProc.ParamByName('AN4_IS_VALID').AsInteger =1
                 then View.Columns[3].Visible:=true
                 else View.Columns[3].Visible:=false;
                 if ConfigProc.ParamByName('AN5_IS_VALID').AsInteger =1
                 then View.Columns[4].Visible:=true
                 else View.Columns[4].Visible:=false;
                 if ConfigProc.ParamByName('AN6_IS_VALID').AsInteger =1
                 then View.Columns[5].Visible:=true
                 else View.Columns[5].Visible:=false;
                 if ConfigProc.ParamByName('AN7_IS_VALID').AsInteger =1
                 then View.Columns[6].Visible:=true
                 else View.Columns[6].Visible:=false;
                 if ConfigProc.ParamByName('AN8_IS_VALID').AsInteger =1
                 then View.Columns[7].Visible:=true
                 else View.Columns[7].Visible:=false;
                 if ConfigProc.ParamByName('AN9_IS_VALID').AsInteger =1
                 then View.Columns[8].Visible:=true
                 else View.Columns[8].Visible:=false;
                 if ConfigProc.ParamByName('AN10_IS_VALID').AsInteger=1
                 then View.Columns[9].Visible:=true
                 else View.Columns[9].Visible:=false;
                 ConfigProc.Free;
end;

procedure TfrmDocsInfo.provsViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  //Нужно убрать те столбцы по которым не выставлена аналитика
  provsView.Controller.BeginUpdate;
  ConfigureAnGridBySch(ProvsDataSet.FieldByName('DB_ID_SCH').AsInteger,cxGrid2DBTableView1);
  cxGrid2DBTableView1.DataController.Filter.Root.Clear;
  ConfigureAnGridBySch(ProvsDataSet.FieldByName('KR_ID_SCH').AsInteger,cxGridDBTableView1);
  cxGridDBTableView1.DataController.Filter.Root.Clear;
  provsView.Controller.EndUpdate;
end;

procedure TfrmDocsInfo.cxGridDBTableView1DblClick(Sender: TObject);
begin
      cxGrid1.SetFocus;
      UpdateAnalitic(true);
end;

procedure TfrmDocsInfo.UpdateAnalitic(is_credit: Boolean);
var ID_PROV:Integer;
    UpdProc:TpFibStoredProc;
begin
                 ID_PROV:=ProvsDataSet.FieldByName('ID_PROV').AsInteger;
                 UpdProc:=TpFibStoredProc.Create(self);
                 UpdProc.Database:=WorkDatabase;
                 UpdProc.Transaction:=WriteTransaction;
                 UpdProc.Transaction.StartTransaction;
                 UpdProc.StoredProcName:='MBOOK_UPDATE_PROV_INFO';
                 UpdProc.Prepare;

                 if Is_Credit
                 then UpdProc.ParamByName('ID_OBJECT').Value  :=KrTemplatesDataSet.FieldByName('DEFAULT_VALUE1').Value
                 else UpdProc.ParamByName('ID_OBJECT').Value  :=DBTemplatesDataSet.FieldByName('DEFAULT_VALUE1').Value;

                 UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=11;
                 UpdProc.ParamByName('IS_CREDIT').AsInteger:=integer(is_credit);
                 UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                 UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                 UpdProc.ExecProc;

                 if Is_Credit
                 then UpdProc.ParamByName('ID_OBJECT').Value  :=KrTemplatesDataSet.FieldByName('DEFAULT_VALUE2').Value
                 else UpdProc.ParamByName('ID_OBJECT').Value  :=DBTemplatesDataSet.FieldByName('DEFAULT_VALUE2').Value;

                 UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=12;
                 UpdProc.ParamByName('IS_CREDIT').AsInteger:=integer(is_credit);
                 UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                 UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                 UpdProc.ExecProc;

                 if Is_Credit
                 then UpdProc.ParamByName('ID_OBJECT').Value  :=KrTemplatesDataSet.FieldByName('DEFAULT_VALUE3').Value
                 else UpdProc.ParamByName('ID_OBJECT').Value  :=DBTemplatesDataSet.FieldByName('DEFAULT_VALUE3').Value;

                 UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=13;
                 UpdProc.ParamByName('IS_CREDIT').AsInteger:=integer(is_credit);
                 UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                 UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                 UpdProc.ExecProc;


                 if Is_Credit
                 then UpdProc.ParamByName('ID_OBJECT').Value  :=KrTemplatesDataSet.FieldByName('DEFAULT_VALUE4').Value
                 else UpdProc.ParamByName('ID_OBJECT').Value  :=DBTemplatesDataSet.FieldByName('DEFAULT_VALUE4').Value;

                 UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=14;
                 UpdProc.ParamByName('IS_CREDIT').AsInteger:=integer(is_credit);
                 UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                 UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                 UpdProc.ExecProc;

                 if Is_Credit
                 then UpdProc.ParamByName('ID_OBJECT').Value  :=KrTemplatesDataSet.FieldByName('DEFAULT_VALUE5').Value
                 else UpdProc.ParamByName('ID_OBJECT').Value  :=DBTemplatesDataSet.FieldByName('DEFAULT_VALUE5').Value;

                 UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=15;
                 UpdProc.ParamByName('IS_CREDIT').AsInteger:=integer(is_credit);
                 UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                 UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                 UpdProc.ExecProc;

                 if Is_Credit
                 then UpdProc.ParamByName('ID_OBJECT').Value  :=KrTemplatesDataSet.FieldByName('DEFAULT_VALUE6').Value
                 else UpdProc.ParamByName('ID_OBJECT').Value  :=DBTemplatesDataSet.FieldByName('DEFAULT_VALUE6').Value;

                 UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=16;
                 UpdProc.ParamByName('IS_CREDIT').AsInteger:=integer(is_credit);
                 UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                 UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                 UpdProc.ExecProc;

                 if Is_Credit
                 then UpdProc.ParamByName('ID_OBJECT').Value  :=KrTemplatesDataSet.FieldByName('DEFAULT_VALUE7').Value
                 else UpdProc.ParamByName('ID_OBJECT').Value  :=DBTemplatesDataSet.FieldByName('DEFAULT_VALUE7').Value;

                 UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=17;
                 UpdProc.ParamByName('IS_CREDIT').AsInteger:=integer(is_credit);
                 UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                 UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                 UpdProc.ExecProc;

                 if Is_Credit
                 then UpdProc.ParamByName('ID_OBJECT').Value  :=KrTemplatesDataSet.FieldByName('DEFAULT_VALUE8').Value
                 else UpdProc.ParamByName('ID_OBJECT').Value  :=DBTemplatesDataSet.FieldByName('DEFAULT_VALUE8').Value;

                 UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=18;
                 UpdProc.ParamByName('IS_CREDIT').AsInteger:=integer(is_credit);
                 UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                 UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                 UpdProc.ExecProc;

                 if Is_Credit
                 then UpdProc.ParamByName('ID_OBJECT').Value  :=KrTemplatesDataSet.FieldByName('DEFAULT_VALUE9').Value
                 else UpdProc.ParamByName('ID_OBJECT').Value  :=DBTemplatesDataSet.FieldByName('DEFAULT_VALUE9').Value;

                 UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=19;
                 UpdProc.ParamByName('IS_CREDIT').AsInteger:=integer(is_credit);
                 UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                 UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                 UpdProc.ExecProc;

                 if Is_Credit
                 then UpdProc.ParamByName('ID_OBJECT').Value  :=KrTemplatesDataSet.FieldByName('DEFAULT_VALUE10').Value
                 else UpdProc.ParamByName('ID_OBJECT').Value  :=DBTemplatesDataSet.FieldByName('DEFAULT_VALUE10').Value;

                 UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=20;
                 UpdProc.ParamByName('IS_CREDIT').AsInteger:=integer(is_credit);
                 UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                 UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                 UpdProc.ExecProc;


                 UpdProc.Transaction.Commit;
                 UpdProc.Free;
                 ProvsDataSet.CloseOpen(true);
                 ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
end;


procedure TfrmDocsInfo.DBTemplatesDataSetAfterOpen(DataSet: TDataSet);
begin
     DBTemplatesDataSet.Locate('DEFAULT_VALUE1;DEFAULT_VALUE2;DEFAULT_VALUE3;DEFAULT_VALUE4;DEFAULT_VALUE5;DEFAULT_VALUE6;DEFAULT_VALUE7;DEFAULT_VALUE8;DEFAULT_VALUE9;DEFAULT_VALUE10',
                               VarArrayOf([ProvsDataSet.FieldByName('DB_ANALIZE1').Value,
                                           ProvsDataSet.FieldByName('DB_ANALIZE2').Value,
                                           ProvsDataSet.FieldByName('DB_ANALIZE3').Value,
                                           ProvsDataSet.FieldByName('DB_ANALIZE4').Value,
                                           ProvsDataSet.FieldByName('DB_ANALIZE5').Value,
                                           ProvsDataSet.FieldByName('DB_ANALIZE6').Value,
                                           ProvsDataSet.FieldByName('DB_ANALIZE7').Value,
                                           ProvsDataSet.FieldByName('DB_ANALIZE8').Value,
                                           ProvsDataSet.FieldByName('DB_ANALIZE9').Value,
                                           ProvsDataSet.FieldByName('DB_ANALIZE10').Value]),[]);
end;

procedure TfrmDocsInfo.KrTemplatesDataSetAfterOpen(DataSet: TDataSet);
begin
     KrTemplatesDataSet.Locate('DEFAULT_VALUE1;DEFAULT_VALUE2;DEFAULT_VALUE3;DEFAULT_VALUE4;DEFAULT_VALUE5;DEFAULT_VALUE6;DEFAULT_VALUE7;DEFAULT_VALUE8;DEFAULT_VALUE9;DEFAULT_VALUE10',
                               VarArrayOf([ProvsDataSet.FieldByName('KR_ANALIZE1').Value,
                                           ProvsDataSet.FieldByName('KR_ANALIZE2').Value,
                                           ProvsDataSet.FieldByName('KR_ANALIZE3').Value,
                                           ProvsDataSet.FieldByName('KR_ANALIZE4').Value,
                                           ProvsDataSet.FieldByName('KR_ANALIZE5').Value,
                                           ProvsDataSet.FieldByName('KR_ANALIZE6').Value,
                                           ProvsDataSet.FieldByName('KR_ANALIZE7').Value,
                                           ProvsDataSet.FieldByName('KR_ANALIZE8').Value,
                                           ProvsDataSet.FieldByName('KR_ANALIZE9').Value,
                                           ProvsDataSet.FieldByName('KR_ANALIZE10').Value]),[]);

end;

procedure TfrmDocsInfo.Action1Execute(Sender: TObject);
begin
     provsView.Controller.FocusedRow.Expand(false);
end;

procedure TfrmDocsInfo.Action2Execute(Sender: TObject);
begin
     provsView.Controller.FocusedRow.Collapse(true);
end;

procedure TfrmDocsInfo.cxGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_RETURN
  then begin
      cxGrid1.SetFocus;
      UpdateAnalitic(true);
   end;
end;

procedure TfrmDocsInfo.cxGrid2DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_RETURN
  then begin
      cxGrid1.SetFocus;
      UpdateAnalitic(false);
   end;

end;

procedure TfrmDocsInfo.UpdateSum;
var T:TfrmSumEdit;
    ID_PROV:Integer;
    UpdProc:TpFibStoredProc;
begin
 if (ProvsDataSet.RecordCount>0)
 then begin
    T:=TfrmSumEdit.Create(self);
    T.cxCalcEdit1.Value:=ProvsDataSet.FieldByName('SUMMA').AsFloat;
    if T.ShowModal=mrYes
    then begin
                 ID_PROV:=ProvsDataSet.FieldByName('ID_PROV').AsInteger;
                 UpdProc:=TpFibStoredProc.Create(self);
                 UpdProc.Database:=WorkDatabase;
                 UpdProc.Transaction:=WriteTransaction;
                 UpdProc.Transaction.StartTransaction;
                 UpdProc.StoredProcName:='MBOOK_UPDATE_PROV_INFO_EX';
                 UpdProc.Prepare;
                 UpdProc.ParamByName('SUMMA').Value:=T.cxCalcEdit1.Value;
                 UpdProc.ParamByName('SUMMA_VALUTE').Value:=0;
                 UpdProc.ParamByName('ID_VALUTE').Value:=NULL;
                 UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                 UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                 UpdProc.ExecProc;
                 UpdProc.Transaction.Commit;
                 UpdProc.Free;
                 ProvsDataSet.CloseOpen(true);
                 ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
                 InfoDoc.CloseOpen(true);
    end;
    T.Free;
  end;
end;

procedure TfrmDocsInfo.EditSumActionExecute(Sender: TObject);
begin
    UpdateSum;
end;

procedure TfrmDocsInfo.SaveButtonClick(Sender: TObject);
var DoResult:Boolean;
    ErrorList:TStringList;
    i:Integer;
    UpdProc:TpFibStoredProc;
begin
     if (DocType.Text='')
     then begin
          agShowMessage('Не визначено тип документу');
          DocType.SetFocus;
          Exit;
     end;


     DoResult:=false;
     PageControl1.ActivePage:=TabSheet1;
     if Mode
     then begin
         {Добавление нового документа}
         UpdProc:=TpFibStoredProc.Create(self);
         UpdProc.Database:=WorkDatabase;
         UpdProc.Transaction:=WriteTransaction;
         UpdProc.Transaction.StartTransaction;
         UpdProc.StoredProcName:='MBOOK_UPDATE_DOC';
         UpdProc.Prepare;
         UpdProc.ParamByName('ID_TYPE_DOC').Value       :=DocType.editValue;
         UpdProc.ParamByName('NUM_DOC').Value           :=NumDoc.Text;
         UpdProc.ParamByName('DATE_DOC').Value          :=DocDate.Date;
         UpdProc.ParamByName('DATE_PROV').Value         :=DateProv.date;
         UpdProc.ParamByName('ID_CUSTOMER').Value       :=id_customer;
         UpdProc.ParamByName('NOTE').Value              :=EdComment.Lines.Text;
         UpdProc.ParamByName('FIO').Value               :=NULL;
         UpdProc.ParamByName('ID_RATE_ACC').Value       :=id_rate_acc;
         UpdProc.ParamByName('ID_RATE_ACC_NATIVE').Value:=id_rate_acc_native;
         UpdProc.ParamByName('PRIHOD').Value            :=Integer(cxCheckBox1.Checked);
         UpdProc.ParamByName('KEY_SESSION').AsInt64     :=KEY_SESSION;
         UpdProc.ExecProc;
         UpdProc.Transaction.Commit;
         UpdProc.Free;

         InfoDoc.CloseOpen(true);

         WriteTransaction.StartTransaction;
         STRU.TRHANDLE:=WriteTransaction.Handle;
         STRU.WORKDATE:=DateProv.date;
         STRU.ID_USER:=self.id_user;
         ActionLog.Lines.Insert(0,'Проведення документу... '+TimeToStr(Time));
         try
             DoResult:=Kernel.KernelDo(@STRU);
         except on E:Exception do
             ShowMessage('Помилка ядра '+E.Message);
         end;

         if  DoResult
         then begin
                CHANGE_FLAG:=false;
                PK_ID:=STRU.PK_ID;
                ActionLog.Lines.Insert(0,'Документ було проведено без помилок!');
                Mode:=false;
                if not self.Mode then ToolButton1.Enabled:=true;

                ShowMessage('Документ було проведенно без помилок!');
         end
         else begin
                ActionLog.Lines.Clear;
                ActionLog.Lines.Insert(0,'При проведенні документа виникли помилки');
                ErrorList:=Kernel.GetDocErrorsList(@STRU);
                if ErrorList<>nil then for i:=0 to  ErrorList.Count-1 do ActionLog.Lines.Insert(0,'ОШИБКА- '+ErrorList.Strings[i]);
                Panel3.Visible:=true;
                Splitter1.Top:=Panel3.Top+1;
         end;
         WriteTransaction.Commit;
         RefreshButtonClick(self);
     end
     else begin
         UpdProc:=TpFibStoredProc.Create(self);
         UpdProc.Database:=WorkDatabase;
         UpdProc.Transaction:=WriteTransaction;
         UpdProc.Transaction.StartTransaction;
         UpdProc.StoredProcName:='MBOOK_UPDATE_DOC';
         UpdProc.Prepare;
         UpdProc.ParamByName('ID_TYPE_DOC').Value       :=DocType.editValue;
         UpdProc.ParamByName('NUM_DOC').Value           :=NumDoc.Text;
         UpdProc.ParamByName('DATE_DOC').Value          :=DocDate.Date;
         UpdProc.ParamByName('DATE_PROV').Value         :=DateProv.date;
         UpdProc.ParamByName('ID_CUSTOMER').Value       :=id_customer;
         UpdProc.ParamByName('NOTE').Value              :=EdComment.Lines.Text;
         UpdProc.ParamByName('FIO').Value               :=NULL;
         UpdProc.ParamByName('ID_RATE_ACC').Value       :=id_rate_acc;
         UpdProc.ParamByName('ID_RATE_ACC_NATIVE').Value:=id_rate_acc_native;
         UpdProc.ParamByName('PRIHOD').Value            :=Integer(cxCheckBox1.Checked);
         UpdProc.ParamByName('KEY_SESSION').AsInt64     :=KEY_SESSION;
         UpdProc.ExecProc;
         UpdProc.Transaction.Commit;
         UpdProc.Free;

         WriteTransaction.StartTransaction;
         STRU.TRHANDLE:=WriteTransaction.Handle;
         STRU.WORKDATE:=DateProv.date;
         //ShowMessage('STRU.WORKDATE='+DateToStr(STRU.WORKDATE));
         STRU.KERNEL_ACTION:=3;
         STRU.PK_ID:=self.PK_ID;
         STRU.ID_USER:=self.id_user;
         ActionLog.Lines.Insert(0,'Проведення документу... '+TimeToStr(Time));
         try
             DoResult:=Kernel.KernelDo(@STRU);
         except on E:Exception do
             ShowMessage('Ошибка ядра '+E.Message);
         end;
         if  DoResult
         then begin
                CHANGE_FLAG:=false;
                ActionLog.Lines.Insert(0,'Документ було проведено без помилок!');
                Mode:=false;
                if not self.Mode then ToolButton1.Enabled:=true;                
                ShowMessage('Документ було проведено без помилок!');
         end
         else begin
                ActionLog.Lines.Clear;
                ActionLog.Lines.Insert(0,'При проведенні документа виникли помилки');
                ErrorList:=Kernel.GetDocErrorsListEx(@STRU);
                if ErrorList<>nil then for i:=0 to  ErrorList.Count-1 do ActionLog.Lines.Insert(0,'ОШИБКА- '+ErrorList.Strings[i]);
                Panel3.Visible:=true;
                Splitter1.Top:=Panel3.Top+1;
         end;
         WriteTransaction.Commit;
         RefreshButtonClick(self);
     end;
end;

procedure TfrmDocsInfo.cxGrid1DBBandedTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  var StrItem:String;
begin
  StrItem:=VarToStr(ARecord.Values[15]);
  if StrItem='0'
  then begin
       if Odd(ARecord.Index)
       then AStyle:=cxStyle13
       else AStyle:=cxStyle6;
  end
  else AStyle:=cxErrorStyle;
end;

procedure TfrmDocsInfo.ViewButtonClick(Sender: TObject);
var  CP:TpFibStoredProc;
begin
if ProvsDataSet.RecordCount>0
then begin
   if BaseTypes.agMessageDlg('Увага!','Ви хочете видалити проводку з документа?',mtWarning,[mbYes,mbNo])=mrYes
   then begin
            CP:=TpFibStoredProc.Create(self);
            CP.Database:=WorkDatabase;
            CP.Transaction:=WriteTransaction;
            CP.Transaction.StartTransaction;
            CP.StoredProcName:='MBOOK_DELETE_PROV';
            CP.Prepare;
            CP.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
            CP.ParamByName('ID_PROV').AsInt64    :=ProvsDataSet.FieldByName('ID_PROV').Value;
            CP.ExecProc;
            CP.Transaction.Commit;
            CP.Free;
            ProvsDataSet.CacheDelete;
            InfoDoc.CloseOpen(true);
   end;
end;
end;

procedure TfrmDocsInfo.CloseButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmDocsInfo.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
i, o : TSpravParams;
begin
    i := TSpravParams.Create;
    o := TSpravParams.Create;
    i['DataBase']     := Integer(WorkDatabase.Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := selRateAccount;
    LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    if o['ModalResult'] = mrOk then
    begin
          id_customer := o['ID_CUSTOMER'];
          id_rate_acc := o['ID_RATE_ACCOUNT'];
          EdCustomer.text:=VarToStr(o['NAME_CUSTOMER']);
          EdAcc.Text:=VarToStr(o['NAME_BANK'])+'(мфо '+VarToStr(o['MFO'])+') р:'+VarToStr(o['RATE_ACCOUNT']);
    end;
    i.Free;
    o.Free;
end;

procedure TfrmDocsInfo.cxButtonEdit2PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin
    Res:=GlobalSPR.GetCustomers(self,WorkDatabase.Handle,fsNormal,DateProv.Date,csmRateAcc);
end;

procedure TfrmDocsInfo.cxButtonEdit3PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var ret:Variant;
begin
     ret:=LoadDogManedger.WorkSpMfoRsch(Self, WorkDatabase.Handle, fsNormal,'get', id_rate_acc_native);
     if VarArrayDimCount(ret) > 0 then
     begin
               id_rate_acc_native := ret[0][0];
               EdAccNative.Text := VarToStr(ret[0][1])+'(мфо '+VarToStr(ret[0][2])+') р:'+VarToStr(ret[0][3]);
     end;
end;

procedure TfrmDocsInfo.cxCheckBox3Click(Sender: TObject);
begin
     provsView.Controller.BeginUpdate;
     provsViewDBBandedColumn10.Visible:=cxCheckBox3.Checked;
     provsViewDBBandedColumn15.Visible:=cxCheckBox3.Checked;
     provsView.Controller.EndUpdate;
end;

procedure TfrmDocsInfo.DelButtonClick(Sender: TObject);
var  CP:TpFibStoredProc;
     ID_PROV:Integer;
begin
if (ProvsDataSet.RecordCount>0)
then begin
     CP:=TpFibStoredProc.Create(self);
     CP.Database:=WorkDatabase;
     CP.Transaction:=WriteTransaction;
     CP.Transaction.StartTransaction;
     CP.StoredProcName:='MBOOK_CREATE_PROV_EX2';
     CP.Prepare;
     CP.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
     CP.ParamByName('PK_ID').AsInt64:=PK_ID;
     CP.ParamByName('ID_PROV_IN').AsInt64:=TFibBCDField(ProvsDataSet.FieldByName('ID_PROV')).asInt64;
     CP.ExecProc;
     ID_PROV:=CP.ParamByName('ID_PROV').AsInteger;
     CP.Transaction.Commit;
     CP.Free;
     ProvsDataSet.CloseOpen(true);
     ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
end;
end;

procedure TfrmDocsInfo.N1Click(Sender: TObject);
var ID_PROV:Integer;
    UpdProc:TpFibStoredProc;
begin
 if (ProvsDataSet.RecordCount>0)
 then begin
                 ID_PROV:=ProvsDataSet.FieldByName('ID_PROV').AsInteger;
                 UpdProc:=TpFibStoredProc.Create(self);
                 UpdProc.Database:=WorkDatabase;
                 UpdProc.Transaction:=WriteTransaction;
                 UpdProc.Transaction.StartTransaction;
                 UpdProc.StoredProcName:='MBOOK_UPDATE_PROV_TYPE';
                 UpdProc.Prepare;
                 UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                 UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                 UpdProc.ExecProc;
                 UpdProc.Transaction.Commit;
                 UpdProc.Free;
                 ProvsDataSet.CloseOpen(true);
                 ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
                 InfoDoc.CloseOpen(true);
  end;
end;

procedure TfrmDocsInfo.N2Click(Sender: TObject);
var ID_PROV:Integer;
    UpdProc:TpFibStoredProc;
begin
 if (ProvsDataSet.RecordCount>0)
 then begin
                 ID_PROV:=ProvsDataSet.FieldByName('ID_PROV').AsInteger;
                 UpdProc:=TpFibStoredProc.Create(self);
                 UpdProc.Database:=WorkDatabase;
                 UpdProc.Transaction:=WriteTransaction;
                 UpdProc.Transaction.StartTransaction;
                 UpdProc.StoredProcName:='MBOOK_UPDATE_PROV_MAIN_SCH';
                 UpdProc.Prepare;
                 UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                 UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                 UpdProc.ExecProc;
                 UpdProc.Transaction.Commit;
                 UpdProc.Free;
                 ProvsDataSet.CloseOpen(true);
                 ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
                 InfoDoc.CloseOpen(true);
  end;
end;

procedure TfrmDocsInfo.SaveDataAfterWizard(STRU: WIZARD_GET_PROV_INFO;ID_PROV:Int64);
var UpdProc:TpFibStoredProc;
begin
               //Запоминание информации полученной из мастера
               UpdProc:=TpFibStoredProc.Create(self);
               UpdProc.Database:=WorkDatabase;
               UpdProc.Transaction:=WriteTransaction;
               UpdProc.Transaction.StartTransaction;
               UpdProc.StoredProcName:='MBOOK_UPDATE_PROV_INFO';
               UpdProc.Prepare;
               UpdProc.ParamByName('ID_OBJECT').AsInt64:=STRU.KR_ID_SCH;
               UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=1;
               UpdProc.ParamByName('IS_CREDIT').AsInteger:=1;
               UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
               UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
               UpdProc.ExecProc;

               UpdProc.StoredProcName:='MBOOK_UPDATE_PROV_INFO';
               UpdProc.Prepare;
               UpdProc.ParamByName('ID_OBJECT').AsInt64:=STRU.DB_ID_SCH;
               UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=1;
               UpdProc.ParamByName('IS_CREDIT').AsInteger:=0;
               UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
               UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
               UpdProc.ExecProc;

               UpdProc.StoredProcName:='MBOOK_UPDATE_PROV_INFO';
               UpdProc.Prepare;
               UpdProc.ParamByName('ID_OBJECT').AsInt64:=STRU.DB_ID_SMETA;
               UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=2;
               UpdProc.ParamByName('IS_CREDIT').AsInteger:=0;
               UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
               UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
               UpdProc.ExecProc;
               UpdProc.ParamByName('ID_OBJECT').AsInt64:=STRU.DB_ID_RAZD;
               UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=3;
               UpdProc.ParamByName('IS_CREDIT').AsInteger:=0;
               UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
               UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
               UpdProc.ExecProc;
               UpdProc.ParamByName('ID_OBJECT').AsInt64:=STRU.DB_ID_STAT;
               UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=4;
               UpdProc.ParamByName('IS_CREDIT').AsInteger:=0;
               UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
               UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
               UpdProc.ExecProc;

               UpdProc.StoredProcName:='MBOOK_UPDATE_PROV_INFO';
               UpdProc.Prepare;
               UpdProc.ParamByName('ID_OBJECT').AsInt64:=STRU.KR_ID_SMETA;
               UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=2;
               UpdProc.ParamByName('IS_CREDIT').AsInteger:=1;
               UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
               UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
               UpdProc.ExecProc;
               UpdProc.ParamByName('ID_OBJECT').AsInt64:=STRU.KR_ID_RAZD;
               UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=3;
               UpdProc.ParamByName('IS_CREDIT').AsInteger:=1;
               UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
               UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
               UpdProc.ExecProc;
               UpdProc.ParamByName('ID_OBJECT').AsInt64:=STRU.KR_ID_STAT;
               UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=4;
               UpdProc.ParamByName('IS_CREDIT').AsInteger:=1;
               UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
               UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
               UpdProc.ExecProc;

               UpdProc.StoredProcName:='MBOOK_UPDATE_PROV_INFO';
               UpdProc.Prepare;
               UpdProc.ParamByName('ID_OBJECT').AsInt64:=STRU.KR_ID_KEKV;
               UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=5;
               UpdProc.ParamByName('IS_CREDIT').AsInteger:=1;
               UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
               UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
               UpdProc.ExecProc;

               UpdProc.ParamByName('ID_OBJECT').AsInt64:=STRU.DB_ID_KEKV;
               UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=5;
               UpdProc.ParamByName('IS_CREDIT').AsInteger:=0;
               UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
               UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
               UpdProc.ExecProc;

               UpdProc.ParamByName('ID_OBJECT').AsInt64:=STRU.CR_BY_DT;
               UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=30;
               UpdProc.ParamByName('IS_CREDIT').AsInteger:=0;
               UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
               UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
               UpdProc.ExecProc;

               UpdProc.StoredProcName:='MBOOK_UPDATE_PROV_INFO';
               UpdProc.Prepare;

               if STRU.EXIST_DB_AN
               then begin
                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.DB_ANALIZE1;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=11;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=0;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.DB_ANALIZE2;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=12;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=0;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.DB_ANALIZE3;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=13;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=0;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.DB_ANALIZE4;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=14;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=0;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.DB_ANALIZE5;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=15;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=0;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.DB_ANALIZE6;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=16;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=0;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.DB_ANALIZE7;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=17;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=0;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.DB_ANALIZE8;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=18;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=0;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.DB_ANALIZE9;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=19;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=0;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.DB_ANALIZE10;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=20;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=0;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;
               end;

               if STRU.EXIST_KR_AN
               then begin
                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.KR_ANALIZE1;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=11;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=1;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.KR_ANALIZE2;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=12;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=1;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.KR_ANALIZE3;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=13;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=1;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.KR_ANALIZE4;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=14;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=1;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.KR_ANALIZE5;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=15;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=1;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.KR_ANALIZE6;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=16;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=1;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.KR_ANALIZE7;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=17;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=1;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.KR_ANALIZE8;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=18;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=1;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.KR_ANALIZE9;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=19;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=1;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.KR_ANALIZE10;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=20;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=1;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.ParamByName('ID_OBJECT').Value  :=STRU.CR_BY_DT;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=30;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=1;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

               end;

               if STRU.FACED_FLAG
               then begin

                         UpdProc.StoredProcName:='MBOOK_UPDATE_PROV_INFO_EX';
                         UpdProc.Prepare;
                         UpdProc.ParamByName('SUMMA').AsCurrency:=STRU.FACED_PROV_SUMMA;
                         UpdProc.ParamByName('SUMMA_VALUTE').Value:=0;
                         UpdProc.ParamByName('ID_VALUTE').Value:=NULL;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;

                         UpdProc.StoredProcName:='MBOOK_UPDATE_PROV_INFO';
                         UpdProc.Prepare;
                         //Последним должен менятся идентификатор проводки
                         UpdProc.ParamByName('ID_OBJECT').asint64  :=STRU.FACED_ID_PROV;
                         UpdProc.ParamByName('TYPE_OBJECT').AsInt64:=40;
                         UpdProc.ParamByName('IS_CREDIT').AsInteger:=1;
                         UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                         UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                         UpdProc.ExecProc;
               end;

               UpdProc.Transaction.Commit;
               UpdProc.Free;

end;

procedure TfrmDocsInfo.N6Click(Sender: TObject);
var  CP:TpFibStoredProc;
     ID_PROV:Integer;
     STRU:WIZARD_GET_PROV_INFO;
     T:TfrmGetTemplate;
     CR: TfrmGetRsch;
begin
     T:=TfrmGetTemplate.Create(self);
     if T.ShowModal=mrYes
     then begin
               if (T.TemplatesDataSet.FieldByName('ID_TEMPLATE').AsInteger=-1)
               then begin
                         //Работа мастера
                         STRU.AOWNER:=self;
                         STRU.DBHANDLE:=WorkDatabase.Handle;
                         STRU.MODE:=21;
                         STRU.ID_FORM_UCH:=self.id_form_kod;
                         STRU.CR_BY_DT:=1;
                         STRU.ACTUAL_DATE:=DocDate.Date;
                         STRU.WIZARD_FORM_SH:=true;
                         STRU.INFO_PANEL_SH:=true;
                         STRU.NOT_DIF_BDG_FG:=true;
                         STRU.ID_LANGUAGE:=2;
                         if Kernel.WizardGetProvInfo(@STRU)
                         then begin
                                   //Создание шаблона проводки
                                   CP:=TpFibStoredProc.Create(self);
                                   CP.Database:=WorkDatabase;
                                   CP.Transaction:=WriteTransaction;
                                   CP.Transaction.StartTransaction;
                                   CP.StoredProcName:='MBOOK_CREATE_PROV';
                                   CP.Prepare;
                                   CP.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                                   CP.ParamByName('PK_ID').AsInt64:=PK_ID;
                                   CP.ExecProc;
                                   ID_PROV:=CP.ParamByName('ID_PROV').AsInteger;
                                   CP.Transaction.Commit;
                                   CP.Free;

                                   SaveDataAfterWizard(STRU,ID_PROV);

                                   cxGrid1DBTableView1.Controller.BeginUpdate;
                                   ProvsDataSet.CloseOpen(true);
                                   ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
                                   //UpdateSum;
                                   cxGrid1DBTableView1.Controller.EndUpdate;
                         end;
               end
               else begin
                                   //Работа мастера
                                   STRU.AOWNER        :=self;
                                   STRU.DBHANDLE      :=WorkDatabase.Handle;
                                   STRU.MODE          :=11;

                                   IF (T.TemplatesDataSet.FieldByName('CR_BY_DT').Value<>NULL)
                                   then STRU.CR_BY_DT      :=T.TemplatesDataSet.FieldByName('CR_BY_DT').AsInteger
                                   else begin
                                             CR:=TfrmGetRsch.Create(self);
                                             if CR.ShowModal=mrYes
                                             then begin
                                                       if CR.cxRadioButton1.Checked then STRU.CR_BY_DT:=1;
                                                       if CR.cxRadioButton2.Checked then STRU.CR_BY_DT:=0;
                                             end
                                             else Exit;
                                             CR.Free;
                                   end;

                                   if T.TemplatesDataSet.FieldByName('DB_ID_SCH').Value<>NULL
                                   then STRU.DB_ID_SCH    :=StrToInt64(T.TemplatesDataSet.FieldByName('DB_ID_SCH').AsString)
                                   else STRU.DB_ID_SCH    :=-1;

                                   if T.TemplatesDataSet.FieldByName('KR_ID_SCH').Value<>NULL
                                   then STRU.KR_ID_SCH    :=StrToInt64(T.TemplatesDataSet.FieldByName('KR_ID_SCH').AsString)
                                   else STRU.KR_ID_SCH    :=-1;

                                   if T.TemplatesDataSet.FieldByName('DB_ID_SM').Value<>NULL
                                   then STRU.DB_ID_SMETA   :=StrToInt64(T.TemplatesDataSet.FieldByName('DB_ID_SM').AsString)
                                   else STRU.DB_ID_SMETA   :=-1;

                                   if T.TemplatesDataSet.FieldByName('KR_ID_SM').Value<>NULL
                                   then STRU.KR_ID_SMETA   :=StrToInt64(T.TemplatesDataSet.FieldByName('KR_ID_SM').AsString)
                                   else STRU.KR_ID_SMETA   :=-1;

                                   if T.TemplatesDataSet.FieldByName('DB_ID_RZ').Value<>NULL
                                   then STRU.DB_ID_RAZD    :=StrToInt64(T.TemplatesDataSet.FieldByName('DB_ID_RZ').AsString)
                                   else STRU.DB_ID_RAZD    :=-1;

                                   if T.TemplatesDataSet.FieldByName('KR_ID_RZ').Value<>NULL
                                   then STRU.KR_ID_RAZD    :=StrToInt64(T.TemplatesDataSet.FieldByName('KR_ID_RZ').AsString)
                                   else STRU.KR_ID_RAZD    :=-1;

                                   if T.TemplatesDataSet.FieldByName('DB_ID_ST').Value<>NULL
                                   then STRU.DB_ID_STAT    :=StrToInt64(T.TemplatesDataSet.FieldByName('DB_ID_ST').AsString)
                                   else STRU.DB_ID_STAT    :=-1;

                                   if T.TemplatesDataSet.FieldByName('KR_ID_ST').Value<>NULL
                                   then STRU.KR_ID_STAT    :=StrToInt64(T.TemplatesDataSet.FieldByName('KR_ID_ST').AsString)
                                   else STRU.KR_ID_STAT    :=-1;

                                   if T.TemplatesDataSet.FieldByName('DB_ID_KEKV').Value<>NULL
                                   then STRU.DB_ID_KEKV    :=StrToInt64(T.TemplatesDataSet.FieldByName('DB_ID_KEKV').AsString)
                                   else STRU.DB_ID_KEKV    :=-1;

                                   if T.TemplatesDataSet.FieldByName('KR_ID_KEKV').Value<>NULL
                                   then STRU.KR_ID_KEKV    :=StrToInt64(T.TemplatesDataSet.FieldByName('KR_ID_KEKV').AsString)
                                   else STRU.KR_ID_KEKV    :=-1;

                                   STRU.ACTUAL_DATE   :=DocDate.Date;
                                   STRU.WIZARD_FORM_SH:=true;
                                   STRU.INFO_PANEL_SH :=true;
                                   STRU.NOT_DIF_BDG_FG:=false;
                                   STRU.ID_LANGUAGE:=2;
                                   if Kernel.WizardGetProvInfo(@STRU)
                                   then begin
                                             //Создание шаблона проводки
                                             CP:=TpFibStoredProc.Create(self);
                                             CP.Database:=WorkDatabase;
                                             CP.Transaction:=WriteTransaction;
                                             CP.Transaction.StartTransaction;
                                             CP.StoredProcName:='MBOOK_CREATE_PROV';
                                             CP.Prepare;
                                             CP.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                                             CP.ParamByName('PK_ID').AsInt64:=PK_ID;
                                             CP.ExecProc;
                                             ID_PROV:=CP.ParamByName('ID_PROV').AsInteger;
                                             CP.Transaction.Commit;
                                             CP.Free;

                                             SaveDataAfterWizard(STRU,ID_PROV);
                                             ID_PROV:=TFibBCDField(ProvsDataSet.FieldByName('ID_PROV')).AsInt64;
                                             cxGrid1DBTableView1.Controller.BeginUpdate;
                                             ProvsDataSet.CloseOpen(true);
                                             ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
                                             //UpdateSum;
                                             cxGrid1DBTableView1.Controller.EndUpdate;
                                   end;
               end;
      end;
      T.Free;
end;

procedure TfrmDocsInfo.N8Click(Sender: TObject);
begin
     cxGrid1Level2.Visible:=false;
end;

procedure TfrmDocsInfo.N9Click(Sender: TObject);
begin
     cxGrid1Level2.Visible:=true;
end;

procedure TfrmDocsInfo.test1Click(Sender: TObject);
var STRU:WIZARD_GET_PROV_INFO;
begin
     STRU.AOWNER:=self;
     STRU.DBHANDLE:=WorkDatabase.Handle;
     STRU.MODE:=3;
     STRU.ACTUAL_DATE:=Date;
     STRU.WIZARD_FORM_SH:=false;
     STRU.INFO_PANEL_SH :=false;
     Kernel.WizardGetProvInfo(@STRU)
end;

procedure TfrmDocsInfo.cxGrid1DBBandedTableView1DBBandedColumn8PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var  STRU:WIZARD_GET_PROV_INFO;
     ID_PROV:Int64;
begin
     //Работа мастера
     STRU.AOWNER        :=self;
     STRU.DBHANDLE      :=WorkDatabase.Handle;
     STRU.MODE          :=11;
     STRU.CR_BY_DT      :=ProvsDataSet.FieldByName('CR_BY_DT').AsInteger;

     STRU.DB_ID_SCH     :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_SCH')).asInt64;
     STRU.KR_ID_SCH     :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_SCH')).asInt64;;

     STRU.DB_ID_SMETA   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_SM')).asInt64;
     STRU.KR_ID_SMETA   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_SM')).asInt64;

     STRU.DB_ID_RAZD    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_RZ')).asInt64;
     STRU.KR_ID_RAZD    :=-1;

     STRU.DB_ID_STAT    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_ST')).asInt64;
     STRU.KR_ID_STAT    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_ST')).asInt64;

     STRU.DB_ID_KEKV    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_KEKV')).asInt64;
     STRU.KR_ID_KEKV    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_KEKV')).asInt64;


     STRU.ACTUAL_DATE   :=localWorkPeriod;
     STRU.WIZARD_FORM_SH:=true;
     STRU.INFO_PANEL_SH :=true;
     STRU.NOT_DIF_BDG_FG:=not cxCheckBox2.Checked;
     STRU.ID_LANGUAGE:=2;
     if Kernel.WizardGetProvInfo(@STRU)
     then begin
               SaveDataAfterWizard(STRU,ProvsDataSet.FieldByName('ID_PROV').Value);
               ID_PROV:=TFibBCDField(ProvsDataSet.FieldByName('ID_PROV')).AsInt64;
               cxGrid1DBTableView1.Controller.BeginUpdate;
               ProvsDataSet.CloseOpen(true);
               ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
               cxGrid1DBTableView1.Controller.EndUpdate;
     end;
end;

procedure TfrmDocsInfo.cxGrid1DBBandedTableView1DBBandedColumn9PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var  STRU:WIZARD_GET_PROV_INFO;
     ID_PROV:Int64;
begin
     //Работа мастера
     STRU.AOWNER        :=self;
     STRU.DBHANDLE      :=WorkDatabase.Handle;
     STRU.MODE          :=11;
     STRU.CR_BY_DT      :=ProvsDataSet.FieldByName('CR_BY_DT').AsInteger;

     STRU.DB_ID_SCH     :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_SCH')).asInt64;
     STRU.KR_ID_SCH     :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_SCH')).asInt64;;

     STRU.DB_ID_SMETA   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_SM')).asInt64;
     STRU.KR_ID_SMETA   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_SM')).asInt64;

     STRU.DB_ID_RAZD    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_RZ')).asInt64;
     STRU.KR_ID_RAZD    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_RZ')).asInt64;

     STRU.DB_ID_STAT    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_ST')).asInt64;
     STRU.KR_ID_STAT    :=-1;

     STRU.DB_ID_KEKV    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_KEKV')).asInt64;
     STRU.KR_ID_KEKV    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_KEKV')).asInt64;


     STRU.ACTUAL_DATE   :=localWorkPeriod;
     STRU.WIZARD_FORM_SH:=true;
     STRU.INFO_PANEL_SH :=true;
     STRU.NOT_DIF_BDG_FG:=not cxCheckBox2.Checked;
     STRU.ID_LANGUAGE:=2;
     if Kernel.WizardGetProvInfo(@STRU)
     then begin
               SaveDataAfterWizard(STRU,ProvsDataSet.FieldByName('ID_PROV').Value);
               ID_PROV:=TFibBCDField(ProvsDataSet.FieldByName('ID_PROV')).AsInt64;
               cxGrid1DBTableView1.Controller.BeginUpdate;
               ProvsDataSet.CloseOpen(true);
               ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
               cxGrid1DBTableView1.Controller.EndUpdate;
     end;
end;

procedure TfrmDocsInfo.cxGrid1DBBandedTableView1DBBandedColumn3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var  STRU:WIZARD_GET_PROV_INFO;
     ID_PROV:Int64;
begin
     //Работа мастера
     STRU.AOWNER        :=self;
     STRU.DBHANDLE      :=WorkDatabase.Handle;
     STRU.MODE          :=11;
     STRU.CR_BY_DT      :=ProvsDataSet.FieldByName('CR_BY_DT').AsInteger;

     STRU.DB_ID_SCH     :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_SCH')).asInt64;
     STRU.KR_ID_SCH     :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_SCH')).asInt64;

     STRU.DB_ID_SMETA   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_SM')).asInt64;
     STRU.KR_ID_SMETA   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_SM')).asInt64;

     STRU.DB_ID_RAZD    :=-1;
     STRU.KR_ID_RAZD    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_RZ')).asInt64;

     STRU.DB_ID_STAT    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_ST')).asInt64;
     STRU.KR_ID_STAT    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_ST')).asInt64;

     STRU.DB_ID_KEKV    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_KEKV')).asInt64;
     STRU.KR_ID_KEKV    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_KEKV')).asInt64;

     STRU.ACTUAL_DATE   :=localWorkPeriod;
     STRU.WIZARD_FORM_SH:=true;
     STRU.INFO_PANEL_SH :=true;
     STRU.NOT_DIF_BDG_FG:=not cxCheckBox2.Checked;
     STRU.ID_LANGUAGE:=2;
     if Kernel.WizardGetProvInfo(@STRU)
     then begin
               SaveDataAfterWizard(STRU,ProvsDataSet.FieldByName('ID_PROV').Value);
               ID_PROV:=TFibBCDField(ProvsDataSet.FieldByName('ID_PROV')).AsInt64;
               cxGrid1DBTableView1.Controller.BeginUpdate;
               ProvsDataSet.CloseOpen(true);
               ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
               cxGrid1DBTableView1.Controller.EndUpdate;
     end;
end;

procedure TfrmDocsInfo.cxGrid1DBBandedTableView1DBBandedColumn4PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var  STRU:WIZARD_GET_PROV_INFO;
     ID_PROV:Int64;
begin
     //Работа мастера
     STRU.AOWNER        :=self;
     STRU.DBHANDLE      :=WorkDatabase.Handle;
     STRU.MODE          :=11;
     STRU.CR_BY_DT      :=ProvsDataSet.FieldByName('CR_BY_DT').AsInteger;

     STRU.DB_ID_SCH     :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_SCH')).asInt64;
     STRU.KR_ID_SCH     :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_SCH')).asInt64;

     STRU.DB_ID_SMETA   :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_SM')).asInt64;
     STRU.KR_ID_SMETA   :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_SM')).asInt64;

     STRU.DB_ID_RAZD    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_RZ')).asInt64;
     STRU.KR_ID_RAZD    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_RZ')).asInt64;

     STRU.DB_ID_STAT    :=-1;
     STRU.KR_ID_STAT    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_ST')).asInt64;

     STRU.DB_ID_KEKV    :=TFibBCDField(ProvsDataSet.FieldByName('DB_ID_KEKV')).asInt64;
     STRU.KR_ID_KEKV    :=TFibBCDField(ProvsDataSet.FieldByName('KR_ID_KEKV')).asInt64;

     STRU.ACTUAL_DATE   :=localWorkPeriod;
     STRU.WIZARD_FORM_SH:=true;
     STRU.INFO_PANEL_SH :=true;
     STRU.NOT_DIF_BDG_FG:=not cxCheckBox2.Checked;
     STRU.ID_LANGUAGE:=2;
     if Kernel.WizardGetProvInfo(@STRU)
     then begin
               SaveDataAfterWizard(STRU,ProvsDataSet.FieldByName('ID_PROV').Value);
               ID_PROV:=TFibBCDField(ProvsDataSet.FieldByName('ID_PROV')).AsInt64;
               cxGrid1DBTableView1.Controller.BeginUpdate;
               ProvsDataSet.CloseOpen(true);
               ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
               cxGrid1DBTableView1.Controller.EndUpdate;
     end;
end;

procedure TfrmDocsInfo.provsViewDblClick(Sender: TObject);
begin
     UpdateSum;
end;

procedure TfrmDocsInfo.provsViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_RETURN
  then UpdateSum;
end;

procedure TfrmDocsInfo.Panel2DblClick(Sender: TObject);
begin
     if ProvsDataSet.RecordCount>0
     then begin
               if ProvsDataSet.FieldByName('DB_ID_DOG').Value<>null
               then showMessage('id_dog='+ProvsDataSet.FieldByName('DB_ID_DOG').AsString+ ' kod_dog='+ProvsDataSet.FieldByName('DB_KOD_DOG').AsString)
               else showMessage('id_dog= '+' kod_dog=');
     end
end;

procedure TfrmDocsInfo.N7Click(Sender: TObject);
var  CP:TpFibStoredProc;
     ID_PROV:Integer;
     STRU:WIZARD_GET_PROV_INFO;
begin
     //Работа мастера
     STRU.AOWNER:=self;
     STRU.DBHANDLE:=WorkDatabase.Handle;
     STRU.MODE:=21;

     if self.id_form_kod<>10
     then STRU.ID_FORM_UCH:=self.id_form_kod
     else STRU.ID_FORM_UCH:=1;

     STRU.CR_BY_DT      :=1;
     STRU.ACTUAL_DATE   :=localWorkPeriod;
     STRU.WIZARD_FORM_SH:=true;
     STRU.INFO_PANEL_SH :=true;
     STRU.NOT_DIF_BDG_FG:=true;
     STRU.ID_LANGUAGE   :=2;
     if Kernel.WizardGetProvInfo(@STRU)
     then begin
               //Создание шаблона проводки
               CP:=TpFibStoredProc.Create(self);
               CP.Database:=WorkDatabase;
               CP.Transaction:=WriteTransaction;
               CP.Transaction.StartTransaction;
               CP.StoredProcName:='MBOOK_CREATE_PROV';
               CP.Prepare;
               CP.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
               CP.ParamByName('PK_ID').AsInt64:=PK_ID;
               CP.ExecProc;
               ID_PROV:=CP.ParamByName('ID_PROV').AsInteger;
               CP.Transaction.Commit;
               CP.Free;

               SaveDataAfterWizard(STRU,ID_PROV);

               cxGrid1DBTableView1.Controller.BeginUpdate;
               ProvsDataSet.CloseOpen(true);
               ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);

               //UpdateSum;

               cxGrid1DBTableView1.Controller.EndUpdate;
     end;

end;

procedure TfrmDocsInfo.N11Click(Sender: TObject);
var  CP:TpFibStoredProc;
     ID_PROV:Integer;
     STRU:WIZARD_GET_PROV_INFO;
begin
     //Работа мастера
     STRU.AOWNER:=self;
     STRU.DBHANDLE:=WorkDatabase.Handle;
     STRU.MODE:=21;
     if self.id_form_kod<>10
     then STRU.ID_FORM_UCH:=self.id_form_kod
     else STRU.ID_FORM_UCH:=1;


     STRU.CR_BY_DT:=0;
     STRU.ACTUAL_DATE:=localWorkPeriod;
     STRU.WIZARD_FORM_SH:=true;
     STRU.INFO_PANEL_SH:=true;
     STRU.NOT_DIF_BDG_FG:=true;
     STRU.ID_LANGUAGE:=2;
     if Kernel.WizardGetProvInfo(@STRU)
     then begin
               //Создание шаблона проводки
               CP:=TpFibStoredProc.Create(self);
               CP.Database:=WorkDatabase;
               CP.Transaction:=WriteTransaction;
               CP.Transaction.StartTransaction;
               CP.StoredProcName:='MBOOK_CREATE_PROV';
               CP.Prepare;
               CP.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
               CP.ParamByName('PK_ID').AsInt64:=PK_ID;
               CP.ExecProc;
               ID_PROV:=CP.ParamByName('ID_PROV').AsInteger;
               CP.Transaction.Commit;
               CP.Free;

               SaveDataAfterWizard(STRU,ID_PROV);

               cxGrid1DBTableView1.Controller.BeginUpdate;
               ProvsDataSet.CloseOpen(true);
               ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
               //UpdateSum;
               cxGrid1DBTableView1.Controller.EndUpdate;
     end;
end;

procedure TfrmDocsInfo.InsertActionExecute(Sender: TObject);
var
  T: TfrmInputProv;
begin
     T:=TfrmInputProv.Create(self);
     if T.ShowModal=mrYes
     then begin
               if T.cxRadioButton1.Checked then N7.OnClick(self);
               if T.cxRadioButton2.Checked then N11.OnClick(self);
               if T.cxRadioButton3.Checked then N6.OnClick(self);
     end;
     T.Free;
end;

procedure TfrmDocsInfo.ToolButton3Click(Sender: TObject);
var T:TfrmGetExtParams;
    UpdProc:TpFibStoredProc;
begin
if (ProvsDataSet.RecordCount>0)
then begin
     T:=TfrmGetExtParams.Create(self);

     if ProvsDataSet.FieldByName('DB_ID_DOG').Value<>null
     then T.DB_ID_DOG:=StrToInt64(ProvsDataSet.FieldByName('DB_ID_DOG').AsString)
     else T.DB_ID_DOG:=-1;

     if ProvsDataSet.FieldByName('KR_ID_DOG').Value<>null
     then T.KR_ID_DOG:=StrToInt64(ProvsDataSet.FieldByName('KR_ID_DOG').asstring)
     else T.KR_ID_DOG:=-1;

     if ProvsDataSet.FieldByName('DB_KOD_DOG').Value<>null
     then T.DB_KOD_DOG:=StrToInt64(ProvsDataSet.FieldByName('DB_KOD_DOG').AsString)
     else T.DB_KOD_DOG:=-1;

     if ProvsDataSet.FieldByName('KR_KOD_DOG').Value<>null
     then T.KR_KOD_DOG:=StrToInt64(ProvsDataSet.FieldByName('KR_KOD_DOG').AsString)
     else T.KR_KOD_DOG:=-1;

     if ProvsDataSet.FieldByName('ID_MEN').Value<>null
     then T.ID_MEN:=TFIBBCDField(ProvsDataSet.FieldByName('ID_MEN')).AsInt64
     else T.ID_MEN:=-1;

     if ProvsDataSet.FieldByName('FIO').Value<>null
     then T.cxButtonEdit3.Text:=ProvsDataSet.FieldByName('FIO').AsString
     else T.cxButtonEdit3.Text:='';

     if T.ShowModal=mrYes
     then begin
               UpdProc:=TpFibStoredProc.Create(self);
               UpdProc.Database:=WorkDatabase;
               UpdProc.Transaction:=WriteTransaction;
               UpdProc.Transaction.StartTransaction;
               UpdProc.StoredProcName:='MBOOK_UPDATE_PROV_EXT_INFO';
               UpdProc.Prepare;
               UpdProc.ParamByName('DB_ID_DOG').asInt64     :=T.DB_ID_DOG;
               UpdProc.ParamByName('KR_ID_DOG').asInt64     :=T.KR_ID_DOG;
               UpdProc.ParamByName('DB_KOD_DOG').asInt64    :=T.DB_KOD_DOG;
               UpdProc.ParamByName('KR_KOD_DOG').asInt64    :=T.KR_KOD_DOG;
               UpdProc.ParamByName('ID_MEN').asInt64        :=T.ID_MEN;
               UpdProc.ParamByName('KEY_SESSION').AsInt64   :=KEY_SESSION;
               UpdProc.ParamByName('ID_PROV').AsInt64       :=StrToInt64(ProvsDataSet.FieldByName('ID_PROV').asString);
               UpdProc.ExecProc;
               WriteTransaction.Commit;
               UpdProc.Free;

               ProvsDataSet.CloseOpen(true);
     end;
     T.Free;
end;
end;

procedure TfrmDocsInfo.DBF1Click(Sender: TObject);
var T:TfrmGetDbfPath;
    id_doc:Int64;
begin
     if ((FileExists(ALL_DOC_DBF_PATH) and FileExists(ALL_PROV_DBF_PATH)))
     then begin
               id_doc:=GetDbfIdDoc;
               if (id_doc<>0)
               then loadProvsFromDBF(Id_Doc);
     end
     else begin
               T:=TfrmGetDbfPath.Create(self);
               T.cxCheckBox1.Checked:=Boolean(NEED_HEADER_INFO);
               T.EdAllDocDBF.Text:=ALL_DOC_DBF_PATH;
               T.EdAllProvDBF.Text:=ALL_PROV_DBF_PATH;
               if T.ShowModal=mrYes
               then begin

                         NEED_HEADER_INFO :=Integer(T.cxCheckBox1.checked);
                         ALL_DOC_DBF_PATH :=T.EdAllDocDBF.Text;
                         ALL_PROV_DBF_PATH:=T.EdAllProvDBF.Text;

                         if (NEED_HEADER_INFO=1)
                         then id_doc:=GetDbfIdDoc
                         else id_doc:=-1;

                         if (id_doc<>0)
                         then loadProvsFromDBF(Id_Doc);
               end;
               T.Free;
     end;
end;

function TfrmDocsInfo.GetDbfIdDoc: Int64;
var  T:TfrmGetDBFDoc;
     id_doc:Int64;
     InsertSP:TpFibStoredProc;
begin
     if HalcyonDataSet1.Active then HalcyonDataSet1.Close;

     id_doc:=0;
     HalcyonDataSet1.DatabaseName:=ExtractFilePath(ALL_DOC_DBF_PATH);
     HalcyonDataSet1.TableName:=ExtractFileName(ALL_DOC_DBF_PATH);

     HalcyonDataSet1.Open;
     if HalcyonDataSet1.Active
     then begin
                T:=TfrmGetDBFDoc.Create(self);
                if T.ShowModal=mrYes
                then begin
                           id_doc:=StrToInt64(HalcyonDataSet1.FieldByName('ID_DOC').AsString);

                           //Сохраняем информацию о шапке документа
                           InsertSP:=TpFibStoredProc.Create(self);
                           InsertSP.Database:=WorkDatabase;
                           InsertSP.Transaction:=WriteTransaction;
                           WriteTransaction.StartTransaction;
                           InsertSP.StoredProcName:='MBOOK_UPDATE_DOC';
                           InsertSP.Prepare;
                           InsertSP.ParamByName('ID_TYPE_DOC').Value       :=5000;
                           InsertSP.ParamByName('NUM_DOC').Value           :=HalcyonDataSet1.FieldByName('NUM_DOC').Value;
                           InsertSP.ParamByName('DATE_DOC').Value          :=HalcyonDataSet1.FieldByName('DATE_DOC').Value;
                           InsertSP.ParamByName('DATE_PROV').Value         :=HalcyonDataSet1.FieldByName('DATE_PROV').Value;
                           InsertSP.ParamByName('ID_CUSTOMER').Value       :=NULL;
                           InsertSP.ParamByName('NOTE').Value              :=HalcyonDataSet1.FieldByName('NOTE').Value;
                           InsertSP.ParamByName('FIO').Value               :=NULL;
                           InsertSP.ParamByName('ID_RATE_ACC').Value       :=NULL;
                           InsertSP.ParamByName('ID_RATE_ACC_NATIVE').Value:=NULL;
                           InsertSP.ParamByName('PRIHOD').Value            :=NULL;
                           InsertSP.ParamByName('KEY_SESSION').AsInt64     :=KEY_SESSION;
                           InsertSP.ExecProc;
                           InsertSP.Transaction.Commit;
                           InsertSP.Free;

                end
                else id_doc:=0;
                T.Free;
     end;
     Result:=id_doc;
end;

procedure TfrmDocsInfo.loadProvsFromDBF(Id_doc: Int64);
var i:Integer;
    Id_Doc_Str:String;
    InsertStoredProc:TpFibStoredProc;
begin
     Id_Doc_Str:=IntToStr(Id_doc);

     if HalcyonDataSet1.Active then HalcyonDataSet1.Close;
     HalcyonDataSet1.DatabaseName:=ExtractFilePath(ALL_PROV_DBF_PATH);
     HalcyonDataSet1.TableName:=ExtractFileName(ALL_PROV_DBF_PATH);
     HalcyonDataSet1.Open;

     if HalcyonDataSet1.Active
     then begin
               HalcyonDataSet1.First;

               if (HalcyonDataSet1.RecordCount>0)
               then begin
                         InsertStoredProc:=TpFibStoredProc.Create(self);
                         InsertStoredProc.Database:=WorkDatabase;
                         InsertStoredProc.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         InsertStoredProc.StoredProcName:='PUB_DT_ALL_PROV_BUFFER_INSERT';
                         InsertStoredProc.Prepare;

                         for i:=1 to HalcyonDataSet1.RecordCount do
                         begin
                              if (Id_doc > 0)
                              then begin
                                        If (Id_Doc_Str=HalcyonDataSet1.FieldByName('DB_ID_DOC').AsString)
                                        or (Id_Doc_Str=HalcyonDataSet1.FieldByName('KR_ID_DOC').AsString)
                                        then begin
                                                  //Сохраняем информацию по проводке
                                                  InsertStoredProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                                                  InsertStoredProc.ParamByName('DATE_REG').Value     :=HalcyonDataSet1.FieldByName('DATE_REG').Value;
                                                  InsertStoredProc.ParamByName('CR_BY_DT').Value     :=Integer(HalcyonDataSet1.FieldByName('CR_BY_DT').AsBoolean);
                                                  InsertStoredProc.ParamByName('STORNO').Value       :=Integer(HalcyonDataSet1.FieldByName('STORNO').AsBoolean);
                                                  InsertStoredProc.ParamByName('DB_BAL_ID').Value    :=HalcyonDataSet1.FieldByName('DB_BAL_ID').AsInteger;
                                                  InsertStoredProc.ParamByName('DB_SUB_ID').Value    :=HalcyonDataSet1.FieldByName('DB_SUB_ID').AsInteger;
                                                  InsertStoredProc.ParamByName('DB_KOD_SM').Value    :=HalcyonDataSet1.FieldByName('DB_KOD_SM').AsInteger;
                                                  InsertStoredProc.ParamByName('DB_KOD_RAZ').Value   :=HalcyonDataSet1.FieldByName('DB_KOD_RAZ').AsInteger;
                                                  InsertStoredProc.ParamByName('DB_KOD_ST').Value    :=HalcyonDataSet1.FieldByName('DB_KOD_ST').AsInteger;
                                                  InsertStoredProc.ParamByName('KR_BAL_ID').Value    :=HalcyonDataSet1.FieldByName('KR_BAL_ID').AsInteger;
                                                  InsertStoredProc.ParamByName('KR_SUB_ID').Value    :=HalcyonDataSet1.FieldByName('KR_SUB_ID').AsInteger;
                                                  InsertStoredProc.ParamByName('KR_KOD_SM').Value    :=HalcyonDataSet1.FieldByName('KR_KOD_SM').AsInteger;
                                                  InsertStoredProc.ParamByName('KR_KOD_RAZ').Value   :=HalcyonDataSet1.FieldByName('KR_KOD_RAZ').Value;
                                                  InsertStoredProc.ParamByName('KR_KOD_ST').Value    :=HalcyonDataSet1.FieldByName('KR_KOD_ST').Value;
                                                  InsertStoredProc.ParamByName('SUMMA').Value        :=HalcyonDataSet1.FieldByName('SUMMA').Value;

                                                  if (HalcyonDataSet1.FieldByName('KOD_DOG').Value<>null)
                                                  then begin
                                                            InsertStoredProc.ParamByName('KOD_DOG').asInt64    :=StrToInt64(HalcyonDataSet1.FieldByName('KOD_DOG').AsString);
                                                            InsertStoredProc.ParamByName('ID_DOG').asInt64     :=StrToInt64(HalcyonDataSet1.FieldByName('ID_DOG').AsString);
                                                  end
                                                  else begin
                                                            InsertStoredProc.ParamByName('KOD_DOG').Value      :=null;
                                                            InsertStoredProc.ParamByName('ID_DOG').Value       :=null;
                                                  end;

                                                  InsertStoredProc.ExecProc;
                                        end;
                              end
                              else begin
                                        //Сохраняем информацию по проводке
                                        InsertStoredProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                                        InsertStoredProc.ParamByName('DATE_REG').Value     :=HalcyonDataSet1.FieldByName('DATE_REG').Value;
                                        InsertStoredProc.ParamByName('CR_BY_DT').Value     :=Integer(HalcyonDataSet1.FieldByName('CR_BY_DT').AsBoolean);
                                        InsertStoredProc.ParamByName('STORNO').Value       :=Integer(HalcyonDataSet1.FieldByName('STORNO').AsBoolean);
                                        InsertStoredProc.ParamByName('DB_BAL_ID').Value    :=HalcyonDataSet1.FieldByName('DB_BAL_ID').AsInteger;
                                        InsertStoredProc.ParamByName('DB_SUB_ID').Value    :=HalcyonDataSet1.FieldByName('DB_SUB_ID').AsInteger;
                                        InsertStoredProc.ParamByName('DB_KOD_SM').Value    :=HalcyonDataSet1.FieldByName('DB_KOD_SM').AsInteger;
                                        InsertStoredProc.ParamByName('DB_KOD_RAZ').Value   :=HalcyonDataSet1.FieldByName('DB_KOD_RAZ').AsInteger;
                                        InsertStoredProc.ParamByName('DB_KOD_ST').Value    :=HalcyonDataSet1.FieldByName('DB_KOD_ST').AsInteger;
                                        InsertStoredProc.ParamByName('KR_BAL_ID').Value    :=HalcyonDataSet1.FieldByName('KR_BAL_ID').AsInteger;
                                        InsertStoredProc.ParamByName('KR_SUB_ID').Value    :=HalcyonDataSet1.FieldByName('KR_SUB_ID').AsInteger;
                                        InsertStoredProc.ParamByName('KR_KOD_SM').Value    :=HalcyonDataSet1.FieldByName('KR_KOD_SM').AsInteger;
                                        InsertStoredProc.ParamByName('KR_KOD_RAZ').Value   :=HalcyonDataSet1.FieldByName('KR_KOD_RAZ').Value;
                                        InsertStoredProc.ParamByName('KR_KOD_ST').Value    :=HalcyonDataSet1.FieldByName('KR_KOD_ST').Value;
                                        InsertStoredProc.ParamByName('SUMMA').Value        :=HalcyonDataSet1.FieldByName('SUMMA').Value;

                                        if (HalcyonDataSet1.FieldByName('KOD_DOG').Value<>null)
                                        then begin
                                                  InsertStoredProc.ParamByName('KOD_DOG').asInt64    :=StrToInt64(HalcyonDataSet1.FieldByName('KOD_DOG').AsString);
                                                  InsertStoredProc.ParamByName('ID_DOG').asInt64     :=StrToInt64(HalcyonDataSet1.FieldByName('ID_DOG').AsString);
                                        end
                                        else begin
                                                  InsertStoredProc.ParamByName('KOD_DOG').Value      :=null;
                                                  InsertStoredProc.ParamByName('ID_DOG').Value       :=null;
                                        end;

                                        InsertStoredProc.ExecProc;
                              end;
                              HalcyonDataSet1.Next;
                         end;
                         WriteTransaction.Commit;
                         RefreshButton.OnClick(self);
                         InsertStoredProc.Free;
               end;

     end;
end;

procedure TfrmDocsInfo.FormCreate(Sender: TObject);
var reg:TRegistry;

begin
      CHANGE_FLAG:=false;
      reg:=TRegistry.Create;
      try
         reg.RootKey:=HKEY_CURRENT_USER;
         if  reg.OpenKey('\Software\Budgeting\ALL_DOC_DBF_PATH\',False)
         then begin
                   ALL_DOC_DBF_PATH :=reg.ReadString('ALL_DOC_DBF_PATH');
         end;

         NEED_HEADER_INFO:=1;
         if  reg.OpenKey('\Software\Budgeting\NEED_HEADER_INFO\',False)
         then begin
                   NEED_HEADER_INFO :=StrToInt(reg.ReadString('NEED_HEADER_INFO'));
         end;

         if  reg.OpenKey('\Software\Budgeting\ALL_PROV_DBF_PATH\',False)
         then begin
                   ALL_PROV_DBF_PATH:=reg.ReadString('ALL_PROV_DBF_PATH');
         end;

      finally
             reg.Free;
      end;

      if not self.Mode
      then ToolButton1.Enabled:=true;
end;

procedure TfrmDocsInfo.DBF2Click(Sender: TObject);
var reg:TRegistry;
begin
      reg:=TRegistry.Create;
      try
         reg.RootKey:=HKEY_CURRENT_USER;
         ALL_DOC_DBF_PATH:='';
         ALL_PROV_DBF_PATH:='';
         NEED_HEADER_INFO:=1;

         if  reg.OpenKey('\Software\Budgeting\ALL_DOC_DBF_PATH\',true)
         then begin
                   reg.WriteString('ALL_DOC_DBF_PATH',ALL_DOC_DBF_PATH);
         end;
         if  reg.OpenKey('\Software\Budgeting\ALL_PROV_DBF_PATH\',true)
         then begin
                   reg.WriteString('ALL_PROV_DBF_PATH',ALL_PROV_DBF_PATH);
         end;
         if  reg.OpenKey('\Software\Budgeting\NEED_HEADER_INFO\',true)
         then begin
                   reg.WriteString('NEED_HEADER_INFO','1');
         end;


      finally
         reg.Free;
      end;
end;

procedure TfrmDocsInfo.GetRigths;
begin
     //Проверка на редактирование документа
     {if fibCheckPermission('/ROOT/Kernell/MBook','Edit')=0
     then begin //yes
                InsertAction.OnExecute:=nil;
                AddButton.Enabled:=true;
                ViewButton.Enabled:=true;
                ToolButton3.Enabled:=true;
                ToolButton1.Enabled:=true;
                UpdateButton.Enabled:=true;
     end
     else begin //No
                agMessageDlg('Увага!','Ви маєте не маєте права редагувати цей документ?',mtInformation,[mbOk]);
                AddButton.Enabled:=false;
                ViewButton.Enabled:=false;
                ToolButton3.Enabled:=false;
                ToolButton1.Enabled:=false;
                UpdateButton.Enabled:=false;
                InsertAction.OnExecute:=InsertActionExecute;
     end;}
end;

procedure TfrmDocsInfo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    {if CHANGE_FLAG
    then begin
              Res:=agMessageDlg('Увага!','Зберегти зміни в документі?',mtWarning,[mbYes,mbNo,mbCancel]);
              if Res=mrYes
              then begin
                        ToolButton1.OnClick(self);
                        if not CHANGE_FLAG
                        then CanClose:=true
                        else CanClose:=false;
              end;
              if Res=mrNo
              then begin
                        CanClose:=true;
              end;
              if Res=mrCancel
              then begin
                        CanClose:=false;
              end;
    end;}

    CanClose:=true;
end;

procedure TfrmDocsInfo.DocDatePropertiesChange(Sender: TObject);
begin
     CHANGE_FLAG:=true;
end;

procedure TfrmDocsInfo.NumDocPropertiesChange(Sender: TObject);
begin
     CHANGE_FLAG:=true;
end;

procedure TfrmDocsInfo.DocTypePropertiesChange(Sender: TObject);
begin
     CHANGE_FLAG:=true;
end;

procedure TfrmDocsInfo.cxDBTextEdit1PropertiesChange(Sender: TObject);
begin
     CHANGE_FLAG:=true;
end;

procedure TfrmDocsInfo.DateProvPropertiesChange(Sender: TObject);
begin
     CHANGE_FLAG:=true;
end;

procedure TfrmDocsInfo.N10Click(Sender: TObject);
var I:Integer;
begin
     for i:=0 to provsView.ColumnCount-1 do provsView.Columns[i].Options.Filtering:=not N10.Checked;
     N10.Checked:=not N10.Checked;

end;

procedure TfrmDocsInfo.N12Click(Sender: TObject);
begin
     provsView.OptionsView.GroupByBox:=not N12.Checked;
     N12.Checked:=not N12.Checked;
end;

constructor TfrmDocsInfo.Create(AOwner: TComponent;
                                DBHandle: TISC_DB_HANDLE;
                                id_user: Int64;
                                login, user: string;
                                id_form_kod: integer;
                                WorkPeriod: TDateTime;
                                KEY_SESSION:Int64);
var GetPKID:TpFibDataSet;
    i:integer;
begin
     inherited Create(AOwner);
     CLEAR_TMP_INFO:=0;
     localWorkPeriod:=WorkPeriod;
     self.id_form_kod:=id_form_kod;
     WorkDatabase.Handle:=DBHandle;
     self.login:=login;
     self.user:=user;
     self.id_user:=id_user;

     PageControl2.ActivePage:=TabSheet3;
     GetSysInfo;


     TypeDocDataSet.SelectSQL.Text:='select * from pub_ini_type_doc where id_form_kod='+IntToStr(id_form_kod);
     TypeDocDataSet.Open;

     TypeDocDataSet.FetchAll;
     TypeDocDataSet.First;


     self.Mode:=true;
     self.KEY_SESSION:=KEY_SESSION;
     STRU.KERNEL_ACTION:=1;

     GetPKID:=TpFibDataSet.Create(self);
     GetPKID.Database:=WorkDatabase;
     GetPKID.Transaction:=ReadTransaction;
     GetPKID.SelectSQL.Text:='SELECT * FROM PUB_DT_ALL_DOC_BUFFER WHERE KEY_SESSION='+IntToStr(self.KEY_SESSION);
     GetPKID.Open;

     self.PK_ID:=StrToInt64(GetPKID.FieldByName('ID_DOC').asString);
     TypeDocDataSet.Locate('ID_TYPE_DOC',GetPKID.FieldByName('ID_TYPE_DOC').Value,[]);
     GetPKID.Close;
     GetPKID.Free;

     ConfigureAnGrid;

     MBIniDataSet.Open;
     if (MBIniDataSet.FieldByName('USE_DEFAULT_VALUES').AsInteger=1)
     then begin
                provsViewDBBandedColumn14.Visible:=false;
                provsViewDBBandedColumn2.Visible :=false;
                provsViewDBBandedColumn3.Visible :=false;
                provsViewDBBandedColumn4.Visible :=false;
                provsViewDBBandedColumn5.Visible :=false;
                provsViewDBBandedColumn7.Visible :=false;
                provsViewDBBandedColumn8.Visible :=false;
                provsViewDBBandedColumn9.Visible :=false;
                provsView.Bands[0].Width:=200;
                provsView.Bands[1].Width:=200;
                cxGrid1DBCardView2DBCardViewRow2.Visible         :=false;
                cxGrid1DBCardView2DBCardViewRow3.Visible         :=false;
                cxGrid1DBCardView2DBCardViewRow4.Visible         :=false;
                cxGrid1DBCardView2DBCardViewRow5.Visible         :=false;
                cxGrid1DBCardView2DBCardViewRow7.Visible         :=false;
                cxGrid1DBCardView2DBCardViewRow8.Visible         :=false;
                cxGrid1DBCardView2DBCardViewRow9.Visible         :=false;
                cxGrid1DBCardView2DBCardViewRow10.Visible        :=false;
     end
     else begin
                provsViewDBBandedColumn14.Visible:=true;
                provsViewDBBandedColumn2.Visible :=true;
                provsViewDBBandedColumn3.Visible :=true;
                provsViewDBBandedColumn4.Visible :=true;
                provsViewDBBandedColumn5.Visible :=true;
                provsViewDBBandedColumn7.Visible :=true;
                provsViewDBBandedColumn8.Visible :=true;
                provsViewDBBandedColumn9.Visible :=true;
                cxGrid1DBCardView2DBCardViewRow2.Visible         :=true;
                cxGrid1DBCardView2DBCardViewRow3.Visible         :=true;
                cxGrid1DBCardView2DBCardViewRow4.Visible         :=true;
                cxGrid1DBCardView2DBCardViewRow5.Visible         :=true;
                cxGrid1DBCardView2DBCardViewRow7.Visible         :=true;
                cxGrid1DBCardView2DBCardViewRow8.Visible         :=true;
                cxGrid1DBCardView2DBCardViewRow9.Visible         :=true;
                cxGrid1DBCardView2DBCardViewRow10.Visible        :=true;
     end;

     STRU.KERNEL_ACTION:=1;


     InfoDoc.SelectSQL.Text:=' SELECT * FROM MBOOK_DOC_BUFFER_SELECT('+IntToStr(self.KEY_SESSION)+')';
     InfoDoc.Open;

     ActionLog.Lines.Add('Створення документа');
     Caption:='Створення нового документу';

     provsViewDBBandedColumn10.PropertiesClass := TcxPopupEditProperties;
     TcxPopupEditProperties(provsViewDBBandedColumn10.Properties).PopupControl:=cxGrid2;

     provsViewDBBandedColumn15.PropertiesClass := TcxPopupEditProperties;
     TcxPopupEditProperties(provsViewDBBandedColumn15.Properties).PopupControl:=cxGrid3;

     NumDoc.Text                      := InfoDoc.FieldByName('NUM_DOC').AsString;
     DocDate.Date                     := InfoDoc.FieldByName('DATE_DOC').AsDateTime;
     DocType.editValue                := InfoDoc.FieldByName('ID_TYPE_DOC').Value;
     DateProv.Date                    := InfoDoc.FieldByName('DATE_PROV').AsDateTime;
     EdCustomer.Text                  := InfoDoc.FieldByName('CUSTOMER').AsString;
     EdAcc.Text                       := InfoDoc.FieldByName('ACC_TEXT').AsString;
     EdAccNative.Text                 := InfoDoc.FieldByName('ACC_NATIVE_TEXT').AsString;
     id_rate_acc_native               := InfoDoc.FieldByName('ID_RATE_ACC_NATIVE').Value;
     id_rate_acc                      := InfoDoc.FieldByName('ID_RATE_ACC').Value;
     id_customer                      := InfoDoc.FieldByName('ID_CUSTOMER').Value;
     EdComment.Text                   := InfoDoc.FieldByName('NOTE').AsString;
     cxCheckBox1.Checked              := InfoDoc.FieldByName('PRIHOD').AsBoolean;


     STRU.KEY_SESSION                 := KEY_SESSION;
     STRU.WORKDATE                    := DocDate.Date;
     STRU.DBHANDLE                    := WorkDatabase.Handle;
     STRU.TRHANDLE                    := WriteTransaction.Handle;
     ProvsDataSet.SelectSQL.Text      :=' SELECT * FROM MBOOK_PROV_BUFFER_SELECT('+IntToStr(self.KEY_SESSION)+')';
     DetailDataSet.SelectSQL.Text     :=' SELECT * FROM MBOOK_PROV_BUFFER_SELECT_EX('+IntToStr(self.KEY_SESSION)+')';
     DBTemplatesDataSet.SelectSQL.Text:=' SELECT * FROM PUB_DT_SCH_ANALITIC_SELECT_EX2(:DB_ID_SCH)';
     KRTemplatesDataSet.SelectSQL.Text:=' SELECT * FROM PUB_DT_SCH_ANALITIC_SELECT_EX2(:KR_ID_SCH)';
     ErrorProvsDataSet.SelectSQL.Text :=' SELECT * FROM KERNEL_PROVS_ERRORS WHERE ID_PROV=:ID_PROV AND KEY_SESSION='+IntToStr(self.KEY_SESSION);
     ProvInfoDataSet.SelectSQL.Text   :=' SELECT * FROM MBOOK_GET_PROV_INFO('+IntToStr(self.KEY_SESSION)+',:ID_PROV) ORDER BY INDEX_POS';
     ProvsDataSet.Open;


     if (self.id_form_kod in [9,99])
     then begin
                DBF1.Visible:=false;
                DBF2.Visible:=false;
     end
     else begin
                cxStyle12.Color        :=$00EBC4A4;
                cxStyle6.Color         :=$00EBC4A4;
                cxStyle13.Color        :=$00EBC4A4;
                DocDate.Style.Color    :=$00EBC4A4;
                NumDoc.Style.Color     :=$00EBC4A4;
                DateProv.Style.Color   :=$00EBC4A4;
                EdCustomer.Style.Color :=$00EBC4A4;
                EdAccNative.Style.Color:=$00EBC4A4;
                DocType.Style.Color    :=$00EBC4A4;
                cxTextEdit1.Style.Color:=$00EBC4A4;
                cxTextEdit2.Style.Color:=$00EBC4A4;
                EdAcc.Style.Color      :=$00EBC4A4;
                cxDBTextEdit1.Style.Color:=$00EBC4A4;
                EdComment.Style.Color  :=$00EBC4A4;

                for i:=0 to StyleRepository.Count-1 do
                begin
                      TcxStyle(StyleRepository.Items[i]).Font.Size:=8;
                end;
     end;
     GetRigths;
end;

procedure TfrmDocsInfo.ToolButton1Click(Sender: TObject);
var GetNumSP:TpFibStoredProc;
    MO_NUM:String;
begin



     if (ProvsDataSet.RecordCount>0)
     then begin
               if self.use_mo=0
               then begin
                         frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+
                                                 '\Reports\Mbook\ReportDocPrint.fr3',true);
                         frxReport1.Variables['DOC_DATE']:=Docdate.Date;
                         frxReport1.Variables['DATE_REG']:=DateProv.Date;
                         frxReport1.Variables['DOC_PROV']:=DateProv.Date;
                         frxReport1.Variables['SUMMA']   :=''''+cxDBTextEdit1.Text+'''';
                         frxReport1.Variables['DOC_NUM'] :=''''+NumDoc.Text+'''';
                         frxReport1.Variables['TYPE_DOC']:=''''+DocType.Text+'''';
                         frxReport1.Variables['DOC_NOTE']:=''''+EdComment.Text+'''';
               end
               else begin
                         GetNumSP:=TpFibStoredProc.Create(self);
                         GetNumSP.Database:=WorkDatabase;
                         GetNumSP.Transaction:=ReadTransaction;
                         GetNumSP.StoredProcName:='MBOOK_MO_GET_MO_NUM';
                         ReadTransaction.StartTransaction;
                         GetNumSP.Prepare;
                         GetNumSP.ParamByName('PK_ID').AsInt64:=PK_ID;
                         GetNumSP.ExecProc;
                         MO_NUM:=GetNumSP.ParamByName('MO_NUM').AsString;
                         GetNumSP.Close;
                         GetNumSP.Free;

                         frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+
                                                 '\Reports\Mbook\ReportDocPrintMO.fr3',true);
                         frxReport1.Variables['DATE_REG']:=DateProv.Date;
                         frxReport1.Variables['MO_NUM']:=''''+MO_NUM+'''';
                         frxReport1.Variables['CUSTOMER']:=''''+NativeCustomer+'''';
                         frxReport1.Variables['DOC_NOTE']:=''''+EdComment.Text+'''';
                         frxReport1.Variables['MAIN_BUHG_FIO']:=''''+MAIN_BUHG_FIO+'''';
                         frxReport1.Variables['USER_FIO']:=''''+accmgmt.GetUserFIO+'''';
               end;

               frxReport1.PrepareReport(true);
               frxReport1.ShowPreparedReport;
     end;
end;

procedure TfrmDocsInfo.N13Click(Sender: TObject);
var  CP:TpFibStoredProc;
     I:Integer;
begin
      if (ProvsDataSet.RecordCount>0)
      then begin
                 if BaseTypes.agMessageDlg('Увага!','Ви хочете видалити проводки з документа за фільтром?',mtWarning,[mbYes,mbNo])=mrYes
                 then begin
                           CP:=TpFibStoredProc.Create(self);
                           CP.Database:=WorkDatabase;
                           CP.Transaction:=WriteTransaction;
                           CP.Transaction.StartTransaction;
                           CP.StoredProcName:='MBOOK_DELETE_PROV';

                           for i:=0 to provsView.ViewData.RowCount-1 do
                           begin
                                CP.Prepare;
                                CP.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                                CP.ParamByName('ID_PROV').AsInt64    :=StrToInt64(provsView.ViewData.Rows[i].DisplayTexts[id_prov.index]);
                                CP.ExecProc;
                           end;

                           CP.Transaction.Commit;
                           ProvsDataSet.CloseOpen(true);
                           CP.Free;
                           InfoDoc.CloseOpen(true);
                 end;
      end;
end;

procedure TfrmDocsInfo.ToolButton4Click(Sender: TObject);
 var T:TfrmEditComments;
     upproc:TpFibStoredProc;
     id:Int64;
begin
     if (ProvsDataSet.RecordCount>0)
     then begin
               T:=TfrmEditComments.Create(self);
               t.cxMemo1.text:=Provsdataset.FieldByname('comments').asString;
               if T.ShowModal=mrYes
               then begin
                         upproc:=TpFibStoredProc.Create(self);
                         upproc.database:=WorkDatabase;
                         upproc.transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         upproc.StoredProcname:='PUB_DT_ALL_PROV_BUFFER_UPD_COM';
                         upproc.Prepare;
                         upproc.ParamByName('KEY_SESSION').asInt64:=KEY_SESSION;
                         id:=ProvsDataSet.FieldByName('ID_PROV').Value;
                         upproc.ParamByName('ID_PROV').asInt64    :=ProvsDataSet.FieldByName('ID_PROV').Value;
                         upproc.ParamByName('comments').value     :=t.cxMemo1.Text;
                         upproc.ExecProc;
                         WriteTransaction.Commit;

                         ProvsDataSet.CloseOpen(true);
                         ProvsDataSet.Locate('id_prov', id,[]);

               end;
               T.free;
     end;
end;

end.

