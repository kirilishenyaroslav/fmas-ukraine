{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uShablonDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, StdCtrls,
  cxButtons, ComCtrls, DB, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery, DBCtrls, Ibase,
  cxCheckBox, uMatasVars, uMatasUtils, cxSpinEdit,
  FR_DSet, FR_DBSet, FR_Class, FR_Desgn, DateUtils, ActnList, FR_E_TXT,
  FR_E_RTF, frOLEExl;

type
  TfmMyShablon = (Shablon_doc, Shablon_ostatok);

  TfmPrintShablonDoc = class(TForm)
    cxButtonChect: TcxButton;
    cxButtonExitSHAB: TcxButton;
    LabelShablon: TLabel;
    ShablonDatabase: TpFIBDatabase;
    pFIBTransactionRead: TpFIBTransaction;
    ShablonDataSet: TpFIBDataSet;
    cxComboBoxShablon: TcxComboBox;
    pFIBDataSetShapka: TpFIBDataSet;
    pFIBDataSetDannie: TpFIBDataSet;
    CheckBoxDoc: TcxCheckBox;
    cxCheckOnPrinter: TcxCheckBox;
    cxCopies: TcxSpinEdit;
    Label1: TLabel;
    cxSelectPrinter: TcxCheckBox;
    frReportDoc: TfrReport;
    frDBDataSetDoc: TfrDBDataSet;
    frDBDataSetPos: TfrDBDataSet;
    pFIBDataSetKartData: TpFIBDataSet;
    frDBDataSetKart: TfrDBDataSet;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    ActionOk: TAction;
    DataSource1: TDataSource;
    pFIBDataSetDocKart: TpFIBDataSet;
    frDBDataSetDocKart: TfrDBDataSet;
    pFIBDataSetDocMnaKart: TpFIBDataSet;
    frOLEExcelExport1: TfrOLEExcelExport;
    frRTFExport1: TfrRTFExport;
    cxexport: TcxCheckBox;
    procedure cxButtonExitSHABClick(Sender: TObject);
    procedure cxButtonChectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    Ind : array of Int64;
    TmplArray: array of string;
    my_path : string;
    n : TfmMyShablon;
    pid_d, i : integer;
  public
    ID_TIPD_SHABLON, ID_DOC_SHABLON : Variant;
    NAMEREPORT : string;
    constructor Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; ReadTr : TISC_TR_HANDLE; id_t, id_d : integer; m : TfmMyShablon); reintroduce; overload;
    destructor Destroy; override;
  end;


procedure PrtShablon(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE;  TransactionHandle : TISC_TR_HANDLE; id_tipd, id_doc : integer; modeShablon : TfmMyShablon);stdcall;

exports PrtShablon;


implementation
{$R *.dfm}

procedure PrtShablon(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE;  TransactionHandle : TISC_TR_HANDLE; id_tipd, id_doc : integer; modeShablon : TfmMyShablon);stdcall;
var
    T : TfmPrintShablonDoc;
begin
    T := TfmPrintShablonDoc.create(AOwner, DBHANDLE, TransactionHandle, id_tipd, id_doc, modeShablon);
    T.ShowModal;
    T.free;
end;


constructor TfmPrintShablonDoc.Create(AOwner: TComponent;
  DBHandle : TISC_DB_HANDLE; ReadTr : TISC_TR_HANDLE; id_t, id_d : integer; m : TfmMyShablon);
