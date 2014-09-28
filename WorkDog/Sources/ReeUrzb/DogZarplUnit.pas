unit DogZarplUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxButtonEdit, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, StdCtrls, cxLookAndFeelPainters, cxButtons, ExtCtrls,
  cxCurrencyEdit, GlobalSPR, DB, FIBDataSet, pFIBDataSet, Mask, ToolEdit,
  CurrEdit;

type
  TfrmDogZarp = class(TForm)
    Label2: TLabel;
    cxButtonEdit_name_kekv: TcxButtonEdit;
    Label3: TLabel;
    Panel1: TPanel;
    cxButton_add: TcxButton;
    cxButton_cancel: TcxButton;
    cxMaskEdit_kekv: TcxMaskEdit;
    DataSet: TpFIBDataSet;
    cxCurrencyEdit_summa: TCurrencyEdit;
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButtonEdit_name_kekvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton_addClick(Sender: TObject);
    procedure cxMaskEdit_kekvExit(Sender: TObject);
    procedure cxMaskEdit_kekvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxCurrencyEdit_summaExit(Sender: TObject);
    procedure cxCurrencyEdit_summaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButtonEdit_name_kekvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    id_kekv   :  Int64;
    kod_kekv   : Integer;
  end;

var
  frmDogZarp: TfrmDogZarp;

implementation
  uses ReeUrzbUnit,ReeUrzbDogUnit;
{$R *.dfm}

procedure TfrmDogZarp.cxButton_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDogZarp.cxButtonEdit_name_kekvPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  res : variant;
begin
  res := GlobalSPR.GetKEKVSpr(self,(Owner.Owner as TfrmReeUrzb).WorkDatabase.Handle, fsNormal, Date, 1);
  if VarArrayDimCount(res) > 0 then
  begin
      if (res[0][0]<>null) and (res[0][1]<>null) then
      begin
          id_kekv := res[0][0];
          kod_kekv := res[0][2];
          cxButtonEdit_name_kekv.Text := res[0][1]; 
          cxMaskEdit_kekv.Text        := res[0][2];
      end;
  end;
end;


procedure TfrmDogZarp.cxButton_addClick(Sender: TObject);
begin

  if (Trim(cxButtonEdit_name_kekv.Text))='' then
  begin
    ShowMessage('¬ибер≥ть  ≈ ¬.');
    exit;
    cxButtonEdit_name_kekv.SetFocus;
  end;

  if (Trim(cxCurrencyEdit_summa.Text))='' then
  begin
    ShowMessage('¬вед≥ть сумму.');
    exit;
    cxCurrencyEdit_summa.SetFocus;
  end;

  TfrmUrzbDog(Self.Owner).GetIdKekv(id_kekv, cxCurrencyEdit_summa.Value, kod_kekv);

  ModalResult := mrYes;
end;

procedure TfrmDogZarp.cxMaskEdit_kekvExit(Sender: TObject);
begin
  if Trim(cxMaskEdit_kekv.Text) <> '' then
  begin
    DataSet.Close;
    DataSet.ParamByName('num_kekv').Value := Trim(cxMaskEdit_kekv.Text);
    DataSet.ParamByName('actual_date').Value := Date;
    DataSet.Open;
    id_kekv := DataSet.FBN('id_kekv').AsInteger;
    kod_kekv := StrToInt(Trim(cxMaskEdit_kekv.Text));
    cxButtonEdit_name_kekv.Text := DataSet.FBN('KEKV_TITLE').AsString;
    cxButtonEdit_name_kekv.SetFocus;
  end;
end;

procedure TfrmDogZarp.cxMaskEdit_kekvKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    cxMaskEdit_kekvExit(Self);
    cxButtonEdit_name_kekv.SetFocus;
  end;
end;

procedure TfrmDogZarp.cxCurrencyEdit_summaExit(Sender: TObject);
begin
  cxButton_add.SetFocus;
end;

procedure TfrmDogZarp.cxCurrencyEdit_summaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 // cxButton_add.SetFocus;
end;

procedure TfrmDogZarp.cxButtonEdit_name_kekvKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  cxCurrencyEdit_summa.setfocus;
end;

end.
