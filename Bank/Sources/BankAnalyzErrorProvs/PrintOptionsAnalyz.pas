unit PrintOptionsAnalyz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ImgList, ActnList, StdCtrls, cxCheckBox,
  cxLabel, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxControls, cxGroupBox, cxButtons, ResultAnalyz, Un_R_file_Alex;

type
  TfrmPrintOptionsAnalyz = class(TForm)
    cxButton1: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxSpinEdit1: TcxSpinEdit;
    cxLabel1: TcxLabel;
    RadioButton1: TRadioButton;
    cxCheckBoxShow: TcxCheckBox;
    cxButton2: TcxButton;
    ActionList1: TActionList;
    ActionClose: TAction;
    ActionPrint: TAction;
    ImageList1: TImageList;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure LoadCaption;
    procedure ActionPrintExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
  private
    { Private declarations }
  public
    myform : TfrmResultAnalyz;
  end;

  function ShowPrFormBank(Owner : TComponent; m : TfrmResultAnalyz; var Res : Variant) : boolean;


{var
  frmPrintOptionsAnalyz: TfrmPrintOptionsAnalyz; }

implementation

{$R *.dfm}
function ShowPrFormBank(Owner : TComponent; m : TfrmResultAnalyz; var Res : Variant) : boolean;
var
    T : TfrmPrintOptionsAnalyz;
    i : integer;
begin
    T := TfrmPrintOptionsAnalyz.Create(nil);
    T.LoadCaption;

    if T.ShowModal = mrOk then
    begin
        if T.cxCheckBoxShow.Checked then i := 1 else i := 0;

        Res := VarArrayCreate([0, 3], varVariant);
        //if T.RadioButton1.Checked then
       // begin
            T.RadioButton2.Enabled := true;
            T.RadioButton3.Enabled := true;
            if T.RadioButton2.Checked then
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
            if T.RadioButton3.Checked then
            begin
                Res[1] := VarArrayOf([0, 0, i, 0]);
                Res[0] := VarArrayOf([0, 0, i, 0]);
                Res[2] := VarArrayOf([0, 0, i, 0]);
                Res[3] := VarArrayOf([0, T.cxSpinEdit1.Value, 1, 1]);
            end else
            if T.RadioButton1.Checked then
            begin
                Res[0] := VarArrayOf([1, T.cxSpinEdit1.Value, 1, 0]);
                Res[1] := VarArrayOf([0, 0, i, 0]);
                Res[2] := VarArrayOf([0, 0, i, 0]);
                Res[3] := VarArrayOf([0, 0, i, 0]);
            end;

       // end else
      //  begin
       //     Res[0] := VarArrayOf([0, 0, i,0]);
      //      Res[1] := VarArrayOf([0, 0, i,0]);
       //     Res[3] := VarArrayOf([0, 0, i,0]);
       // end;
        {if T.RadioButton2.Checked
        then begin
            T.cxCheckbox1.Enabled := false;
            T.cxCheckbox2.Enabled := false;
            Res[2] := VarArrayOf([1, 1, i,0]);
        end else
        begin
            Res[2] := VarArrayOf([0, 0, i,0]);
        end; }
        Result := true;
    end
    else
        Result := false;
    T.Free;
end;

procedure TfrmPrintOptionsAnalyz.LoadCaption;
begin
   cxLabel1.Caption                  := Un_R_file_Alex.KASSA_COL_COPY;
   cxCheckBoxShow.Properties.Caption := Un_R_file_Alex.KASSA_PRINT_SHOW_OTCHET;
   caption                           := Un_R_file_Alex.KASSA_PRINT_CAPTION;
   ActionClose.Caption               := Un_R_file_Alex.MY_BUTTON_CANCEL_CONST;
   ActionPrint.Caption               := Un_R_file_Alex.MY_ACTION_PRINT;
   RadioButton1.Caption              := Un_R_file_Alex.BANK_ANALYZ_REESTR;
   RadioButton2.Caption              := Un_R_file_Alex.BANK_ANALYZ_REESTR_NOTE;
   RadioButton3.Caption              := Un_R_file_Alex.BANK_ANALYZ_REESTR_KOR;
end;

procedure TfrmPrintOptionsAnalyz.ActionPrintExecute(Sender: TObject);
begin
     ModalResult := mrOK;
end;

procedure TfrmPrintOptionsAnalyz.ActionCloseExecute(Sender: TObject);
begin
    close;
end;

end.
