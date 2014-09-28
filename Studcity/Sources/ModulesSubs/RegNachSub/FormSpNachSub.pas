unit FormSpNachSub;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ImgList, pFIBDataSet, FIBDatabase,
  pFIBDatabase, dxBar, dxBarExtItems, ActnList, dxStatusBar, StdCtrls,
  ExtCtrls, frxClass, frxDBSet, AccMGMT, st_constUnit, st_proc;

type
  TSpNachSub = class(TForm)
    ReadTransaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    LargeImages: TImageList;
    PopupImageList: TImageList;
    DisabledLargeImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Column_Otch: TcxGridDBColumn;
    Column_date_beg: TcxGridDBColumn;
    Column_date_End: TcxGridDBColumn;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    ViewButton: TdxBarLargeButton;
    AddRoomButton: TdxBarLargeButton;
    DeleteRoomButton: TdxBarLargeButton;
    EditRoomButton: TdxBarLargeButton;
    AddRoomButton2: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    Search_Button: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    ActionList1: TActionList;
    RefreshAction: TAction;
    ExitAction: TAction;
    Column_summa: TcxGridDBColumn;
    DataSetFAM: TFIBStringField;
    DataSetNAME: TFIBStringField;
    DataSetOTCHESTVO: TFIBStringField;
    DataSetDATE_BEG: TFIBDateField;
    DataSetDATE_END: TFIBDateField;
    DataSetSUMMA: TFIBBCDField;
    Column_Fam: TcxGridDBColumn;
    Column_name: TcxGridDBColumn;
    HotKey_StatusBar: TdxStatusBar;
    Panel1: TPanel;
    Bevel4: TBevel;
    Label1: TLabel;
    PrintAction: TAction;
    PrintButton: TdxBarLargeButton;
    DataSetReport: TfrxDBDataset;
    DataSet_reports: TpFIBDataSet;
    St_Report: TfrxReport;
    procedure ExitActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    Procedure Grid_select;
    procedure FormCreate(Sender: TObject);
    constructor Create(aOwner:TComponent; id_smsub:integer);
    procedure PrintActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    Id:integer;
    PLanguageIndex:integer;
    { Public declarations }
  end;

//const PLanguageIndex=1;
var
  SpNachSub: TSpNachSub;
  summ:Extended;


implementation

uses RegNachSub_unit;

{$R *.dfm}


procedure TSpNachSub.ExitActionExecute(Sender: TObject);
begin
 Close;
end;

Procedure TSpNachSub.Grid_select;
Begin
 summ:=0;
 Label1.Caption:='Общая сумма:';
 DataSet.Close;
 DataSet.SQLs.SelectSQL.Text:='Select * from st_dt_spsub_select(:id)';
 DataSet.ParamByName('id').asinteger:=Id;
 DataSet.Open;
 DataSet.FetchAll;
 While not DataSet.Eof do
  Begin
   Summ:=summ+DataSet['SUMMA'] ;
   DataSet.Next;
  End;
  summ:=trunc(summ*100)/100;
 Label1.Caption:=Label1.Caption+'  '+FloatToStr(Summ);
End;

procedure TSpNachSub.RefreshActionExecute(Sender: TObject);
begin
 Grid_select;
end;

procedure TSpNachSub.FormCreate(Sender: TObject);
begin
 //ReadTransaction.StartTransaction;
 Grid_select;
 PLanguageIndex:=st_proc.cnLanguageIndex;
 {button.language}
 RefreshButton.Caption:=st_RefreshBtn_Caption[PLanguageIndex];
 PrintButton.Caption:=st_Print_Caption[PLanguageIndex];
 ExitButton.Caption:=st_ExitBtn_Caption[PLanguageIndex];
end;

constructor TSpNachSub.Create(aOwner:TComponent;id_smsub: integer);
begin
 id:=id_smsub;
 inherited Create(aOwner);
end;

procedure TSpNachSub.PrintActionExecute(Sender: TObject);
var
 i:integer;
begin
 if fibCheckPermission('/ROOT/Studcity/Sp_OplSub','print') <> 0 then
 begin
  messagebox(handle,
  pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
  +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
  pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
  exit;
 end;
  DataSet_reports.Active:=False;
  DataSet_reports.ParamByName('id').asinteger:=Id;
  DataSet_reports.Active:=True;
  
  St_Report.Clear;
  St_Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\SpNachSub.fr3');
  St_Report.Variables.Clear;
  St_Report.PrepareReport;
  St_Report.ShowReport;

  //  ShowMEssage('Ручками');
end;

end.
