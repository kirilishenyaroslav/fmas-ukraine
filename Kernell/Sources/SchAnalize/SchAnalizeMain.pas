unit SchAnalizeMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, FIBDatabase, pFIBDatabase, cxStyles, ImgList,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxTextEdit, cxButtonEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ComCtrls, ToolWin,Ibase, cxGridBandedTableView,
  cxGridDBBandedTableView,pFibStoredProc, FIBDataSet, pFIBDataSet, ExtCtrls,
  cxContainer, cxCheckBox, StdCtrls, Placemnt;

type
  TfrmSchAnalize = class(TForm)
    SmallImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    columnst: TcxStyle;
    WorkDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    ToolBar1: TToolBar;
    CloseButton: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    SchAnDataSet: TpFIBDataSet;
    SchAnDataSource: TDataSource;
    Panel1: TPanel;
    cxCheckBox1: TcxCheckBox;
    cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn9: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn10: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn11: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn12: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn13: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn14: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn15: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn16: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn17: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn18: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn19: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn20: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn21: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn22: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn23: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn24: TcxGridDBBandedColumn;
    cxStyle2: TcxStyle;
    IniAnDataSet: TpFIBDataSet;
    Panel2: TPanel;
    cxCheckBox2: TcxCheckBox;
    Splitter1: TSplitter;
    cxCheckBox3: TcxCheckBox;
    Label1: TLabel;
    cxCheckBox4: TcxCheckBox;
    cxCheckBox5: TcxCheckBox;
    cxCheckBox6: TcxCheckBox;
    cxCheckBox7: TcxCheckBox;
    cxCheckBox8: TcxCheckBox;
    cxCheckBox9: TcxCheckBox;
    cxCheckBox10: TcxCheckBox;
    cxCheckBox11: TcxCheckBox;
    cxCheckBox12: TcxCheckBox;
    cxGrid1DBBandedTableView1DBBandedColumn25: TcxGridDBBandedColumn;
    cxGrid2: TcxGrid;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDBBandedColumn4: TcxGridDBBandedColumn;
    cxGridDBBandedColumn5: TcxGridDBBandedColumn;
    cxGridDBBandedColumn6: TcxGridDBBandedColumn;
    cxGridDBBandedColumn7: TcxGridDBBandedColumn;
    cxGridDBBandedColumn8: TcxGridDBBandedColumn;
    cxGridDBBandedColumn9: TcxGridDBBandedColumn;
    cxGridDBBandedColumn10: TcxGridDBBandedColumn;
    cxGridDBBandedColumn11: TcxGridDBBandedColumn;
    cxGridDBBandedColumn12: TcxGridDBBandedColumn;
    cxGridDBBandedColumn13: TcxGridDBBandedColumn;
    cxGridDBBandedColumn14: TcxGridDBBandedColumn;
    cxGridDBBandedColumn15: TcxGridDBBandedColumn;
    cxGridDBBandedColumn16: TcxGridDBBandedColumn;
    cxGridDBBandedColumn17: TcxGridDBBandedColumn;
    cxGridDBBandedColumn18: TcxGridDBBandedColumn;
    cxGridDBBandedColumn19: TcxGridDBBandedColumn;
    cxGridDBBandedColumn20: TcxGridDBBandedColumn;
    cxGridDBBandedColumn21: TcxGridDBBandedColumn;
    cxGridDBBandedColumn22: TcxGridDBBandedColumn;
    cxGridDBBandedColumn23: TcxGridDBBandedColumn;
    cxGridDBBandedColumn24: TcxGridDBBandedColumn;
    cxGridDBBandedColumn25: TcxGridDBBandedColumn;
    cxGridLevel1: TcxGridLevel;
    RealValDataSet: TpFIBDataSet;
    RealValDataSource: TDataSource;
    cxStyle3: TcxStyle;
    ImageList1: TImageList;
    FormStorage1: TFormStorage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseButtonClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxGrid1DBBandedTableView1DBBandedColumn4PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBBandedTableView1DBBandedColumn6PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBBandedTableView1DBBandedColumn8PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBBandedTableView1DBBandedColumn10PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBBandedTableView1DBBandedColumn12PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBBandedTableView1DBBandedColumn14PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBBandedTableView1DBBandedColumn16PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBBandedTableView1DBBandedColumn18PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBBandedTableView1DBBandedColumn20PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBBandedTableView1DBBandedColumn22PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxCheckBox2Click(Sender: TObject);
    procedure cxCheckBox3Click(Sender: TObject);
    procedure cxCheckBox4Click(Sender: TObject);
    procedure cxCheckBox5Click(Sender: TObject);
    procedure cxCheckBox6Click(Sender: TObject);
    procedure cxCheckBox7Click(Sender: TObject);
    procedure cxCheckBox8Click(Sender: TObject);
    procedure cxCheckBox9Click(Sender: TObject);
    procedure cxCheckBox10Click(Sender: TObject);
    procedure cxCheckBox11Click(Sender: TObject);
    procedure cxCheckBox12Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ResultValue:Variant;
    constructor Create(AOwner: TComponent; DB_HANDLE: TISC_DB_HANDLE;  FS: TFormStyle);
    procedure UpdateA(Index:Integer);
    procedure ShowAnalisy;
    function CheckCurStateAnalisy(Index:Integer):Integer;
  end;


  function GetSchAnalitic(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle):Variant;stdcall;
  Exports GetSchAnalitic;

