unit BankBuffEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, StdCtrls, cxButtons, ExtCtrls,
  cxMemo, FIBQuery, pFIBQuery, pFIBStoredProc, cxDropDownEdit;

type
  TfrmBuffEdit = class(TForm)
    Panel1: TPanel;
    cxButton_add: TcxButton;
    cxButton_cancel: TcxButton;
    cxButtonEdit_buff: TcxButtonEdit;
    OpenDialog: TOpenDialog;
    cxMemo_comment: TcxMemo;
    Label1: TLabel;
    Label2: TLabel;
    pFIBStoredProc: TpFIBStoredProc;
    Label3: TLabel;
    cxComboBox_save: TcxComboBox;
    Label4: TLabel;
    Label5: TLabel;
    cxComboBox_del: TcxComboBox;
    cxComboBox_name_table: TcxComboBox;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButton_addClick(Sender: TObject);
  private
    { Private declarations }
  public
  id_bank_buff : Integer;

  constructor Create (Aowner: TComponent; mode: String;
                      path, comment, table_name, prog_save, prog_del : String; id_bankbuff: Integer); overload;
    { Public declarations }
  end;

var
  frmBuffEdit: TfrmBuffEdit;
  mode_b: string;
  id_buff : Integer;

implementation
uses
  BankBuff;

{$R *.dfm}

constructor TfrmBuffEdit.Create(Aowner: TComponent; mode: String;
                                path, comment, table_name, prog_save, prog_del : String; id_bankbuff: Integer);
begin
  inherited Create (Aowner);
  mode_b := mode;
  id_buff := id_bankbuff;
  if mode <> 'add' then
  begin
    cxButtonEdit_buff.Text := path;
    cxMemo_comment.Text := comment;
    cxComboBox_name_table.Text := table_name;
    cxComboBox_save.Text := prog_save;
    cxComboBox_del.Text := prog_del;
    Caption := 'Редагування';
  end;
  if mode = 'view' then
  begin
    cxButtonEdit_buff.Properties.ReadOnly := true;
    cxMemo_comment.Properties.ReadOnly := true;
    cxButtonEdit_buff.Properties.ReadOnly := true;
    cxButton_add.Visible := false;
    cxButton_cancel.Caption := 'ОК';
    Caption := 'Перегляд';
  end;
end;

procedure TfrmBuffEdit.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if mode_b = 'view' then Exit;
  if not OpenDialog.Execute then exit;
  cxButtonEdit_buff.Text := OpenDialog.FileName;
  //select * from RDB$PROCEDURE_PARAMETERS
//where RDB$PROCEDURE_NAME='DOG_BUFFER_SELECT'
end;

procedure TfrmBuffEdit.cxButton_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBuffEdit.cxButton_addClick(Sender: TObject);
var
  path, alias: String;
begin
  if mode_b = 'view' then Exit;

  alias := ExtractFileName(cxButtonEdit_buff.Text);
  path := ExtractFilePath(cxButtonEdit_buff.Text);
  delete(path,Length(path),1);

  if mode_b = 'add' then
  begin
    pFIBStoredProc.Transaction.StartTransaction;
    pFIBStoredProc.StoredProcName := 'DOG_DT_BANKBUFF_INSERT';
    pFIBStoredProc.ParamByName('comment').Value := cxMemo_comment.Text;
    pFIBStoredProc.ParamByName('path_buff').Value := path;
    pFIBStoredProc.ParamByName('alias').Value := alias;
    pFIBStoredProc.ParamByName('name_table_buff').Value := cxComboBox_name_table.Text;
    pFIBStoredProc.ParamByName('prog_save').Value := cxComboBox_save.Text;
    pFIBStoredProc.ParamByName('prog_dele').Value := cxComboBox_del.Text;
    try
      pFIBStoredProc.ExecProc;
    except on e: Exception do
     begin
      ShowMessage(e.Message);
      pFIBStoredProc.Transaction.Rollback;
      Exit;
     end;
    end;
      pFIBStoredProc.Transaction.Commit;
      id_bank_buff := pFIBStoredProc.ParamByNAme('id_bank_buff').AsInteger;
  end
  else if mode_b = 'red' then
  begin
    pFIBStoredProc.Transaction.StartTransaction;
    pFIBStoredProc.StoredProcName := 'DOG_DT_BANKBUFF_UPDATE';
    pFIBStoredProc.ParamByName('comment').Value := cxMemo_comment.Text;
    pFIBStoredProc.ParamByName('path_buff').Value := path;
    pFIBStoredProc.ParamByName('alias').Value := alias;
    pFIBStoredProc.ParamByName('name_table_buff').Value := cxComboBox_name_table.Text;
    pFIBStoredProc.ParamByName('id_bank_buff').Value := Id_buff;
    pFIBStoredProc.ParamByName('prog_save').Value := cxComboBox_save.Text;
    pFIBStoredProc.ParamByName('prog_del').Value := cxComboBox_del.Text;

    try
      pFIBStoredProc.ExecProc;
    except on e: Exception do
     begin
      ShowMessage(e.Message);
      pFIBStoredProc.Transaction.Rollback;
      Exit;
     end;
    end;
      pFIBStoredProc.Transaction.Commit;
  end;
  Close;
end;

end.
