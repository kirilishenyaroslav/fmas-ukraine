{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uAddNorma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxMemo, cxButtonEdit, cxMaskEdit,
  cxDropDownEdit, cxCurrencyEdit, StdCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxButtons, ActnList, DB, FIBDataSet, pFIBDataSet,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ClassInvKart, uNormIznos,
  uResources;

type
  TfmAddNorma = class(TForm)
    cxButtonCls: TcxButton;
    cxButtonAddNorm: TcxButton;
    cxTextEditNameNorma: TcxTextEdit;
    LabelNorma: TLabel;
    LabelPerc: TLabel;
    LabelPer: TLabel;
    cxCurrencyEditPercent: TcxCurrencyEdit;
    cxComboBoxPeriod: TcxComboBox;
    cxTextEditYear: TcxTextEdit;
    cxTextEditMonth: TcxTextEdit;
    cxMemoFormula: TcxMemo;
    LabelTip: TLabel;
    LabelYear: TLabel;
    LabelMeth: TLabel;
    LabelFormula: TLabel;
    LabelMonth: TLabel;
    pFIBDataSetSelForComb: TpFIBDataSet;
    DataSourceSel: TDataSource;
    cxLookupComboBoxNorma: TcxLookupComboBox;
    pFIBDataSetSelForCombID_METOD: TFIBBCDField;
    pFIBDataSetSelForCombNAME: TFIBStringField;
    cxTextEditTip: TcxTextEdit;
    ActionList1: TActionList;
    Action1: TAction;
    procedure cxButtonClsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    FlagNaAdd : boolean;
    myform : TfmNormIznos;
    i_1, i_2, i_3, i_4, i_5, uch : integer;
    id : int64;
    text_1, text_2, method : string;
    pr : double;
  public
  end;

function ShowNorm(mformu: TfmNormIznos; Flagu : boolean; var t1, t2, meth : string; var  int_2, int_3, int_4, int_5 : integer; var proc : double; var id_new : int64; var ucht : integer) : boolean;

implementation

uses MainInvKartForm;
{$R *.dfm}

function ShowNorm(mformu: TfmNormIznos; Flagu : boolean; var t1, t2, meth : string; var  int_2, int_3, int_4, int_5 : integer; var proc : double; var id_new : int64; var ucht : integer) : boolean;
var
    T : TfmAddNorma;
begin
    T := TfmAddNorma.Create(nil);
    T.myform := mformu;
    T.FlagNaAdd := flagu;
    T.pFIBDataSetSelForComb.Active := true;
    T.id := id_new;
    T.uch := ucht;
    T.text_1 := t1;
    T.Text_2 := t2;
    T.method := meth;
    T.i_2    := int_2;
    T.i_3    := int_3;
    T.i_4    := int_4;
    T.i_5    := int_5;
    T.pr     := proc;
    T.id     := id_new;

    T.cxTextEditNameNorma.Text   := t1;
    T.cxCurrencyEditPercent.Text := FloatToStr(proc);
    T.cxComboBoxPeriod.ItemIndex := int_2;
    T.cxLookupComboBoxNorma.Text := meth;
    T.cxMemoFormula.Text         := t2;
    T.cxTextEditYear.Text        := IntToStr(int_4);
    T.cxTextEditMonth.Text       := IntToStr(int_5);
    T.LabelNorma.Caption         := MAT_INV_norm_nor;
    T.LabelPerc.Caption          := MAT_INV_Percent;
    T.LabelPer.Caption           := MAT_INV_izn_period;
    T.LabelMeth.Caption          := MAT_INV_izn_method;
    T.LabelFormula.Caption       := MAT_INV_izn_formula;
    T.LabelTip.Caption           := MAT_INV_norm_tip;
    T.LabelYear.Caption          := MAT_INV_izn_God;
    T.LabelMonth.Caption         := MAT_INV_izn_Month;
    T.cxButtonCls.Caption        := MAT_INV_Cansel;

    if T.FlagNaAdd = true then
    begin
          if T.uch = 0 then
          begin
              T.cxTextEditTip.text := MAT_INV_norm_buh_uch ;
          end else
          begin
              T.cxTextEditTip.Text := MAT_INV_norm_nal_uch ;
          end;
        T.cxTextEditNameNorma.Clear;
        T.cxCurrencyEditPercent.Clear;
        T.cxComboBoxPeriod.ItemIndex := 0;
        T.cxLookupComboBoxNorma.Clear;
        T.cxMemoFormula.Clear;
        T.cxTextEditYear.Clear;
        T.cxTextEditMonth.Clear;
        T.Caption                   := MAT_INV_system_name + MAT_INV_norm_NaAdd;
        T.cxButtonAddNorm.Caption   := MAT_INV_Add;
    end else
    begin
        T.Caption                   := MAT_INV_system_name + MAT_INV_norm_NaIzm;
        T.cxButtonAddNorm.Caption   := MAT_INV_Change;
        if T.uch = 0 then
          begin
              T.cxTextEditTip.text := MAT_INV_norm_buh_uch ;
          end else
          begin
              T.cxTextEditTip.Text := MAT_INV_norm_nal_uch ;
          end;
    end;
    if T.ShowModal=mrOk then
    begin
        t1     := T.text_1;
        t2     := T.Text_2;
        meth   := T.method;
        int_2  := T.i_2;
        int_3  := T.i_3;
        int_4  := T.i_4;
        int_5  := T.i_5;
        proc   := T.pr;
        id_new := T.id;
        result := true;
    end else
    begin
        result := false;
    end;

end;


procedure TfmAddNorma.cxButtonClsClick(Sender: TObject);
begin
  close;
end;

procedure TfmAddNorma.FormCreate(Sender: TObject);
begin
     cxComboBoxPeriod.ItemIndex:= 0;
end;

procedure TfmAddNorma.Action1Execute(Sender: TObject);
var
    j, Result : int64;
    convertSel : String;
    T : TfmMainIvKartForm;
    N : TfmNormIznos;
begin
    convertSel := cxLookupComboBoxNorma.Text;
    convertSel := VArToStr(cxLookupComboBoxNorma.Properties.DataController.GetRecordId(cxLookupComboBoxNorma.Properties.DataController.GetSelectedRowIndex(0)));

    if FlagNaAdd = true then
    begin
          if (cxTextEditNameNorma.Text = '') or (cxCurrencyEditPercent.Text = '') or (cxTextEditMonth.text = '') or (cxTextEditYear.Text = '') or (cxLookupComboBoxNorma.Text = '')  then
           begin
            ShowMessage(MAT_INV_metall_not_all_Row);
            exit;
           end
           else
            begin
            DecimalSeparator := '.';
            //showmessage(IntToStr(cxComboBoxPeriod.ItemIndex));
            j := AddNorma(cxTextEditNameNorma.Text, StringReplace(cxCurrencyEditPercent.Text,',','.',[]), cxComboBoxPeriod.ItemIndex, StrToInt(convertSel), uch, cxMemoFormula.Text, StrToInt(cxTextEditYear.text), StrToInt(cxTextEditMonth.Text));

            If j > 0 then
            begin
                DecimalSeparator := ',';
                id := j;
                close;
            end;
        end;
    end;
if FlagNaAdd = false then
    begin
        if (cxTextEditNameNorma.Text = '') or (cxCurrencyEditPercent.Text = '') or (cxTextEditMonth.text = '') or (cxTextEditYear.Text = '') or (cxLookupComboBoxNorma.Text = '')  then
           begin
            ShowMessage(MAT_INV_metall_not_all_Row);
            exit;
           end
           else
        begin
            begin
            DecimalSeparator := '.';
            j := id;
            ChangeNorma(j, cxTextEditNameNorma.Text, StringReplace(cxCurrencyEditPercent.Text,',','.',[]), cxComboBoxPeriod.ItemIndex, StrToInt(convertSel), uch, cxMemoFormula.Text, StrToInt(cxTextEditYear.text), StrToInt(cxTextEditMonth.Text));
        end;
        end;
    end;

    text_1 := '';
    Text_2 := '';
    i_1    := 0;
    i_2    := 0;
    i_3    := 0;
    i_4    := 0;
    i_5    := 0;
    pr     := 0;

    ModalResult := mrOk;
end;

end.