begin
    inherited Create (AOwner);
    n := m;
    ShablonDatabase.Handle:=DBHandle;
    pFIBTransactionRead.Handle := ReadTr;
    ShablonDatabase.DefaultTransaction := pFIBTransactionRead;

    if n = Shablon_doc then
    begin
        cxButtonChect.Caption:='Друк';
        LabelShablon.Caption:='Шаблон документу';

        ShablonDatabase.DefaultTransaction := pFIBTransactionRead;
        ShablonDataSet.Database := ShablonDatabase;
        ShablonDataSet.Transaction := ShablonDatabase.DefaultTransaction;
        ShablonDataSet.Transaction.StartTransaction;
        ShablonDataSet.Close;
        ShablonDataSet.ParamByName('PID_TIPD').Value:=id_t;
        pid_d := id_d;
        ShablonDataSet.Open;
        ShablonDataSet.FetchAll;
        SetLength(Ind, ShablonDataSet.RecordCount);
        SetLength(TmplArray, ShablonDataSet.RecordCount);
        ShablonDataSet.First;
        cxComboBoxShablon.Properties.Items.Clear;
        if ShablonDataSet['FLAG'] = 0 then
            BEGIN
                while not ShablonDataSet.Eof do
                    begin
                        Ind[ShablonDataSet.RecNo - 1] := ShablonDataSet['ID_TEMPLATE'];
                        TmplArray[ShablonDataSet.RecNo - 1] := ShablonDataSet['TEMPLATE'];
                        my_path := ShablonDataSet['TEMPLATE'];
                        cxComboBoxShablon.Properties.Items.Insert(ShablonDataSet.RecNo - 1, ShablonDataSet['NAME_SHAB']);
                        ShablonDataSet.Next;
                    end;
        end;
        cxComboBoxShablon.ItemIndex := 0;
    end;

    if n = Shablon_ostatok then
    begin
        cxButtonChect.Caption:='Вибрати';
        LabelShablon.Caption:='Шаблон звіту';

        ShablonDataSet.Database := ShablonDatabase;
        ShablonDataSet.Transaction := ShablonDatabase.DefaultTransaction;
        ShablonDataSet.Transaction.StartTransaction;
        ShablonDataSet.Close;
        ShablonDataSet.ParamByName('PID_TIPD').Value:=id_t;
        ShablonDataSet.Open;
        ShablonDataSet.FetchAll;
        SetLength(Ind, ShablonDataSet.RecordCount);
        ShablonDataSet.First;
        cxComboBoxShablon.Properties.Items.Clear;
        if ShablonDataSet['FLAG'] = 1 then
            BEGIN
                while not ShablonDataSet.Eof do
                    begin
                        Ind[ShablonDataSet.RecNo - 1] := ShablonDataSet['ID_TEMPLATE'];
                        my_path := ShablonDataSet['TEMPLATE'];
                        cxComboBoxShablon.Properties.Items.Insert(ShablonDataSet.RecNo - 1, ShablonDataSet['NAME_SHAB']);
                        ShablonDataSet.Next;
                    end;
            end;
        cxComboBoxShablon.ItemIndex := 0;
    end;
    i:=0;
end;

procedure TfmPrintShablonDoc.cxButtonExitSHABClick(Sender: TObject);
begin
 Close;
end;

destructor TfmPrintShablonDoc.Destroy;
begin
  ShablonDataSet.Close;
  inherited;
end;

procedure TfmPrintShablonDoc.cxButtonChectClick(Sender: TObject);
begin
  i:=i+1;
    if not ShablonDataSet.IsEmpty then
    begin
     if n = Shablon_doc then
     begin
         pFIBDataSetShapka.Close;
         pFIBDataSetShapka.SQLs.SelectSQL.Text := 'SELECT * FROM MAT_DT_DOC_SEL(:PID_DOC)';
         pFIBDataSetShapka.ParamByName('PID_DOC').Value:=pid_d;
         pFIBDataSetShapka.CloseOpen(false);

         pFIBDataSetDannie.Close;
         pFIBDataSetDannie.SQLs.SelectSQL.Text := 'SELECT * FROM MAT_DT_DOC_POS_SEL(:PID_DOC)';
         pFIBDataSetDannie.ParamByName('PID_DOC').Value:=pid_d;
         pFIBDataSetDannie.CloseOpen(false);