implementation

uses GlobalSpr,SchAnalizeEdit, FIBQuery, BaseTypes;
{$R *.dfm}
function GetSchAnalitic(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle):Variant;
var T:TfrmSchAnalize;
    Res:Variant;
    f:Boolean;
    i:Integer;
begin
    if FS=fsNormal
    then begin
         T:=TfrmSchAnalize.Create(AOwner,DB_HANDLE,FS);
         if T.ShowModal=mrYes
         then begin
             Res:=T.ResultValue;
         end
         else Res:=NULL;
         T.Free;
    end
    else begin
         f:=true;
         for i:=0 to Application.MainForm.MDIChildCount-1 do
         begin
             if (Application.MainForm.MDIChildren[i] is TfrmSchAnalize)
             then begin
                  Application.MainForm.MDIChildren[i].BringToFront;
                  f:=false;
             end;
         end;
         if f then Res:=Integer(TfrmSchAnalize.Create(AOwner,DB_HANDLE,FS));
    end;
    GetSchAnalitic:=Res;
end;
{ TfrmSchAnalize }

constructor TfrmSchAnalize.Create(AOwner: TComponent;
  DB_HANDLE: TISC_DB_HANDLE; FS: TFormStyle);
begin
  Inherited Create(AOwner);
  self.FormStyle:=FS;
  WorkDatabase.Handle:=DB_HANDLE;

  SchAnDataSet.SelectSQL.Text:='SELECT * FROM PUB_DT_SCH_ANALITIC_SELECT('+IntToStr(Integer(cxCheckBox1.checked))+')';
  SchAnDataSet.Open;

  RealValDataSet.SelectSQL.Text:='SELECT * FROM PUB_DT_SCH_ANALITIC_SELECT_EX('+IntToStr(Integer(cxCheckBox1.checked))+')';
  RealValDataSet.Open;
end;

procedure TfrmSchAnalize.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmSchAnalize.CloseButtonClick(Sender: TObject);
var Res:Variant;
    Sp:TpFibStoredProc;
    New_Id:Integer;
begin
       Res:=GlobalSpr.GetScH(self.owner,WorkDatabase.handle,fsNormal,Date ,DEFAULT_ROOT_ID,0,0);
       if VarArrayDimCount(RES)>0
       then begin
              Sp:=TpFibStoredProc.Create(self);
              Sp.Database:=WorkDatabase;
              Sp.Transaction:=writeTransaction;
              Sp.StoredProcName:='PUB_DT_SCH_ANALITIC_INSERT';
              Sp.Transaction.StartTransaction;
              Sp.Prepare;
              Sp.ParamByName('ID_SCH').AsInteger:=RES[0][0];
              Sp.ExecProc;
              New_Id:=Sp.ParamByName('ID_SCH_ANALITIC').AsInteger;
              Sp.Transaction.Commit;
              Sp.Free;
              SchAnDataSet.CloseOpen(true);
              RealValDataSet.CloseOpen(true);
              SchAnDataSet.Locate('ID_SCH_ANALITIC',New_Id,[]);
       end;
