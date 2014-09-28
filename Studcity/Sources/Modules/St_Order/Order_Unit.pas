unit Order_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxLookAndFeelPainters,
  FIBQuery, pFIBQuery, pFIBStoredProc, ImgList, dxBar, dxBarExtItems,
  FIBDatabase, pFIBDatabase, ActnList, FIBDataSet, pFIBDataSet, StdCtrls,
  cxButtons, cxContainer, dxStatusBar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ibase, ExtCtrls;

type
  Tfrm_Order = class(TForm)
    Order_Grid: TcxGrid;
    Order_Table: TcxGridDBTableView;
    order: TcxGridDBColumn;
    nomer: TcxGridDBColumn;
    date: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    ActionList1: TActionList;
    ExitAction: TAction;
    SearchAction: TAction;
    Edit_Action: TAction;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    dxBarManager1: TdxBarManager;
    prp_CancelAll_LargeButton: TdxBarLargeButton;
    Add_Button: TdxBarLargeButton;
    Edit_Button: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    LargeImages: TImageList;
    WriteProc: TpFIBStoredProc;
    Panel1: TPanel;
    ShortNameLabel: TEdit;
    StatusBar: TdxStatusBar;
    Label1: TLabel;
    procedure prp_CancelAll_LargeButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Add_ButtonClick(Sender: TObject);
    procedure Edit_ActionExecute(Sender: TObject);
    procedure Edit_ButtonClick(Sender: TObject);
    procedure Order_TableDblClick(Sender: TObject);
    procedure DataSetAfterOpen(DataSet: TDataSet);
    procedure DataSetAfterScroll(DataSet: TDataSet);
  private
    id_kod_inside: int64;
  //  current_session_db_handle: TISC_DB_HANDLE;
    OLD_NOM_ORDER: string;
    
  public

  end;

var
  frm_Order: Tfrm_Order;

  function View_Order(AOwner : TComponent;DB:TISC_DB_HANDLE;id_kod: int64):Variant;stdcall;
  exports View_Order;

   var  res:Variant;
        FRM_Caption:string;
        Del_Action_String_Query:string;

implementation

uses Add_Edit_Order_Unit;

{$R *.dfm}
function View_Order(AOwner : TComponent;DB:TISC_DB_HANDLE;id_kod: int64):Variant;stdcall;
var ViewForm: Tfrm_Order;
begin
   ViewForm:=Tfrm_Order.Create(AOwner);
   ViewForm.DB.Handle:=db;
//   ViewForm.current_session_db_handle:=db;
   ViewForm.id_kod_inside:=id_kod;
   ViewForm.DataSet.SelectSQL.Text:='select * from ST_ORDER_SELECT('+inttostr(id_kod) +')';
   ViewForm.DataSet.Open;
   ViewForm.ShowModal;
   View_Order:=res;
   ViewForm.Free;
end;
procedure Tfrm_Order.prp_CancelAll_LargeButtonClick(Sender: TObject);
begin
res:=null;
close;
end;

procedure Tfrm_Order.FormCreate(Sender: TObject);
begin
with  Order_Table do begin
 Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
 Items[2].DataBinding.ValueTypeClass := TcxDateTimeValueType;
 end;
 FRM_Caption:='Накази';
 Del_Action_String_Query:='Видалити цей запис ?';
end;

procedure Tfrm_Order.dxBarLargeButton1Click(Sender: TObject);
var  selected: int64;
begin
  if order_table.DataController.RecordCount = 0 then exit;

  if MessageBox(Handle,PChar(Del_Action_String_Query),'Увага!',MB_YESNO or MB_ICONQUESTION)= mrNo then exit;

    With WriteProc do
    begin
        StoredProcName := 'ST_ORDER_DELETE';
        Transaction.StartTransaction;
        Prepare;
        ParamByName('ID_KOD').AsInt64 := id_kod_inside;
        ParamByName('NOM_ORDER').AsString := DATASET['NOM_ORDER'];
        ExecProc;
         try
          Transaction.Commit;
          Close;
         except
          SHOWmessage('Виникла помилка при виконанні процедури ST_ORDER_DELETE');
          Transaction.Rollback;
          Close;
          raise;
          end;
    END;
 selected := Order_table.DataController.FocusedRowIndex-1;
 Dataset.closeopen(true);
 Order_table.DataController.FocusedRowIndex := selected;
end;

procedure Tfrm_Order.dxBarLargeButton2Click(Sender: TObject);
begin
 Dataset.closeopen(true);
end;

procedure Tfrm_Order.FormShow(Sender: TObject);
begin
caption:=FRM_Caption;
//if Order_Table.DataController.RecordCount = 0 then
// StatusBar.Panels[0].Text:='Наказів не знайдено';
end;

