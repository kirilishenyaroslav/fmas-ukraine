unit TITaxInvoices_ImportReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDBEdit, cxLabel, cxProgressBar,
  StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, ibase,TiMessages, TIImportDBFData,TiCommonTypes,cxDataStorage,
  TICommonLoader, TiWaitForm,kernel;

type TTaxInvocesUser = record
 id_user:Integer;
 name_user:string;
 name_computer:string;
 ip_computer:string;
end;

type
  TImportReestrForm = class(TForm)
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
    OpenDialog: TOpenDialog;
    GroupBox3: TGroupBox;
    SubdivisionButtonEdit: TcxButtonEdit;
    procedure StartBtnClick(Sender: TObject);
    procedure eFileNameEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SubdivisionButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);


  private
    PDb_Handle      : TISC_DB_HANDLE;
    is_vid_nakl_ins : Integer;
    TaxInvoicesUser : TTaxInvocesUser;
  public
    ReestrParam      : TReestrParam;
    id_subdivision   : Integer;
    name_subdivision : string;
    constructor Create (AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE; is_vid_nakl:Integer);reintroduce;
  end;

var
  ImportReestrForm: TImportReestrForm;

implementation

uses TITaxInvoicesDM, DB;

{$R *.dfm}
constructor TImportReestrForm.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;is_vid_nakl:Integer);
begin
  inherited Create(AOwner);
  PDb_Handle := DB_HANDLE;
  is_vid_nakl_ins := is_vid_nakl;
  //--------------------------------------------------------------------
  TaxInvoicesDM.UserDSet.Close;
  TaxInvoicesDM.UserDSet.SelectSQL.Text := 'select * from TI_USER_INFO';
  TaxInvoicesDM.UserDSet.Open;
  TaxInvoicesUser.id_user       := TaxInvoicesDM.UserDSet['ID_USER'];
  TaxInvoicesUser.name_user     := TaxInvoicesDM.UserDSet['USER_FIO'];
  TaxInvoicesUser.name_computer := TaxInvoicesDM.UserDSet['HOST_NAME'];
  TaxInvoicesUser.ip_computer   := TaxInvoicesDM.UserDSet['IP_ADRESS'];
end;
procedure TImportReestrForm.StartBtnClick(Sender: TObject);
var
  RecordCount     : Integer;
  LastNomer       : Integer;
  Id_Type_Doc     : Integer;
  Name_Type_Doc   : string;
  CharCod         : string;
  name_contragent : string;
  ViewForm        : TImportDBFForm;
  i,j             : Integer;
  wf              : TForm;
  LastNumVidNakl  : Integer;
  id_vid_nakl     : Integer;
  KEY_SESSION     : Int64;
  workdate        : TDate;
  STRU            : KERNEL_MODE_STRUCTURE;
  DoResult        : Boolean;
  ErrorList       : TStringList;
  s               : string;
  LastNumOtrNakl  : Integer;
  id_otr_nakl     : Integer;
