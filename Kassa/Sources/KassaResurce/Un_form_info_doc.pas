unit Un_form_info_doc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, cxButtons, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, cxLabel, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxDBData, cxSplitter, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls;

type
  TfmUnFormInfoDoc = class(TForm)
    cxButton1: TcxButton;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    Database: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    procedure cxButton1Click(Sender: TObject);
  private
    procedure LoadCaption;
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure Info_doc_show(AOwner: TComponent; db : TpFIBDatabase; pk_id: int64);

implementation
uses Un_R_file_Alex;

{$R *.dfm}

{ TfmUnFormInfoDoc }

procedure Info_doc_show(AOwner: TComponent; db : TpFIBDatabase; pk_id: int64);
var
    T : TfmUnFormInfoDoc;
begin
    T := TfmUnFormInfoDoc.Create(AOwner);
    T.Database                    := db;
    T.Transaction.DefaultDatabase := T.Database;
    T.Database.DefaultTransaction := T.Transaction;
    T.DataSet.Database            := T.Database;
    T.DataSet.Transaction         := T.Transaction;
    T.Transaction.StartTransaction;
    T.LoadCaption;
    T.DataSet.Close;
    T.DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_INFO_USER_BY_PK_ID('+IntToStr(pk_id)+')';
    T.DataSet.Open;
    T.cxTextEdit1.Text := T.DataSet.FieldByName('R_FIO').AsString;
    T.cxTextEdit2.Text := T.DataSet.FieldByName('R_TIME').AsString;
    T.cxTextEdit3.Text := T.DataSet.FieldByName('R_COMP').AsString;
    T.DataSet.Close;
    if T.ShowModal=mrOk then
    begin
        T.Free;
    end;
end;

procedure TfmUnFormInfoDoc.LoadCaption;
begin
    cxLabel1.Caption  := Un_R_file_Alex.INFO_FIO;
    cxLabel2.Caption  := Un_R_file_Alex.INFO_TIME;
    cxLabel3.Caption  := Un_R_file_Alex.INFO_COMP;
    cxButton1.Caption := Un_R_file_Alex.MY_BUTTON_CLOSE;
    Caption           := Un_R_file_Alex.INFO_CAPTION_DOC;

end;

procedure TfmUnFormInfoDoc.cxButton1Click(Sender: TObject);
begin
    close;
end;

end.
