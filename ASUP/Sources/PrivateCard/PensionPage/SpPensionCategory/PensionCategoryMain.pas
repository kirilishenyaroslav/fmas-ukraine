unit PensionCategoryMain;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ComCtrls, ToolWin, ImgList, cxStyles, cxCustomData, cxGraphics,
    cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet,
    pFIBDataSet, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, cxClasses, Ibase,
    FIBDatabase, pFIBDatabase, pFibStoredProc, rxmemDs, ActnList, dxBar,
  dxBarExtItems, FIBQuery, pFIBQuery, ExtCtrls, cxTextEdit, cxContainer,
  cxLabel, cxMaskEdit, cxDropDownEdit, StdCtrls, cxLookAndFeelPainters,
  cxButtons, cxCheckBox;


type
    TfrmPensionCategory = class(TForm)
    PCatDB: TpFIBDatabase;
    PensCatRTrans: TpFIBTransaction;
    PensCatWTrans: TpFIBTransaction;
    GridPensCatTableView: TcxGridDBTableView;
    GridPensCatLevel: TcxGridLevel;
    GridPensCat: TcxGrid;
    PensionCatDSet: TpFIBDataSet;
    PensCatSource: TDataSource;
    GridPensCatTableViewDBColumn2: TcxGridDBColumn;
    PCATfilteredt: TcxTextEdit;
    PensionCatQuery: TpFIBQuery;
    BarManager: TdxBarManager;
    lbtnAdd: TdxBarLargeButton;
    imgMainList: TImageList;
    lbtnEdit: TdxBarLargeButton;
    lbtnDel: TdxBarLargeButton;
    lbtnRefresh: TdxBarLargeButton;
    lbtnSelect: TdxBarLargeButton;
    dxbarSearchLabel: TdxBarStatic;
    dxBarEdit1: TdxBarEdit;
    Panel1: TPanel;
    Label1: TLabel;
    lbtnClose: TdxBarLargeButton;
    LocalFilterChb: TcxCheckBox;
    ColumnGroupChb: TcxCheckBox;
    ActionList1: TActionList;
    ActionAdd: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionRefresh: TAction;
    ActionSelect: TAction;
    ActionClose: TAction;
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
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
    procedure cxLocFilChbPropertiesChange(Sender: TObject);
    procedure cxGroupChbPropertiesChange(Sender: TObject);
    procedure ActionEditExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionSelectExecute(Sender: TObject);
    private
    { Private declarations }
        OutPut:TRxMemoryData;
        procedure PensionCatDSetCloseOpen;
    public
    { Public declarations }
        constructor Create(AOwner: TComponent; OutPut:TRxMemoryData; DbHandle: TISC_DB_HANDLE); reintroduce;
    end;

implementation

{$R *.dfm}

uses BaseTypes, UpKernelUnit, uPensionCategory, PensionCategoryEdit;

{ TfrmSpSigners }

constructor TfrmPensionCategory.Create(AOwner: TComponent; OutPut:TRxMemoryData; DbHandle: TISC_DB_HANDLE);
begin
    inherited Create(AOwner);
    Self.Output:=OutPut;
    PCatDB.Handle:=DbHandle;
    PensionCatDSetCloseOpen;
end;

procedure TfrmPensionCategory.PensionCatDSetCloseOpen;
begin
   if (PensionCatDset.Active) then PensionCatDset.Close;
   PensionCatDSet.SQLs.SelectSQL.Clear;
   PensionCatDSet.SQLs.SelectSQL.Text:='select distinct * from up_sp_pension_cat_sel';
   PensionCatDSet.Open;
end;

procedure TfrmPensionCategory.cxTextEdit1PropertiesChange(Sender: TObject);
begin
  PensionCatDSet.Filtered:=false;
  if(length(PCATfilteredt.Text)>0) then
  begin
    PensionCatDSet.Filter:='upper(Name_Pension_cat) LIKE upper('+#39+'%'+
    PCATfilteredt.Text+'%'+#39+')';
    PensionCatDSet.Filtered:=true;
  end
end;


