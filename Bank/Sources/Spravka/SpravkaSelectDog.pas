unit SpravkaSelectDog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ActnList, RxMemDS, cxTextEdit, Placemnt,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase;

type
  TfmSpravkaSelectDog = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
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
    Rx: TRxMemoryData;
    DataSource1: TDataSource;
    ActionList1: TActionList;
    ActionClose: TAction;
    FormStorage1: TFormStorage;
    pFIBDataSet1: TpFIBDataSet;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionCloseExecute(Sender: TObject);
    procedure LoadCaption;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//function Show_Select_Type_Dog({num, sum, note, date_doc : string;} var i : integer) : Boolean;
function Show_Select_Type_Dog(var i : integer; db : TpFIBDatabase; tran : TpFIBTransaction; prihod : integer) : Boolean;


implementation
uses Un_R_file_Alex;

{$R *.dfm}

function Show_Select_Type_Dog(var i : integer; db : TpFIBDatabase; tran : TpFIBTransaction; prihod : integer) : Boolean;
var
    T : TfmSpravkaSelectDog;
    pr, check_show_nich: integer;
begin
    T := TfmSpravkaSelectDog.Create(nil);
    T.LoadCaption;
//  T.cxTextEditNumber.Text := num;
//  pr := 0;
//  T.cxTextEditSumma.Text  := AddNol(sum, pr);
//  T.cxMemo1.Text          := Note;
//  T.cxDateEditdate.Date   := StrToDate(date_doc);
{   T.Rx.Open;
    T.Rx.Insert;
    T.Rx.FieldByName('Id').Value   := 1;
    T.Rx.FieldByName('Name').Value := Un_R_file_Alex.BANK_TYPE_KASSA_BANK;
    T.Rx.Post;}
    T.Rx.Open;
    T.Rx.Insert;
    T.Rx.FieldByName('Id').Value   := 2;
    T.Rx.FieldByName('Name').Value := Un_R_file_Alex.BANK_TYPE_OTHER;
    T.Rx.Post;

    {T.Rx.Open;
    T.Rx.Insert;
    T.Rx.FieldByName('Id').Value   := 3;
    T.Rx.FieldByName('Name').Value := Un_R_file_Alex.BANK_DOG_OBUCH;
    T.Rx.Post;}

    T.Rx.Open;
    T.Rx.Insert;
    T.Rx.FieldByName('Id').Value   := 4;
    T.Rx.FieldByName('Name').Value := Un_R_file_Alex.BANK_STUD_CITY;//'Студгородок';
    T.Rx.Post;

    T.Rx.Open;
    T.Rx.Insert;
    T.Rx.FieldByName('Id').Value   := 5;
    T.Rx.FieldByName('Name').Value := 'Договора за навчання (нові)';
    T.Rx.Post;

    T.pFIBDataSet1.Database := db;
    T.pFIBDataSet1.Transaction := tran;
    T.pFIBDataSet1.Transaction.StartTransaction;
    T.pFIBDataSet1.Close;
    T.pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_INI';
    T.pFIBDataSet1.Open;
    if (T.pFIBDataSet1.FieldByName('CHECK_SHOW_NICH').AsInteger = 1) then check_show_nich := 1
      else check_show_nich := 0;

    if ((prihod = 1) and (check_show_nich = 1)) then
    begin
      T.Rx.Open;
      T.Rx.Insert;
      T.Rx.FieldByName('Id').Value   := 6;
      T.Rx.FieldByName('Name').Value := 'Фінансування НІЧ';
      T.Rx.Post;
    end;

    T.Rx.Locate('Id', 2, []);
    if T.ShowModal=mrOk then
    begin
        i := T.Rx.FieldByName('Id').Value;
        Result := true;
    end else
    begin
        Result := false;
    end;
    T.Free;
end;

procedure TfmSpravkaSelectDog.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfmSpravkaSelectDog.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = VK_RETURN then ModalResult := mrOk;
end;

procedure TfmSpravkaSelectDog.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmSpravkaSelectDog.LoadCaption;
begin
//    cxLabel1.Caption := Un_R_file_Alex.BANK_NUM_DOCUMENT;
//    cxLabel2.Caption := Un_R_file_Alex.BANK_SUMMA_DOC;
//    cxLabel3.Caption := Un_R_file_Alex.BANK_DATE_DOCUMENT;
//    cxLabel4.Caption := Un_R_file_Alex.BANK_NOTE;
    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.BANK_SHABLON;
    Caption          := Un_R_file_Alex.BANK_TYPE_CAPTION;
end;

procedure TfmSpravkaSelectDog.FormCreate(Sender: TObject);
begin
    FormStorage1.RestoreFormPlacement;
end;

procedure TfmSpravkaSelectDog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FormStorage1.SaveFormPlacement;
end;

end.
