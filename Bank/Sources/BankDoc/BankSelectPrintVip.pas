unit BankSelectPrintVip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, ExtCtrls, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ActnList, FIBDataSet,
  pFIBDataSet, BankDocMainForm, pFIBDatabase,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ComCtrls, ToolWin, cxTextEdit,
  cxContainer, cxLabel, cxImage, cxRadioGroup, cxGroupBox, cxCheckBox;


type
  TfmBankSelectPrintVip = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxCheckBox1: TcxCheckBox;
    cxGroupBox1: TcxGroupBox;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxCheckBox2: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
Function ShowSelectPrintBankVipiska (fr : TComponent; var who_pr, rassh, vip, groupby : integer) : boolean;

implementation
uses Un_R_file_Alex;
{$R *.dfm}

Function ShowSelectPrintBankVipiska (fr : TComponent; var who_pr, rassh, vip, groupby : integer) : boolean;
var
    T : TfmBankSelectPrintVip;
begin
    T := TfmBankSelectPrintVip.Create(fr);
    T.cxButton1.Caption      := Un_R_file_Alex.MY_ACTION_PRINT_CONST;
    T.cxButton2.Caption      := Un_R_file_Alex.MY_ACTION_CLOSE_VIH;
    T.cxRadioButton1.Caption := Un_R_file_Alex.BANK_SELECT_PRINT_VIPISKA;
    T.cxRadioButton2.Caption := Un_R_file_Alex.BANK_SELECT_PRINT_REESTR_VIPISKA;
    T.cxCheckBox2.Properties.Caption := Un_R_file_Alex.BANK_PRINT_VED_PRINT;
    T.cxCheckBox1.Properties.Caption := Un_R_file_Alex.BANK_PRINT_RAS_DAY;


    if T.ShowModal = mrOk then
    begin
        if T.cxRadioButton1.Checked then who_pr  := 1;
        if T.cxRadioButton2.Checked then who_pr  := 2;
        if T.cxCheckBox1.Checked    then rassh   := 1 else rassh   := -1;
        if T.cxCheckBox2.Checked    then vip     := 1 else vip     := -1;
        if T.cxCheckBox3.Checked    then groupby := 1 else groupby := 0;
        Result := True;
    end else
    begin
        Result := false;
    end;
    T.Free;
//
end;

procedure TfmBankSelectPrintVip.cxButton2Click(Sender: TObject);
begin
    Close;
end;

procedure TfmBankSelectPrintVip.cxButton1Click(Sender: TObject);
begin
    ModalResult := mrOk;
end;

end.
