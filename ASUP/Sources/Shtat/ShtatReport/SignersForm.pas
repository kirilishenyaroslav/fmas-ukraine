unit SignersForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxBar, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ActnList, dxBarExtItems, ImgList, uCommonSp,
  U_Shtat_Rep065, iBase, FIBDatabase, FIBDataSet, pFibDataSet, BaseTypes,
  FIBQuery, pFIBQuery, pFIBStoredProc, cxTextEdit, UpKernelUnit, AccMgmt;

type
  TfrmSigner = class(TForm)
    SignerGridLevel: TcxGridLevel;
    SignerGrid: TcxGrid;
    dxBarManager1: TdxBarManager;
    ImageList: TImageList;
    cxStyleRepository1: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    btnAdd: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    btnMoveUp: TdxBarLargeButton;
    btnMoveDown: TdxBarLargeButton;
    ActList: TActionList;
    ActAdd: TAction;
    ActDel: TAction;
    ActMoveUp: TAction;
    ActMoveDown: TAction;
    ActRefresh: TAction;
    ActClose: TAction;
    btnCLose: TdxBarLargeButton;
    SignerGridTableView1: TcxGridTableView;
    SignerGridTableView1Column1: TcxGridColumn;
    SignerGridTableView1Column2: TcxGridColumn;
    SignerGridTableView1Column3: TcxGridColumn;
    DSet: TpFIBDataSet;
    procedure ActAddExecute(Sender: TObject);
    procedure ActCloseExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
  private
    { Private declarations }
    DBHandle:TISC_DB_HANDLE;
    DisplayOrder:Integer;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; HND:TISC_DB_HANDLE);
    function GetListIdShablon:Boolean;
    function FormSignersView:Boolean;
  end;

var
  frmSigner: TfrmSigner;

implementation

{$R *.dfm}

constructor TfrmSigner.Create(AOwner:TComponent; HND:TISC_DB_HANDLE);
var i:Integer;
begin
  inherited Create(AOwner);
  Self.DBHandle:=HND;
  DisplayOrder:=0;
  for i:=0 to SignerGridTableView1.ColumnCount-1 do
      SignerGridTableView1.Columns[i].DataBinding.ValueTypeClass:=TcxStringValueType;
  FormSignersView;
end;

function TfrmSigner.FormSignersView:Boolean;
var i, j, cnt, NumberRecord:Integer;
    CntItems, ValueItem:Variant;
begin
  try
     CntItems:=KYVLoadFromRegistry('ListSignerCntItems',GetUserId);
     if ((VarIsNull(CntItems)) or (CntItems=0)) then Exit;
     for j:=0 to CntItems-1 do
     begin
        ValueItem:=KYVLoadFromRegistry('ListSigner'+IntToStr(j),GetUserId);
        if ((VarIsNull(ValueItem)) or (ValueItem=0)) then Exit;
        DSet.Close;
        DSet.SQLs.SelectSQL.Text:='select distinct * '+
                                  '  from up_dt_text_shablons '+
                                  ' where id_shablon=:id_shablon';
        DSet.ParamByName('id_shablon').AsInteger:=ValueItem;
        DSet.Open;
        DSet.FetchAll;
        If not DSet.IsEmpty Then
        begin
            with SignerGridTableView1.DataController do
            begin
               BeginUpdate;
               if RecordCount=0  then
               begin
                  NumberRecord:=0;
                  InsertRecord(NumberRecord);
               end
               else
               begin
                  NumberRecord:=RecordCount;
                  InsertRecord(NumberRecord);
               end;
               Values[NumberRecord, 0]:=DSet['text1'];
               Values[NumberRecord, 1]:=DSet['text2'];
               Values[NumberRecord, 2]:=DSet['id_shablon'];
               EndUpdate;
            end;
        end;
     end;
  except on e:Exception
         do begin
               //agMessageDlg('”вага!', e.Message, mtError, [mbOK]);
               Result:=False;
         end;
  end;
end;

function TfrmSigner.GetListIdShablon:Boolean;
var i, CntItems:Integer;
begin
  try
     with SignerGridTableView1 do
     begin
         CntItems:=DataController.RecordCount;
         KYVSaveIntoRegistry('ListSignerCntItems',IntToStr(CntItems), GetUserId);
         if DataController.RecordCount=0 then Exit;
         for i:=0 to CntItems-1 do
         begin
            KYVSaveIntoRegistry('ListSigner'+IntToStr(i),ViewData.Rows[i].Values[2], GetUserId);
         end;
     end;
     Result:=True;
   except on E:Exception
          do begin
                agMessageDlg('”вага!', e.Message, mtError, [mbOK]);
                Result:=False;
          end;
   end;
end;

procedure TfrmSigner.ActAddExecute(Sender: TObject);
var Sp:Tsprav;
    NumberRecord:Integer;
begin
   Sp:=GetSprav('UP\UpSpHeaders');
   if sp <> nil then
   begin
      with sp.Input do
      begin
        Append;
        FieldValues['DBHandle']    := Integer(DBHandle);
        FieldValues['IdTypeSigner'] := 6;
        FieldValues['ModeEdit'] := 1;
        Post;
      end;
      sp.Show;
      if (sp.Output <> nil) and not sp.Output.IsEmpty then
      begin
         with SignerGridTableView1.DataController do
         begin
            BeginUpdate;
            if RecordCount=0  then
            begin
               NumberRecord:=0;
               InsertRecord(NumberRecord);
            end
            else
            begin
               NumberRecord:=RecordCount;
               InsertRecord(NumberRecord);
            end;
            Values[NumberRecord, 0]:=Sp.Output['Name_Fio'];
            Values[NumberRecord, 1]:=Sp.Output['Name_Post'];
            Values[NumberRecord, 2]:=Sp.Output['Id_Shablon'];
            EndUpdate;
         end;
      end;
      Sp.Free;
   end;
end;

procedure TfrmSigner.ActCloseExecute(Sender: TObject);
begin
   GetListIdShablon;
   ModalResult:=mrOk;
end;

procedure TfrmSigner.ActDelExecute(Sender: TObject);
Var CurRecord:Integer;
begin
   if agMessageDlg('”вага!', '¬и д≥йсно бажаЇте вилучити цей запис?', mtConfirmation, [mbYes, mbNo])=mrYes then
   begin
      with SignerGridTableView1.DataController do
      begin
         CurRecord:=FocusedRecordIndex;
         BeginUpdate;
         DeleteRecord(CurRecord);
         EndUpdate;
      end;
   end;
end;

end.