begin
  if (eFileNameEdit.Text='')   then
  begin
   TiShowMessage('Увага!','Оберіть файл для імпорту',mtWarning,[mbOK]);
   Exit;
  end;

  if (SubdivisionButtonEdit.Text='')   then
  begin
   TiShowMessage('Увага!','Заповніть назву організації, дані якої будут імпортуватися',mtWarning,[mbOK]);
   SubdivisionButtonEdit.SetFocus;
   Exit;
  end;

  ReestrParam.Id_reestr        := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
  ReestrParam.Num_Reestr       := TaxInvoicesDM.ReestrDSet['NUM_REESTR'];
  ReestrParam.Kod_setup_Reestr := TaxInvoicesDM.ReestrDSet['KOD_SETUP_OUT'];
  ReestrParam.DATABEG_REESTR   := TaxInvoicesDM.ReestrDSet['DATABEG_REESTR'];
  ReestrParam.DATAEND_REESTR   := TaxInvoicesDM.ReestrDSet['DATAEND_REESTR'];

  ViewForm := TImportDBFForm.Create(Self, TaxInvoicesDM.DB.Handle, ReestrParam);

  if (is_vid_nakl_ins = 1)then   //выданные накладные
  begin
    TaxInvoicesDM.IMPORT.Close;
    TaxInvoicesDM.IMPORT.Open;

    ViewForm.DBFDataVidNaklGridTableView1.DataController.RecordCount := TaxInvoicesDM.IMPORT.RecordCount;
    ViewForm.DBFDataVidNaklGridTableView_NUM_ORDER.DataBinding.ValueTypeClass        := TcxIntegerValueType;
    ViewForm.DBFDataVidNaklGridTableView_DATA_VIPISKI.DataBinding.ValueTypeClass     := TcxDateTimeValueType;
    ViewForm.DBFDataVidNaklGridTableView_NUM_NAKL.DataBinding.ValueTypeClass         := TcxStringValueType;
    ViewForm.DBFDataVidNaklGridTableView_NAME_TYPE_DOCUMENT.DataBinding.ValueTypeClass := TcxStringValueType;
    ViewForm.DBFDataVidNaklGridTableView_NAME_CUSTOMER.DataBinding.ValueTypeClass    := TcxStringValueType;
    ViewForm.DBFDataVidNaklGridTableView_IPN_CUSTOMER.DataBinding.ValueTypeClass     := TcxStringValueType;
    ViewForm.DBFDataVidNaklGridTableView_SUMMA_ALL_PDV.DataBinding.ValueTypeClass    := TcxFloatValueType;
    ViewForm.DBFDataVidNaklGridTableView_SUMMA_TAXABLE_20.DataBinding.ValueTypeClass := TcxFloatValueType;
    ViewForm.DBFDataVidNaklGridTableView_SUMMA_PDV_20.DataBinding.ValueTypeClass     := TcxFloatValueType;
    ViewForm.DBFDataVidNaklGridTableView_SUMMA_TAXABLE_0.DataBinding.ValueTypeClass  := TcxFloatValueType;
    ViewForm.DBFDataVidNaklGridTableView_SUMMA_EXEMPT.DataBinding.ValueTypeClass     := TcxFloatValueType;
    ViewForm.DBFDataVidNaklGridTableView_SUMMA_EXPORT.DataBinding.ValueTypeClass     := TcxFloatValueType;

    // начало импорта выданных налоговых накладных
    if (TaxInvoicesDM.IMPORT.RecordCount <> 0) then
    begin
      // поиск последнего номера в реестре
      LastNomer := 0;
      TaxInvoicesDM.WriteTransaction.StartTransaction;
      TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_LAST_NOMER_NAKL_SEARCH';
      TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_REESTR').Value := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
      TaxInvoicesDM.pFIBStoredProc.ParamByName('TYPE_NAKL').Value := 1;
      TaxInvoicesDM.pFIBStoredProc.ExecProc;
      TaxInvoicesDM.WriteTransaction.Commit;
      LastNomer := TaxInvoicesDM.pFIBStoredProc.ParamByName('LAST_NUM_ORDER').Value;
      ViewForm.DBFDataVidNaklGridTableView1.DataController.RecordCount := TaxInvoicesDM.IMPORT.RecordCount;
      TaxInvoicesDM.IMPORT.First;
      for i := 0 to TaxInvoicesDM.IMPORT.RecordCount-1 do
      begin
        name_contragent := '';
        name_contragent := TaxInvoicesDM.IMPORT['NAZP'];
        OemToAnsi(PAnsiChar(name_contragent),PAnsiChar(name_contragent));
        Name_Type_Doc := TaxInvoicesDM.IMPORT['WMDTYPESTR'];
        OemToAnsi(PAnsiChar(Name_Type_Doc),PAnsiChar(Name_Type_Doc));

        ViewForm.DBFDataVidNaklGridTableView_NUM_ORDER.DataBinding.DataController.Values[i,0]          := LastNomer+i;
        ViewForm.DBFDataVidNaklGridTableView_DATA_VIPISKI.DataBinding.DataController.Values[i,1]       := TaxInvoicesDM.IMPORT['DATEV'] ;
        ViewForm.DBFDataVidNaklGridTableView_NUM_NAKL.DataBinding.DataController.Values[i,2]           := TaxInvoicesDM.IMPORT['NUM'] ;
        ViewForm.DBFDataVidNaklGridTableView_NAME_TYPE_DOCUMENT.DataBinding.DataController.Values[i,3] := Name_Type_Doc;
        ViewForm.DBFDataVidNaklGridTableView_NAME_CUSTOMER.DataBinding.DataController.Values[i,4]      := name_contragent ;

        if ((TaxInvoicesDM.IMPORT['IPN'] = '') or (TaxInvoicesDM.IMPORT['IPN'] = null)) then
          ViewForm.DBFDataVidNaklGridTableView_IPN_CUSTOMER.DataBinding.DataController.Values[i,5] := 0
        else
          ViewForm.DBFDataVidNaklGridTableView_IPN_CUSTOMER.DataBinding.DataController.Values[i,5] := TaxInvoicesDM.IMPORT['IPN'];

        ViewForm.DBFDataVidNaklGridTableView_SUMMA_ALL_PDV.DataBinding.DataController.Values[i,6]    := TaxInvoicesDM.IMPORT['ZAGSUM'];
        ViewForm.DBFDataVidNaklGridTableView_SUMMA_TAXABLE_20.DataBinding.DataController.Values[i,7] := TaxInvoicesDM.IMPORT['BAZOP20'];
        ViewForm.DBFDataVidNaklGridTableView_SUMMA_PDV_20.DataBinding.DataController.Values[i,8]     := TaxInvoicesDM.IMPORT['SUMPDV'];
        ViewForm.DBFDataVidNaklGridTableView_SUMMA_TAXABLE_0.DataBinding.DataController.Values[i,9]  := TaxInvoicesDM.IMPORT['BAZOP0'];
        ViewForm.DBFDataVidNaklGridTableView_SUMMA_EXEMPT.DataBinding.DataController.Values[i,10]    := TaxInvoicesDM.IMPORT['ZVILN'];
        ViewForm.DBFDataVidNaklGridTableView_SUMMA_EXPORT.DataBinding.DataController.Values[i,11]    := TaxInvoicesDM.IMPORT['EXPORT'];
        TaxInvoicesDM.IMPORT.Next;
      end;
    end;
    ViewForm.ShowModal;

    if ViewForm.ModalResult = mrOk then
    begin
     TaxInvoicesDM.WriteTransaction.StartTransaction;
     wf:=ShowWaitForm(Application.MainForm,wfImportData);
     ProgressBar.Properties.Max := TaxInvoicesDM.IMPORT.RecordCount;
     //---------------------импорт выданных накладных
     if (TaxInvoicesDM.IMPORT.RecordCount)<>0 then
     begin
      for i :=0 to ViewForm.DBFDataVidNaklGridTableView1.DataController.RecordCount - 1 do
      begin
       //поиск номера
       TaxInvoicesDM.pFIBStoredProc.StoredProcName                 := 'TI_LAST_NOMER_NAKL_SEARCH';
       TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_REESTR').Value := ReestrParam.Id_reestr;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('TYPE_NAKL').Value := 1; //выданные накладные
       TaxInvoicesDM.pFIBStoredProc.ExecProc;

       LastNumVidNakl := TaxInvoicesDM.pFIBStoredProc.ParamByName('LAST_NUM_ORDER').Value;

       //поиск кода

       Id_Type_Doc   := 0;
       Name_Type_Doc := '';
       CharCod       := ViewForm.DBFDataVidNaklGridTableView_NAME_TYPE_DOCUMENT.DataBinding.DataController.Values[i,3];

       //TaxInvoicesDM.WriteTransaction.StartTransaction;
       TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_TYPE_DOC_SEARCH';
       TaxInvoicesDM.pFIBStoredProc.ParamByName('KOD').Value   := CharCod;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('IDSPR').Value := 2;
       TaxInvoicesDM.pFIBStoredProc.ExecProc;
       //TaxInvoicesDM.WriteTransaction.Commit;
       Id_Type_Doc   := TaxInvoicesDM.pFIBStoredProc.ParamByName('id_type_doc').Value;
       name_type_doc := TaxInvoicesDM.pFIBStoredProc.ParamByName('name_type_doc').Value;
       // добавление записи в таблицу выданных накладных
       // TaxInvoicesDM.WriteTransaction.StartTransaction;
       TaxInvoicesDM.pFIBStoredProc.StoredProcName                          := 'TI_SP_VID_NAKL_INS';
       TaxInvoicesDM.pFIBStoredProc.ParamByName('data_vipiski').Value       := StrToDate(ViewForm.DBFDataVidNaklGridTableView_DATA_VIPISKI.DataBinding.DataController.Values[i,1]);
       TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value           := ViewForm.DBFDataVidNaklGridTableView_NUM_NAKL.DataBinding.DataController.Values[i,2];
       TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_ORDER').Value          := LastNumVidNakl;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value   := Id_Type_Doc;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value := name_type_doc;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value        := 0;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value      := ViewForm.DBFDataVidNaklGridTableView_NAME_CUSTOMER.DataBinding.DataController.Values[i,4];
       TaxInvoicesDM.pFIBStoredProc.ParamByName('ipn_customer').Value       := ViewForm.DBFDataVidNaklGridTableView_IPN_CUSTOMER.DataBinding.DataController.Values[i,5];
       TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_USER_CREATE').Value      := TaxInvoicesUser.id_user;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_USER_CREATE').Value    := TaxInvoicesUser.name_user;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('date_time_create').Value    := Now;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_IMPORT').Value           := 1;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_SYSTEM').Value         := name_subdivision;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('id_subdivision').Value        := id_subdivision;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SCHET_IMPORT').Value     := 0;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_PDV_20').Value        := ViewForm.DBFDataVidNaklGridTableView_SUMMA_PDV_20.DataBinding.DataController.Values[i,8];
       TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_20').Value    := ViewForm.DBFDataVidNaklGridTableView_SUMMA_TAXABLE_20.DataBinding.DataController.Values[i,7];
       TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_0').Value     := ViewForm.DBFDataVidNaklGridTableView_SUMMA_TAXABLE_0.DataBinding.DataController.Values[i,9];
       TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT').Value        := ViewForm.DBFDataVidNaklGridTableView_SUMMA_EXEMPT.DataBinding.DataController.Values[i,10];
       TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_EXPORT').Value        := ViewForm.DBFDataVidNaklGridTableView_SUMMA_EXPORT.DataBinding.DataController.Values[i,11];
       TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_KORIG').Value            := 0;// ?
       TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value        := 0;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_SIGN').Value             := 0;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := 0;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := '';
       TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_REESTR').Value           := ReestrParam.Id_reestr;;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL_DOCUMENT').Value    := StrToInt('-1');
       TaxInvoicesDM.pFIBStoredProc.ParamByName('pk_id').Value               := 0;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('is_import').Value           := 1;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_LGOTA').Value            := 0;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_LGOTA').Value          := '';
       TaxInvoicesDM.pFIBStoredProc.ExecProc;
       id_vid_nakl := TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_').Value;
       // проверка настройки подразделений
       TaxInvoicesDM.pFIBStoredProc.StoredProcName                      := 'TI_BUDGET_NDS_IMPORT_PROVERKA';
       TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SUBDIVISION').Value := ID_SUBDIVISION;
       if (ViewForm.DBFDataVidNaklGridTableView_SUMMA_PDV_20.DataBinding.DataController.Values[i,8] <> 0) then
        begin
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NDS').Value := 1;
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value := 1;
        end
       else
        begin
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NDS').Value := 0;
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value := 0;
        end;

       if (ViewForm.DBFDataVidNaklGridTableView_SUMMA_PDV_20.DataBinding.DataController.Values[i,8] <> 0) then
        begin
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value := 1;
        end
       else
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value := 0;

       TaxInvoicesDM.pFIBStoredProc.ExecProc;

       if (TaxInvoicesDM.pFIBStoredProc.ParamByName('OUT').Value = 1)then
       begin
        TiShowMessage('Виникла помилка!',TaxInvoicesDM.pFIBStoredProc.ParamByName('error_message').Value,mtError,[mbOK]);
        TaxInvoicesDM.WriteTransaction.Rollback;
        CloseWaitForm(wf);
        Exit;
       end;

       // добавление бюджетов в таблицу TI_BUDGET_NDS
       TaxInvoicesDM.pFIBStoredProc.StoredProcName                      := 'TI_BUDGET_NDS_IMPORT';
       TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SUBDIVISION').Value := ID_SUBDIVISION;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL').Value        := id_vid_nakl;
       TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_VID').Value         := 1;

       if (ViewForm.DBFDataVidNaklGridTableView_SUMMA_PDV_20.DataBinding.DataController.Values[i,8] <> 0) then
        begin
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NDS').Value        := 1;
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value    := 1;
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_not_nds').Value := ViewForm.DBFDataVidNaklGridTableView_SUMMA_TAXABLE_20.DataBinding.DataController.Values[i,7];
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_nds').Value     := ViewForm.DBFDataVidNaklGridTableView_SUMMA_PDV_20.DataBinding.DataController.Values[i,8];
        end
       else
        begin
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NDS').Value        := 0;
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value    := 0;
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_not_nds').Value := ViewForm.DBFDataVidNaklGridTableView_SUMMA_EXEMPT.DataBinding.DataController.Values[i,10];
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_nds').Value     := 0;
        end;

       TaxInvoicesDM.pFIBStoredProc.ExecProc;


       //добавление проводки по этой налоговой накладной
       //проверка - необходимо ли отражать её в бухгалтерию
       if (ViewForm.DBFDataVidNaklGridTableView_SUMMA_PDV_20.DataBinding.DataController.Values[i,8] <> 0)then
       begin
         //добавление проводок в буфера
         TaxInvoicesDM.pFIBStoredProc.StoredProcName                          := 'TI_PROVODKA_VID_NAKL';
         TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_VID_NAKL').Value        := id_vid_nakl;
         TaxInvoicesDM.pFIBStoredProc.ParamByName('IP_ADRESS_COMPUTER').Value := TaxInvoicesUser.ip_computer;
         TaxInvoicesDM.pFIBStoredProc.ExecProc;

         //TaxInvoicesDM.WriteTransaction.Commit;
         //TaxInvoicesDM.WriteTransaction.StartTransaction;
         // добавление проводки
         KEY_SESSION := TaxInvoicesDM.pFIBStoredProc.ParamByName('KEY_SESSION_DOC').value;
         workdate    := TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_PROV').value;
         //ShowMessage(IntToStr(KEY_SESSION));

         STRU.KEY_SESSION   := KEY_SESSION;
         STRU.WORKDATE      := WORKDATE;
         STRU.DBHANDLE      := TaxInvoicesDM.DB.Handle;
         STRU.TRHANDLE      := TaxInvoicesDM.WriteTransaction.Handle;
         STRU.KERNEL_ACTION := 1;
         STRU.ID_USER       := TaxInvoicesUser.id_user;

         try
           DoResult:=Kernel.KernelDo(@STRU);
         except
          on E:Exception do
          begin
            ShowMessage('Помилка ядра ' + E.Message);
            Exit;
          end;
         end;

        if not DoResult then
        begin
          ErrorList := Kernel.GetDocErrorsListEx(@STRU);

         s := '';
         for j:=0 to ErrorList.Count - 1 do
          begin
            if s <> '' then s := s + #13;
            s := s + ErrorList.Strings[j];
          end;

          ShowMessage(s);
          TaxInvoicesDM.WriteTransaction.Rollback;
          Exit;
        end;
       end;
       ProgressBar.Position:=ProgressBar.Position+1;
      end;//конец цикла
      CloseWaitForm(wf);
      TaxInvoicesDM.WriteTransaction.Commit;
      TiShowMessage('Увага!','Дані Імпортовано.',mtWarning,[mbOK]);
      Close;
     end;
    end;
  end;

  if (is_vid_nakl_ins = 0)then   //полученные накладные
  begin
    TaxInvoicesDM.IMPORT.Close;
    TaxInvoicesDM.IMPORT.Open;

    ViewForm.DBFDataOtrNaklGridTableView1.DataController.RecordCount                         := TaxInvoicesDM.IMPORT.RecordCount+1;
    ViewForm.DBFDataOtrNaklGridTableView_DATA_OTR.DataBinding.ValueTypeClass                 := TcxDateTimeValueType;
    ViewForm.DBFDataOtrNaklGridTableView_DATA_VIPISKI.DataBinding.ValueTypeClass             := TcxDateTimeValueType;
    ViewForm.DBFDataOtrNaklGridTableView_NUM_NAKL.DataBinding.ValueTypeClass                 := TcxStringValueType;
    ViewForm.DBFDataOtrNaklGridTableView_NAME_TYPE_DOCUMENT.DataBinding.ValueTypeClass       := TcxStringValueType;
    ViewForm.DBFDataOtrNaklGridTableView_NAME_PROVIDER.DataBinding.ValueTypeClass            := TcxStringValueType;
    ViewForm.DBFDataOtrNaklGridTableView_IPN_PROVIDER.DataBinding.ValueTypeClass             := TcxStringValueType;
    ViewForm.DBFDataOtrNaklGridTableView_SUMMA_ALL_PDV.DataBinding.ValueTypeClass            := TcxFloatValueType;
    ViewForm.DBFDataOtrNaklGridTableView_SUMMA_20_0_NOT_PDV.DataBinding.ValueTypeClass       := TcxFloatValueType;
    ViewForm.DBFDataOtrNaklGridTableView_SUMMA_20_0_PDV.DataBinding.ValueTypeClass           := TcxFloatValueType;
    ViewForm.DBFDataOtrNaklGridTableView_SUMMA_EXEMPT_NOT_PDV.DataBinding.ValueTypeClass     := TcxFloatValueType;
    ViewForm.DBFDataOtrNaklGridTableView_SUMMA_EXEMPT_PDV.DataBinding.ValueTypeClass         := TcxFloatValueType;
    ViewForm.DBFDataOtrNaklGridTableView_SUMMA_ECON_ACTIV_NOT_PDV.DataBinding.ValueTypeClass := TcxFloatValueType;
    ViewForm.DBFDataOtrNaklGridTableView1_SUMMA_ECON_ACTIV_PDV.DataBinding.ValueTypeClass    := TcxFloatValueType;
    ViewForm.DBFDataOtrNaklGridTableView_SUMMA_DELIVERY_NOT_PDV.DataBinding.ValueTypeClass   := TcxFloatValueType;
    ViewForm.DBFDataOtrNaklGridTableView_SUMMA_DELIVERY_PDV.DataBinding.ValueTypeClass       := TcxFloatValueType;

    // начало импорта полученных налоговых накладных
    if (TaxInvoicesDM.IMPORT.RecordCount <> 0) then
    begin
      // поиск последнего номера в реестре
      LastNomer := 0;
      TaxInvoicesDM.WriteTransaction.StartTransaction;
      TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_LAST_NOMER_NAKL_SEARCH';
      TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_REESTR').Value := TaxInvoicesDM.ReestrDSet['ID_REESTR'];
      TaxInvoicesDM.pFIBStoredProc.ParamByName('TYPE_NAKL').Value := 0;
      TaxInvoicesDM.pFIBStoredProc.ExecProc;
      TaxInvoicesDM.WriteTransaction.Commit;
      LastNomer := TaxInvoicesDM.pFIBStoredProc.ParamByName('LAST_NUM_ORDER').Value;
      ViewForm.DBFDataOtrNaklGridTableView1.DataController.RecordCount := TaxInvoicesDM.IMPORT.RecordCount;
      TaxInvoicesDM.IMPORT.First;
      for i := 0 to TaxInvoicesDM.IMPORT.RecordCount-1 do
      begin
        name_contragent := '';
        name_contragent := TaxInvoicesDM.IMPORT['NAZP'];

        OemToAnsi(PAnsiChar(name_contragent),PAnsiChar(name_contragent));
        Name_Type_Doc := TaxInvoicesDM.IMPORT['WMDTYPESTR'];

        OemToAnsi(PAnsiChar(Name_Type_Doc),PAnsiChar(Name_Type_Doc));
        ViewForm.DBFDataOtrNaklGridTableView_DATA_OTR.DataBinding.DataController.Values[i,0]           :=  TaxInvoicesDM.IMPORT['DATEV'];
        ViewForm.DBFDataOtrNaklGridTableView_DATA_VIPISKI.DataBinding.DataController.Values[i,1]       :=  TaxInvoicesDM.IMPORT['DTVP'];
        ViewForm.DBFDataOtrNaklGridTableView_NUM_NAKL.DataBinding.DataController.Values[i,2]           := LastNomer + i ;
        ViewForm.DBFDataOtrNaklGridTableView_NAME_TYPE_DOCUMENT.DataBinding.DataController.Values[i,3] := Name_Type_Doc ;
        ViewForm.DBFDataOtrNaklGridTableView_NAME_PROVIDER.DataBinding.DataController.Values[i,4]      := name_contragent ;

        if ((TaxInvoicesDM.IMPORT['IPN'] = '') or (TaxInvoicesDM.IMPORT['IPN'] = null)) then
          ViewForm.DBFDataOtrNaklGridTableView_IPN_PROVIDER.DataBinding.DataController.Values[i,5] := 0
        else
          ViewForm.DBFDataOtrNaklGridTableView_IPN_PROVIDER.DataBinding.DataController.Values[i,5] := TaxInvoicesDM.IMPORT['IPN'];

        ViewForm.DBFDataOtrNaklGridTableView_SUMMA_ALL_PDV.DataBinding.DataController.Values[i,6]             := TaxInvoicesDM.IMPORT['ZAGSUM'];
        ViewForm.DBFDataOtrNaklGridTableView_SUMMA_20_0_NOT_PDV.DataBinding.DataController.Values[i,7]        := TaxInvoicesDM.IMPORT['VART7'];
        ViewForm.DBFDataOtrNaklGridTableView_SUMMA_20_0_PDV.DataBinding.DataController.Values[i,8]            := TaxInvoicesDM.IMPORT['SUM8'];
        ViewForm.DBFDataOtrNaklGridTableView_SUMMA_EXEMPT_NOT_PDV.DataBinding.DataController.Values[i,9]      := TaxInvoicesDM.IMPORT['VART9'];
        ViewForm.DBFDataOtrNaklGridTableView_SUMMA_EXEMPT_PDV.DataBinding.DataController.Values[i,10]         := TaxInvoicesDM.IMPORT['SUM10'];
        ViewForm.DBFDataOtrNaklGridTableView_SUMMA_ECON_ACTIV_NOT_PDV.DataBinding.DataController.Values[i,11] := TaxInvoicesDM.IMPORT['VART11'];
        ViewForm.DBFDataOtrNaklGridTableView1_SUMMA_ECON_ACTIV_PDV.DataBinding.DataController.Values[i,12]    := TaxInvoicesDM.IMPORT['SUM12'];
        ViewForm.DBFDataOtrNaklGridTableView_SUMMA_DELIVERY_NOT_PDV.DataBinding.DataController.Values[i,13]   := TaxInvoicesDM.IMPORT['VART13'];
        ViewForm.DBFDataOtrNaklGridTableView_SUMMA_DELIVERY_PDV.DataBinding.DataController.Values[i,14]       := TaxInvoicesDM.IMPORT['SUM14'];
        TaxInvoicesDM.IMPORT.Next;
      end;
      ViewForm.ShowModal;
    end;

    if (ViewForm.ModalResult = mrok) then
    begin
     TaxInvoicesDM.WriteTransaction.StartTransaction;
     wf:=ShowWaitForm(Application.MainForm,wfImportData);
     ProgressBar.Properties.Max := TaxInvoicesDM.IMPORT.RecordCount;
     //---------------------импорт полученных накладных
     if (TaxInvoicesDM.IMPORT.RecordCount)<>0 then
     begin
      for i :=0 to ViewForm.DBFDataOtrNaklGridTableView1.DataController.RecordCount - 1 do
       begin
        //поиск номера
        TaxInvoicesDM.pFIBStoredProc.StoredProcName                 := 'TI_LAST_NOMER_NAKL_SEARCH';
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_REESTR').Value := ReestrParam.Id_reestr;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('TYPE_NAKL').Value := 0; //полученные накладные
        TaxInvoicesDM.pFIBStoredProc.ExecProc;
        LastNumOtrNakl := TaxInvoicesDM.pFIBStoredProc.ParamByName('LAST_NUM_ORDER').Value;

        //поиск кода
        Id_Type_Doc   := 0;
        Name_Type_Doc := '';
        CharCod       := ViewForm.DBFDataOtrNaklGridTableView_NAME_TYPE_DOCUMENT.DataBinding.DataController.Values[i,3];

        TaxInvoicesDM.pFIBStoredProc.StoredProcName := 'TI_TYPE_DOC_SEARCH';
        TaxInvoicesDM.pFIBStoredProc.ParamByName('KOD').Value   := CharCod;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IDSPR').Value := 1; // полученные- 1 выданные- 2
        TaxInvoicesDM.pFIBStoredProc.ExecProc;

        if (TaxInvoicesDM.pFIBStoredProc.ParamByName('id_type_doc').Value = null) then
        begin
          Id_Type_Doc   := 0;
          Name_Type_Doc := '';
        end
        else
        begin
          Id_Type_Doc   := TaxInvoicesDM.pFIBStoredProc.ParamByName('id_type_doc').Value;
          name_type_doc := TaxInvoicesDM.pFIBStoredProc.ParamByName('name_type_doc').Value;
        end;
        //Id_Type_Doc   := TaxInvoicesDM.pFIBStoredProc.ParamByName('id_type_doc').Value;
        // name_type_doc := TaxInvoicesDM.pFIBStoredProc.ParamByName('name_type_doc').Value;

        // добавление записи в таблицу полученных накладных
        TaxInvoicesDM.pFIBStoredProc.StoredProcName                          := 'TI_SP_OTR_NAKL_INS';
        TaxInvoicesDM.pFIBStoredProc.ParamByName('DATA_OTR').Value           := StrToDate(ViewForm.DBFDataOtrNaklGridTableView_DATA_OTR.DataBinding.DataController.Values[i,0]);
        TaxInvoicesDM.pFIBStoredProc.ParamByName('DATA_VIPISKI').Value       := StrToDate(ViewForm.DBFDataOtrNaklGridTableView_DATA_VIPISKI.DataBinding.DataController.Values[i,1]);
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value           := ViewForm.DBFDataOtrNaklGridTableView_NUM_NAKL.DataBinding.DataController.Values[i,2];
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NUM_ORDER').Value          := LastNumOtrNakl;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value   := Id_Type_Doc;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value := name_type_doc;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_PROVIDER').Value        := 0;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_PROVIDER').Value      := ViewForm.DBFDataOtrNaklGridTableView_NAME_PROVIDER.DataBinding.DataController.Values[i,4];
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IPN_PROVIDER').Value       := ViewForm.DBFDataOtrNaklGridTableView_IPN_PROVIDER.DataBinding.DataController.Values[i,5];
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_USER_CREATE').Value     := TaxInvoicesUser.id_user;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_USER_CREATE').Value   := TaxInvoicesUser.name_user;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('date_time_create').Value   := Now;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('pk_id').Value              := 0;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('is_import').Value          := 1;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_20_0_NOT_PDV').Value := ViewForm.DBFDataOtrNaklGridTableView_SUMMA_20_0_NOT_PDV.DataBinding.DataController.Values[i,7];
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_20_0_PDV').Value     := ViewForm.DBFDataOtrNaklGridTableView_SUMMA_20_0_PDV.DataBinding.DataController.Values[i,8];
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT_NOT_PDV').Value     := ViewForm.DBFDataOtrNaklGridTableView_SUMMA_EXEMPT_NOT_PDV.DataBinding.DataController.Values[i,9];
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT_PDV').Value         := ViewForm.DBFDataOtrNaklGridTableView_SUMMA_EXEMPT_PDV.DataBinding.DataController.Values[i,10];
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_ECON_ACTIV_NOT_PDV').Value := ViewForm.DBFDataOtrNaklGridTableView_SUMMA_ECON_ACTIV_NOT_PDV.DataBinding.DataController.Values[i,11];
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_ECON_ACTIV_PDV').Value     := ViewForm.DBFDataOtrNaklGridTableView1_SUMMA_ECON_ACTIV_PDV.DataBinding.DataController.Values[i,12];
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_DELIVERY_NOT_PDV').Value   := ViewForm.DBFDataOtrNaklGridTableView_SUMMA_DELIVERY_NOT_PDV.DataBinding.DataController.Values[i,13];
        TaxInvoicesDM.pFIBStoredProc.ParamByName('SUMMA_DELIVERY_PDV').Value       := ViewForm.DBFDataOtrNaklGridTableView_SUMMA_DELIVERY_PDV.DataBinding.DataController.Values[i,14];
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_KORIG').Value            := 0;// ?
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value        := 0;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := 0;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := '';
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SUBDIVISION').Value      := id_subdivision;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_REESTR').Value           := ReestrParam.Id_reestr;;
        TaxInvoicesDM.pFIBStoredProc.ExecProc;
        //TaxInvoicesDM.WriteTransaction.Commit;
        id_otr_nakl := TaxInvoicesDM.pFIBStoredProc.ParamByName('id_otr_nakl_').Value;
        // проверка настройки подразделений
        TaxInvoicesDM.pFIBStoredProc.StoredProcName                      := 'TI_BUDGET_NDS_IMPORT_PROVERKA';
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SUBDIVISION').Value := ID_SUBDIVISION;
        if (ViewForm.DBFDataOtrNaklGridTableView_SUMMA_20_0_PDV.DataBinding.DataController.Values[i,8] <> 0) then
         begin
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NDS').Value := 1;
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value := 1;
         end
        else
         begin
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NDS').Value := 0;
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value := 0;
         end;

        if (ViewForm.DBFDataOtrNaklGridTableView_SUMMA_20_0_PDV.DataBinding.DataController.Values[i,8] <> 0) then
         begin
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value := 1;
         end
        else
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value := 0;

        TaxInvoicesDM.pFIBStoredProc.ExecProc;

        if (TaxInvoicesDM.pFIBStoredProc.ParamByName('OUT').Value = 1)then
        begin
          TiShowMessage('Виникла помилка!',TaxInvoicesDM.pFIBStoredProc.ParamByName('error_message').Value,mtError,[mbOK]);
          TaxInvoicesDM.WriteTransaction.Rollback;
          CloseWaitForm(wf);
          Exit;
        end;

        // добавление бюджетов в таблицу TI_BUDGET_NDS
        TaxInvoicesDM.pFIBStoredProc.StoredProcName                      := 'TI_BUDGET_NDS_IMPORT';
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_SUBDIVISION').Value := ID_SUBDIVISION;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_NAKL').Value        := id_otr_nakl;
        TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_VID').Value         := 0;

        if (ViewForm.DBFDataOtrNaklGridTableView_SUMMA_20_0_PDV.DataBinding.DataController.Values[i,8] <> 0) then
         begin
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NDS').Value        := 1;
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value    := 1;
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_not_nds').Value := ViewForm.DBFDataOtrNaklGridTableView_SUMMA_20_0_NOT_PDV.DataBinding.DataController.Values[i,7];
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_nds').Value     := ViewForm.DBFDataOtrNaklGridTableView_SUMMA_20_0_PDV.DataBinding.DataController.Values[i,8];
         end
        else
         begin
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NDS').Value        := 0;
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IS_NOT_NDS').Value    := 0;
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_not_nds').Value := ViewForm.DBFDataOtrNaklGridTableView_SUMMA_EXEMPT_NOT_PDV.DataBinding.DataController.Values[i,9];
          TaxInvoicesDM.pFIBStoredProc.ParamByName('summa_nds').Value     := 0;
         end;

        TaxInvoicesDM.pFIBStoredProc.ExecProc;

        //добавление проводки по этой налоговой накладной
        //проверка - необходимо ли отражать её в бухгалтерию
        if (ViewForm.DBFDataOtrNaklGridTableView_SUMMA_20_0_PDV.DataBinding.DataController.Values[i,8] <> 0)then
        begin
          //добавление проводок в буфера
          TaxInvoicesDM.pFIBStoredProc.StoredProcName                          := 'TI_PROVODKA_OTR_NAKL';
          TaxInvoicesDM.pFIBStoredProc.ParamByName('ID_OTR_NAKL').Value        := id_otr_nakl;
          TaxInvoicesDM.pFIBStoredProc.ParamByName('IP_ADRESS_COMPUTER').Value := TaxInvoicesUser.ip_computer;
          TaxInvoicesDM.pFIBStoredProc.ExecProc;

          //TaxInvoicesDM.WriteTransaction.Commit;
          //TaxInvoicesDM.WriteTransaction.StartTransaction;
          // добавление проводки
          KEY_SESSION := TaxInvoicesDM.pFIBStoredProc.ParamByName('KEY_SESSION_DOC').value;
          workdate    := TaxInvoicesDM.pFIBStoredProc.ParamByName('DATE_PROV').value;
          //ShowMessage(IntToStr(KEY_SESSION));

          STRU.KEY_SESSION   := KEY_SESSION;
          STRU.WORKDATE      := WORKDATE;
          STRU.DBHANDLE      := TaxInvoicesDM.DB.Handle;
          STRU.TRHANDLE      := TaxInvoicesDM.WriteTransaction.Handle;
          STRU.KERNEL_ACTION := 1;
          STRU.ID_USER       := TaxInvoicesUser.id_user;

          try
            DoResult:=Kernel.KernelDo(@STRU);
          except
           on E:Exception do
           begin
             ShowMessage('Помилка ядра ' + E.Message);
             Exit;
           end;
          end;

         if not DoResult then
         begin
           ErrorList := Kernel.GetDocErrorsListEx(@STRU);
           s := '';
          for j:=0 to ErrorList.Count - 1 do
           begin
             if s <> '' then s := s + #13;
             s := s + ErrorList.Strings[j];
           end;
           ShowMessage(s);
           TaxInvoicesDM.WriteTransaction.Rollback;
           Exit;
         end;
        end;
        ProgressBar.Position:=ProgressBar.Position+1;
       end;
      CloseWaitForm(wf);
      TaxInvoicesDM.WriteTransaction.Commit;
      TiShowMessage('Увага!','Дані Імпортовано.',mtWarning,[mbOK]);
      Close;
     end;
    end
  end;   
end;

procedure TImportReestrForm.eFileNameEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  //SaveDialog.FileName:='Reestr_vid_Nakl.dbf';
 if OpenDialog.Execute then
   begin
      eFileNameEdit.Text:=OpenDialog.FileName;
      TaxInvoicesDM.IMPORT.DatabaseName:=ExtractFileDir(OpenDialog.FileName);
      TaxInvoicesDM.IMPORT.TableName:=ExtractFileName(OpenDialog.FileName);
   end;
end;

procedure TImportReestrForm.SubdivisionButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter   : TTiSimpleParam;
  SubDivision : Variant;
begin
  Parameter           := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesDM.DB.Handle;
  Parameter.Owner     := self;
  SubDivision         := DoFunctionFromPackage(Parameter,Subdivision_Const);
  Parameter.Destroy;

  If VarArrayDimCount(SubDivision)>0 then
  begin
    SubdivisionButtonEdit.Text   := SubDivision[1];
    name_subdivision             := SubDivision[1];
    id_subdivision               := SubDivision[0];
    SubdivisionButtonEdit.SetFocus;
  end;
end;

end.