end;

procedure TfrmSchAnalize.ToolButton3Click(Sender: TObject);
var New_Id:Integer;
begin
              if SchAnDataSet.RecordCount>0 then New_Id:=SchAnDataSet.FieldByName('ID_SCH_ANALITIC').AsInteger;
              SchAnDataSet.Close;
              SchAnDataSet.SelectSQL.Text:='SELECT * FROM PUB_DT_SCH_ANALITIC_SELECT('+IntToStr(Integer(cxCheckBox1.checked))+')';
              SchAnDataSet.Open;
              SchAnDataSet.Locate('ID_SCH_ANALITIC',New_Id,[]);
              RealValDataSet.CloseOpen(true);
end;

procedure TfrmSchAnalize.cxCheckBox1PropertiesChange(Sender: TObject);
var New_Id:Integer;
begin
              if SchAnDataSet.RecordCount>0 then New_Id:=SchAnDataSet.FieldByName('ID_SCH_ANALITIC').AsInteger;
              SchAnDataSet.Close;
              SchAnDataSet.SelectSQL.Text:='SELECT * FROM PUB_DT_SCH_ANALITIC_SELECT('+IntToStr(Integer(cxCheckBox1.checked))+')';
              SchAnDataSet.Open;
              SchAnDataSet.Locate('ID_SCH_ANALITIC',New_Id,[]);
end;

procedure TfrmSchAnalize.cxCheckBox1Click(Sender: TObject);
begin
    cxGrid1DBBandedTableView1DBBandedColumn23.Visible:=not cxCheckBox1.Checked;
    cxGrid1DBBandedTableView1DBBandedColumn24.Visible:=not cxCheckBox1.Checked;
end;

procedure TfrmSchAnalize.UpdateA(Index: Integer);
var Sp:TpFibStoredProc;
    New_id:Integer;
    T:TfrmSchAnalizeEdit;
begin
    if SchAnDataSet.RecordCount>0
    then begin
         T:=TfrmSchAnalizeEdit.Create(self);
         if SchAnDataSet.FieldByName('DEFAULT_VALUE'+IntToStr(Index)).AsVariant<>NULL
         then begin
            T.ckDefaultValue.Checked:=true;
            T.EdDefaultvalue.Text:=SchAnDataSet.FieldByName('EMUN_TITLE'+IntToStr(Index)).AsString;
            T.Id_def_val         :=SchAnDataSet.FieldByName('DEFAULT_VALUE'+IntToStr(Index)).Value;
         end;
         T.DBLookupComboBox1.KeyValue:=SchAnDataSet.FieldByName('ID_AN_TYPE_VALUE'+IntToStr(Index)).AsInteger;
         T.CurIndex:=CheckCurStateAnalisy(Index);
         if T.CurIndex>0
         then begin
                   if T.ShowModal=mrYes
                   then begin
                        New_Id:=SchAnDataSet.FieldByName('ID_SCH_ANALITIC').AsInteger;
                        Sp:=TpFibStoredProc.Create(self);
                        Sp.Database:=WorkDatabase;
                        Sp.Transaction:=WriteTransaction;
                        Sp.StoredProcName:='PUB_DT_SCH_ANALITIC_UPDATE';
                        Sp.Transaction.StartTransaction;
                        Sp.Prepare;
                        Sp.ParamByName('ID_SCH_ANALITIC').AsInteger:=New_id;
                        Sp.ParamByName('NUM_ANALITIC').AsInteger:=Index;
                        Sp.ParamByName('ID_AN_TYPE_VALUE').AsInteger:=T.DBLookupComboBox1.KeyValue;
                        IF T.ckDefaultValue.Checked
                        then Sp.ParamByName('DEFAULT_VALUE').AsInteger:=T.Id_def_val
                        else Sp.ParamByName('DEFAULT_VALUE').Value:=NULL;
                        Sp.ExecProc;
                        Sp.Transaction.Commit;
                        Sp.Free;
                        SchAnDataSet.CloseOpen(true);
                        SchAnDataSet.Locate('ID_SCH_ANALITIC',New_Id,[]);
                        RealValDataSet.CloseOpen(true);
                  end;
         end
         else begin
              ShowMessage('Данная аналитика не привязана к перечислению');
         end;
    end;