procedure Tfrm_Order.Add_ButtonClick(Sender: TObject);
begin
 frm_Add_Edit_Prikaz:=Tfrm_Add_Edit_Prikaz.create(self);
 frm_Add_Edit_Prikaz.Caption:='Додати/Змінити';
// frm_Add_Edit_Prikaz.ae_current_session_db_handle:=current_session_db_handle;
 if frm_Add_Edit_Prikaz.showmodal = mrOk then
  begin
         With WriteProc do
          begin
              StoredProcName := 'ST_ORDER_INSERT';
              Transaction.StartTransaction;
              Prepare;
              ParamByName('ID_KOD').AsInt64 := id_kod_inside;
              ParamByName('ID_ORDER').AsInteger:= frm_Add_Edit_Prikaz.oe_Type_Order;
              ParamByName('DATE_ORDER').AsDate :=frm_Add_Edit_Prikaz.ord_ae_Date_Ord.Date;
              ParamByName('NOM_ORDER').AsString := frm_Add_Edit_Prikaz.ord_ae_Nom_Ord.Text;
              ParamByName('KOMM').AsString := frm_Add_Edit_Prikaz.ord_ae_Comments.Text;
              ExecProc;
              try
                Transaction.Commit;
                Close;
               except
                SHOWmessage('Виникла помилка при виконанні процедури ST_ORDER_INSERT');
                Transaction.Rollback;
                Close;
                raise;
                end;
          end;
  DataSet.CloseOpen(true);
  DataSet.Locate('NOM_ORDER',frm_Add_Edit_Prikaz.ord_ae_Nom_Ord.Text, []);
  frm_Add_Edit_Prikaz.Free;
  end;
end;

procedure Tfrm_Order.Edit_ActionExecute(Sender: TObject);
begin
if order_table.DataController.RecordCount = 0 then exit;
frm_Add_Edit_Prikaz:=Tfrm_Add_Edit_Prikaz.create(self);
frm_Add_Edit_Prikaz.Caption:='Додати/Змінити';
frm_Add_Edit_Prikaz.oe_Type_Order:=DATASET['ID_ORDER'];
frm_Add_Edit_Prikaz.ord_ae_Type_Ord.Text:= DATASET['SHORT_NAME_ORDER'];
frm_Add_Edit_Prikaz.ord_ae_Date_Ord.Date:= DATASET['DATE_ORDER'];
frm_Add_Edit_Prikaz.ord_ae_Nom_Ord.Text:=  DATASET['NOM_ORDER'];
if DATASET['KOMM']<> null then
frm_Add_Edit_Prikaz.ord_ae_Comments.Text:=  DATASET['KOMM'];
OLD_NOM_ORDER:=  DATASET['NOM_ORDER'];
if frm_Add_Edit_Prikaz.showmodal = mrOk then
  begin
         With WriteProc do
          begin
              StoredProcName := 'ST_ORDER_UPDATE';
              Transaction.StartTransaction;
              Prepare;
              ParamByName('ID_KOD').AsInt64 := id_kod_inside;
              ParamByName('ID_ORDER').AsInteger:= frm_Add_Edit_Prikaz.oe_Type_Order;
              ParamByName('DATE_ORDER').AsDate :=frm_Add_Edit_Prikaz.ord_ae_Date_Ord.Date;
              ParamByName('NOM_ORDER_OLD').AsString := OLD_NOM_ORDER;
              ParamByName('NOM_ORDER_NEW').AsString := frm_Add_Edit_Prikaz.ord_ae_Nom_Ord.Text;
              ParamByName('KOMM').AsString := frm_Add_Edit_Prikaz.ord_ae_Comments.Text;
              ExecProc;
              try
                Transaction.Commit;
                Close;
               except
                SHOWmessage('Виникла помилка при виконанні процедури ST_ORDER_UPDATE');
                Transaction.Rollback;
                Close;
                raise;
                end;
          end;
  DataSet.CloseOpen(true);
  DataSet.Locate('NOM_ORDER',frm_Add_Edit_Prikaz.ord_ae_Nom_Ord.Text, []);
  frm_Add_Edit_Prikaz.Free;
  end;
end;

procedure Tfrm_Order.Edit_ButtonClick(Sender: TObject);
begin
  Edit_Action.Execute;
end;

procedure Tfrm_Order.Order_TableDblClick(Sender: TObject);
begin
Edit_Action.Execute;
end;

procedure Tfrm_Order.DataSetAfterOpen(DataSet: TDataSet);
begin
ShortNameLabel.Text:='';
if Order_Table.DataController.RecordCount<> 0 then
if dataset['KOMM']<> null then
ShortNameLabel.Text:= dataset['KOMM'];
end;

procedure Tfrm_Order.DataSetAfterScroll(DataSet: TDataSet);
begin
ShortNameLabel.Text:='';
if Order_Table.DataController.RecordCount<> 0 then
if dataset['KOMM']<> null then
ShortNameLabel.Text:= dataset['KOMM'];
end;

end.
