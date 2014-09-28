unit BankTypeKassa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, RxMemDS, cxTextEdit, cxContainer,
  cxMemo, cxLabel, cxMaskEdit, cxDropDownEdit, cxCalendar, ActnList,
  FIBDataSet, pFIBDataSet, pFIBDatabase, Placemnt;

type
  TfmBankTypeKassa = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    Rx: TRxMemoryData;
    Panel1: TPanel;
    cxTextEditNumber: TcxTextEdit;
    cxTextEditSumma: TcxTextEdit;
    DataSource1: TDataSource;
    cxDateEditdate: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxMemo1: TcxMemo;
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
    ActionList1: TActionList;
    ActionClose: TAction;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    DataSetShablon: TpFIBDataSet;
    FormStorage1: TFormStorage;
    pFIBDataSet1: TpFIBDataSet;
    cxTextEditValuta: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabelValuta: TcxLabel;
    procedure LoadCaption;
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
      { Public declarations }
  end;

function Show_Kassa_Bank(db : TpFIBDatabase; tran : TpFIBTransaction; prihod : integer; num, sum, note, date_doc : string; var shabl,id : integer; summa_valuta : Double; id_valuta : Integer; name_valuta : string) : Boolean;

implementation
USES Un_R_file_Alex, Un_func_file_Alex, Accmgmt;
{$R *.dfm}

function Show_Kassa_Bank(db : TpFIBDatabase; tran : TpFIBTransaction; prihod : integer;num, sum, note, date_doc : string; var shabl,id : integer;summa_valuta : Double; id_valuta : Integer; name_valuta : string) : Boolean;
var
    T : TfmBankTypeKassa;
    pr, check_show_nich: integer;
begin
    T := TfmBankTypeKassa.Create(nil);

    //**valuta**************************************
    if (id_valuta = 0) or (id_valuta = null) then
    begin
      T.cxLabel5.visible         := False;
      T.cxLabel6.visible         := False;
      T.cxTextEditValuta.visible := False;
      T.cxLabelValuta.visible    := False;
    end
    else
    begin
      T.cxLabel5.visible         := True;
      T.cxLabel6.visible         := True;
      T.cxTextEditValuta.visible := True;
      T.cxLabelValuta.visible    := True;
      t.cxTextEditValuta.Text    := FloatToStr(summa_valuta);
      t.cxLabelValuta.Caption    := name_valuta
    end;  
    //************************************************
    T.DataSetShablon.Database := db;
    T.DataSetShablon.Transaction := tran;
    T.DataSetShablon.Transaction.StartTransaction;

    T.pFIBDataSet1.Database := db;
    T.pFIBDataSet1.Transaction := tran;
    T.pFIBDataSet1.Transaction.StartTransaction;
    T.pFIBDataSet1.Close;
    T.pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_INI';
    T.pFIBDataSet1.Open;
    if (T.pFIBDataSet1.FieldByName('CHECK_SHOW_NICH').AsInteger = 1) then check_show_nich := 1
      else check_show_nich := 0;

    T.LoadCaption;
    T.cxTextEditNumber.Text := num;
    pr := 0;

    T.cxTextEditSumma.Text  := AddNol(sum, pr);
    T.cxMemo1.Text          := Note;
    T.cxDateEditdate.Date   := StrToDate(date_doc);
    T.Rx.Open;
    T.Rx.Insert;
    T.Rx.FieldByName('ShablonObr').Value   := 1;
    T.Rx.FieldByName('Id').Value   := 0;
    T.Rx.FieldByName('Name').Value := Un_R_file_Alex.BANK_TYPE_KASSA_BANK;
    T.Rx.Post;
    T.Rx.Open;
    T.Rx.Insert;
    T.Rx.FieldByName('ShablonObr').Value   := 2;
    T.Rx.FieldByName('Id').Value   := 0;
    T.Rx.FieldByName('Name').Value := Un_R_file_Alex.BANK_TYPE_OTHER;
    T.Rx.Post;

