unit uSP_Text_Order;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBQuery, pFIBQuery, ActnList,
  cxGridTableView, ImgList, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, dxBarExtItems, dxBar, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxContainer, cxCheckBox, StdCtrls, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,Ibase,
  cxGridDBTableView, cxGrid, ExtCtrls, ComCtrls, ToolWin, pFibStoredProc;

type
  TfmSP_Text_Order = class(TForm)
    ToolBar1: TToolBar;
    btn2: TToolButton;
    btn4: TToolButton;
    ToolButton2: TToolButton;
    RefreshButton: TToolButton;
    btn1: TToolButton;
    btn3: TToolButton;
    ItemsGrid: TcxGrid;
    ReportDataView: TcxGridDBTableView;
    ReportDataViewDBColumn1: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
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
    StajDS: TpFIBDataSet;
    dsSiognersDSet: TDataSource;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    ReportDataViewDBColumn2: TcxGridDBColumn;
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private

  public
    { Public declarations }
     text1:string;
     id_shablon:Integer;
     constructor Create(AOwner: TComponent; DbHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  fmSP_Text_Order: TfmSP_Text_Order;

implementation

uses uSP_Text_Order_Edit, BaseTypes;

{$R *.dfm}
constructor TfmSP_Text_Order.Create(AOwner: TComponent; DbHandle:TISC_DB_HANDLE);
begin 
     inherited Create(AOwner);
     WorkDatabase.Handle:=DbHandle;
     ReadTransaction.StartTransaction;
     StajDS.SelectSQL.Text:='select text1,id_shablon from up_get_text_shablon(17)';
     StajDS.Open;
end;

procedure TfmSP_Text_Order.btn2Click(Sender: TObject);
var T: TfmSP_Text_OrderEdit;
    SP:TpFibStoredProc;
    //ID_SHABLON:Integer;
begin
     T:=TfmSP_Text_OrderEdit.Create(self);
     if T.ShowModal=mrYes
     then begin
               SP:=TpFibStoredProc.Create(self);
               SP.Database:=WorkDatabase;
               SP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               SP.StoredProcName:='UP_DT_TEXT_SHABLONS_INS_UPD';
               SP.Prepare;
               SP.ParamByName('TEXT1').Value          :=T.cxTextEdit1.Text;
               SP.ParamByName('ID_SHABLON_TYPE').Value          :=17;
               SP.ExecProc;
               ID_SHABLON:=SP.ParamByName('ID_SHABLON').Value;
               SP.Close;
               SP.Free;
               WriteTransaction.Commit;
               StajDS.CloseOpen(true);
               StajDS.Locate('ID_SHABLON',ID_SHABLON,[]);
     end;
     T.Free;
end;

procedure TfmSP_Text_Order.btn4Click(Sender: TObject);
var SP:TpFibStoredProc;
begin
     if (StajDS.RecordCount>0)
     then begin
               if agMessageDlg('Увага!','Ви хочете вилучити запис?',mtConfirmation,[mbYes,mbNo])=mrYes
               then begin
                         SP:=TpFibStoredProc.Create(self);
                         SP.Database:=WorkDatabase;
                         SP.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         SP.StoredProcName:='UP_DT_TEXT_SHABLONS_DEL';
                         SP.Prepare;
                         SP.ParamByName('ID_SHABLON').Value          :=stajDS.FieldByName('ID_SHABLON').Value;
                         SP.ExecProc;
                         SP.Close;
                         SP.Free;
                         WriteTransaction.Commit;
                         StajDS.CacheDelete;
               end;
     end;

end;

procedure TfmSP_Text_Order.ToolButton2Click(Sender: TObject);
var T: TfmSP_Text_OrderEdit;
    SP:TpFibStoredProc;
    //ID_SHABLON:Integer;
begin
     T:=TfmSP_Text_OrderEdit.Create(self);
     T.cxTextEdit1.EditValue:=StajDS.FieldByName('TEXT1').Value;
     if T.ShowModal=mrYes
     then begin
               SP:=TpFibStoredProc.Create(self);
               SP.Database:=WorkDatabase;
               SP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               SP.StoredProcName:='UP_DT_TEXT_SHABLONS_INS_UPD';
               SP.Prepare;
               ID_SHABLON:=StajDS.FieldByName('ID_SHABLON').Value;
               SP.ParamByName('ID_SH').Value          :=ID_SHABLON;
               SP.ParamByName('TEXT1').Value          :=T.cxTextEdit1.Text;
               SP.ParamByName('ID_SHABLON_TYPE').Value          :=17;
               SP.ExecProc;
               SP.Close;
               SP.Free;
               WriteTransaction.Commit;
               StajDS.CloseOpen(true);
               StajDS.Locate('ID_SHABLON',ID_SHABLON,[]);
     end;
     T.Free;

end;

procedure TfmSP_Text_Order.RefreshButtonClick(Sender: TObject);
begin
     StajDS.CloseOpen(true);
end;

procedure TfmSP_Text_Order.btn1Click(Sender: TObject);
begin
     if (StajDS.RecordCount>0)
     then begin
               text1 :=StajDS.FieldByName('TEXT1').AsString;
               id_shablon := StajDS.FieldByName('ID_SHABLON').Value;
               ModalResult:=mrYes;
     end;
end;

procedure TfmSP_Text_Order.btn3Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.
