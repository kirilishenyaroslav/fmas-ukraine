unit BankSelectKomisDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BankOrder, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, RxMemDS, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, cxClasses, ActnList, ImgList, dxBar,
  dxBarExtItems, cxCurrencyEdit;

type
  TfmBankSelectKomisDoc = class(TForm)
    DataSource: TDataSource;
    ActionList1: TActionList;
    ActionClose: TAction;
    ActionTake: TAction;
    StyleRepository: TcxStyleRepository;
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
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    KomisDoc: TRxMemoryData;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    ImageList: TImageList;
    procedure LoadCaptions;
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure ActionTakeExecute(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
  private
    myform : TfmBankOrder;
  public
    { Public declarations }
  end;

function ShowMultyKomisDoc(m : TfmBankOrder):boolean;

implementation
uses Un_R_file_Alex;
{$R *.dfm}

{ TfmBankSelectKomisDoc }

function ShowMultyKomisDoc(m : TfmBankOrder):boolean;
var
    T : TfmBankSelectKomisDoc;
begin
    T := TfmBankSelectKomisDoc.Create(nil);
    T.LoadCaptions;
    T.myform := m;
    T.myform.DataSetKomis.First;
    while not T.myform.DataSetKomis.Eof do
    begin
        T.KomisDoc.Open;
        T.KomisDoc.Insert;
        T.KomisDoc.FieldByName('Id').Value        := T.myform.DataSetKomis.FieldByName('R_ID_DOC').AsVariant;
        T.KomisDoc.FieldByName('Number').Value    := T.myform.cxTextEditNum.Text;
        T.KomisDoc.FieldByName('note').Value      := T.myform.DataSetKomis.FieldByName('R_NOTE').AsString;
        T.KomisDoc.FieldByName('name_cust').Value := T.myform.DataSetKomis.FieldByName('R_NAME_CUST').AsString;
        T.KomisDoc.FieldByName('summa').Value     := T.myform.DataSetKomis.FieldByName('R_SUMMA').AsFloat;
        T.KomisDoc.FieldByName('date_vip').Value  := T.myform.DataSetKomis.FieldByName('R_DATE_VIP').AsDateTime;
        T.KomisDoc.post;
        T.myform.DataSetKomis.next;
    end;

    if T.ShowModal=mrOk then
    begin
        T.myform.DataSetKomis.Locate('R_ID_DOC', T.KomisDoc.FieldByName('Id').AsVariant, []);
        Result := true;
    end else
    begin
        Result := false;
    end;
    T.Free;
end;

procedure TfmBankSelectKomisDoc.LoadCaptions;
begin
    Caption                              := Un_R_file_Alex.BANK_SELECT_KOMIS_DOC;
    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.J4_FIND_DOC_NUM;
    cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.BANK_DATE_VIP;
    cxGrid1DBTableView1DBColumn3.Caption := Un_R_file_Alex.BANK_SUMMA_DOC;
    cxGrid1DBTableView1DBColumn4.Caption := Un_R_file_Alex.BANK_P_S_NAME_CUSTOMER;
    cxGrid1DBTableView1DBColumn5.Caption := Un_R_file_Alex.BANK_NOTE;
    ActionClose.Caption                  := Un_R_file_Alex.MY_BUTTON_CANCEL_CONST;
    ActionTake.Caption                   := Un_R_file_Alex.MY_ACTION_CHOOSE_CONST;
end;

procedure TfmBankSelectKomisDoc.cxGrid1DBTableView1DblClick(
  Sender: TObject);
begin
    Modalresult := mrOK;
end;

procedure TfmBankSelectKomisDoc.ActionTakeExecute(Sender: TObject);
begin
    Modalresult := mrOK;
end;

procedure TfmBankSelectKomisDoc.dxBarLargeButton2Click(Sender: TObject);
begin
    Close;
end;

end.