{    T.Rx.Open;
    T.Rx.Insert;
    T.Rx.FieldByName('Id').Value   := 3;
    T.Rx.FieldByName('Name').Value := Un_R_file_Alex.BANK_DOG_OBUCH + ' (старые)';
    T.Rx.Post;
 }
    T.Rx.Open;
    T.Rx.Insert;
    T.Rx.FieldByName('ShablonObr').Value   := 4;
    T.Rx.FieldByName('Id').Value   := 0;
    T.Rx.FieldByName('Name').Value := Un_R_file_Alex.BANK_STUD_CITY;//'Студгородок';
    T.Rx.Post;

    T.Rx.Open;
    T.Rx.Insert;
    T.Rx.FieldByName('ShablonObr').Value   := 5;
    T.Rx.FieldByName('Id').Value   := 0;
    T.Rx.FieldByName('Name').Value := Un_R_file_Alex.BANK_DOG_OBUCH;
    T.Rx.Post;

    T.Rx.Open;
    T.Rx.Insert;
    T.Rx.FieldByName('ShablonObr').Value   := 6;
    T.Rx.FieldByName('Id').Value   := 0;
    T.Rx.FieldByName('Name').Value := Un_R_file_Alex.BANK_SHABLON_TRANZ;
    T.Rx.Post;
    T.Rx.Last;

    if ((prihod = 1) and (check_show_nich = 1)) then
    begin
      T.Rx.Open;
      T.Rx.Insert;
      T.Rx.FieldByName('ShablonObr').Value := 8;
      T.Rx.FieldByName('Id').Value   := 0;
      T.Rx.FieldByName('Name').Value := Un_R_file_Alex.BANK_TYPE_NICH;
      T.Rx.Post;
      T.Rx.Last;
    end;

    T.DataSetShablon.Close;
    T.DataSetShablon.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_SHABLON('+IntToStr(prihod)+')';
    T.DataSetShablon.Open;
    T.DataSetShablon.FetchAll;
    T.DataSetShablon.First;
    while not T.DataSetShablon.Eof do
    begin
        T.Rx.Open;
        T.Rx.Insert;
        T.Rx.FieldByName('ShablonObr').Value   := 7;
        T.Rx.FieldByName('Id').Value           := T.DataSetShablon.FieldByName('kod_operation').AsInteger;
        T.Rx.FieldByName('Name').Value         := T.DataSetShablon.FieldByName('shot_name').AsString;
        T.Rx.Post;
        T.DataSetShablon.Next;
    end;


    T.Rx.Locate('ShablonObr', 2, []);
    if T.ShowModal=mrOk then
    begin
        shabl := T.Rx.FieldByName('ShablonObr').Value;
        id := T.Rx.FieldByName('id').Value;
        Result := true;
    end else
    begin
        Result := false;
    end;
    T.Free;
end;

{ TfmBankTypeKassa }

procedure TfmBankTypeKassa.LoadCaption;
begin
    cxLabel1.Caption := Un_R_file_Alex.BANK_NUM_DOCUMENT;
    cxLabel2.Caption := Un_R_file_Alex.BANK_SUMMA_DOC;
    cxLabel3.Caption := Un_R_file_Alex.BANK_DATE_DOCUMENT;
    cxLabel4.Caption := Un_R_file_Alex.BANK_NOTE;
    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.BANK_SHABLON;
    Caption          := Un_R_file_Alex.BANK_TYPE_CAPTION;
end;

procedure TfmBankTypeKassa.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfmBankTypeKassa.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = VK_RETURN then ModalResult := mrOk;
end;

procedure TfmBankTypeKassa.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmBankTypeKassa.FormCreate(Sender: TObject);
begin
   FormStorage1.RestoreFormPlacement;
end;

procedure TfmBankTypeKassa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      FormStorage1.SaveFormPlacement;
end;

end.