end;

procedure TfrmSchAnalize.cxGrid1DBBandedTableView1DBBandedColumn4PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  UpdateA(1);
end;

procedure TfrmSchAnalize.cxGrid1DBBandedTableView1DBBandedColumn6PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  UpdateA(2);
end;

procedure TfrmSchAnalize.cxGrid1DBBandedTableView1DBBandedColumn8PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
    UpdateA(3);
end;

procedure TfrmSchAnalize.cxGrid1DBBandedTableView1DBBandedColumn10PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
    UpdateA(4);
end;

procedure TfrmSchAnalize.cxGrid1DBBandedTableView1DBBandedColumn12PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  UpdateA(5);
end;

procedure TfrmSchAnalize.cxGrid1DBBandedTableView1DBBandedColumn14PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
    UpdateA(6);
end;

procedure TfrmSchAnalize.cxGrid1DBBandedTableView1DBBandedColumn16PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
    UpdateA(7);
end;

procedure TfrmSchAnalize.cxGrid1DBBandedTableView1DBBandedColumn18PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
    UpdateA(8);
end;

procedure TfrmSchAnalize.cxGrid1DBBandedTableView1DBBandedColumn20PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
    UpdateA(9);
end;

procedure TfrmSchAnalize.cxGrid1DBBandedTableView1DBBandedColumn22PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
    UpdateA(10);
end;

procedure TfrmSchAnalize.ShowAnalisy;
begin
//
end;

procedure TfrmSchAnalize.cxCheckBox2Click(Sender: TObject);
begin
     panel2.Visible:=cxCheckBox2.Checked;
     if cxCheckBox2.Checked
     then Splitter1.Left:=panel2.Left+2;
end;

procedure TfrmSchAnalize.cxCheckBox3Click(Sender: TObject);
begin
    cxGrid1DBBandedTableView1DBBandedColumn3.Visible:=cxCheckBox3.Checked;
    cxGrid1DBBandedTableView1DBBandedColumn4.Visible:=cxCheckBox3.Checked;
    cxGrid1DBBandedTableView1.Bands[2].Visible:=cxCheckBox3.Checked;
end;

procedure TfrmSchAnalize.cxCheckBox4Click(Sender: TObject);
begin
    cxGrid1DBBandedTableView1DBBandedColumn5.Visible:=cxCheckBox4.Checked;
    cxGrid1DBBandedTableView1DBBandedColumn6.Visible:=cxCheckBox4.Checked;
    cxGrid1DBBandedTableView1.Bands[3].Visible:=cxCheckBox4.Checked;
end;

procedure TfrmSchAnalize.cxCheckBox5Click(Sender: TObject);
begin
    cxGrid1DBBandedTableView1DBBandedColumn7.Visible:=cxCheckBox5.Checked;
    cxGrid1DBBandedTableView1DBBandedColumn8.Visible:=cxCheckBox5.Checked;
    cxGrid1DBBandedTableView1.Bands[4].Visible:=cxCheckBox5.Checked;
end;

procedure TfrmSchAnalize.cxCheckBox6Click(Sender: TObject);
begin
    cxGrid1DBBandedTableView1DBBandedColumn9.Visible:=cxCheckBox6.Checked;
    cxGrid1DBBandedTableView1DBBandedColumn10.Visible:=cxCheckBox6.Checked;
    cxGrid1DBBandedTableView1.Bands[5].Visible:=cxCheckBox6.Checked;
end;

procedure TfrmSchAnalize.cxCheckBox7Click(Sender: TObject);
begin
    cxGrid1DBBandedTableView1DBBandedColumn11.Visible:=cxCheckBox7.Checked;
    cxGrid1DBBandedTableView1DBBandedColumn12.Visible:=cxCheckBox7.Checked;
    cxGrid1DBBandedTableView1.Bands[6].Visible:=cxCheckBox7.Checked;