procedure TfrmPensionCategory.cxLocFilChbPropertiesChange(Sender: TObject);
begin
  if(LocalFilterChb.Checked) then
    GridPensCatTableView.OptionsCustomize.ColumnFiltering:=true
  else
    GridPensCatTableView.OptionsCustomize.ColumnFiltering:=false;
end;

procedure TfrmPensionCategory.cxGroupChbPropertiesChange(Sender: TObject);
begin
  if(ColumnGroupChb.Checked) then
    GridPensCatTableView.OptionsView.GroupByBox:=true
  else
    GridPensCatTableView.OptionsView.GroupByBox:=false;
end;

procedure TfrmPensionCategory.ActionEditExecute(Sender: TObject);
var
  frm:TfrmPensCatEdit;
  Id:integer;
begin
  if PensionCatDSet.IsEmpty then Exit;
  Id:=PensionCatDSet['Id_Pension_Cat'];
  PensionCatQuery.SQL.Clear;
  PensionCatQuery.SQL.Text:=
  'execute procedure up_sp_pension_cat_upd (:id_pension_cat_i, :pension_cat_name_i)';
  frm:=TfrmPensCatEdit.Create(Self);
  frm.Caption:='Змінити';
  if not VarIsNull(PensionCatDSet['Name_Pension_Cat']) then
     frm.PensionCatEdit.Text:=PensionCatDSet['Name_Pension_Cat'];
  if (frm.ShowModal=mrOk) then
  begin
    PensCatwTrans.StartTransaction;
    PensionCatQuery.SetParamValues([IntToStr(Id), frm.PensionCatEdit.Text]);
    PensionCatQuery.ExecQuery;
    PensCatwTrans.Commit;
    PensionCatDSetCloseOpen;
    PensionCatDSet.Locate('Id_Pension_Cat', Id, []);
  end;
  frm.Free;
end;

procedure TfrmPensionCategory.ActionAddExecute(Sender: TObject);
var
  frm:TfrmPensCatEdit;
begin
  frm:=TfrmPensCatEdit.Create(Self);
  frm.Caption:='Додати';
  if (frm.ShowModal=mrOk) then
  begin
    PensCatwTrans.StartTransaction;
    PensionCatQuery.SQL.Clear;
    PensionCatQuery.SQL.Text:=
    'execute procedure UP_SP_PENSION_CAT_INS (:Name_Pension_Cat)';
    PensionCatQuery.SetParamValues([frm.PensionCatEdit.Text]);
    PensionCatQuery.ExecQuery;
    PensCatwTrans.Commit;
    PensionCatDSetCloseOpen;
    PensionCatDSet.Locate('Id_Pension_Cat', PensionCatQuery.Fields[0].AsString,[]);
  end;
  frm.Free;
end;

procedure TfrmPensionCategory.ActionDelExecute(Sender: TObject);
begin
  if(agMessageDlg('Увага!', 'Ви дійсно бажаєте вилучити цей запис?',mtConfirmation,
                  [mbYes, mbNo])=mrYes) then
  begin
    PensCatwTrans.StartTransaction;
    PensionCatQuery.SQL.Clear;
    PensionCatQuery.SQL.Text:=
    'execute procedure up_sp_pension_cat_del (:Id_Pension_Cat)';
    PensionCatQuery.SetParamValues([PensionCatDSet.Fields.Fields[0].AsString ]);
    PensionCatQuery.ExecQuery;
    PensCatwTrans.Commit;
    PensionCatDSetCloseOpen;
  end;
end;

procedure TfrmPensionCategory.ActionRefreshExecute(Sender: TObject);
begin
  PensionCatDSetCloseOpen;
end;

procedure TfrmPensionCategory.ActionCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPensionCategory.ActionSelectExecute(Sender: TObject);
begin
  if OutPut <> nil then
  begin
     OutPut.Open;
     OutPut.Append;
     OutPut['Id_Pension_Cat']:=PensionCatDSet['Id_Pension_Cat'];
     OutPut['Name_Pension_Cat']:=PensionCatDSet['Name_Pension_Cat'];
     OutPut.Post;
     ModalResult:=mrOk;
  end;
end;

end.
