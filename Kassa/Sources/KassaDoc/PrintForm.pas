unit PrintForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxRadioGroup,
  ExtCtrls, Un_R_file_Alex, FR_Class, cxControls, KassaDayForm, FR_DSet,
  FR_DBSet, DB, FIBDataSet, pFIBDataSet, cxContainer, cxEdit, cxCheckBox,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxSpinEdit, cxLabel, frxClass,
  frxDBSet, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase;

type
  TPrint = (prihod, rashod);

  TfmPrintForm = class(TForm)
    cxButtonPrint: TcxButton;
    cxButtonClose: TcxButton;
    Report: TfrReport;
    DataSetList: TpFIBDataSet;
    frDBDataSet1: TfrDBDataSet;
    cxCheckBoxEdit: TcxCheckBox;
    cxCheckBoxShow: TcxCheckBox;
    Bevel1: TBevel;
    cxCheckBoxPrihod_List: TcxCheckBox;
    cxCheckBoxRashod_List: TcxCheckBox;
    cxCheckBoxBuh_Otchet: TcxCheckBox;
    cxCheckBoxOtchet_Sch: TcxCheckBox;
    DataSetBuh: TpFIBDataSet;
    frDBDataSet2: TfrDBDataSet;
    Report1: TfrReport;
    cxSpinEditRihodList: TcxSpinEdit;
    cxSpinEditRashodList: TcxSpinEdit;
    cxSpinEditBuhOtchet: TcxSpinEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxSpinEdit1: TcxSpinEdit;
    cxSpinEdit2: TcxSpinEdit;
    cxSpinEdit3: TcxSpinEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    cxLabel10: TcxLabel;
    cxSpinEdit4: TcxSpinEdit;
    cxLabel11: TcxLabel;
    cxSpinEdit5: TcxSpinEdit;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxSpinEdit6: TcxSpinEdit;
    cxLabel14: TcxLabel;
    cxSpinEdit7: TcxSpinEdit;
    cxLabel15: TcxLabel;
    DataSetBuhNUMBER: TFIBStringField;
    DataSetBuhFIO: TFIBStringField;
    DataSetBuhPRIHOD: TFIBBCDField;
    DataSetBuhRASHOD: TFIBBCDField;
    DataSetBuhOSNOVANIE: TFIBStringField;
    DataSetBuhTITLE_SCH: TFIBStringField;
    DataSetBuhSUM_PRIHOD: TFIBBCDField;
    DataSetBuhSUM_RASHOD: TFIBBCDField;
    DataSetListPRIHOD: TFIBStringField;
    DataSetListR_DAY: TFIBDateField;
    DataSetListNUMBER: TFIBStringField;
    DataSetListFIO: TFIBStringField;
    DataSetListOSNOVANIE: TFIBStringField;
    DataSetListSUMMA: TFIBBCDField;
    cxCheckBox3: TcxCheckBox;
    cxLabel16: TcxLabel;
    cxSpinEdit8: TcxSpinEdit;
    cxLabel17: TcxLabel;
    cxSpinEdit9: TcxSpinEdit;
    cxLabel18: TcxLabel;
    DataSetOtchetRasschifrovka: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    DataSetOtchetRasschifrovkaNUMBER_DOC: TFIBStringField;
    DataSetOtchetRasschifrovkaFIO: TFIBStringField;
    DataSetOtchetRasschifrovkaPRIHOD: TFIBBCDField;
    DataSetOtchetRasschifrovkaRASHOD: TFIBBCDField;
    DataSetOtchetRasschifrovkaOSNOVANIE: TFIBStringField;
    DataSetOtchetRasschifrovkaSUM_PRIH: TFIBBCDField;
    DataSetOtchetRasschifrovkaSUM_RASH: TFIBBCDField;
    DataSetOtchetRasschifrovkaSCH_KOD: TFIBStringField;
    DataSetOtchetRasschifrovkaSMETA_KOD: TFIBIntegerField;
    DataSetOtchetRasschifrovkaRAZD_KOD: TFIBIntegerField;
    DataSetOtchetRasschifrovkaSTATE_KOD: TFIBIntegerField;
    DataSetOtchetRasschifrovkaKEKV_KOD: TFIBIntegerField;
    DataSetOtchetRasschifrovkaNAME_PREDPR: TFIBStringField;
    frxReport1: TfrxReport;
    cxCheckBoxDel: TcxCheckBox;
    cxLabel19: TcxLabel;
    cxSpinEdit10: TcxSpinEdit;
    DataSetDel: TpFIBDataSet;
    DBDatasetDel: TfrxDBDataset;
    DataSetDelID_DT_DOC: TFIBBCDField;
    DataSetDelKASSA_DAY: TFIBDateField;
    DataSetDelNOTE: TFIBStringField;
    DataSetDelNUMBER: TFIBBCDField;
    DataSetDelSUMMA_PRIH: TFIBBCDField;
    DataSetDelSUMMA_RASH: TFIBBCDField;
    DataSetDelPRIHOD: TFIBIntegerField;
    DataSetDelUSE_END: TFIBDateTimeField;
    DataSetDelID_USER: TFIBBCDField;
    DataSetDelFIO_DEL: TFIBStringField;
    DataSetDelFIO: TFIBStringField;
    ReportDel: TfrxReport;
    DataSetPage: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    TransactionWr: TpFIBTransaction;
    DataSetBuhID: TFIBBCDField;
    DBDataseOtchet: TfrxDBDataset;
    DataSetBuhNAME_PREDPR: TFIBStringField;
    ReportOtchet: TfrxReport;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonPrintClick(Sender: TObject);
    procedure cxCheckBoxShowClick(Sender: TObject);
    procedure cxCheckBoxPrihod_ListClick(Sender: TObject);
    procedure cxCheckBoxRashod_ListClick(Sender: TObject);
    procedure cxCheckBoxBuh_OtchetClick(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxCheckBox2Click(Sender: TObject);
  private
    myform : TfmKassaDayForm;
    count_page : integer;
    ll : integer;
  public
    constructor Create(mform : TfmKassaDayForm{; m : TPrint}); reintroduce; overload;
  end;

implementation

uses cxGridDBTableView, cxDBData, cxGridTableView, cxGridCustomTableView,
  cxGridCustomView, cxCustomData, GlobalSPR, Un_Progress_form;

{$R *.dfm}

constructor TfmPrintForm.Create(mform: TfmKassaDayForm{; m : TPrint});
begin
    inherited Create(nil);
    myform := mform;

    cxButtonPrint.Caption  := Un_R_file_Alex.MY_BUTTON_PRINT;
    cxButtonClose.Caption  := Un_R_file_Alex.N_AUTOKOD_FORM_CANCLE;

    Caption                                  := Un_R_file_Alex.KASSA_PRINT_CAPTION;
    cxCheckBoxPrihod_List.Properties.Caption := Un_R_file_Alex.KASSA_PRINT_PRIHOD_LIST;
    cxCheckBoxRashod_List.Properties.Caption := Un_R_file_Alex.KASSA_PRINT_RASHOD_LIST;
    cxCheckBoxBuh_Otchet.Properties.Caption  := Un_R_file_Alex.KASSA_PRINT_OTCHET_KASIRA;
    cxCheckBoxOtchet_Sch.Properties.Caption  := Un_R_file_Alex.KASSA_PRINT_OTCHET_PROV;
    cxCheckBoxShow.Properties.Caption        := Un_R_file_Alex.KASSA_PRINT_SHOW_OTCHET;
    cxCheckBox1.Properties.Caption           := Un_R_file_Alex.KASSA_PRINT_DOC_OT_2;
    cxCheckBox2.Properties.Caption           := Un_R_file_Alex.KASSA_PRINT_DOC_OT_3;
    cxCheckBox3.Properties.Caption           := Un_R_file_Alex.KASSA_PRINT_DOC_OT_4;
    cxCheckBoxDel.Properties.Caption         := Un_R_file_Alex.KASSA_PRINT_DOC_OT_5;
    cxLabel7.CAPTION                         := Un_R_file_Alex.KASSA_COL_COPY;
    cxLabel8.CAPTION                         := Un_R_file_Alex.KASSA_COL_COPY;
    cxLabel9.CAPTION                         := Un_R_file_Alex.KASSA_COL_COPY;
    cxLabel10.CAPTION                        := Un_R_file_Alex.KASSA_COL_COPY;
    cxLabel13.CAPTION                        := Un_R_file_Alex.KASSA_COL_COPY;
    cxLabel1.CAPTION                         := Un_R_file_Alex.KASSA_PRINT_FROM;
    cxLabel2.CAPTION                         := Un_R_file_Alex.KASSA_PRINT_FROM;
    cxLabel3.CAPTION                         := Un_R_file_Alex.KASSA_PRINT_FROM;
    cxLabel11.CAPTION                        := Un_R_file_Alex.KASSA_PRINT_FROM;
    CxLabel14.CAPTION                        := Un_R_file_Alex.KASSA_PRINT_FROM;
    cxLabel4.CAPTION                         := Un_R_file_Alex.KASSA_PAGE;
    cxLabel5.CAPTION                         := Un_R_file_Alex.KASSA_PAGE;
    cxLabel6.CAPTION                         := Un_R_file_Alex.KASSA_PAGE;
    cxLabel12.CAPTION                        := Un_R_file_Alex.KASSA_PAGE;
    cxLabel15.CAPTION                        := Un_R_file_Alex.KASSA_PAGE;

    DataSetList.Database    := myform.Database;
    DataSetList.Transaction := myform.Database.DefaultTransaction;
    DataSetList.Transaction.StartTransaction;

    DataSetOtchetRasschifrovka.Database    := myform.Database;
    DataSetOtchetRasschifrovka.Transaction := myform.Database.DefaultTransaction;
    DataSetOtchetRasschifrovka.Transaction.StartTransaction;

    DataSetBuh.Database    := myform.Database;
    DataSetBuh.Transaction := myform.Database.DefaultTransaction;
    DataSetBuh.Transaction.StartTransaction;

    DataSetDel.Database    := myform.Database;
    DataSetDel.Transaction := myform.Database.DefaultTransaction;
    DataSetDel.Transaction.StartTransaction;

    DataSetPage.Database    := myform.Database;
    DataSetPage.Transaction := myform.Database.DefaultTransaction;
    DataSetPage.Transaction.StartTransaction;

    DataSetPage.SQLs.SelectSQL.Text := 'SELECT * from KASSA_SELECT_LAST_PRINT_DAY('''+myform.DataSetDay.fieldByName('DAY_KASSA').AsString+''', '+IntToStr(myform.id_kassa)+')';
    DataSetPage.Open;

    StoredProc.Database           := myform.Database;
    TransactionWr.DefaultDatabase := myform.Database;
    StoredProc.Transaction        := TransactionWr;

    ll := DataSetPage.fieldByName('LAST_PAGE').AsInteger;
    cxSpinEdit3.Value := 1+ ll;
    count_page        := DataSetPage.fieldByName('COUNT_PAGE').AsInteger;
    DataSetPage.Close;
end;

function edinici(s : integer; flag : boolean):string;
begin
      Case S of
        0 : edinici := '';
        1 : if flag then edinici := 'одна ' else edinici := 'один ';
        2 : if flag then edinici := 'две ' else edinici := 'два ';
        3 : edinici := 'три ';
        4 : edinici := 'четыре ';
        5 : edinici := 'п€ть ';
        6 : edinici := 'шесть ';
        7 : edinici := 'семь ';
        8 : edinici := 'восемь ';
        9 : edinici := 'дев€ть ';
      end;
end;

function Desyatki(S : word): string;
begin
      Case S of
         1 :  Desyatki := 'дес€ть ';
         2 :  Desyatki := 'двадцать ';
         3 :  Desyatki := 'тридцать ';
         4 :  Desyatki := 'сорок ';
         5 :  Desyatki := 'п€тьдес€т ';
         6 :  Desyatki := 'шестьдес€т ';
         7 :  Desyatki := 'семьдес€т ';
         8 :  Desyatki := 'восемьдес€т ';
         9 :  Desyatki := 'дев€носто ';
      end;
end;

function Tisyacha (S : word): string;
begin
      Case S of
          1 : Tisyacha := 'сто ';
          2 : Tisyacha := 'двести ';
          3 : Tisyacha := 'триста ';
          4 : Tisyacha := 'четыреста ';
          5 : Tisyacha := 'п€тьсот ';
          6 : Tisyacha := 'шестьсот ';
          7 : Tisyacha := 'семьсот ';
          8 : Tisyacha := 'восемьсот ';
          9 : Tisyacha := 'дев€тьсот ';
       end;
end;

function des (s : word) : string;
begin
      Case S of
        1 :  des := 'одиннадцать ';
        2 :  des := 'двенадцать ';
        3 :  des := 'тринадцать ';
        4 :  des := 'четырнадцать ';
        5 :  des := 'п€тнадцать ';
        6 :  des := 'шестнадцать ';
        7 :  des := 'семнадцать ';
        8 :  des := 'восемнадцать ';
        9 :  des := 'дев€тнадцать ';
      end;
end;

function gugol (s: integer; m : word) : string;
begin
   Case S of
                   1 : begin
                        case m of
                           1      : gugol := 'тыс€ча ';
                           2..4   : gugol := 'тыс€чи ';
                           0,5..9 : gugol := 'тыс€ч ';
                        end;
                       end;
                  10 : begin
                         case m of
                           1       : gugol := 'миллион ';
                           2..4    : gugol := 'миллиона ';
                           0,5..9  : gugol := 'миллионов ';
                         end;
                       end;
                 100 : begin
                         case m of
                            1      : gugol := 'миллиард ';
                            2..4   : gugol := 'миллиарда ';
                            0,5..9 : gugol := 'миллиардов ';
                         end;
                       end;
               1000  : begin
                          case m of
                            1      : gugol := 'триллион ';
                            2..4   : gugol := 'триллиона ';
                            0,5..9 : gugol := 'триллионов ';
                          end;
                        end;
   end;
end;

function Kopy (s : word) : string;
begin
    case s of
        1      : Kopy := 'копейка ';
           2..4   : Kopy := 'копейки ';
        5..9,0 : Kopy := 'копеек ';
    end;
end;

function Grivna (s : word) : string;
begin
    case s of
        1      : Grivna := 'гривна ';
        5..9,0 : Grivna := 'гривень ';
        2..4   : Grivna := 'гривни ';
    end;
end;

function perevod (m : string) : string;
var
    name, n, razrad  : string;
    i, j, cifra, len : integer;
    flag : boolean;
begin
//    if n = '0'
//    then perevod := 'ноль' else
//    begin
    i := 1;
    cifra := 0;
    flag := true;
    len := Length(m);
    n := m;
    name := '';
    while i <= len do
    begin
         if length(n) >= 3 then
         begin
             razrad := copy(n, length(n)-2, 3);
             if razrad <> '000' then
             begin
             if ((i div 3) = 1) and (i mod 3 =1) then
                    if (StrToInt64(copy(razrad,1,2)) mod 10 <> 1) then name := gugol(1,cifra) + name
                                                                  else name := gugol(1,0) + name;
             if ((i div 3) = 2) and (i mod 3 =1) then
                    if (StrToInt64(copy(razrad,1,2)) mod 10 <> 1) then name := gugol(10,cifra) + name
                                                                  else name := gugol(10,0) + name;
             if ((i div 3) = 3) and (i mod 3 =1) then
                    if (StrToInt64(copy(razrad,1,2)) mod 10 <> 1) then name := gugol(100,cifra) + name
                                                                  else name := gugol(100,0) + name;
             if ((i div 3) = 4) and (i mod 3 =1) then
                    if (StrToInt64(copy(razrad,1,2)) mod 10 <> 1) then name := gugol(1000,cifra) + name
                                                                  else name := gugol(1000,0) + name;

             for j := 1 to 3 do
             begin
                 cifra := (StrToInt64(razrad) mod 10);
                 if ((j mod 3) = 0)  then
                      name := Tisyacha(cifra)+ name;

                 if ((j mod 3) = 2) and (cifra <> 1) then
                      name := Desyatki(cifra)+ name;

                 if (j mod 3) = 1
                 then
                 begin
                     if (StrToInt64(copy(razrad,1,2)) mod 10 = 1)
                         then
                         begin
                             if cifra = 0
                                   then name := Desyatki(1)+ name
                                   else name := Des(cifra)+ name
                         end
                      else name := edinici(cifra, flag) + name
                 end;
                 razrad := copy(razrad,1,3-j);

             end;
             end;
             n := copy(n,1,length(n)-3);
         end else
         begin
             if ((i div 3) = 1) and (i mod 3 =1) then
                    if (length(n) > 1) then begin if (StrToInt64(n) div 10 <> 1) then name := gugol(1,cifra) + name else name := gugol(1,0) + name end
                                                                  else name := gugol(1,strToInt(n)) + name;
             if ((i div 3) = 2) and (i mod 3 =1) then
                    if (length(n) > 1) then begin if  (StrToInt64(n) div 10 <> 1) then name := gugol(10,cifra) + name else name := gugol(10,0) + name end
                                                                  else name := gugol(10,StrToInt(n)) + name;
             if ((i div 3) = 3) and (i mod 3 =1) then
                    if (length(n) > 1) then begin if  (StrToInt64(n) div 10 <> 1) then name := gugol(100,cifra) + name else name := gugol(100,0) + name end
                                                                  else name := gugol(100,StrToInt(n)) + name;
             if ((i div 3) = 4) and (i mod 3 =1) then
                    if (length(n) > 1) then begin if  (StrToInt64(n) div 10 <> 1) then name := gugol(1000,cifra) + name else name := gugol(1000,0) + name end
                                                                  else name := gugol(1000,StrToInt(n)) + name;

                 cifra := (StrToInt64(n) mod 10);
                 if (length(n) = 1) then
                      case (i div 3) of
                      1,0    : name := edinici(cifra,true)+ name;
                      2..4 : name := edinici(cifra,false)+ name;
                      end;

                 if (length(n) = 2) and (StrToInt64(n) div 10 <> 1) then
                      name := edinici(cifra,true)+ name;

                 if (length(n) = 2) then
                  if (StrToInt64(n) div 10 = 1) then
                      begin
                      if cifra = 0
                             then name := Desyatki(1)+ name
                             else name := Des(cifra)+ name;
                      end
                      else name := Desyatki(StrToInt64(n) div 10)+ name;
         end;
         i := i+3;
    end;
    perevod := name;
end;

function perevod_chislo (m : string) : string;
var
    name, n, razrad  : string;
    i, j, cifra, len : integer;
    flag : boolean;
begin
    i := 1;
    flag := false;
    len := Length(m);
    n := m;
    name := '';
    while i <= len do
    begin
         if length(n) >= 3 then
         begin
             razrad := copy(n, length(n)-2, 3);
             if razrad <> '000' then
             begin
             if ((i div 3) = 1) and (i mod 3 =1) then
                    if (StrToInt64(copy(razrad,1,2)) mod 10 <> 1) then name := gugol(1,cifra) + name
                                                                  else name := gugol(1,0) + name;
             if ((i div 3) = 2) and (i mod 3 =1) then
                    if (StrToInt64(copy(razrad,1,2)) mod 10 <> 1) then name := gugol(10,cifra) + name
                                                                  else name := gugol(10,0) + name;
             if ((i div 3) = 3) and (i mod 3 =1) then
                    if (StrToInt64(copy(razrad,1,2)) mod 10 <> 1) then name := gugol(100,cifra) + name
                                                                  else name := gugol(100,0) + name;
             if ((i div 3) = 4) and (i mod 3 =1) then
                    if (StrToInt64(copy(razrad,1,2)) mod 10 <> 1) then name := gugol(1000,cifra) + name
                                                                  else name := gugol(1000,0) + name;

             for j := 1 to 3 do
             begin
                 cifra := (StrToInt64(razrad) mod 10);
                 if ((j mod 3) = 0)  then
                      name := Tisyacha(cifra)+ name;

                 if ((j mod 3) = 2) and (cifra <> 1) then
                      name := Desyatki(cifra)+ name;

                 if (j mod 3) = 1
                 then
                 begin
                     if (StrToInt64(copy(razrad,1,2)) mod 10 = 1)
                         then
                         begin
                             if cifra = 0
                                   then name := Desyatki(1)+ name
                                   else name := Des(cifra)+ name
                         end
                      else name := edinici(cifra, flag) + name
                 end;
                 razrad := copy(razrad,1,3-j);

             end;
             end;
             n := copy(n,1,length(n)-3);
         end else
         begin
             if ((i div 3) = 1) and (i mod 3 =1) then
                    if (length(n) > 1) then begin if (StrToInt64(n) div 10 <> 1) then name := gugol(1,cifra) + name else name := gugol(1,0) + name end
                                                                  else name := gugol(1,strToInt(n)) + name;
             if ((i div 3) = 2) and (i mod 3 =1) then
                    if (length(n) > 1) then begin if  (StrToInt64(n) div 10 <> 1) then name := gugol(10,cifra) + name else name := gugol(10,0) + name end
                                                                  else name := gugol(10,StrToInt(n)) + name;
             if ((i div 3) = 3) and (i mod 3 =1) then
                    if (length(n) > 1) then begin if  (StrToInt64(n) div 10 <> 1) then name := gugol(100,cifra) + name else name := gugol(100,0) + name end
                                                                  else name := gugol(100,StrToInt(n)) + name;
             if ((i div 3) = 4) and (i mod 3 =1) then
                    if (length(n) > 1) then begin if  (StrToInt64(n) div 10 <> 1) then name := gugol(1000,cifra) + name else name := gugol(1000,0) + name end
                                                                  else name := gugol(1000,StrToInt(n)) + name;

                 cifra := (StrToInt64(n) mod 10);
                 if (length(n) = 1) then
                      case (i div 3) of
                      1,0    : name := edinici(cifra,false)+ name;
                      2..4 : name := edinici(cifra,false)+ name;
                      end;

                 if (length(n) = 2) and (StrToInt64(n) div 10 <> 1) then
                      name := edinici(cifra,false)+ name;

                 if (length(n) = 2) then
                  if (StrToInt64(n) div 10 = 1) then
                      begin
                      if cifra = 0
                             then name := Desyatki(1)+ name
                             else name := Des(cifra)+ name;
                      end
                      else name := Desyatki(StrToInt64(n) div 10)+ name;
         end;
         i := i+3;
    end;
    perevod_chislo := name;
end;



function AllChislo(z : string) : string;
var
    summa, kop, griv : string;
    j : int64;
    flag : boolean;
begin
    summa := z;
    j := 1;
    flag := true;
    griv := '';
    kop := '';
    while j <= Length(summa) do
    begin
        if (copy(summa,j,1) <> ',') and flag
            then griv := griv + copy(summa,j,1)
            else flag := false;
        if (copy(summa,j,1) <> ',') and not flag then
            kop := kop + copy(summa,j,1);
        j := j+1;
    end;
    AllChislo := '';
    if (kop = '') and (griv <> '0') then AllChislo := perevod(griv) + grivna((StrToInt(griv) mod 10));
    if (griv = '0') and (kop <> '') then AllChislo := 'ноль гривень ' + perevod(kop) + Kopy((StrToInt(kop) mod 10));
    if (griv = '0') and (kop = '')
    then AllChislo := 'ноль гривень ';
    if (griv <> '0') and (kop <> '') then AllChislo := perevod(griv) + grivna((StrToInt(griv) mod 10)) + perevod(kop) + Kopy((StrToInt(kop) mod 10));
end;


procedure TfmPrintForm.cxButtonCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TfmPrintForm.cxButtonPrintClick(Sender: TObject);
var
    l, day : string;
    i : variant;
    ss : string;
    T : TfmUn_Progress_form;
begin
    if cxCheckBoxPrihod_List.Checked then
    begin
            DataSetList.Close;                                                     {IntToStr(myform.DataSetDay.FieldByName('ID_DT_DAY').AsVariant)}
            DataSetList.SQLs.SelectSQL.Text := 'select * from KASSA_GET_REG_LIST('''+myform.DataSetDay.FieldByName('ID_DT_DAY').AsString+''', '+IntToStr(1)+')';
            DataSetList.Open;
            DataSetList.FetchAll;
            l := myform.DataSetDay.fieldByName('DAY_KASSA').AsString;
            frVariables['count_page']  := cxSpinEdit1.value;
            frVariables['day_all'] := l;
            Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\RegList.frf');
            Report.PrepareReport;
            if not cxCheckBoxEdit.Checked then
            begin
                if not cxCheckBoxShow.Checked then
                begin
                        Report.PrintPreparedReport(IntTostr(1)+'-'+IntTostr(1000),
                                                   cxSpinEditRihodList.Value,
                                                   true,
                                                   frAll);
                end
                else Report.ShowReport
            end else
            Report.DesignReport;
    end;

    if cxCheckBoxRashod_List.Checked then
    begin
        DataSetList.Close;
        DataSetList.SQLs.SelectSQL.Text := 'select * from KASSA_GET_REG_LIST('''+myform.DataSetDay.FieldByName('ID_DT_DAY').AsString+''', '+IntToStr(0)+')';
        DataSetList.Open;
        frVariables['count_page']  := cxSpinEdit2.value;
        frVariables['day_all']     := myform.DataSetDay.fieldByName('DAY_KASSA').AsString;
        Report.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\RegList.frf');
        Report.PrepareReport;
        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
            begin
                        Report.PrintPreparedReport(IntTostr(1)+'-'+IntTostr(1000),
                                                   cxSpinEditRashodList.Value,
                                                   true,
                                                   frAll);

            end
            else Report.ShowReport
        end else
        Report.DesignReport;
    end;

    if cxCheckBoxBuh_Otchet.Checked then
    begin
        day := myform.DataSetDay.FieldByName('DAY_KASSA').AsString;
        DataSetBuh.Close;
        DataSetBuh.SQLs.SelectSQL.Text := 'select * from KASSA_GET_OTCHET_KASSIRA(''' + day +''')';
        DataSetBuh.Open;
        DataSetBuh.FetchAll;
{        frVariables['saldo_begin'] := myform.DataSetDay.FieldByName('SALDO_BEGIN').AsFloat;
        frVariables['day']         := myform.DataSetDay['DAY_KASSA'];
        frVariables['count_page']  := cxSpinEdit3.value;
        Report1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Otchetkassira.frf');
        Report1.PrepareReport;}

        l := myform.DataSetDay.fieldByName('DAY_KASSA').AsString;
        frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10008.fr3');
        frxReport1.Variables['day_all']     := QuotedStr(l);
        frxReport1.Variables['count_page']  := cxSpinEdit3.value;
        frxReport1.Variables['comp']        := QuotedStr(GetComputerNetName);
        frxReport1.Variables['saldo_begin'] := QuotedStr(myform.DataSetDay.fieldByName('SALDO_BEGIN').AsString);
        frxReport1.Variables['saldo_end']   := QuotedStr(myform.DataSetDay.fieldByName('SALDO_END').AsString);
        frxReport1.Variables['id_user']     := QuotedStr(IntToStr(myform.myclass.id_user));

{        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
               begin
                        Report1.PrintPreparedReport(IntTostr(1)+'-'+IntTostr(1000),
                                                   cxSpinEditBuhOtchet.Value,
                                                   true,
                                                   frAll);
               end
            else Report1.ShowReport;
        end else
        Report1.DesignReport;}
            if not cxCheckBoxEdit.Checked then
            begin
                if not cxCheckBoxShow.Checked then
                begin
                      frxReport1.Print;
                end
                else frxReport1.ShowReport(true);
            end;
//        Report1.GetVariableValue('TOTALPAGES', i);
        i := frxReport1.Variables.Variables['TOTALPAGES'];
        showmessage(VarToStr(i));
        exit;
        if (i <> count_page) or (cxSpinEdit3.Value <> ll + 1) then
        begin
            T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.WAIT_UPDATE_DATA);
            T.Show;
            T.UpDate;
            TransactionWr.StartTransaction;
            StoredProc.StoredProcName:='KASSA_UPDATE_PRINT_DAY';
            StoredProc.Prepare;
            StoredProc.ParamByName('D_ID_USER').AsInt64      := myform.myclass.id_user;
            StoredProc.ParamByName('D_DAY').AsDate           := myform.DataSetDay.FieldByname('DAY_KASSA').AsDateTime;
            StoredProc.ParamByName('D_SP_KASSA').AsInt64     := myform.id_kassa;
            StoredProc.ParamByName('D_COUNT_PAGE').AsVariant := i;
//            showmessage(VarToStr(i));
            StoredProc.ParamByName('D_LAST_PAGE').AsInteger  := cxSpinEdit3.Value + i - 1;
//            showmessage(VarToStr(ll + i));
            StoredProc.ExecProc;
            TransactionWr.Commit;
            T.Free;
        end;
    end;

    if cxCheckBox1.Checked then
    begin
        day := myform.DataSetDay.FieldByName('DAY_KASSA').AsString;
        DataSetBuh.Close;
        DataSetBuh.SQLs.SelectSQL.Text := 'select * from KASSA_GET_OTCHET_KASSIRA(''' + day +''')';
        DataSetBuh.Open;
        DataSetBuh.FetchAll;
        frVariables['saldo_begin'] := myform.DataSetDay.FieldByName('SALDO_BEGIN').AsFloat;
        frVariables['day']         := myform.DataSetDay['DAY_KASSA'];
        frVariables['count_page']  := cxSpinEdit3.value;
        Report1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Otchetkassira_var2.frf');
        Report1.PrepareReport;
        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
               begin
                        Report1.PrintPreparedReport(IntTostr(1)+'-'+IntTostr(1000),
                                                   cxSpinEdit4.Value,
                                                   true,
                                                   frAll);
               end
            else Report1.ShowReport
        end else
        Report1.DesignReport;
    end;

    if cxCheckBox2.Checked then
    begin
        day := myform.DataSetDay.FieldByName('DAY_KASSA').AsString;
        DataSetBuh.Close;
        DataSetBuh.SQLs.SelectSQL.Text := 'select * from KASSA_GET_OTCHET_KASSIRA(''' + day +''')';
        DataSetBuh.Open;
        DataSetBuh.FetchAll;
        frVariables['saldo_begin'] := myform.DataSetDay.FieldByName('SALDO_BEGIN').AsFloat;
        frVariables['day']         := myform.DataSetDay['DAY_KASSA'];
        frVariables['count_page']  := cxSpinEdit3.value;

        frVariables['сount_prih']  := perevod_chislo(myform.DataSetDay.FieldByName('COL_PRIHOD').AsString);
        frVariables['count_rash']  := perevod_chislo(myform.DataSetDay.FieldByName('COL_RASHOD').AsString);


        Report1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Otchetkassira_var3.frf');
        Report1.PrepareReport;
        if not cxCheckBoxEdit.Checked then
        begin
            if not cxCheckBoxShow.Checked then
               begin
                        Report1.PrintPreparedReport(IntTostr(1)+'-'+IntTostr(1000),
                                                   cxSpinEdit6.Value,
                                                   true,
                                                   frAll);
               end
            else Report1.ShowReport
        end else
        Report1.DesignReport;
    end;

    if cxCheckBox3.Checked then
    begin
            DataSetOtchetRasschifrovka.Close;
            DataSetOtchetRasschifrovka.SQLs.SelectSQL.Text := 'select * from KASSA_GET_OTCHET_KASSIRA_RASSCH('''+myform.DataSetDay.FieldByName('DAY_KASSA').AsString+''')';
            DataSetOtchetRasschifrovka.Open;
//            DataSetOtchetRasschifrovka.FetchAll;
            l := myform.DataSetDay.fieldByName('DAY_KASSA').AsString;
            frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10005.fr3');
            frxReport1.Variables['day_all']     := QuotedStr(l);
            frxReport1.Variables['count_page']  := cxSpinEdit9.value;
            frxReport1.Variables['comp']        := QuotedStr(GetComputerNetName);
            frxReport1.Variables['saldo_begin'] := QuotedStr(myform.DataSetDay.fieldByName('SALDO_BEGIN').AsString);
            frxReport1.Variables['saldo_end']   := QuotedStr(myform.DataSetDay.fieldByName('SALDO_END').AsString);
            frxReport1.Variables['id_user']     := QuotedStr(IntToStr(myform.myclass.id_user));
            if not cxCheckBoxEdit.Checked then
            begin
                if not cxCheckBoxShow.Checked then
                begin
{                     frxReport1.PrintOptions.PrintPages := (IntTostr(1)+'-'+IntTostr(1000),
                                                   1,
                                                   true,
                                                   frAll)}
                      frxReport1.Print;
                end
                else frxReport1.ShowReport(true);
            end else
            frxReport1.DesignReport;
    end;

    if cxCheckBoxDel.Checked then {удаленные}
    begin
            l := myform.DataSetDay.fieldByName('DAY_KASSA').AsString;
            DataSetDel.Close;
            DataSetDel.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_DELETED_DOC('''+l+''','''+l+''', '''+'-99999999999999'+''', '''+'99999999999999'+''', '''+''+''', '''+''+''', '+IntToStr(1)+', '+IntToStr(1)+')';
            DataSetDel.Open;
//            DataSetOtchetRasschifrovka.FetchAll;
            ReportDel.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10007.fr3');
            ReportDel.Variables['date_beg']   := QuotedStr(l);
//            ReportDel.Variables['date_end']   := QuotedStr(l);
//            ReportDel.Variables['count_page'] := cxSpinEdit9.value;
            ReportDel.Variables['comp']       := QuotedStr(GetComputerNetName);
            ReportDel.Variables['id_user']    := QuotedStr(IntToStr(myform.myclass.id_user));
            if not cxCheckBoxEdit.Checked then
            begin
                if not cxCheckBoxShow.Checked then
                begin
                      ReportDel.Print;
                end
                else ReportDel.ShowReport(true);
            end else
            ReportDel.DesignReport;
    end;
end;


procedure TfmPrintForm.cxCheckBoxShowClick(Sender: TObject);
begin

    if (cxCheckBoxPrihod_List.Checked) and (cxCheckBoxShow.Checked)
    then begin
        cxSpinEditRihodList.Enabled := false
    end
    else cxSpinEditRihodList.Enabled := true;

    if (cxCheckBoxRashod_List.Checked) and (cxCheckBoxShow.Checked)
    then begin
        cxSpinEditRashodList.Enabled := false
    end
    else cxSpinEditRashodList.Enabled := true;

    if (cxCheckBoxBuh_Otchet.Checked) and (cxCheckBoxShow.Checked)
    then begin
        cxSpinEditBuhOtchet.Enabled := false
    end
    else cxSpinEditBuhOtchet.Enabled := true;

    if (cxCheckBox1.Checked) and (cxCheckBoxShow.Checked)
    then begin
        cxSpinEdit4.Enabled := false
    end
    else cxSpinEdit4.Enabled := true;

    if (cxCheckBox2.Checked) and (cxCheckBoxShow.Checked)
    then begin
        cxSpinEdit6.Enabled := false
    end
    else cxSpinEdit6.Enabled := true;

end;

procedure TfmPrintForm.cxCheckBoxPrihod_ListClick(Sender: TObject);
begin
    if cxCheckBoxShow.Checked then
    if cxCheckBoxPrihod_List.Checked
    then begin
        cxSpinEditRihodList.Enabled := false
    end
    else cxSpinEditRihodList.Enabled := true;
end;

procedure TfmPrintForm.cxCheckBoxRashod_ListClick(Sender: TObject);
begin
    if cxCheckBoxShow.Checked then
    if cxCheckBoxRashod_List.Checked
    then begin
        cxSpinEditRashodList.Enabled := false
    end
    else cxSpinEditRashodList.Enabled := true;
end;

procedure TfmPrintForm.cxCheckBoxBuh_OtchetClick(Sender: TObject);
begin
    if cxCheckBoxShow.Checked then
    if cxCheckBoxBuh_Otchet.Checked
    then begin
        cxSpinEditBuhOtchet.Enabled := false
    end
    else cxSpinEditBuhOtchet.Enabled := true;
end;

procedure TfmPrintForm.cxCheckBox1Click(Sender: TObject);
begin
    if cxCheckBoxShow.Checked then
    if cxCheckBox1.Checked
    then begin
        cxSpinEdit4.Enabled := false
    end
    else cxSpinEdit4.Enabled := true;
end;

procedure TfmPrintForm.cxCheckBox2Click(Sender: TObject);
begin
    if cxCheckBoxShow.Checked then
    if cxCheckBox2.Checked
    then begin
        cxSpinEdit6.Enabled := false
    end
    else cxSpinEdit6.Enabled := true;
end;

end.
