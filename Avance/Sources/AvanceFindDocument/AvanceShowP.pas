unit AvanceShowP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxControls, cxGroupBox, StdCtrls, cxButtons,
  cxCheckBox, ActnList, ImgList, AvanceResultFindForm, Un_R_file_Alex,
  cxRadioGroup;

type
  TfmAvanceShowP = class(TForm)
    cxButton1: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxSpinEdit1: TcxSpinEdit;
    cxLabel1: TcxLabel;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    cxCheckBoxShow: TcxCheckBox;
    cxLabel2: TcxLabel;
    cxSpinEdit2: TcxSpinEdit;
    cxButton2: TcxButton;
    ActionList1: TActionList;
    ActionClose: TAction;
    ActionPrint: TAction;
    ImageList1: TImageList;
    cxCheckBox3: TcxCheckBox;
    cxLabel3: TcxLabel;
    cxSpinEdit3: TcxSpinEdit;
    cxCheckBox4: TcxCheckBox;
    cxLabel4: TcxLabel;
    cxSpinEdit4: TcxSpinEdit;
    procedure LoadCaption;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
  private
  public
    myform : TfmAvanceResultFindForm;
  end;

  function ShowPrForm(Owner : TComponent; m : TfmAvanceResultFindForm; var Res : Variant) : boolean;

implementation

{$R *.dfm}

{ TfmAvanceShowP }

function ShowPrForm(Owner : TComponent; m : TfmAvanceResultFindForm; var Res : Variant) : boolean;
var
    T : TfmAvanceShowP;
    i : integer;
begin
    T := TfmAvanceShowP.Create(nil);
    T.LoadCaption;

    if T.ShowModal = mrOk then
    begin
        if T.cxCheckBoxShow.Checked then i := 1 else i := 0;
        Res := VarArrayCreate([0, 3],varVariant);
        if T.cxCheckBox1.Checked
            then Res[0]:=VarArrayOf([1, T.cxSpinEdit1.Value, i])
            else Res[0]:=VarArrayOf([0, 0, i]);
        if T.cxCheckBox2.Checked
            then Res[1]:=VarArrayOf([1, T.cxSpinEdit2.Value, i])
            else Res[1]:=VarArrayOf([0, 0, i]);
        if T.cxCheckBox3.Checked
            then Res[2]:=VarArrayOf([1, T.cxSpinEdit3.Value, i])
            else Res[2]:=VarArrayOf([0, 0, i]);
        if T.cxCheckBox4.Checked
            then Res[3]:=VarArrayOf([1, T.cxSpinEdit4.Value, i])
            else Res[3]:=VarArrayOf([0, 0, i]);
        Result  := true;
    end
    else
        Result  := false;
    T.Free;
end;

procedure TfmAvanceShowP.LoadCaption;
begin
   cxLabel1.Caption := Un_R_file_Alex.KASSA_COL_COPY;
   cxLabel2.Caption := Un_R_file_Alex.KASSA_COL_COPY;
   cxLabel3.Caption := Un_R_file_Alex.KASSA_COL_COPY;
   cxLabel4.Caption := Un_R_file_Alex.KASSA_COL_COPY;
   cxCheckBoxShow.Properties.Caption := Un_R_file_Alex.KASSA_PRINT_SHOW_OTCHET;
   caption := Un_R_file_Alex.KASSA_PRINT_CAPTION;
   cxCheckBox1.Properties.Caption := Un_R_file_Alex.KASSA_PRINT_FIND_1;
   cxCheckBox2.Properties.Caption := Un_R_file_Alex.KASSA_PRINT_FIND_2;
   cxCheckBox3.Properties.Caption := Un_R_file_Alex.J4_GROUP_MEN;
   cxCheckBox4.Properties.Caption := Un_R_file_Alex.J4_REPORT_SV_1DF;
   ActionClose.Caption            := Un_R_file_Alex.MY_BUTTON_CANCEL_CONST;
   ActionPrint.Caption            := Un_R_file_Alex.MY_ACTION_PRINT;

end;

procedure TfmAvanceShowP.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmAvanceShowP.ActionPrintExecute(Sender: TObject);
begin
     ModalResult := mrOK;
end;

end.
