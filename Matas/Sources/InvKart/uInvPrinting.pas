{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uInvPrinting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uMatasVars, uMatasUtils, cxLookAndFeelPainters, StdCtrls,
  cxSpinEdit, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxButtons,
  cxControls, cxContainer, cxEdit, cxCheckBox,
  ActnList, ImgList, DB, FIBDataSet, pFIBDataSet, FR_DSet,
  FR_DBSet, FR_Class, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  RxMemDS, uAmort_selection, ClassInvKart, frxCross, frxClass, frxDBSet, uResources,
  DateUtils;

type
  TfmPrinting = class(TForm)
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    CheckBoxDoc: TcxCheckBox;
    cxButtonChect: TcxButton;
    cxButtonClose: TcxButton;
    cxLabelChecked_Shablon: TcxLabel;
    cxCopies: TcxSpinEdit;
    LabelKol_copys: TLabel;
    ActionList1: TActionList;
    ImageListButton: TImageList;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    ActionClose: TAction;
    ActionPrint: TAction;
    DataSet_Sel_Template_Setings: TpFIBDataSet;
    frReportShab_Amort: TfrReport;
    frDBDataSetShab: TfrDBDataSet;
    DataSet_Sel_Template_SetingsTEMPLATE: TFIBStringField;
    DataSet_Sel_Template_SetingsNAME_SHABLON: TFIBStringField;
    DataSet_Sel_Template_SetingsDEF_TEMPLATE: TFIBIntegerField;
    DataSet_Sel_Template_SetingsID_SHAB: TFIBBCDField;
    VariantField1: TVariantField;
    VariantField2: TVariantField;
    CurrencyField1: TCurrencyField;
    VariantField3: TVariantField;
    VariantField4: TVariantField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    IntegerField3: TIntegerField;
    StringField3: TStringField;
    IntegerField4: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    RxMemoryData3: TRxMemoryData;
    VariantField5: TVariantField;
    VariantField6: TVariantField;
    CurrencyField2: TCurrencyField;
    VariantField7: TVariantField;
    VariantField8: TVariantField;
    IntegerField10: TIntegerField;
    StringField9: TStringField;
    IntegerField11: TIntegerField;
    StringField10: TStringField;
    IntegerField12: TIntegerField;
    StringField11: TStringField;
    IntegerField13: TIntegerField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    IntegerField14: TIntegerField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    RxMemoryDataVirtual: TRxMemoryData;
    RxMemoryDataVirtualid_items: TIntegerField;
    RxMemoryDataVirtualId_shablona: TIntegerField;
    RxMemoryDataVirtualName_shablon: TStringField;
    DataSourceSel_Shab: TDataSource;
    RxMemoryDataVirtualtemplate: TStringField;
    pFIBDataSet_All_Selection_For_shab: TpFIBDataSet;
    cxCheckBoxPrint_Iznoshenih: TcxCheckBox;
    cxComboBoxSpisok: TcxComboBox;
    pFIBDataSetSprOstPrOS: TpFIBDataSet;
    pFIBDataSetSprOstPrOSDATE_RECORD: TFIBDateField;
    pFIBDataSetSprOstPrOSNUM_SCH: TFIBStringField;
    pFIBDataSetSprOstPrOSNAME_SCH: TFIBStringField;
    pFIBDataSetSprOstPrOSPERVISNA_VART: TFIBBCDField;
    pFIBDataSetSprOstPrOSIZNOS: TFIBBCDField;
    pFIBDataSetSprOstPrOSOST_PRICE: TFIBBCDField;
    pFIBDataSetSprOstPrOSID_SCH: TFIBBCDField;
    pFIBDataSetPoShifram: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    frxCrossObject1: TfrxCrossObject;
    frxReportPrint: TfrxReport;
    cxComboBoxPrintSel: TcxComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure cxComboBoxSpisokPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    aydishnik_tipd : integer;
    amort_form : TfmAmSelect;
    idishnik_am_ved, id_schsis, id_manis : Int64;

    idishnik_object:           string;
    aMassReports:              Variant;
    path_to_shablon, id_shaba: string;
    int:                       integer;
    Kod_shab:                  string;
  public
    { Public declarations }
    _ON_PRINTER, _SEL_PRINTER, _EDIT_TEMPLATE: boolean;
    _NUM_COPIES: integer;
    constructor Create(am_forma : TfmAmSelect; id_amort_ved, id_schss, id_mans : Int64); reintroduce; overload;
  end;

var
  fmPrinting: TfmPrinting;

implementation

{$R *.dfm}

constructor TfmPrinting.Create(am_forma : TfmAmSelect; id_amort_ved, id_schss, id_mans : Int64);
begin
    inherited Create(nil);
    amort_form := am_forma;
    idishnik_am_ved := id_amort_ved;
    id_schsis := id_schss;
    id_manis  := id_mans;
end;

procedure TfmPrinting.FormCreate(Sender: TObject);
var
    indexis : integer;
begin
    Caption                             := MAT_INV_system_name + MAT_INV_print_caption;
    cxLabelChecked_Shablon.Caption      := MAT_INV_print_sel_Shablon;
    LabelKol_copys.Caption              := MAT_INV_print_kol;
    cxCheckOnPrinter.Properties.Caption := MAT_INV_print_on_printer;
    //cxCheckBoxPrint_Iznoshenih.Properties.Caption := 'Друк зношених карток';//'MAT_INV_printing_finish_card';
    cxSelectPrinter.Properties.Caption  := MAT_INV_print_sel_printer;
    cxButtonClose.Caption               := MAT_INV_Cansel;
    cxButtonChect.Caption               := MAT_INV_Print;

    idishnik_object                     := 'Inv277';
    indexis                             := 0;

    LoadReportsTocxComboBoxMy(idishnik_object,cxComboBoxSpisok,aMassReports);

    cxComboBoxSpisok.ItemIndex:=0;
    cxComboBoxPrintSel.ItemIndex:=1;

    cxCopies.Value                      := 1;
    cxCheckOnPrinter.Checked            := IntToBool(_SET_PRINT_ON_PRINTER);
    CheckBoxDoc.Visible                 := IntToBool(_ALLOW_EDIT_TEMPLATE);
    _ON_PRINTER                         := IntToBool(_SET_PRINT_ON_PRINTER);
    _SEL_PRINTER                        := false;
    _EDIT_TEMPLATE                      := IntToBool(_ALLOW_EDIT_TEMPLATE);
    _NUM_COPIES                         := 1;
end;

procedure TfmPrinting.cxButtonCloseClick(Sender: TObject);
begin
    close;
end;

procedure TfmPrinting.ActionPrintExecute(Sender: TObject);
var
    god_amort, mesyac_amort : string;
    tip_uchet, primochka, grp_flag : integer;
begin

    if ((Kod_shab = '1') or (Kod_shab = '2') or (Kod_shab = '0')) then
    begin
        frDBDataSetShab.Dataset := pFIBDataSet_All_Selection_For_shab;

        primochka := cxComboBoxPrintSel.ItemIndex;

        pFIBDataSet_All_Selection_For_shab.Close;
        pFIBDataSet_All_Selection_For_shab.SQLs.SelectSQL.Clear;
        pFIBDataSet_All_Selection_For_shab.SQLs.SelectSQL.Text := 'select * from MAT_INV_SEL_FOR_PRINT_AMOR_VED('+IntToStr(idishnik_am_ved)+','''+idishnik_object+''','+IntToStr(primochka)+')';
        if id_manis <> 0 then
        begin
            pFIBDataSet_All_Selection_For_shab.SelectSQL.Add(' where ' + 'ID_MOL= ' + IntToStr(id_manis));
            if id_schsis <> 0 then
            begin
                pFIBDataSet_All_Selection_For_shab.SelectSQL.Add(' and ' + 'ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_schsis)+')');
            end;
        end else
        begin
            if id_schsis <> 0 then
            begin
                pFIBDataSet_All_Selection_For_shab.SelectSQL.Add(' where ' + 'ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_schsis)+')');
            end;
        end;
        pFIBDataSet_All_Selection_For_shab.Open;

        tip_uchet    := pFIBDataSet_All_Selection_For_shab.FieldByName('TIP').AsInteger;
        If (tip_uchet = 2) then
        begin
             god_amort    := pFIBDataSet_All_Selection_For_shab.FieldByName('GOD').AsString;

             //mesyac_amort := god_amort[4] + god_amort[5];
             if MonthOf(pFIBDataSet_All_Selection_For_shab.FieldByName('DATE_AMORT').AsDateTime) = 4 then
             begin
               frVariables['period_nachisl']  := ' 1 квартал ' + IntToStr(StrToInt(god_amort)+1);
               frVariables['godok']           := ' 1 квартал ';
             end;
             if MonthOf(pFIBDataSet_All_Selection_For_shab.FieldByName('DATE_AMORT').AsDateTime) = 7 then
             begin
               frVariables['period_nachisl']  := ' 2 квартал ' + IntToStr(StrToInt(god_amort)+1);
               frVariables['godok']           := ' 2 квартал ';
             end;
             if MonthOf(pFIBDataSet_All_Selection_For_shab.FieldByName('DATE_AMORT').AsDateTime) = 10 then
             begin
               frVariables['period_nachisl']  := ' 3 квартал ' + IntToStr(StrToInt(god_amort)+1);
               frVariables['godok']           := ' 3 квартал ';
             end;
             if MonthOf(pFIBDataSet_All_Selection_For_shab.FieldByName('DATE_AMORT').AsDateTime) = 1 then
             begin
               frVariables['period_nachisl']  := ' 4 квартал ' + god_amort;
               frVariables['godok']           := ' 4 квартал ';
             end;
        end;
        If (tip_uchet = 1) or (tip_uchet = 0) then
        begin
             god_amort    := pFIBDataSet_All_Selection_For_shab.FieldByName('GOD').AsString;

             mesyac_amort := pFIBDataSet_All_Selection_For_shab.FieldByName('MESYAC').AsString;

             if mesyac_amort = '1' then mesyac_amort := MAT_INV_sichen;
             if mesyac_amort = '2' then mesyac_amort := MAT_INV_lyutiy;
             if mesyac_amort = '3' then mesyac_amort := MAT_INV_berezen;
             if mesyac_amort = '4' then mesyac_amort := MAT_INV_kviten;
             if mesyac_amort = '5' then mesyac_amort := MAT_INV_traven;
             if mesyac_amort = '6' then mesyac_amort := MAT_INV_lipen;
             if mesyac_amort = '7' then mesyac_amort := MAT_INV_cherven;
             if mesyac_amort = '8' then mesyac_amort := MAT_INV_serpen;
             if mesyac_amort = '9' then mesyac_amort := MAT_INV_veresen;
             if mesyac_amort = '10' then mesyac_amort := MAT_INV_jovten;
             if mesyac_amort = '11' then mesyac_amort := MAT_INV_listopad;
             if mesyac_amort = '12' then mesyac_amort := MAT_INV_gruden;

             frVariables['period_nachisl']  := mesyac_amort + ' ' +god_amort + ' р.'; {mesyac_amort + ' ' +}
             frVariables['godok']           := mesyac_amort + ' ' + god_amort + ' р.';
        end;


        frVariables['ustanova']        := _ORG_FULL_NAME;
        frVariables['OKPO']            := _ORG_KOD_OKPO;

    end;

    if (Kod_shab = '10') then
    begin
        frDBDataSetShab.Dataset := pFIBDataSet_All_Selection_For_shab;

        primochka := cxComboBoxPrintSel.ItemIndex;
        {if (cxCheckBoxPrint_Iznoshenih.Checked = true)then
        begin
            primochka := 0;
        end else
        begin
            primochka := 1;
        end; }

        pFIBDataSet_All_Selection_For_shab.Close;
        pFIBDataSet_All_Selection_For_shab.SQLs.SelectSQL.Clear;
        pFIBDataSet_All_Selection_For_shab.SQLs.SelectSQL.Text := 'select * from MAT_INV_SEL_PRINT_AMOR_SCH('+IntToStr(idishnik_am_ved)+','''+idishnik_object+''','+IntToStr(primochka)+')';
        if id_schsis <> 0 then
        begin
            pFIBDataSet_All_Selection_For_shab.SelectSQL.Add(' where ' + 'ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_schsis)+')');
        end;
        pFIBDataSet_All_Selection_For_shab.Open;
        tip_uchet    := pFIBDataSet_All_Selection_For_shab.FieldByName('TIP').AsInteger;
        If (tip_uchet = 2) then
        begin
             god_amort    := pFIBDataSet_All_Selection_For_shab.FieldByName('GOD').AsString;
             if MonthOf(pFIBDataSet_All_Selection_For_shab.FieldByName('DATE_AMORT').AsDateTime) = 4 then
             begin
               frVariables['period_nachisl']  := ' 1 квартал ' + IntToStr(StrToInt(god_amort)+1);
               frVariables['godok']           := ' 1 квартал ';
             end;
             if MonthOf(pFIBDataSet_All_Selection_For_shab.FieldByName('DATE_AMORT').AsDateTime) = 7 then
             begin
               frVariables['period_nachisl']  := ' 2 квартал ' + IntToStr(StrToInt(god_amort)+1);
               frVariables['godok']           := ' 2 квартал ';
             end;
             if MonthOf(pFIBDataSet_All_Selection_For_shab.FieldByName('DATE_AMORT').AsDateTime) = 10 then
             begin
               frVariables['period_nachisl']  := ' 3 квартал ' + IntToStr(StrToInt(god_amort)+1);
               frVariables['godok']           := ' 3 квартал ';
             end;
             if MonthOf(pFIBDataSet_All_Selection_For_shab.FieldByName('DATE_AMORT').AsDateTime) = 1 then
             begin
               frVariables['period_nachisl']  := ' 4 квартал ' + god_amort;
               frVariables['godok']           := ' 4 квартал ';
             end;
        end;
        If (tip_uchet = 1) or (tip_uchet = 0) then
        begin
             god_amort    := pFIBDataSet_All_Selection_For_shab.FieldByName('GOD').AsString;
             mesyac_amort := pFIBDataSet_All_Selection_For_shab.FieldByName('MESYAC').AsString;
             if mesyac_amort = '1' then mesyac_amort := MAT_INV_sichen;
             if mesyac_amort = '2' then mesyac_amort := MAT_INV_lyutiy;
             if mesyac_amort = '3' then mesyac_amort := MAT_INV_berezen;
             if mesyac_amort = '4' then mesyac_amort := MAT_INV_kviten;
             if mesyac_amort = '5' then mesyac_amort := MAT_INV_traven;
             if mesyac_amort = '6' then mesyac_amort := MAT_INV_lipen;
             if mesyac_amort = '7' then mesyac_amort := MAT_INV_cherven;
             if mesyac_amort = '8' then mesyac_amort := MAT_INV_serpen;
             if mesyac_amort = '9' then mesyac_amort := MAT_INV_veresen;
             if mesyac_amort = '10' then mesyac_amort := MAT_INV_jovten;
             if mesyac_amort = '11' then mesyac_amort := MAT_INV_listopad;
             if mesyac_amort = '12' then mesyac_amort := MAT_INV_gruden;
             frVariables['period_nachisl']  := mesyac_amort + ' ' +god_amort + ' р.';
             frVariables['godok']           := mesyac_amort + ' ' + god_amort + ' р.';
        end;

        frVariables['ustanova']        := _ORG_FULL_NAME;
        frVariables['OKPO']            := _ORG_KOD_OKPO;
    end;
    if (Kod_shab = '11') then
    begin
        frDBDataSetShab.Dataset := pFIBDataSet_All_Selection_For_shab;
        primochka := 3;

        pFIBDataSet_All_Selection_For_shab.Close;
        pFIBDataSet_All_Selection_For_shab.SQLs.SelectSQL.Clear;
        pFIBDataSet_All_Selection_For_shab.SQLs.SelectSQL.Text := 'select * from MAT_INV_SEL_FOR_PRINT_AMOR_VED('+IntToStr(idishnik_am_ved)+','''+idishnik_object+''','+IntToStr(primochka)+')';
        if id_schsis <> 0 then
        begin
            pFIBDataSet_All_Selection_For_shab.SelectSQL.Add(' where ' + 'ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_schsis)+')');
        end;

        pFIBDataSet_All_Selection_For_shab.Open;

        tip_uchet    := pFIBDataSet_All_Selection_For_shab.FieldByName('TIP').AsInteger;
        If (tip_uchet = 2) then
        begin
             god_amort    := pFIBDataSet_All_Selection_For_shab.FieldByName('GOD').AsString;

             //mesyac_amort := god_amort[4] + god_amort[5];
             if MonthOf(pFIBDataSet_All_Selection_For_shab.FieldByName('DATE_AMORT').AsDateTime) = 4 then
             begin
               frVariables['period_nachisl']  := ' 1 квартал ' + IntToStr(StrToInt(god_amort)+1)+ ' р.';
               frVariables['godok']           := ' 1 квартал ';
             end;
             if MonthOf(pFIBDataSet_All_Selection_For_shab.FieldByName('DATE_AMORT').AsDateTime) = 7 then
             begin
               frVariables['period_nachisl']  := ' 2 квартал ' + IntToStr(StrToInt(god_amort)+1)+ ' р.';
               frVariables['godok']           := ' 2 квартал ';
             end;
             if MonthOf(pFIBDataSet_All_Selection_For_shab.FieldByName('DATE_AMORT').AsDateTime) = 10 then
             begin
               frVariables['period_nachisl']  := ' 3 квартал ' + IntToStr(StrToInt(god_amort)+1)+ ' р.';
               frVariables['godok']           := ' 3 квартал ';
             end;
             if MonthOf(pFIBDataSet_All_Selection_For_shab.FieldByName('DATE_AMORT').AsDateTime) = 1 then
             begin
               frVariables['period_nachisl']  := ' 4 квартал ' + god_amort+ ' р.';
               frVariables['godok']           := ' 4 квартал ';
             end;

        end;
        If (tip_uchet = 1) or (tip_uchet = 0) then
        begin
             god_amort    := pFIBDataSet_All_Selection_For_shab.FieldByName('GOD').AsString;
             mesyac_amort := pFIBDataSet_All_Selection_For_shab.FieldByName('MESYAC').AsString;

             if mesyac_amort = '1' then mesyac_amort := MAT_INV_sichen;
             if mesyac_amort = '2' then mesyac_amort := MAT_INV_lyutiy;
             if mesyac_amort = '3' then mesyac_amort := MAT_INV_berezen;
             if mesyac_amort = '4' then mesyac_amort := MAT_INV_kviten;
             if mesyac_amort = '5' then mesyac_amort := MAT_INV_traven;
             if mesyac_amort = '6' then mesyac_amort := MAT_INV_lipen;
             if mesyac_amort = '7' then mesyac_amort := MAT_INV_cherven;
             if mesyac_amort = '8' then mesyac_amort := MAT_INV_serpen;
             if mesyac_amort = '9' then mesyac_amort := MAT_INV_veresen;
             if mesyac_amort = '10' then mesyac_amort := MAT_INV_jovten;
             if mesyac_amort = '11' then mesyac_amort := MAT_INV_listopad;
             if mesyac_amort = '12' then mesyac_amort := MAT_INV_gruden;

             frVariables['period_nachisl']  := mesyac_amort + ' ' +god_amort + ' р.'; {mesyac_amort + ' ' +}
             frVariables['godok']           := mesyac_amort + ' ' + god_amort + ' р.';
        end;

        frVariables['ustanova']        := _ORG_FULL_NAME;
        frVariables['OKPO']            := _ORG_KOD_OKPO;

    end;

    if (Kod_shab = '12') then
    begin
        frDBDataSetShab.Dataset := pFIBDataSet_All_Selection_For_shab;

        primochka := cxComboBoxPrintSel.ItemIndex;

        pFIBDataSet_All_Selection_For_shab.Close;
        pFIBDataSet_All_Selection_For_shab.SQLs.SelectSQL.Clear;
        pFIBDataSet_All_Selection_For_shab.SQLs.SelectSQL.Text := 'select * from MAT_INV_SEL_FOR_PRINT_AMOR_VED('+IntToStr(idishnik_am_ved)+','''+idishnik_object+''','+IntToStr(primochka)+')';
        if id_schsis <> 0 then
        begin
            pFIBDataSet_All_Selection_For_shab.SelectSQL.Add(' where ' + 'ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_schsis)+')');
        end;

        pFIBDataSet_All_Selection_For_shab.Open;

        tip_uchet    := pFIBDataSet_All_Selection_For_shab.FieldByName('TIP').AsInteger;
        If (tip_uchet = 2) then
        begin
             god_amort    := pFIBDataSet_All_Selection_For_shab.FieldByName('GOD').AsString;
             frVariables['period_nachisl']  := god_amort + ' р.'; {mesyac_amort + ' ' +}
             frVariables['godok']           := ' ' + god_amort + ' р.';
        end;
        If (tip_uchet = 1) or (tip_uchet = 0) then
        begin
             god_amort    := pFIBDataSet_All_Selection_For_shab.FieldByName('GOD').AsString;
             mesyac_amort := pFIBDataSet_All_Selection_For_shab.FieldByName('MESYAC').AsString;

             if mesyac_amort = '1' then mesyac_amort := MAT_INV_sichen;
             if mesyac_amort = '2' then mesyac_amort := MAT_INV_lyutiy;
             if mesyac_amort = '3' then mesyac_amort := MAT_INV_berezen;
             if mesyac_amort = '4' then mesyac_amort := MAT_INV_kviten;
             if mesyac_amort = '5' then mesyac_amort := MAT_INV_traven;
             if mesyac_amort = '6' then mesyac_amort := MAT_INV_lipen;
             if mesyac_amort = '7' then mesyac_amort := MAT_INV_cherven;
             if mesyac_amort = '8' then mesyac_amort := MAT_INV_serpen;
             if mesyac_amort = '9' then mesyac_amort := MAT_INV_veresen;
             if mesyac_amort = '10' then mesyac_amort := MAT_INV_jovten;
             if mesyac_amort = '11' then mesyac_amort := MAT_INV_listopad;
             if mesyac_amort = '12' then mesyac_amort := MAT_INV_gruden;

             frVariables['period_nachisl']  := mesyac_amort + ' ' +god_amort + ' р.'; {mesyac_amort + ' ' +}
             frVariables['godok']           := mesyac_amort + ' ' + god_amort + ' р.';
        end;

        frVariables['ustanova']        := _ORG_FULL_NAME;
        frVariables['OKPO']            := _ORG_KOD_OKPO;
    end;

    if Kod_shab = '3' then
    begin
        frDBDataSetShab.Dataset := pFIBDataSetPoShifram;

        pFIBDataSetPoShifram.Close;
        pFIBDataSetPoShifram.SQLs.SelectSQL.Text :='select * from MAT_INV_PRINT_VED_PO_SHIFRAM('+IntToStr(idishnik_am_ved)+')';
        if id_manis <> 0 then
        begin
            pFIBDataSetPoShifram.SelectSQL.Add(' where ' + 'ID_MO= ' + IntToStr(id_manis));
            if id_schsis <> 0 then
            begin
  //              pFIBDataSetPoShifram.SelectSQL.Add(' and ' + 'ID_SCH_MAIN IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_schsis)+')');
            end;
        end else
        begin
            if id_schsis <> 0 then
            begin
//                pFIBDataSetPoShifram.SelectSQL.Add(' where ' + 'ID_SCH_MAIN IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_schsis)+')');
            end;
        end;
        pFIBDataSetPoShifram.Open;

        mesyac_amort := pFIBDataSetPoShifram.FieldByName('MESYAC').AsString;
        god_amort    := pFIBDataSetPoShifram.FieldByName('GOD').AsString;

         if mesyac_amort = '1' then mesyac_amort := MAT_INV_sichen;
         if mesyac_amort = '2' then mesyac_amort := MAT_INV_lyutiy;
         if mesyac_amort = '3' then mesyac_amort := MAT_INV_berezen;
         if mesyac_amort = '4' then mesyac_amort := MAT_INV_kviten;
         if mesyac_amort = '5' then mesyac_amort := MAT_INV_traven;
         if mesyac_amort = '6' then mesyac_amort := MAT_INV_lipen;
         if mesyac_amort = '7' then mesyac_amort := MAT_INV_cherven;
         if mesyac_amort = '8' then mesyac_amort := MAT_INV_serpen;
         if mesyac_amort = '9' then mesyac_amort := MAT_INV_veresen;
         if mesyac_amort = '10' then mesyac_amort := MAT_INV_jovten;
         if mesyac_amort = '11' then mesyac_amort := MAT_INV_listopad;
         if mesyac_amort = '12' then mesyac_amort := MAT_INV_gruden;

        frVariables['godok']           := 'за ' + mesyac_amort + ' ' + god_amort + ' року';
        frVariables['OKUD']            := _ORG_KOD_OKPO;
        frVariables['ustanova']        := _ORG_FULL_NAME;
    end;

    if Kod_shab = '4' then
    begin
        frDBDataSetShab.Dataset := pFIBDataSetPoShifram;

        pFIBDataSetPoShifram.Close;
        pFIBDataSetPoShifram.SQLs.SelectSQL.Text :='select * from MAT_INV_PRINT_VED_PO_SHIFRAM2('+IntToStr(idishnik_am_ved)+')';
        if id_manis <> 0 then
        begin
            pFIBDataSetPoShifram.SelectSQL.Add(' where ' + 'ID_MO= ' + IntToStr(id_manis));
            if id_schsis <> 0 then
            begin
//                pFIBDataSetPoShifram.SelectSQL.Add(' and ' + 'ID_SCH_MAIN IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_schsis)+')');
            end;
        end else
        begin
            if id_schsis <> 0 then
            begin
//                pFIBDataSetPoShifram.SelectSQL.Add(' where ' + 'ID_SCH_MAIN IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_schsis)+')');
            end;
        end;
        pFIBDataSetPoShifram.Open;

        mesyac_amort := pFIBDataSetPoShifram.FieldByName('MESYAC').AsString;
        god_amort    := pFIBDataSetPoShifram.FieldByName('GOD').AsString;

         if mesyac_amort = '1' then mesyac_amort := MAT_INV_sichen;
         if mesyac_amort = '2' then mesyac_amort := MAT_INV_lyutiy;
         if mesyac_amort = '3' then mesyac_amort := MAT_INV_berezen;
         if mesyac_amort = '4' then mesyac_amort := MAT_INV_kviten;
         if mesyac_amort = '5' then mesyac_amort := MAT_INV_traven;
         if mesyac_amort = '6' then mesyac_amort := MAT_INV_lipen;
         if mesyac_amort = '7' then mesyac_amort := MAT_INV_cherven;
         if mesyac_amort = '8' then mesyac_amort := MAT_INV_serpen;
         if mesyac_amort = '9' then mesyac_amort := MAT_INV_veresen;
         if mesyac_amort = '10' then mesyac_amort := MAT_INV_jovten;
         if mesyac_amort = '11' then mesyac_amort := MAT_INV_listopad;
         if mesyac_amort = '12' then mesyac_amort := MAT_INV_gruden;

        frVariables['godok']           := 'за ' + mesyac_amort + ' ' + god_amort + ' року';
        frVariables['OKUD']            := _ORG_KOD_OKPO;
        frVariables['ustanova']        := _ORG_FULL_NAME;
    end;

    if Kod_shab = '5' then
    begin
        frDBDataSetShab.Dataset := pFIBDataSetPoShifram;

        pFIBDataSetPoShifram.Close;
        pFIBDataSetPoShifram.SQLs.SelectSQL.Text :='select * from MAT_INV_PRINT_VED_PO_SHIFRAM3('+IntToStr(idishnik_am_ved)+')';
        if id_schsis <> 0 then
        begin
//            pFIBDataSetPoShifram.SelectSQL.Add(' where ' + 'ID_SCH_MAIN IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_schsis)+')');
        end;
        pFIBDataSetPoShifram.Open;

        mesyac_amort := pFIBDataSetPoShifram.FieldByName('MESYAC').AsString;
        god_amort    := pFIBDataSetPoShifram.FieldByName('GOD').AsString;

         if mesyac_amort = '1' then mesyac_amort := MAT_INV_sichen;
         if mesyac_amort = '2' then mesyac_amort := MAT_INV_lyutiy;
         if mesyac_amort = '3' then mesyac_amort := MAT_INV_berezen;
         if mesyac_amort = '4' then mesyac_amort := MAT_INV_kviten;
         if mesyac_amort = '5' then mesyac_amort := MAT_INV_traven;
         if mesyac_amort = '6' then mesyac_amort := MAT_INV_lipen;
         if mesyac_amort = '7' then mesyac_amort := MAT_INV_cherven;
         if mesyac_amort = '8' then mesyac_amort := MAT_INV_serpen;
         if mesyac_amort = '9' then mesyac_amort := MAT_INV_veresen;
         if mesyac_amort = '10' then mesyac_amort := MAT_INV_jovten;
         if mesyac_amort = '11' then mesyac_amort := MAT_INV_listopad;
         if mesyac_amort = '12' then mesyac_amort := MAT_INV_gruden;

        frVariables['godok']           := 'за ' + mesyac_amort + ' ' + god_amort + ' року';
        frVariables['OKUD']            := _ORG_KOD_OKPO;
        frVariables['ustanova']        := _ORG_FULL_NAME;
    end;

    if Kod_shab = '6' then
    begin
        frDBDataSetShab.Dataset := pFIBDataSetPoShifram;

        pFIBDataSetPoShifram.Close;
        pFIBDataSetPoShifram.SQLs.SelectSQL.Text :='select * from MAT_INV_PRINT_VED_MOVE_OS('+IntToStr(idishnik_am_ved)+')';
        if id_manis <> 0 then
        begin
            pFIBDataSetPoShifram.SelectSQL.Add(' where ' + 'ID_MO= ' + IntToStr(id_manis));
        end;
        pFIBDataSetPoShifram.Open;

        mesyac_amort := pFIBDataSetPoShifram.FieldByName('MESYAC').AsString;
        god_amort    := pFIBDataSetPoShifram.FieldByName('GOD').AsString;

         if mesyac_amort = '1' then mesyac_amort := MAT_INV_sichen;
         if mesyac_amort = '2' then mesyac_amort := MAT_INV_lyutiy;
         if mesyac_amort = '3' then mesyac_amort := MAT_INV_berezen;
         if mesyac_amort = '4' then mesyac_amort := MAT_INV_kviten;
         if mesyac_amort = '5' then mesyac_amort := MAT_INV_traven;
         if mesyac_amort = '6' then mesyac_amort := MAT_INV_lipen;
         if mesyac_amort = '7' then mesyac_amort := MAT_INV_cherven;
         if mesyac_amort = '8' then mesyac_amort := MAT_INV_serpen;
         if mesyac_amort = '9' then mesyac_amort := MAT_INV_veresen;
         if mesyac_amort = '10' then mesyac_amort := MAT_INV_jovten;
         if mesyac_amort = '11' then mesyac_amort := MAT_INV_listopad;
         if mesyac_amort = '12' then mesyac_amort := MAT_INV_gruden;

        frVariables['godok']           := 'за ' + mesyac_amort + ' ' + god_amort + ' року';
        frVariables['OKUD']            := _ORG_KOD_OKPO;
        frVariables['ustanova']        := _ORG_FULL_NAME;
    end;

    if Kod_shab = '7' then
    begin
        frDBDataSetShab.Dataset := pFIBDataSetPoShifram;

        grp_flag := 0;
        pFIBDataSetPoShifram.Close;
        pFIBDataSetPoShifram.SQLs.SelectSQL.Text :='select * from MAT_INV_PRINT_SVOD_PO_GRP('+IntToStr(idishnik_am_ved)+','+IntToStr(grp_flag)+')';
        pFIBDataSetPoShifram.Open;

        mesyac_amort := pFIBDataSetPoShifram.FieldByName('MESYAC').AsString;
        god_amort    := pFIBDataSetPoShifram.FieldByName('GOD').AsString;

         if mesyac_amort = '1' then mesyac_amort := MAT_INV_sichen;
         if mesyac_amort = '2' then mesyac_amort := MAT_INV_lyutiy;
         if mesyac_amort = '3' then mesyac_amort := MAT_INV_berezen;
         if mesyac_amort = '4' then mesyac_amort := MAT_INV_kviten;
         if mesyac_amort = '5' then mesyac_amort := MAT_INV_traven;
         if mesyac_amort = '6' then mesyac_amort := MAT_INV_lipen;
         if mesyac_amort = '7' then mesyac_amort := MAT_INV_cherven;
         if mesyac_amort = '8' then mesyac_amort := MAT_INV_serpen;
         if mesyac_amort = '9' then mesyac_amort := MAT_INV_veresen;
         if mesyac_amort = '10' then mesyac_amort := MAT_INV_jovten;
         if mesyac_amort = '11' then mesyac_amort := MAT_INV_listopad;
         if mesyac_amort = '12' then mesyac_amort := MAT_INV_gruden;

        frVariables['godok']           := 'за ' + mesyac_amort + ' ' + god_amort + ' року';
        frVariables['OKUD']            := _ORG_KOD_OKPO;
        frVariables['ustanova']        := _ORG_FULL_NAME;
    end;

    if Kod_shab = '8' then
    begin
        frDBDataSetShab.Dataset := pFIBDataSetPoShifram;

        grp_flag := 1;
        pFIBDataSetPoShifram.Close;
        pFIBDataSetPoShifram.SQLs.SelectSQL.Text :='select * from MAT_INV_PRINT_SVOD_PO_GRP('+IntToStr(idishnik_am_ved)+','+IntToStr(grp_flag)+')';
        pFIBDataSetPoShifram.Open;

        mesyac_amort := pFIBDataSetPoShifram.FieldByName('MESYAC').AsString;
        god_amort    := pFIBDataSetPoShifram.FieldByName('GOD').AsString;

         if mesyac_amort = '1' then mesyac_amort := MAT_INV_sichen;
         if mesyac_amort = '2' then mesyac_amort := MAT_INV_lyutiy;
         if mesyac_amort = '3' then mesyac_amort := MAT_INV_berezen;
         if mesyac_amort = '4' then mesyac_amort := MAT_INV_kviten;
         if mesyac_amort = '5' then mesyac_amort := MAT_INV_traven;
         if mesyac_amort = '6' then mesyac_amort := MAT_INV_lipen;
         if mesyac_amort = '7' then mesyac_amort := MAT_INV_cherven;
         if mesyac_amort = '8' then mesyac_amort := MAT_INV_serpen;
         if mesyac_amort = '9' then mesyac_amort := MAT_INV_veresen;
         if mesyac_amort = '10' then mesyac_amort := MAT_INV_jovten;
         if mesyac_amort = '11' then mesyac_amort := MAT_INV_listopad;
         if mesyac_amort = '12' then mesyac_amort := MAT_INV_gruden;

        frVariables['godok']           := 'за ' + mesyac_amort + ' ' + god_amort + ' року';
        frVariables['OKUD']            := _ORG_KOD_OKPO;
        frVariables['ustanova']        := _ORG_FULL_NAME;
    end;

    if Kod_shab = '9' then
    begin
        frDBDataSetShab.Dataset := pFIBDataSetPoShifram;

        grp_flag := 0;
        pFIBDataSetPoShifram.Close;
        pFIBDataSetPoShifram.SQLs.SelectSQL.Text :='select * from MAT_INV_PRINT_SVOD_PO_GRP_CROSS('+IntToStr(idishnik_am_ved)+','+IntToStr(grp_flag)+')';
        pFIBDataSetPoShifram.Open;

        mesyac_amort := pFIBDataSetPoShifram.FieldByName('MESYAC').AsString;
        god_amort    := pFIBDataSetPoShifram.FieldByName('GOD').AsString;

         if mesyac_amort = '1' then mesyac_amort := MAT_INV_sichen;
         if mesyac_amort = '2' then mesyac_amort := MAT_INV_lyutiy;
         if mesyac_amort = '3' then mesyac_amort := MAT_INV_berezen;
         if mesyac_amort = '4' then mesyac_amort := MAT_INV_kviten;
         if mesyac_amort = '5' then mesyac_amort := MAT_INV_traven;
         if mesyac_amort = '6' then mesyac_amort := MAT_INV_lipen;
         if mesyac_amort = '7' then mesyac_amort := MAT_INV_cherven;
         if mesyac_amort = '8' then mesyac_amort := MAT_INV_serpen;
         if mesyac_amort = '9' then mesyac_amort := MAT_INV_veresen;
         if mesyac_amort = '10' then mesyac_amort := MAT_INV_jovten;
         if mesyac_amort = '11' then mesyac_amort := MAT_INV_listopad;
         if mesyac_amort = '12' then mesyac_amort := MAT_INV_gruden;
    end;

    if Kod_shab <> '9' then
    begin
        frReportShab_Amort.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);

        _ON_PRINTER    := cxCheckOnPrinter.Checked;
        _SEL_PRINTER   := cxSelectPrinter.Checked;
        _EDIT_TEMPLATE := CheckBoxDoc.Checked;
        _NUM_COPIES    := cxCopies.EditValue;

        frReportShab_Amort.PrepareReport;
        if cxCopies.Value>1 then
           frReportShab_Amort.DefaultCopies:=cxCopies.Value;
        if cxCheckOnPrinter.Checked then
        begin
            if cxSelectPrinter.Checked then
            begin
               frReportShab_Amort.PrintPreparedReportDlg
            end else
            begin
               frReportShab_Amort.PrintPreparedReport('', cxCopies.Value, false, frAll);
            end;
        end else
        begin
           frReportShab_Amort.ShowReport;
        end;
        if CheckBoxDoc.Checked then
        begin
           frReportShab_Amort.DesignReport;
        end;
        close;
    end else
    begin
        frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + path_to_shablon);

        frxReportPrint.Variables['godok']    := ''''+'за ' + mesyac_amort + ' ' + god_amort + ' року'+'''';
        frxReportPrint.Variables['ustanova'] := ''''+_ORG_FULL_NAME+'''';
        frxReportPrint.Variables['OKUD']     := ''''+_ORG_KOD_OKPO+'''';

        _ON_PRINTER    := cxCheckOnPrinter.Checked;
        _SEL_PRINTER   := cxSelectPrinter.Checked;
        _EDIT_TEMPLATE := CheckBoxDoc.Checked;
        _NUM_COPIES    := cxCopies.EditValue;

        frxReportPrint.PrepareReport;

        //Пока что --if cxCopies.Value>1 then frxReportPrint.DefaultCopies:=cxCopies.Value;

        if cxCheckOnPrinter.Checked then
        begin
            {if cxSelectPrinter.Checked then
            begin
               frxReportPrint.PrintPreparedReportDlg
            end else
            begin
               frxReportPrint.PrintPreparedReport('', cxCopies.Value, false, frAll);
            end;}
        end else
        begin
           frxReportPrint.ShowReport;
        end;
        if CheckBoxDoc.Checked then
        begin
           frxReportPrint.DesignReport;
        end;
        close;
    end;
end;

procedure TfmPrinting.ActionCloseExecute(Sender: TObject);
begin
    close;
end;

procedure TfmPrinting.cxComboBoxSpisokPropertiesChange(Sender: TObject);
begin
    int := cxComboBoxSpisok.ItemIndex;
    id_shaba        := aMassReports[int][0];
    Kod_shab        := aMassReports[int][1];
    path_to_shablon := aMassReports[int][3];
end;


end.
