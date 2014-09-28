unit TITaxInvoices_ExportReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDBEdit, cxLabel, cxProgressBar,
  StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, ibase,TiMessages;

type
  TExportReestrForm = class(TForm)
    FileOpenGroup: TGroupBox;
    eFileNameEdit: TcxButtonEdit;
    ImportPanel: TGroupBox;
    StartBtn: TcxButton;
    ProgressBar: TcxProgressBar;
    GroupBox1: TGroupBox;
    PeriodLabel: TcxLabel;
    PeriodDBTextEdit: TcxDBTextEdit;
    NumReestrLabel: TcxLabel;
    NumReestrDBTextEdit: TcxDBTextEdit;
    GroupBox2: TGroupBox;
    NaklLabel: TcxLabel;
    SaveDialog: TSaveDialog;
    procedure StartBtnClick(Sender: TObject);
    procedure eFileNameEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    PDb_Handle      : TISC_DB_HANDLE;
    is_vid_nakl_ins : Integer;
  public
    constructor Create (AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE; is_vid_nakl:Integer);reintroduce;
  end;

var
  ExportReestrForm: TExportReestrForm;

implementation

uses TITaxInvoicesDM;

{$R *.dfm}
constructor TExportReestrForm.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;is_vid_nakl:Integer);
begin
  inherited Create(AOwner);
  PDb_Handle := DB_HANDLE;
  is_vid_nakl_ins := is_vid_nakl;
end;
procedure TExportReestrForm.StartBtnClick(Sender: TObject);
var
  RecordCount : Integer;
