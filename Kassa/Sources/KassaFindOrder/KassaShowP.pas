unit KassaShowP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxControls, cxGroupBox, StdCtrls, cxButtons,
  cxCheckBox, ActnList, ImgList, KassaResultFindForm, Un_R_file_Alex,
  cxRadioGroup;

type
  TfmKassaShowP = class(TForm)
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
    RadioButton1: TcxRadioButton;
    RadioButton2: TcxRadioButton;
    procedure LoadCaption;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
  private
  public
    myform : TfmKassaResultFindForm;
  end;

  function ShowPrForm(Owner : TComponent; m : TfmKassaResultFindForm; var Res : Variant) : boolean;

implementation

{$R *.dfm}

{ TfmKassaShowP }

function ShowPrForm(Owner : TComponent; m : TfmKassaResultFindForm; var Res : Variant) : boolean;
var
    T : TfmKassaShowP;
    i : integer;
begin
    T := TfmKassaShowP.Create(nil);
    T.LoadCaption;

    if T.ShowModal = mrOk then
    begin
        if T.cxCheckBoxShow.Checked then i := 1 else i := 0;
        Res := VarArrayCreate([0, 2], varVariant);
        if T.RadioButton1.Checked then
        begin
            if T.cxCheckBox1.Checked then
            begin
                Res[1] := VarArrayOf([1, T.cxSpinEdit1.Value, 1]);
                Res[0] := VarArrayOf([0, 0, i]);
                Res[2] := VarArrayOf([0, 0, i]);
            end else
            begin
                Res[0] := VarArrayOf([1, T.cxSpinEdit1.Value, 1]);
                Res[1] := VarArrayOf([0, 0, i]);
                Res[2] := VarArrayOf([0, 0, i]);
            end;
        end else
        begin
            Res[0] := VarArrayOf([0, 0, i]);
            Res[1] := VarArrayOf([0, 0, i]);
        end;
        if T.RadioButton2.Checked
        then begin
            Res[2] := VarArrayOf([1, 1, i]);
        end else
        begin
            Res[2] := VarArrayOf([0, 0, i]);
        end;
        Result  := true;
    end
    else
        Result  := false;
    T.Free;
end;

procedure TfmKassaShowP.LoadCaption;
begin
   cxLabel1.Caption := Un_R_file_Alex.KASSA_COL_COPY;
   cxCheckBoxShow.Properties.Caption := Un_R_file_Alex.KASSA_PRINT_SHOW_OTCHET;
   caption := Un_R_file_Alex.KASSA_PRINT_CAPTION;
   cxCheckBox1.Properties.Caption := Un_R_file_Alex.BANK_PRINT_WITH_SONOVANIE;
   //cxCheckBox3.Properties.Caption := Un_R_file_Alex.KASSA_PRINT_FIND_3;
   ActionClose.Caption            := Un_R_file_Alex.MY_BUTTON_CANCEL_CONST;
   ActionPrint.Caption            := Un_R_file_Alex.MY_ACTION_PRINT;
   RadioButton1.Caption           := Un_R_file_Alex.BANK_PRINT_REESTR_PRINT;
   RadioButton2.Caption           := Un_R_file_Alex.BANK_FIND_PRINT_SPRAV;

end;

procedure TfmKassaShowP.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmKassaShowP.ActionPrintExecute(Sender: TObject);
begin
     ModalResult := mrOK;
end;

end.
