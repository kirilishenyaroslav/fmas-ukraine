unit BankShowP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxControls, cxGroupBox, StdCtrls, cxButtons,
  cxCheckBox, ActnList, ImgList, BankResultFindForm, Un_R_file_Alex;

type
  TfmBankShowP = class(TForm)
    cxButton1: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxSpinEdit1: TcxSpinEdit;
    cxLabel1: TcxLabel;
    cxCheckBox1: TcxCheckBox;
    cxCheckBoxShow: TcxCheckBox;
    cxButton2: TcxButton;
    ActionList1: TActionList;
    ActionClose: TAction;
    ActionPrint: TAction;
    ImageList1: TImageList;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    cxCheckBox2: TcxCheckBox;
    procedure LoadCaption;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
  private
  public
    myform : TfmBankResultFindForm;
  end;

  function ShowPrFormBank(Owner : TComponent; m : TfmbankResultFindForm; var Res : Variant) : boolean;

implementation

{$R *.dfm}

{ TfmBankShowP }

function ShowPrFormBank(Owner : TComponent; m : TfmBankResultFindForm; var Res : Variant) : boolean;
var
    T : TfmBankShowP;
    i : integer;
begin
    T := TfmBankShowP.Create(nil);
    T.LoadCaption;

    if T.ShowModal = mrOk then
    begin
        if T.cxCheckBoxShow.Checked then i := 1 else i := 0;

        Res := VarArrayCreate([0, 3], varVariant);
        if T.RadioButton1.Checked then
        begin
            T.cxCheckBox1.Enabled := true;
            T.cxCheckbox2.Enabled := true;
            if T.cxCheckBox1.Checked then
            begin
            //1- если чекер на основание отмечен то 1, неотмечен 0
            //2- количество экзмепл€ров
            //3- показывать отчет  на экране
            //4- если чеккер стоит на печати с корреспонденцией
                Res[1] := VarArrayOf([1, T.cxSpinEdit1.Value, 1,0]);
                Res[0] := VarArrayOf([0, 0, i, 0]);
                Res[2] := VarArrayOf([0, 0, i, 0]);
                Res[3] := VarArrayOf([0, 0, i, 0]);
            end else
           { begin
                Res[0] := VarArrayOf([1, T.cxSpinEdit1.Value, 1, 0]);
                Res[1] := VarArrayOf([0, 0, i, 0]);
                Res[2] := VarArrayOf([0, 0, i, 0]);
            end; }
            if T.cxCheckBox2.Checked then
            begin
                Res[1] := VarArrayOf([0, 0, i, 0]);
                Res[0] := VarArrayOf([0, 0, i, 0]);
                Res[2] := VarArrayOf([0, 0, i, 0]);
                Res[3] := VarArrayOf([0, T.cxSpinEdit1.Value, 1, 1]);
            end else
            begin
                Res[0] := VarArrayOf([1, T.cxSpinEdit1.Value, 1, 0]);
                Res[1] := VarArrayOf([0, 0, i, 0]);
                Res[2] := VarArrayOf([0, 0, i, 0]);
                Res[3] := VarArrayOf([0, 0, i, 0]);
            end;

        end else
        begin
            Res[0] := VarArrayOf([0, 0, i,0]);
            Res[1] := VarArrayOf([0, 0, i,0]);
            Res[3] := VarArrayOf([0, 0, i,0]);
        end;
        if T.RadioButton2.Checked
        then begin
            T.cxCheckbox1.Enabled := false;
            T.cxCheckbox2.Enabled := false;
            Res[2] := VarArrayOf([1, 1, i,0]);
        end else
        begin
            Res[2] := VarArrayOf([0, 0, i,0]);
        end;
        Result := true;
    end
    else
        Result := false;
    T.Free;
end;

procedure TfmBankShowP.LoadCaption;
begin
   cxLabel1.Caption := Un_R_file_Alex.KASSA_COL_COPY;
   cxCheckBoxShow.Properties.Caption := Un_R_file_Alex.KASSA_PRINT_SHOW_OTCHET;
   caption := Un_R_file_Alex.KASSA_PRINT_CAPTION;
   cxCheckBox1.Properties.Caption := Un_R_file_Alex.BANK_PRINT_WITH_SONOVANIE;
   ActionClose.Caption            := Un_R_file_Alex.MY_BUTTON_CANCEL_CONST;
   ActionPrint.Caption            := Un_R_file_Alex.MY_ACTION_PRINT;
   RadioButton1.Caption           := Un_R_file_Alex.BANK_PRINT_REESTR_PRINT;
   RadioButton2.Caption           := Un_R_file_Alex.BANK_FIND_PRINT_SPRAV;
   cxCheckBox2.Properties.Caption := Un_R_file_Alex.BANK_PRINT_WITH_KORRESP;
end;

procedure TfmBankShowP.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmBankShowP.ActionPrintExecute(Sender: TObject);
begin

     ModalResult := mrOK;
end;

end.