begin
  if (eFileNameEdit.Text='')   then
  begin
   TiShowMessage('Увага!','Оберіть файл для експорту',mtWarning,[mbOK]);
   Exit;
  end;

  if (is_vid_nakl_ins = 1)then   //выданные накладные
  begin
    TaxInvoicesDM.VidNaklDSet.FetchAll;
    RecordCount := TaxInvoicesDM.VidNaklDSet.RecordCount;
    TaxInvoicesDM.VidNaklDSet.First;

    TaxInvoicesDM.CreateDBAccount.CreateFields.Clear;
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('NPP;C;7;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('DATEV;D;8;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('NUM;C;50;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('NAZP;C;200;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('IPN;C;20;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('ZAGSUM;N;16;2');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('BAZOP20;N;16;2');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('SUMPDV;N;16;2');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('BAZOP0;N;16;2');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('ZVILN;N;16;2');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('EXPORT;N;16;2');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('PZOB;N;3;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('NREZ;N;2;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('KOR;N;2;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('WMDTYPE;N;2;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('WMDTYPESTR;C;4;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('UTOCH;N;2;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('WMDTYPEXEC;C;2;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('WMDTUPLIT;C;1;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('DELIVERY;N;16;2');

    if not TaxInvoicesDM.CreateDBAccount.Execute then
     begin
      TiShowMessage('Помилка!', 'Неможливо створити файл!', mtError, [mbOk]);
      Exit;
     end;

    ProgressBar.Properties.Max := RecordCount;
    ProgressBar.Position       := 0;

    TaxInvoicesDM.DbfExport.Exclusive:=False;
    TaxInvoicesDM.DbfExport.Open;

    try
      While not(TaxInvoicesDM.VidNaklDSet.Eof) do
       begin
         TaxInvoicesDM.DbfExport.Append;

         TaxInvoicesDM.DbfExport['NPP']        := TaxInvoicesDM.VidNaklDSet['num_order'];
         TaxInvoicesDM.DbfExport['DATEV']      := TaxInvoicesDM.VidNaklDSet['data_vipiski'];
         TaxInvoicesDM.DbfExport['NUM']        := TaxInvoicesDM.VidNaklDSet['num_nakl'];
         TaxInvoicesDM.DbfExport['NAZP']       := TaxInvoicesDM.VidNaklDSet['name_customer'];

         if (TaxInvoicesDM.VidNaklDSet['ipn_customer']='---') then
           TaxInvoicesDM.DbfExport['IPN'] := 0
         else
           TaxInvoicesDM.DbfExport['IPN']        := TaxInvoicesDM.VidNaklDSet['ipn_customer'];

         TaxInvoicesDM.DbfExport['ZAGSUM']     := TaxInvoicesDM.VidNaklDSet['summa_all_pdv'];
         TaxInvoicesDM.DbfExport['BAZOP20']    := TaxInvoicesDM.VidNaklDSet['summa_taxable_20'];
         TaxInvoicesDM.DbfExport['SUMPDV']     := TaxInvoicesDM.VidNaklDSet['summa_pdv_20'];
         TaxInvoicesDM.DbfExport['BAZOP0']     := TaxInvoicesDM.VidNaklDSet['summa_taxable_0'];
         TaxInvoicesDM.DbfExport['ZVILN']      := TaxInvoicesDM.VidNaklDSet['summa_exempt'];
         TaxInvoicesDM.DbfExport['EXPORT']     := TaxInvoicesDM.VidNaklDSet['summa_export'];
         TaxInvoicesDM.DbfExport['PZOB']       := StrToInt(TaxInvoicesDM.VidNaklDSet['num_tax_liabilities']);
         TaxInvoicesDM.DbfExport['NREZ']       := StrToInt(TaxInvoicesDM.VidNaklDSet['is_sign']);
         TaxInvoicesDM.DbfExport['KOR']        := StrToInt(TaxInvoicesDM.VidNaklDSet['is_korig']);
         TaxInvoicesDM.DbfExport['WMDTYPE']    := StrToInt(TaxInvoicesDM.VidNaklDSet['num_type_document']);
         TaxInvoicesDM.DbfExport['WMDTYPESTR'] := TaxInvoicesDM.VidNaklDSet['charcode_name_type_document'];
         TaxInvoicesDM.DbfExport['UTOCH']      := TaxInvoicesDM.VidNaklDSet['IS_EXPANSION'];
         TaxInvoicesDM.DbfExport['WMDTYPEXEC'] := TaxInvoicesDM.VidNaklDSet['NUM_SPECIALNOTES'];
         TaxInvoicesDM.DbfExport['WMDTUPLIT']  := TaxInvoicesDM.VidNaklDSet['OZNAKA_NAKL'];
         TaxInvoicesDM.DbfExport['DELIVERY']   := TaxInvoicesDM.VidNaklDSet['SUMMA_DELIVERY'];

         TaxInvoicesDM.DbfExport.Post;
         TaxInvoicesDM.VidNaklDSet.Next;

         ProgressBar.Position := ProgressBar.Position + 1;
         Application.ProcessMessages;
       end;
    except
      on e:Exception do
       begin
         TiShowMessage('Помилка!', 'Неможливо зробити експорт!' + #13 + e.Message, mtError, [mbOk]);
         exit;
       end;
    end;
    TaxInvoicesDM.DbfExport.Close;
    TiShowMessage('Завершення','Данні експортовано.',mtInformation, [mbOk]);
  end;

  if (is_vid_nakl_ins = 0)then   //полученные накладные
  begin
    TaxInvoicesDM.OtrNaklDSet.FetchAll;
    RecordCount := TaxInvoicesDM.OtrNaklDSet.RecordCount;
    TaxInvoicesDM.OtrNaklDSet.First;

    TaxInvoicesDM.CreateDBAccount.CreateFields.Clear;
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('NPP;C;7;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('DATEV;D;8;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('NUM;C;50;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('NAZP;C;200;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('IPN;C;20;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('ZAGSUM;N;16;2');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('VART7;N;16;2');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('SUM8;N;16;2');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('VART9;N;16;2');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('SUM10;N;16;2');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('VART11;N;16;2');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('SUM12;N;16;2');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('VART13;N;16;2');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('SUM14;N;16;2');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('PKRED;N;3;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('NREZ;N;2;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('KOR;N;2;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('WMDTYPE;N;2;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('WMDTYPESTR;C;4;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('DTVP;D;8;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('UTOCH;N;2;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('WMDTYPLIT1;C;1;0');
    TaxInvoicesDM.CreateDBAccount.CreateFields.Add('WMDTYPLIT2;C;1;0');

    if not TaxInvoicesDM.CreateDBAccount.Execute then
     begin
      TiShowMessage('Помилка!', 'Неможливо створити файл!', mtError, [mbOk]);
      Exit;
     end;

    ProgressBar.Properties.Max := RecordCount;
    ProgressBar.Position       := 0;

    TaxInvoicesDM.DbfExport.Exclusive:=False;
    TaxInvoicesDM.DbfExport.Open;

    try
      While not(TaxInvoicesDM.OtrNaklDSet.Eof) do
       begin
         TaxInvoicesDM.DbfExport.Append;

         TaxInvoicesDM.DbfExport['NPP']        := TaxInvoicesDM.OtrNaklDSet['num_order'];
         TaxInvoicesDM.DbfExport['DATEV']      := TaxInvoicesDM.OtrNaklDSet['data_otr'];
         TaxInvoicesDM.DbfExport['NUM']        := TaxInvoicesDM.OtrNaklDSet['num_nakl'];
         TaxInvoicesDM.DbfExport['NAZP']       := TaxInvoicesDM.OtrNaklDSet['name_provider'];

         if (TaxInvoicesDM.OtrNaklDSet['ipn_provider']='---') then
           TaxInvoicesDM.DbfExport['IPN'] := 0
         else
           TaxInvoicesDM.DbfExport['IPN']        := TaxInvoicesDM.OtrNaklDSet['ipn_provider'];

         TaxInvoicesDM.DbfExport['ZAGSUM']     := TaxInvoicesDM.OtrNaklDSet['summa_all_pdv'];
         TaxInvoicesDM.DbfExport['VART7']      := TaxInvoicesDM.OtrNaklDSet['summa_20_0_not_pdv'];
         TaxInvoicesDM.DbfExport['SUM8']       := TaxInvoicesDM.OtrNaklDSet['summa_20_0_pdv'];
         TaxInvoicesDM.DbfExport['VART9']      := TaxInvoicesDM.OtrNaklDSet['summa_exempt_not_pdv'];
         TaxInvoicesDM.DbfExport['SUM10']      := TaxInvoicesDM.OtrNaklDSet['summa_exempt_pdv'];
         TaxInvoicesDM.DbfExport['VART11']     := TaxInvoicesDM.OtrNaklDSet['summa_econ_activ_not_pdv'];
         TaxInvoicesDM.DbfExport['SUM12']      := TaxInvoicesDM.OtrNaklDSet['summa_econ_activ_pdv'];
         TaxInvoicesDM.DbfExport['VART13']     := TaxInvoicesDM.OtrNaklDSet['summa_delivery_not_pdv'];
         TaxInvoicesDM.DbfExport['SUM14']      := TaxInvoicesDM.OtrNaklDSet['summa_delivery_pdv'];
         TaxInvoicesDM.DbfExport['PKRED']      := StrToInt(TaxInvoicesDM.OtrNaklDSet['num_tax_liabilities']);
         TaxInvoicesDM.DbfExport['NREZ']       := 0;//так сделано в бест-звите
         TaxInvoicesDM.DbfExport['KOR']        := StrToInt(TaxInvoicesDM.OtrNaklDSet['is_korig']);
         TaxInvoicesDM.DbfExport['WMDTYPE']    := StrToInt(TaxInvoicesDM.OtrNaklDSet['num_type_document']);
         TaxInvoicesDM.DbfExport['WMDTYPESTR'] := TaxInvoicesDM.OtrNaklDSet['charcode_name_type_document'];
         TaxInvoicesDM.DbfExport['DTVP']       := TaxInvoicesDM.OtrNaklDSet['data_vipiski'];
         TaxInvoicesDM.DbfExport['UTOCH']      := TaxInvoicesDM.OtrNaklDSet['IS_EXPANSION'];
         TaxInvoicesDM.DbfExport['WMDTYPLIT1'] := TaxInvoicesDM.OtrNaklDSet['oznaka1'];
         TaxInvoicesDM.DbfExport['WMDTYPLIT2'] := TaxInvoicesDM.OtrNaklDSet['oznaka2'];
         TaxInvoicesDM.DbfExport.Post;
         TaxInvoicesDM.OtrNaklDSet.Next;

         ProgressBar.Position := ProgressBar.Position + 1;
         Application.ProcessMessages;
       end;
    except
      on e:Exception do
       begin
         TiShowMessage('Помилка!', 'Неможливо зробити експорт!' + #13 + e.Message, mtError, [mbOk]);
         exit;
       end;
    end;
    TaxInvoicesDM.DbfExport.Close;
    TiShowMessage('Завершення','Данні експортовано.',mtInformation, [mbOk]);
  end;

end;

procedure TExportReestrForm.eFileNameEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  //SaveDialog.FileName:='Reestr_vid_Nakl.dbf';
  if (SaveDialog.Execute) then
    begin
      eFileNameEdit.Text:=SaveDialog.FileName;
      TaxInvoicesDM.DbfExport.DatabaseName:=ExtractFileDir(eFileNameEdit.Text);
      TaxInvoicesDM.DbfExport.TableName:=ExtractFileName(eFileNameEdit.Text);
    end;
end;

end.