//         pFIBDataSetKartData.Close;
//         pFIBDataSetKartData.SQLs.SelectSQL.Clear;
//         pFIBDataSetKartData.SQLs.SelectSQL.Add('SELECT * FROM MAT_DT_DOC_POS_KART_PRINT_SEL2(:ID_POS)');
//         pFIBDataSetKartData.SQLs.SelectSQL.Add('ORDER BY NAME, INV_NUM_FULL');
//         pFIBDataSetKartData.ParamByName('ID_POS').Value:=pid_d;
         pFIBDataSetKartData.CloseOpen(true);

         pFIBDataSetDocMnaKart.Close;
         pFIBDataSetDocMnaKart.SQLs.SelectSQL.Clear;
         pFIBDataSetDocMnaKart.SQLs.SelectSQL.Add('SELECT * FROM MAT_DT_DOC_POS_KART_PRINT_SELM(:ID_DOC)');
         pFIBDataSetDocMnaKart.ParamByName('ID_DOC').Value:=pid_d;
         pFIBDataSetDocMnaKart.CloseOpen(true);

         pFIBDataSetDocKart.Close;
         pFIBDataSetDocKart.SQLs.SelectSQL.Clear;
         pFIBDataSetDocKart.SQLs.SelectSQL.Add('SELECT * FROM MAT_DT_DOC_POS_KART_PRINT_SEL(:ID_DOC)');
         pFIBDataSetDocKart.SQLs.SelectSQL.Add('ORDER BY NAME, INV_NUM_FULL ');
         pFIBDataSetDocKart.ParamByName('ID_DOC').Value:=pid_d;
         pFIBDataSetDocKart.CloseOpen(true);

         if _USE_ORG_SHORT_NAME=1 then frVariables['ORG_NAME']:=_ORG_SHORT_NAME
         else frVariables['ORG_NAME']:=_ORG_FULL_NAME;
        // frVariables['ORG_SHORT_NAME']:=_ORG_SHORT_NAME;
         frVariables['ORG_KOD_OKPO']:=_ORG_KOD_OKPO;
         
         frVariables['USER']:=Inttostr(_PRINT_ISPOLNIT_IN_DOC);

         frVariables['STR_ICOUNT']:=uMatasUtils.KolMatToString(pFIBDataSetShapka.FieldByName('COUNT_POS').AsFloat);
         frVariables['STR_ISUMMA']:=uMatasUtils.SummaToString(pFIBDataSetShapka.FieldByName('SUMMA').AsFloat);

         if pFIBDataSetShapka.FieldValues['DATE_DOC']<StrToDate('30.09.2013') then
         begin
         if TmplArray[cxComboBoxShablon.ItemIndex]= 'Akt_mbp_with_drag_met_hai.frf' then
         TmplArray[cxComboBoxShablon.ItemIndex]:= 'Akt_mbp_with_drag_met_hai_old.frf';

         if TmplArray[cxComboBoxShablon.ItemIndex]= 'Akt_mbp_hai.frf' then
         TmplArray[cxComboBoxShablon.ItemIndex]:= 'Akt_mbp_hai_old.frf';

         if TmplArray[cxComboBoxShablon.ItemIndex]= 'Akt_na_spisanie_os_hai.frf' then
         TmplArray[cxComboBoxShablon.ItemIndex]:= 'Akt_na_spisanie_os_hai_old.frf';
         end;
         frReportDoc.LoadFromFile(ExtractFilePath(Application.ExeName)+_PATH_REPORTS+'\'+TmplArray[cxComboBoxShablon.ItemIndex]);
         frReportDoc.PrepareReport;
         if cxCopies.Value>1 then
          frReportDoc.DefaultCopies:=cxCopies.Value;
         if cxCheckOnPrinter.Checked then
          begin
           if cxSelectPrinter.Checked then
            frReportDoc.PrintPreparedReportDlg
           else
            frReportDoc.PrintPreparedReport('', cxCopies.Value, false, frAll);
          end
         else
         if cxexport.Checked = True then
         frReportDoc.ExportTo(frOLEExcelExport1, 'c:/'+inttostr(i))
         else
         begin
          frReportDoc.ShowReport;
         if CheckBoxDoc.Checked then
          frReportDoc.DesignReport;
         end;
     end;
    end
    else
     ShowMessage('Виберіть шаблон!');
end;

procedure TfmPrintShablonDoc.FormCreate(Sender: TObject);
begin
 cxCopies.Value:=1;
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 CheckBoxDoc.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
end;

procedure TfmPrintShablonDoc.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

end.

