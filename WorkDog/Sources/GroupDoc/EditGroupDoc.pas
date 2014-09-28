unit EditGroupDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, ExtCtrls, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDataSet, pFIBDataSet,MainGroupDoc,
  dogLangPackUnit2;

resourcestring
    errDtDocNumber = 'Номер не заповнен!';
    errDtDocName = 'Введите найменування групи документів!';

type
  TfrmEditGroupDoc = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cxTextEdit_name_doc: TcxTextEdit;
    cxMaskEdit_n: TcxMaskEdit;
    cxButton_add: TcxButton;
    cxButton_cancel: TcxButton;
    pFIBStoredProc: TpFIBStoredProc;
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButton_addClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxMaskEdit_nKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
  Flag_edit: Boolean;
    { Public declarations }
  constructor Create (Aowner: TComponent; n_doc: Variant; name_group_doc: String; Flag: Boolean; id_group_doc: Variant);overload;
  end;

var
  frmEditGroupDoc: TfrmEditGroupDoc;
  id_group: Variant;

implementation

uses DB;

{$R *.dfm}

constructor TfrmEditGroupDoc.Create (Aowner: TComponent; n_doc: Variant; name_group_doc: String; Flag: Boolean; id_group_doc: Variant);
var
  DataSet: TpFIBDataSet;
  s: String;
begin
  if Flag = true then
  begin
    inherited Create (Aowner);
    cxMaskEdit_n.Text := n_doc;
    cxTextEdit_name_doc.Text := name_group_doc;
    Flag_edit := Flag;
    Caption := 'Редагування';
    id_group := id_group_doc;
    cxMaskEdit_n.Properties.ReadOnly := true;
  end
  else
  begin
    inherited Create (Aowner);
    Flag_edit := flag;
    DataSet := TpFIBDataSet.Create(self);
    DataSet.Database := TfrmGroupDoc(self.Owner).pFIBDatabase;
    DataSet.Transaction := TfrmGroupDoc(self.Owner).pFIBTransactionRead;
    s := 'select max(dog_dt_group_doc.n_group_doc) as max_n_group'+' '+
        'from   dog_dt_group_doc';
    DataSet.SelectSQL.Add(s);
    DataSet.Active := true;
    cxMaskEdit_n.Text := DataSet.FieldByName('max_n_group').AsVariant+1;
  end;
end;

procedure TfrmEditGroupDoc.cxButton_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEditGroupDoc.cxButton_addClick(Sender: TObject);
begin
          // проверка на заполнение номера
    if  Trim(cxMaskEdit_n.Text) = '' then
        begin
        MessageDlg(errDtDocNumber, mtError, [mbOk], 0);
        cxMaskEdit_n.SetFocus;
        Exit;
    end;

           // проверка на заполнение названия
    if Trim(cxTextEdit_name_doc.Text) = '' then
    begin
        MessageDlg(errDtDocName, mtError, [mbOk], 0);
        cxTextEdit_name_doc.SetFocus;
        Exit;
    end;

    if Flag_edit = false then
    begin
      pFIBStoredProc.Database := TfrmGroupDoc(Self.Owner).pFIBDatabase;
      pFIBStoredProc.Transaction := TfrmGroupDoc(Self.Owner).pFIBTransactionWrite;
      TfrmGroupDoc(Self.Owner).pFIBTransactionWrite.DefaultDatabase := TfrmGroupDoc(Self.Owner).pFIBDatabase;
      TfrmGroupDoc(Self.Owner).pFIBTransactionWrite.StartTransaction;
      pFIBStoredProc.StoredProcName := 'DOG_DT_GROUP_DOC_INSERT';
      pFIBStoredProc.Prepare;
      pFIBStoredProc.ParamByName('D_N_GROUP').Value := Trim(cxMaskEdit_n.Text);
      pFIBStoredProc.ParamByName('D_NAME_GROUP').Value := Trim(cxTextEdit_name_doc.Text);
      try
        pFIBStoredProc.ExecProc;
      Except on e:Exception do
        begin
          ShowMessage(e.Message);
          TfrmGroupDoc(Self.Owner).pFIBTransactionWrite.Rollback;
          Exit;
        end;
      end;
        TfrmGroupDoc(Self.Owner).IdGroup(pFIBStoredProc.ParamByName('V_ID_GROUP_DOC').AsVariant);
        TfrmGroupDoc(Self.Owner).pFIBTransactionWrite.Commit;

        Close;
    end
    else
    begin
      pFIBStoredProc.Database := TfrmGroupDoc(Self.Owner).pFIBDatabase;
      pFIBStoredProc.Transaction := TfrmGroupDoc(Self.Owner).pFIBTransactionWrite;
      TfrmGroupDoc(Self.Owner).pFIBTransactionWrite.DefaultDatabase := TfrmGroupDoc(Self.Owner).pFIBDatabase;
      TfrmGroupDoc(Self.Owner).pFIBTransactionWrite.StartTransaction;
      pFIBStoredProc.StoredProcName := 'DOG_DT_GROUP_DOC_UPDATE';
      pFIBStoredProc.Prepare;
      pFIBStoredProc.ParamByName('D_N_GROUP_DOC').Value := Trim(cxMaskEdit_n.Text);
      pFIBStoredProc.ParamByName('D_NAME_GROUP_DOC').Value := Trim(cxTextEdit_name_doc.Text);
      pFIBStoredProc.ParamByName('D_ID_GROUP_DOC').Value := id_group;
       try
        pFIBStoredProc.ExecProc;
      Except
        begin
          TfrmGroupDoc(Self.Owner).pFIBTransactionWrite.Rollback;
          Exit;
        end;
      end;
        TfrmGroupDoc(Self.Owner).pFIBTransactionWrite.Commit;
        Close;
    end;
end;

procedure TfrmEditGroupDoc.FormCreate(Sender: TObject);
begin
//Интерфейс
{  Label2.Caption           := rstd_name_gr;
  Label1.Caption           := rsh_Number;}
end;

procedure TfrmEditGroupDoc.cxMaskEdit_nKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in ['0'..'9'])  and (key <> #8)
  then    key := #0;
  if key = #13 then cxTextEdit_name_doc.SetFocus;
end;

end.
