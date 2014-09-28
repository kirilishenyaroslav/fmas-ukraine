unit UoVidNRobit_Add_Norm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxMaskEdit, cxButtonEdit, cxLabel,
  FIBDatabase, pFIBDatabase, ActnList, AArray;

type
  TfmUoVidNRobit_Add_Norm = class(TForm)
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    cxButtonEdit1: TcxButtonEdit;
    cxButtonEdit2: TcxButtonEdit;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    cxTextEdit4: TcxTextEdit;
    cxTextEdit5: TcxTextEdit;
    cxTextEdit6: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    D: TpFIBDatabase;
    ActionList1: TActionList;
    Action1: TAction;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonCanselClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure cxButtonOKClick(Sender: TObject);
  private
    r_id_obuch, r_id_kat : int64;
  public
    { Public declarations }
  end;

function SNormNavchRobit (Dbase : tpfibdatabase; var id_obuch, id_kat : int64; var name_obuch, name_kat : string; var max_k, max_g, max_p, min_k, min_g, min_p : double) : boolean;

implementation
uses uPrK_Loader,
     uPrK_Resources;
{$R *.dfm}
function SNormNavchRobit (Dbase : tpfibdatabase; var id_obuch, id_kat : int64; var name_obuch, name_kat : string; var max_k, max_g, max_p, min_k, min_g, min_p : double) : boolean;
var
    T : TfmUoVidNRobit_Add_Norm;
begin
    T := TfmUoVidNRobit_Add_Norm.Create(nil);
    T.D := DBase;
    T.r_id_obuch            := id_obuch;
    T.r_id_kat              := id_kat;
    T.cxButtonEdit1.Text    := name_obuch;
    T.cxButtonEdit2.Text    := name_kat;
    T.cxTextEdit2.Text      := FloatToStr(max_k);
    T.cxTextEdit4.Text      := FloatToStr(max_g);
    T.cxTextEdit6.Text      := FloatToStr(max_p);
    T.cxTextEdit1.Text      := FloatToStr(min_k);
    T.cxTextEdit3.Text      := FloatToStr(min_g);
    T.cxTextEdit5.Text      := FloatToStr(min_p);
    if T.ShowModal = mrOk then
    begin
        id_obuch   := T.r_id_obuch;
        id_kat     := T.r_id_kat;
        name_obuch := T.cxButtonEdit1.Text;
        name_kat   := T.cxButtonEdit2.Text;
        max_k      := StrToFloat(T.cxTextEdit2.Text);
        max_g      := StrToFloat(T.cxTextEdit4.Text);
        max_p      := StrToFloat(T.cxTextEdit6.Text);
        min_k      := StrToFloat(T.cxTextEdit1.Text);
        min_g      := StrToFloat(T.cxTextEdit3.Text);
        min_p      := StrToFloat(T.cxTextEdit5.Text);
        result     := true;
    end else
    begin
        result := false;
    end;
    T.Free;
end;

procedure TfmUoVidNRobit_Add_Norm.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    aParams : TAArray;
    r : Variant;
begin
    aParams:=TAArray.Create;
    aParams['Input']['ShowAll'].AsVariant:=True;
    r := uPrK_Loader.ShowPrkSprav(self, D.Handle, PrK_SP_FORM_OBUCH_KATEGORY, fsNormal, aParams);
    if VarArrayDimCount(r) > 0 then
    begin
        if R[0] <> Null then
        begin
            r_id_obuch            := R[0];
            cxButtonEdit1.Text  := R[1];
        end;
    end;
end;

procedure TfmUoVidNRobit_Add_Norm.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    aParams : TAArray;
    r : Variant;
begin
    aParams:=TAArray.Create;
    aParams['Input']['ShowAll'].AsVariant:=True;
    r := uPrK_Loader.ShowPrkSprav(self, D.Handle, PrK_SP_TYPE_KAT_STUD, fsNormal, aParams);
    if VarArrayDimCount(r) > 0 then
    begin
        if R[0] <> Null then
        begin
            r_id_kat            := R[0];
            cxButtonEdit2.Text  := R[1];
        end;
    end;
end;

procedure TfmUoVidNRobit_Add_Norm.cxButtonCanselClick(Sender: TObject);
begin
    close;
end;

procedure TfmUoVidNRobit_Add_Norm.Action1Execute(Sender: TObject);
var
    max_k, max_g, max_p, min_k, min_g, min_p : double;
begin
    if (r_id_obuch <=-2) or (r_id_obuch = 0) then
    begin
        showmessage('Ви не вибрали категорія форми навчання');
        cxButtonEdit1.SetFocus;
        exit;
    end;
    if (r_id_kat <=-2) or (r_id_kat = 0) then
    begin
        showmessage('Ви не вибрали ссвітньо-кваліфікаційний рівень');
        cxButtonEdit2.SetFocus;
        exit;
    end;
    if cxTextEdit1.Text = '' then
    begin
        showmessage('Ви не ввели мін. значення на одного студента');
        cxTextEdit1.SetFocus;
        exit;
    end;
    if cxTextEdit2.Text = '' then
    begin
        showmessage('Ви не ввели макс. значення на одного студента');
        cxTextEdit2.SetFocus;
        exit;
    end;
    if cxTextEdit3.Text = '' then
    begin
        showmessage('Ви не ввели мін. значення на групу/пудгрупу');
        cxTextEdit3.SetFocus;
        exit;
    end;
    if cxTextEdit4.Text = '' then
    begin
        showmessage('Ви не ввели макс. хначення на групу/підгрупу');
        cxTextEdit4.SetFocus;
        exit;
    end;
    if cxTextEdit5.Text = '' then
    begin
        showmessage('Ви не ввели мін. % від загальної кількості годин');
        cxTextEdit5.SetFocus;
        exit;
    end;
    if cxTextEdit6.Text = '' then
    begin
        showmessage('Ви не ввели макс. % від загальної кількості годин');
        cxTextEdit6.SetFocus;
        exit;
    end;
    max_k := StrToFloat(cxTextEdit2.Text);
    max_g := StrToFloat(cxTextEdit4.Text);
    max_p := StrToFloat(cxTextEdit6.Text);
    min_k := StrToFloat(cxTextEdit1.Text);
    min_g := StrToFloat(cxTextEdit3.Text);
    min_p := StrToFloat(cxTextEdit5.Text);
    if (min_k >= 0) and (min_g >= 0) and (min_p >= 0) and (max_k >= min_k) and (max_g >= min_g) and (max_p >= min_p) and ((max_k + max_g + max_p) > 0)
        then ModalResult := mrOk
        else begin
            showmessage('Всі значення нормативів повинні бути більш 0. Кожен макс. повинен бути більш мін. відповідно по всім нормативам!');
        end;

//    VAL_MIN_KONT >= 0 AND VAL_MIN_GROUP >= 0 AND VAL_MIN_PERCENT >= 0 AND VAL_MAX_KONT >= VAL_MIN_KONT AND VAL_MAX_GROUP >= VAL_MIN_GROUP AND VAL_MAX_PERCENT >= VAL_MIN_PERCENT AND VAL_MAX_KONT + VAL_MAX_GROUP + VAL_MAX_PERCENT > 0


end;

procedure TfmUoVidNRobit_Add_Norm.cxButtonOKClick(Sender: TObject);
begin
    Action1Execute(Sender);
end;

end.
