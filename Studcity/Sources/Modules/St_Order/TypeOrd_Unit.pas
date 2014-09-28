unit TypeOrd_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, FIBDatabase,
  pFIBDatabase, ActnList, FIBDataSet, pFIBDataSet, ImgList, dxBar,
  dxBarExtItems, dxStatusBar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ibase, Order_Unit, FIBQuery, pFIBQuery,
  uType_Ord_add, pFIBStoredProc;

type
  Tfrm_TypeOrd = class(TForm)
    to_Type_Order_Grid: TcxGrid;
    to_Type_Order_View: TcxGridDBTableView;
    type_ord: TcxGridDBColumn;
    to_GridLevel: TcxGridLevel;
    dxStatusBar2: TdxStatusBar;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    dxBarManager1: TdxBarManager;
    to_prp_CancelButton: TdxBarLargeButton;
    to_SelectButton: TdxBarLargeButton;
    ImageList1: TImageList;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    ActionList1: TActionList;
    ExitAction: TAction;
    ReadTransaction: TpFIBTransaction;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    WriteTran: TpFIBTransaction;
    WriteProc: TpFIBStoredProc;
    procedure to_prp_CancelButtonClick(Sender: TObject);
    procedure to_SelectButtonClick(Sender: TObject);
    procedure to_Type_Order_ViewDblClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_TypeOrd: Tfrm_TypeOrd;

implementation

uses Add_Edit_Order_Unit;

{$R *.dfm}

procedure Tfrm_TypeOrd.to_prp_CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_TypeOrd.to_SelectButtonClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure Tfrm_TypeOrd.to_Type_Order_ViewDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure Tfrm_TypeOrd.dxBarLargeButton1Click(Sender: TObject);
var
   ViewForm : TfrmType_Ord_add;
begin
  ViewForm := TfrmType_Ord_add.create(self);
  ViewForm.Caption:='Додати/Змінити';

 if ViewForm.showmodal = mrOk then
  begin
   With WriteProc do
    begin
     StoredProcName := 'ST_INI_ORDTYPES_INSERT';
     Transaction.StartTransaction;
     Prepare;
     ParamByName('NAME').AsString       := ViewForm.TextEdit_name.Text;
     ParamByName('SHORT_NAME').AsString := ViewForm.TextEdit_ShortName.Text;
     ExecProc;
     try
      Transaction.Commit;
      Close;
     except
      SHOWmessage('Виникла помилка при виконанні процедури ST_INI_ORDTYPES_INSERT');
      Transaction.Rollback;
      Close;
      raise;
     end;
    end;
   DataSet.CloseOpen(true);
   //DataSet.Locate('NOM_ORDER',frm_Add_Edit_Prikaz.ord_ae_Nom_Ord.Text, []);
  end;

  ViewForm.Free;
end;

procedure Tfrm_TypeOrd.dxBarLargeButton2Click(Sender: TObject);
var
   ViewForm : TfrmType_Ord_add;
   id       : Int64;
begin
  If DataSet.RecordCount = 0 then Exit;

  ViewForm := TfrmType_Ord_add.create(self);
  ViewForm.Caption:='Додати/Змінити';
  id := DataSet['ID_ORDER'];
  ViewForm.TextEdit_name.Text := DataSet['NAME'];
  ViewForm.TextEdit_ShortName.Text := DataSet['SHORT_NAME'];

 if ViewForm.showmodal = mrOk then
  begin
   With WriteProc do
    begin
     StoredProcName := 'ST_INI_ORDTYPES_UPDATE';
     Transaction.StartTransaction;
     Prepare;
     ParamByName('ID_ORDER').AsInt64    := id;
     ParamByName('NAME').AsString       := ViewForm.TextEdit_name.Text;
     ParamByName('SHORT_NAME').AsString := ViewForm.TextEdit_ShortName.Text;
     ExecProc;
     try
      Transaction.Commit;
      Close;
     except
      SHOWmessage('Виникла помилка при виконанні процедури ST_INI_ORDTYPES_INSERT');
      Transaction.Rollback;
      Close;
      raise;
     end;
    end;
   DataSet.CloseOpen(true);
   //DataSet.Locate('NOM_ORDER',frm_Add_Edit_Prikaz.ord_ae_Nom_Ord.Text, []);
  end;

  ViewForm.Free;
end;

procedure Tfrm_TypeOrd.dxBarLargeButton3Click(Sender: TObject);
begin
  If DataSet.RecordCount = 0 then Exit;

  If MessageBox(Handle,PChar(Del_Action_String_Query),'Увага!',MB_YESNO or MB_ICONQUESTION)= mrNo then exit;

   With WriteProc do
    begin
     StoredProcName := 'ST_INI_ORDTYPES_DELETE';
     Transaction.StartTransaction;
     Prepare;
     ParamByName('ID_ORDER').AsInt64 := DataSet['ID_ORDER'];
     ExecProc;
     try
      Transaction.Commit;
      Close;
     except
      SHOWmessage('Виникла помилка при виконанні процедури ST_INI_ORDTYPES_INSERT');
      Transaction.Rollback;
      Close;
      raise;
     end;
    DataSet.CloseOpen(true);
   End
end;

end.