end;

procedure TfrmSchAnalize.cxCheckBox8Click(Sender: TObject);
begin
    cxGrid1DBBandedTableView1DBBandedColumn13.Visible:=cxCheckBox8.Checked;
    cxGrid1DBBandedTableView1DBBandedColumn14.Visible:=cxCheckBox8.Checked;
    cxGrid1DBBandedTableView1.Bands[7].Visible:=cxCheckBox8.Checked;
end;

procedure TfrmSchAnalize.cxCheckBox9Click(Sender: TObject);
begin
    cxGrid1DBBandedTableView1DBBandedColumn15.Visible:=cxCheckBox9.Checked;
    cxGrid1DBBandedTableView1DBBandedColumn16.Visible:=cxCheckBox9.Checked;
    cxGrid1DBBandedTableView1.Bands[8].Visible:=cxCheckBox9.Checked;
end;

procedure TfrmSchAnalize.cxCheckBox10Click(Sender: TObject);
begin
    cxGrid1DBBandedTableView1DBBandedColumn17.Visible:=cxCheckBox10.Checked;
    cxGrid1DBBandedTableView1DBBandedColumn18.Visible:=cxCheckBox10.Checked;
    cxGrid1DBBandedTableView1.Bands[9].Visible:=cxCheckBox10.Checked;
end;

procedure TfrmSchAnalize.cxCheckBox11Click(Sender: TObject);
begin
    cxGrid1DBBandedTableView1DBBandedColumn19.Visible:=cxCheckBox11.Checked;
    cxGrid1DBBandedTableView1DBBandedColumn20.Visible:=cxCheckBox11.Checked;
    cxGrid1DBBandedTableView1.Bands[10].Visible:=cxCheckBox11.Checked;
end;

procedure TfrmSchAnalize.cxCheckBox12Click(Sender: TObject);
begin
    cxGrid1DBBandedTableView1DBBandedColumn21.Visible:=cxCheckBox12.Checked;
    cxGrid1DBBandedTableView1DBBandedColumn22.Visible:=cxCheckBox12.Checked;
    cxGrid1DBBandedTableView1.Bands[11].Visible:=cxCheckBox12.Checked;
end;

function TfrmSchAnalize.CheckCurStateAnalisy(Index: Integer): Integer;
var Sp:TpFibStoredProc;
    Res:Integer;
begin
     Sp:=TpFibStoredProc.Create(self);
     Sp.Database:=WorkDatabase;
     Sp.Transaction:=ReadTransaction;
     Sp.StoredProcName:='PUB_SPR_ANALITIC_CHECK';
     Sp.Prepare;
     Sp.ParamByName('INDEX_AN').AsInteger:=Index;
     Sp.ExecProc;
     Res:=Sp.ParamByName('RET_VALUE').AsInteger;
     Sp.Free;
     CheckCurStateAnalisy:=Res;
end;

procedure TfrmSchAnalize.ToolButton1Click(Sender: TObject);
var Sp:TpFibStoredProc;
begin
  if BaseTypes.agMessageDlg('Увага!','Ви хочете видалити шаблон?',mtWarning,[mbYes, mbNo])=mrYes
  then begin
     Sp:=TpFibStoredProc.Create(self);
     Sp.Database:=WorkDatabase;
     Sp.Transaction:=WriteTransaction;
     Sp.Transaction.StartTransaction;
     Sp.StoredProcName:='PUB_DT_SCH_ANALITIC_DELETE';
     Sp.Prepare;
     Sp.ParamByName('ID_SCH_ANALITIC').AsInteger:=SchAnDataSet.FieldByName('ID_SCH_ANALITIC').AsInteger;
     Sp.ExecProc;
     Sp.Transaction.Commit;
     SchAnDataSet.CloseOpen(true);
     RealValDataSet.CloseOpen(true);
     Sp.Free;
  end;
end;

procedure TfrmSchAnalize.ToolButton5Click(Sender: TObject);
begin
 close;
end;

end.
