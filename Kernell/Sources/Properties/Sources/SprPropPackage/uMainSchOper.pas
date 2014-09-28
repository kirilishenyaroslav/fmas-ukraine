unit uMainSchOper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, ComCtrls, ToolWin, FIBDataSet,
  pFIBDataSet,FIBDatabase, pFIBDatabase,pFibStoredProc, Resources_unitb,
  StdCtrls, dateUtils, Menus, ImgList, Ibase,
  IB_Services, GlobalSpr, cxContainer, cxCheckBox, Placemnt, cxTextEdit,
  ActnList, dxStatusBar;

type
  TfrmMainOper = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    InsertButton: TToolButton;
    DeleteButton: TToolButton;
    UpdateButton: TToolButton;
    HelpButton: TToolButton;
    FilterButton: TToolButton;
    CloseButton: TToolButton;
    PropDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    PropDataSource: TDataSource;
    ViewButton: TToolButton;
    ToolBar2: TToolBar;
    Label8: TLabel;
    cbMonth: TComboBox;
    cbYear: TComboBox;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    AnalizeButton: TToolButton;
    ToolButton10: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    SmallImages: TImageList;
    WorkDatabase: TpFIBDatabase;
    cxCheckBox1: TcxCheckBox;
    FormStorage1: TFormStorage;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    BalckStyle: TcxStyle;
    GreenStyle: TcxStyle;
    RedStyle: TcxStyle;
    BlueStyle: TcxStyle;
    PurpleStyle: TcxStyle;
    AquaStyle: TcxStyle;
    SkyBlueStyle: TcxStyle;
    ActionList1: TActionList;
    Ins: TAction;
    Del: TAction;
    Change: TAction;
    dxStatusBar1: TdxStatusBar;
    Esc: TAction;
    ChooseButton: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure AnalizeButtonClick(Sender: TObject);
    procedure FilterButtonClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxGrid1DBTableView1StylesGetContentStyle( Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure InsExecute(Sender: TObject);
    procedure DelExecute(Sender: TObject);
    procedure ChangeExecute(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure ChooseButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    ResultValue       :Variant;
    WorkItem          :Integer;
    Curr_data         :TdateTime;
    constructor Create(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; Actualdate:TdateTime); overload;
  end;

function GetSprModal(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; Actualdate:TdateTime; FS:TFormStyle):variant;stdcall;
function GetSprMdi(AOwner:TComponent; DBhandle:TISC_DB_HANDLE;Actualdate:TdateTime):integer;stdcall;

exports GetSprMdi, GetSprModal;

implementation

uses uEditProperties, BaseTypes;
{$R *.dfm}

function GetSprMdi(AOwner:TComponent; DBhandle:TISC_DB_HANDLE;Actualdate:TdateTime):integer;
begin
       GetSprMdi:=integer(TfrmMainOper.Create(AOwner,DBhandle,Actualdate));
end;

function GetSprModal(AOwner:TComponent; DBhandle:TISC_DB_HANDLE;Actualdate:TdateTime; FS:TFormStyle):variant;
var
  res: variant;
  T: TfrmMainOper;
begin
      if FS=fsNormal
      then begin
            T:=TfrmMainOper.Create(AOwner,DBhandle,Actualdate);
            T.FormStyle:=fsNormal;
            T.ChooseButton.Enabled:=true;
            T.Visible:=false;
            T.cxGrid1DBTableView1.OptionsSelection.MultiSelect:=true;
            if T.ShowModal=mryes then res:=T.ResultValue
                                 else res:=NULL;
            T.Free;
      end;
      if FS=fsMDIchild
      then begin
            res:=integer(TfrmMainOper.Create(AOwner, DBhandle, Actualdate));
      end;
  GetSprModal:=res;
end;

constructor TfrmMainOper.Create(AOwner: TComponent; DBhandle:TISC_DB_HANDLE; Actualdate:TdateTime);
begin
      inherited Create(AOwner);
      self.WorkDatabase.handle:=DBhandle;
      Curr_data:=Actualdate;
end;

procedure TfrmMainOper.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmMainOper.FormCreate(Sender: TObject);
var i:integer;
begin
       PropDataSet.Database:=WorkDatabase;
       PropDataSet.Transaction:=ReadTransaction;
       PropDataSet.SQLs.SelectSQL.Text:='SELECT * FROM PUB_SP_PROPERTIES_SELECT ORDER BY TYPE_OBJECT';
       PropDataSet.Open;
       PropDataSet.FetchAll;
       cxGrid1DBTableView1.ViewData.Expand(true);

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


       cbMonth.ItemIndex:=MonthOf(Curr_data)-1;
       for i:=0 to cbYear.Items.Count-1 do
       begin
           if pos(cbYear.Items[i],IntToStr(YearOf(Curr_data)))>0
           then begin
              cbYear.ItemIndex:=i;
              break;
           end;
       end;
end;

procedure TfrmMainOper.InsertButtonClick(Sender: TObject);
var T:TfrmEditProp;
begin
    T:=TfrmEditProp.Create(self);
    T.ShowModal;
    T.Free;
    PropDataSet.CloseOpen(true);
    PropDataSet.Locate('id_prop',WorkItem,[]);
end;

procedure TfrmMainOper.InsExecute(Sender: TObject);
begin
  InsertButton.OnClick(self);
end;

procedure TfrmMainOper.UpdateButtonClick(Sender: TObject);
var T:TfrmEditProp;
begin
    WorkItem:=PropDataSet.FieldByName('ID_PROP').AsInteger;
    T:=TfrmEditProp.Create(self);
    T.IsEdit:=true;
    T.ShowModal;
    T.Free;
    PropDataSet.CloseOpen(true);
    PropDataSet.Locate('id_prop',WorkItem,[]);
end;

procedure TfrmMainOper.ChangeExecute(Sender: TObject);
begin
  UpdateButton.OnClick(self);
end;

procedure TfrmMainOper.ViewButtonClick(Sender: TObject);
var T:TfrmEditProp;
begin
    T:=TfrmEditProp.Create(self);
    T.IsEdit:=true;
    T.IsView:=true;
    T.ShowModal;
    T.Free;
end;

procedure TfrmMainOper.DeleteButtonClick(Sender: TObject);
var Proc:TpFibStoredProc;
begin
    if BaseTypes.agMessageDlg(BU_WarningCaption,BU_DeleteConfirmation+'"'+PropDataSet.FieldByName('Prop_Title').AsString+'"',mtWarning,[mbYes,mbNo])=mrYes
    then begin
                Proc:=TpFibStoredProc.Create(self);
                Proc.Database:=WorkDatabase;
                Proc.Transaction:=WriteTransaction;
                proc.StoredProcName:='PUB_SP_PROPERTIES_DELETE';
                WriteTransaction.StartTransaction;
                try
                      proc.Prepare;
                      proc.ParamByName('P_ID_PROP').Value:=PropDataSet.FieldByName('ID_PROP').AsInteger;
                      proc.ExecProc;
                except on E:Exception do
                      begin
                         WriteTransaction.Rollback;
                         BaseTypes.agMessageDlg(BU_WarningCaption,E.Message,mtWarning,[mbOk]);
                      end;
                end;
                WriteTransaction.Commit;
                PropDataSet.CloseOpen(true);
    end;
end;

procedure TfrmMainOper.DelExecute(Sender: TObject);
begin
  DeleteButton.OnClick(self);
end;

procedure TfrmMainOper.AnalizeButtonClick(Sender: TObject);
begin
     GetAnalize(self.owner,WorkDatabase.Handle,Curr_data,PropDataSet.FieldByName('ID_PROP').AsInteger,vmFixProp,fsMDIChild);
end;

procedure TfrmMainOper.FilterButtonClick(Sender: TObject);
begin
     cxGrid1DBTableView1.Filtering.RunCustomizeDialog(nil);
end;

procedure TfrmMainOper.N1Click(Sender: TObject);
begin
   InsertButton.OnClick(self);
end;

procedure TfrmMainOper.N2Click(Sender: TObject);
begin
  DeleteButton.OnClick(self);
end;

procedure TfrmMainOper.N3Click(Sender: TObject);
begin
  UpdateButton.OnClick(self);
end;

procedure TfrmMainOper.N5Click(Sender: TObject);
begin
  FilterButton.OnClick(self);
end;

procedure TfrmMainOper.N6Click(Sender: TObject);
begin
    AnalizeButton.OnClick(self);
end;

procedure TfrmMainOper.N7Click(Sender: TObject);
begin
    HelpButton.OnClick(self);
end;

procedure TfrmMainOper.N8Click(Sender: TObject);
begin
    CloseButton.OnClick(self);
end;

procedure TfrmMainOper.cxCheckBox1PropertiesChange(Sender: TObject);
begin
    cxGrid1DBTableView1.OptionsView.GroupByBox:=cxCheckBox1.Checked;
end;

procedure TfrmMainOper.cxGrid1DBTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
     if (ARecord.Values[4]<>NULL)
     then begin
               if Trim(VarToStr(ARecord.Values[4]))='clGreen'
               then AStyle:=GreenStyle;

               if Trim(VarToStr(ARecord.Values[4]))='clBlack'
               then AStyle:=BalckStyle;

               if Trim(VarToStr(ARecord.Values[4]))='clBlue'
               then AStyle:=BlueStyle;

               if Trim(VarToStr(ARecord.Values[4]))='clRed'
               then AStyle:=RedStyle;

               if Trim(VarToStr(ARecord.Values[4]))='clAqua'
               then AStyle:=AquaStyle;

               if Trim(VarToStr(ARecord.Values[4]))='clPurple'
               then AStyle:=PurpleStyle;

               if Trim(VarToStr(ARecord.Values[4]))='clSkyBlue'
               then AStyle:=SkyBlueStyle;
     end;

end;

procedure TfrmMainOper.EscExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMainOper.ChooseButtonClick(Sender: TObject);
var
  i: integer;
begin
      ResultValue:=VarArrayCreate([0,cxGrid1DBTableView1.Controller.SelectedRecordCount-1], varVariant);

      for i:=0 to cxGrid1DBTableView1.Controller.SelectedRecordCount-1 do
      begin
           ResultValue[i]:=VarArrayOf([ cxGrid1DBTableView1.Controller.SelectedRecords[i].DisplayTexts[0],
                                        cxGrid1DBTableView1.Controller.SelectedRecords[i].DisplayTexts[1],
                                        cxGrid1DBTableView1.Controller.SelectedRecords[i].DisplayTexts[2],
                                        cxGrid1DBTableView1.Controller.SelectedRecords[i].DisplayTexts[3] ]);
      end;
      ModalResult:=mrYes;
end;

end.
