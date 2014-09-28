unit uSPTextOrder;

interface

uses
 { Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBQuery, pFIBQuery, ActnList,
  cxGridTableView, ImgList, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, dxBarExtItems, dxBar, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxContainer, cxCheckBox, StdCtrls, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,Ibase,
  cxGridDBTableView, uSP_Text_Order_Edit, cxGrid, ExtCtrls,RxMemDS, ComCtrls, ToolWin, pFibStoredProc, uDM_Text_Order;
  }Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, cxGridLevel, cxClasses, cxControls, RxMemDS,
  cxGridCustomView, cxGrid, Buttons, ExtCtrls, FIBQuery, pFIBQuery,
  IBase,UpKernelUnit, uSPTextOrderEdit, SpCommon, ActnList, uDMTextOrder, ImgList, ComCtrls, ToolWin, pFibStoredProc,
  StdCtrls;
type
  TfmSPTextOrder = class(TForm)
    ToolBar1: TToolBar;
    btn2: TToolButton;
    btn4: TToolButton;
    ToolButton2: TToolButton;
    RefreshButton: TToolButton;
    btn1: TToolButton;
    btn3: TToolButton;
    IL_Orders: TImageList;
    StyleRepository: TcxStyleRepository;
    stBackground: TcxStyle;
    stContent: TcxStyle;
    stContentEven: TcxStyle;
    stContentOdd: TcxStyle;
    stFilterBox: TcxStyle;
    stFooter: TcxStyle;
    stGroup: TcxStyle;
    stGroupByBox: TcxStyle;
    stHeader: TcxStyle;
    stInactive: TcxStyle;
    stIncSearch: TcxStyle;
    stIndicator: TcxStyle;
    stPreview: TcxStyle;
    stSelection: TcxStyle;
    stHotTrack: TcxStyle;
    ContentError: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    ItemsGrid: TcxGrid;
    ReportDataView: TcxGridDBTableView;
    ReportDataViewDBColumn1: TcxGridDBColumn;
    ReportDataViewDBColumn2: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    KeyList: TActionList;
    AddAction: TAction;
    CancelAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    EnterAction: TAction;
    ShowInfoAction: TAction;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    SearchEdit: TEdit;
    procedure AddActionExecute(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure EnterActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure ShowInfoActionExecute(Sender: TObject);
    procedure ReportDataViewDblClick(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
  private

  public
    { Public declarations }
     text1:string;
     id_shablon:Integer;
    Confirmation:Boolean;
    DMod:  TDMTextOrder;
    Input: TRxMemoryData;
    Output: TRxMemoryData;
    constructor Create(AOwner: TComponent; DataModule: TDMTextOrder;
                      Input: TRxMemoryData = nil; Output: TRxMemoryData = nil);reintroduce;
  end;

var
  fmSPTextOrder: TfmSPTextOrder;

  type TShowMode = (smShowMod, smShowMChild, smSelMod, smSelMChild);
     TFormBtn  = (fbAdd, fbModif, fbDel);
     TFormButtons = set of TFormBtn;

const fbAll = [fbAdd, fbModif, fbDel];
  function ShowTextOrder(AOwner:TComponent; Handle: TISC_DB_Handle; SM: TShowMode; var Output: TRxMemoryData; id_group:Variant; confirm:boolean=true; Buttons:TFormButtons = fbAll):Boolean;

implementation

uses  BaseTypes, USPTextOrderMain;

{$R *.dfm}
constructor TfmSPTextOrder.Create(AOwner: TComponent; DataModule: TDMTextOrder; Input: TRxMemoryData = nil; Output: TRxMemoryData = nil);
begin
  inherited Create(AOwner);
  Self.DMod := DataModule;
//  Self.freeDM := FreeDataModule;
  Self.Input := Input;
  Self.Output := Output;
  DMod.StajDS.Close;
  DMod.StajDS.SelectSQL.Text:='select text1,id_shablon from up_get_text_shablon(17)';
  DMod.StajDS.Open;
end;

function ShowTextOrder(AOwner:TComponent; Handle: TISC_DB_Handle; SM: TShowMode; var Output: TRxMemoryData; id_group:Variant; confirm:boolean=true; Buttons:TFormButtons = fbAll):Boolean;
var RForm:TfmSPTextOrder;
begin
  RForm:=TfmSPTextOrder.Create(AOwner,nil);
  RForm.DMod := TDMTextOrder.Create(RForm);
  RForm.DMod.WorkDatabase.Handle := Handle;
  RForm.DMod.StajDS.SelectSQL.Clear;
  RForm.DMod.StajDS.SelectSQL.Text:='select text1,id_shablon from up_get_text_shablon(17)';
  RForm.DMod.StajDS.Open;

    Output:=RForm.Output;
    Result:=True;
end;

procedure TfmSPTextOrder.AddActionExecute(Sender: TObject);
var T: TfmSP_Text_OrderEdit;
    SP:TpFibStoredProc;
    //ID_SHABLON:Integer;
begin
     T:=TfmSP_Text_OrderEdit.Create(self);
     if T.ShowModal=mrYes
     then begin
               SP:=TpFibStoredProc.Create(self);
                //showmessage('1') ;
               SP.Database:=DMod.WorkDatabase;
               // showmessage('2') ;
               SP.Transaction:=DMod.WriteTransaction;
               DMod.WriteTransaction.StartTransaction;
              // showmessage('3') ;
               SP.StoredProcName:='UP_DT_TEXT_SHABLONS_INS_UPD';
               SP.Prepare;
               SP.ParamByName('TEXT1').Value          :=T.cxTextEdit1.Text;
               SP.ParamByName('ID_SHABLON_TYPE').Value          :=17;
               SP.ExecProc;
               ID_SHABLON:=SP.ParamByName('ID_SHABLON').Value;
               SP.Close;
               SP.Free;
              // showmessage('2') ;
               DMod.WriteTransaction.Commit;
               DMod.StajDS.CloseOpen(true);
               DMod.StajDS.Locate('ID_SHABLON',ID_SHABLON,[]);



     end;
     T.Free;
end;

procedure TfmSPTextOrder.EditActionExecute(Sender: TObject);
var T: TfmSP_Text_OrderEdit;
    SP:TpFibStoredProc;
    //ID_SHABLON:Integer;
begin
     T:=TfmSP_Text_OrderEdit.Create(self);
     T.cxTextEdit1.EditValue:=DMod.StajDS.FieldByName('TEXT1').Value;
     if T.ShowModal=mrYes
     then begin
               SP:=TpFibStoredProc.Create(self);
               SP.Database:=DMod.WorkDatabase;
               SP.Transaction:=DMod.WriteTransaction;
               DMod.WriteTransaction.StartTransaction;
               SP.StoredProcName:='UP_DT_TEXT_SHABLONS_INS_UPD';
               SP.Prepare;
               ID_SHABLON:=DMod.StajDS.FieldByName('ID_SHABLON').Value;
               SP.ParamByName('ID_SH').Value          :=ID_SHABLON;
               SP.ParamByName('TEXT1').Value          :=T.cxTextEdit1.Text;
               SP.ParamByName('ID_SHABLON_TYPE').Value          :=17;
               SP.ExecProc;
               SP.Close;
               SP.Free;
               DMod.WriteTransaction.Commit;
               DMod.StajDS.CloseOpen(true);
               DMod.StajDS.Locate('ID_SHABLON',ID_SHABLON,[]);
     end;
     T.Free;

end;

procedure TfmSPTextOrder.DeleteActionExecute(Sender: TObject);
var SP:TpFibStoredProc;
begin
     if (DMod.StajDS.RecordCount>0)
     then begin
               if agMessageDlg('Увага!','Ви хочете вилучити запис?',mtConfirmation,[mbYes,mbNo])=mrYes
               then begin
                         SP:=TpFibStoredProc.Create(self);
                         SP.Database:=DMod.WorkDatabase;
                         SP.Transaction:=DMod.WriteTransaction;
                         DMod.WriteTransaction.StartTransaction;
                         SP.StoredProcName:='UP_DT_TEXT_SHABLONS_DEL';
                         SP.Prepare;
                         SP.ParamByName('ID_SHABLON').Value          :=DMod.stajDS.FieldByName('ID_SHABLON').Value;
                         SP.ExecProc;
                         SP.Close;
                         SP.Free;

                         DMod.WriteTransaction.Commit;
                         DMod.StajDS.CacheDelete;

               end;
     end;

end;

procedure TfmSPTextOrder.RefreshActionExecute(Sender: TObject);
begin
     DMod.StajDS.CloseOpen(true);
end;

procedure TfmSPTextOrder.EnterActionExecute(Sender: TObject);
begin
     if (DMod.StajDS.RecordCount>0)
     then begin
               text1 :=DMod.StajDS.FieldByName('TEXT1').AsString;
               id_shablon := DMod.StajDS.FieldByName('ID_SHABLON').Value;
               DMod.Free;
               ModalResult:=mrYes;
     end;
end;

procedure TfmSPTextOrder.CancelActionExecute(Sender: TObject);
begin
     DMod.Free;
     ModalResult:=mrNo;
end;

procedure TfmSPTextOrder.ShowInfoActionExecute(Sender: TObject);
begin
  ShowInfo(DMod.StajDS);
end;

procedure TfmSPTextOrder.ReportDataViewDblClick(Sender: TObject);
begin
  EnterActionExecute(Sender);
end;

procedure TfmSPTextOrder.SearchEditChange(Sender: TObject);
begin
  if (SearchEdit.Text = '')or(VarIsNull(SearchEdit.Text)) then
   begin
     ReportDataView.DataController.DataSet.Filtered := False;
   end
  else
   begin
     try
       ReportDataView.DataController.DataSet.Filtered := False;
       ReportDataView.DataController.DataSet.Filter := '(not TEXT1 is null) and UPPER(TEXT1) LIKE ''%' +
            AnsiUpperCase(SearchEdit.Text) + '%''';
       ReportDataView.DataController.DataSet.Filtered := True;
       ReportDataView.ViewData.Expand(False);
       ReportDataView.DataController.SelectRows(0, 0);
//       ShowMessage(cxG_MainDBTableView1.DataController.DataSet.Filter);
     except
//       ShowMessage(cxG_MainDBTableView1.DataController.DataSet.Filter);
//       ShowInfo(cxG_MainDBTableView1.DataController.DataSet);
     end;
   end;
end;

end.



