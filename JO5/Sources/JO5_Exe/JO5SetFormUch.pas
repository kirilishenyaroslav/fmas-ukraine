unit JO5SetFormUch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  FIBDatabase, pFIBDatabase, Ibase, DB, FIBDataSet, pFIBDataSet;

type
  TfrmSetFormUch = class(TForm)
    ItemsListBox: TListBox;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    FormUchDataSet: TpFIBDataSet;
    FormUchDataSource: TDataSource;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure ItemsListBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;id_user:Int64);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TfrmSetFormUch.Create(AOwner: TComponent;
  Db_Handle: TISC_DB_HANDLE; id_user: Int64);
var id_fu:Integer;
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=Db_Handle;
     ReadTransaction.StartTransaction;
     FormUchDataSet.SelectSQL.Text:='SELECT * FROM JO5_INI_SETUP';
     FormUchDataSet.Open;
     FormUchDataSet.First;
     while not FormUchDataSet.Eof do
     begin
          id_fu:=FormUchDataSet.FieldByName('ID_SYSTEM').Value;
          ItemsListBox.AddItem(FormUchDataSet.FieldByName('NAME_SYSTEM').AsString, TObject(id_fu));

          FormUchDataSet.Next;
     end;

     if FormUchDataSet.RecordCount=1
     then ModalResult:=mrYes;

end;

procedure TfrmSetFormUch.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmSetFormUch.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmSetFormUch.ItemsListBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key=VK_return then  ModalResult:=mrYes;
     if Key=VK_escape then  ModalResult:=mrNo;

end;

end.
