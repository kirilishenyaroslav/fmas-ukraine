unit TITaxInvoicesKorig_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,IBase,TiCommonProc,TITaxinvoiceskorig_DM, cxButtonEdit,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxBar,
  TiCommonStyles, cxGridBandedTableView, dxBarExtItems, dxStatusBar,
  TITaxInvoicesKorig_AddInNakl,
  TICommonLoader,dogLoaderUnit, LoaderUnit, AArray,cxLookAndFeelPainters, cxButtons, ComCtrls,
  TiCommonTypes,TiMessages, Registry, cxGridDBBandedTableView,  cxLabel, cxCheckBox, cxMemo, cxCurrencyEdit,
  Buttons, TITaxInvoicesKorig_Budget, kernel, TITaxInvoicesKorig_EditTax, TICommonDates;

type TTaxInvocesUser = record
 id_user:Integer;
 name_user:string;
 name_computer:string;
 ip_computer:string;
end;

type
  TTaxInvoicesKorigAddForm = class(TForm)
    Panel1: TPanel;
    PodNaklLabel: TLabel;
    DataVipLabel: TLabel;
    OsobaProdavecLabel: TLabel;
    OsobaPokupLabel: TLabel;
    IPNProdavecLabel: TLabel;
    IPNPokupLabel: TLabel;
    PlaceProdavecLabel: TLabel;
    TelProdavecLabel: TLabel;
    NumReestrProdavecLabel: TLabel;
    NumReestrPokupLabel: TLabel;
    OsobaPokupButtonEdit: TcxButtonEdit;
    EdrpLabel: TLabel;
    PostavkaButtonEdit: TcxButtonEdit;
    RozraxunokButtonEdit: TcxButtonEdit;
    OsobaProdavecTextEdit: TcxTextEdit;
    IPNProdavecTextEdit: TcxTextEdit;
    PlaceProdavecTextEdit: TcxTextEdit;
    TelProdavecTextEdit: TcxTextEdit;
    NaklInfoAllPanel: TPanel;
    Panel3: TPanel;
    NaklBarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    UpdateButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    SpecialNotesButtonEdit: TcxButtonEdit;
    PodZobButtonEdit: TcxButtonEdit;
    PodKreditButtonEdit: TcxButtonEdit;
    EdrpTextEdit: TcxTextEdit;
    YesButton: TcxButton;
    IPNPokupTextEdit: TcxTextEdit;
    TelPokupTextEdit: TcxTextEdit;
    NumReestrPokupTextEdit: TcxTextEdit;
    NumReestrProdavecTextEdit: TcxTextEdit;
    FirstAllStatusBar: TdxStatusBar;
    SummaAllPDVStatusBar: TdxStatusBar;
    dxStatusBar9: TdxStatusBar;
    EditingButton: TcxButton;
    NaklInsPopupMenu: TdxBarPopupMenu;
    DeliveryInsBarButton: TdxBarButton;
    TransportInsBarButton: TdxBarButton;
    TaraInsBarButton: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    NaklDeliveryGridBanded: TcxGrid;
    NaklDeliveryGridDBBandedTableView: TcxGridDBBandedTableView;
    NaklDeliveryGridLevel: TcxGridLevel;
    NaklDeliveryGridDBBandedTableView_date_korrect: TcxGridDBBandedColumn;
    NaklDeliveryGridDBBandedTableView_name_range_of_delivery: TcxGridDBBandedColumn;
    NaklDeliveryGridDBBandedTableView_reason_korrect: TcxGridDBBandedColumn;
    NaklDeliveryGridDBBandedTableView_name_kod_tovar: TcxGridDBBandedColumn;
    NaklDeliveryGridDBBandedTableView_edit_kolvo: TcxGridDBBandedColumn;
    NaklDeliveryGridDBBandedTableView_edit_price: TcxGridDBBandedColumn;
    NaklDeliveryGridDBBandedTableView_main_stavka: TcxGridDBBandedColumn;
    NaklDeliveryGridDBBandedTableView_edit_price_cost: TcxGridDBBandedColumn;
    NaklDeliveryGridDBBandedTableView_edit_kolvo_cost: TcxGridDBBandedColumn;
    NaklUpdBarPopupMenu: TdxBarPopupMenu;
    NaklDelBarPopupMenu: TdxBarPopupMenu;
    DeliveryUpdBarButton: TdxBarButton;
    TransportUpdBarButton: TdxBarButton;
    TaraUpdBarButton: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    DeliveryDelBarButton: TdxBarButton;
    TransportDelBarButton: TdxBarButton;
    NumOrderLabel: TLabel;
    PodKreditCheckBox: TcxCheckBox;
    PodZobCheckBox: TcxCheckBox;
    OsoblPrimCheckBox: TcxCheckBox;
    VLabel: TcxLabel;
    DataTermsdelDateEdit: TcxDateEdit;
    NumDogLabel: TcxLabel;
    NumTermsDelTextEdit: TcxTextEdit;
    TaraDelBarButton: TdxBarButton;
    DataVipDateEdit: TcxDateEdit;
    is_issued_buyer_CheckBox: TcxCheckBox;
    is_erpn_CheckBox: TcxCheckBox;
    is_copy_CheckBox: TcxCheckBox;
    CauseLabel: TLabel;
    PostavkaCheckBox: TcxCheckBox;
    RozraxunokCheckBox: TcxCheckBox;
    PhoneCheckBox: TCheckBox;
    SavePhoneButton: TcxButton;
    FullNameCheckBox: TCheckBox;
    SaveFullNameButton: TcxButton;
    FullNameMemo: TMemo;
    PlacePokupCheckBox: TCheckBox;
    PlacePokupMemo: TcxMemo;
    SavePlacePokupButton: TcxButton;
    BudgetButton: TdxBarLargeButton;
    EditTaxButton: TdxBarLargeButton;
    Label2: TLabel;
    DateNaklDateEdit: TcxDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    DateTermsDeliveryDateEdit: TcxDateEdit;
    Label5: TLabel;
    NumTermsDeliveryTextEdit: TcxTextEdit;
    PodNumTextEdit: TcxTextEdit;
    NumOrderTextEdit: TcxTextEdit;
    NaklDeliveryGridDBBandedTableView_NAME_MEASURES: TcxGridDBBandedColumn;
    NaklDeliveryGridDBBandedTableView_null_stavka: TcxGridDBBandedColumn;
    NaklDeliveryGridDBBandedTableView_summa_not_pdv: TcxGridDBBandedColumn;
    DateOplDateEdit: TcxDateEdit;
    DateOplLabel: TLabel;
    Label1: TLabel;
    NumOrdInReestrTextEdit: TcxTextEdit;
    OznakaCheckBox: TcxCheckBox;
    OznakaTextEdit: TcxTextEdit;
    DatePodpisDateEdit: TcxDateEdit;
    Label6: TLabel;
    procedure AddButtonClick(Sender: TObject);
    procedure SpecialNotesButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure PostavkaButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure RozraxunokButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OsobaPokupButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure IPNPokupButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure PlacePokupButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure TelPokupButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure NumReestrPokupButtonEditPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure EdrpButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure NumReestrProdavecButtonEditPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure PodKreditButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure PodZobButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CancelButtonClick(Sender: TObject);
    procedure YesButtonClick(Sender: TObject);
    procedure EditingButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DeliveryInsBarButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure DeliveryUpdBarButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure DeliveryDelBarButtonClick(Sender: TObject);
    procedure TransportInsBarButtonClick(Sender: TObject);
    procedure TransportUpdBarButtonClick(Sender: TObject);
    procedure TransportDelBarButtonClick(Sender: TObject);
    procedure TaraInsBarButtonClick(Sender: TObject);
    procedure PodZobCheckBoxClick(Sender: TObject);
    procedure PodKreditCheckBoxClick(Sender: TObject);
    procedure OsoblPrimCheckBoxClick(Sender: TObject);
    procedure TaraUpdBarButtonClick(Sender: TObject);
    procedure TaraDelBarButtonClick(Sender: TObject);
    procedure DataVipDateEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure PodNumTextEditKeyPress(Sender: TObject; var Key: Char);
    procedure OsobaPokupButtonEditKeyPress(Sender: TObject; var Key: Char);
    procedure NumOrderTextEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure PostavkaButtonEditKeyPress(Sender: TObject; var Key: Char);
    procedure DataTermsdelDateEditKeyPress(Sender: TObject; var Key: Char);
    procedure NumTermsDelTextEditKeyPress(Sender: TObject; var Key: Char);
    procedure RozraxunokButtonEditKeyPress(Sender: TObject; var Key: Char);
    procedure PodZobButtonEditKeyPress(Sender: TObject; var Key: Char);
    procedure PodKreditButtonEditKeyPress(Sender: TObject; var Key: Char);
    procedure SpecialNotesButtonEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure IPNPokupTextEditKeyPress(Sender: TObject; var Key: Char);
    procedure PostavkaCheckBox1Click(Sender: TObject);
    procedure RozraxunokCheckBox1Click(Sender: TObject);
    procedure RozraxunokCheckBoxClick(Sender: TObject);
    procedure PostavkaCheckBoxClick(Sender: TObject);
    procedure PhoneCheckBoxClick(Sender: TObject);
    procedure FullNameCheckBoxClick(Sender: TObject);
    procedure SavePhoneButtonClick(Sender: TObject);
    procedure SaveFullNameButtonClick(Sender: TObject);
    procedure NumOrderTextEditExit(Sender: TObject);
    procedure DataVipDateEditKeyPress(Sender: TObject; var Key: Char);
    procedure PlacePokupCheckBoxClick(Sender: TObject);
    procedure SavePlacePokupButtonClick(Sender: TObject);
    procedure TypeDocumentButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ToolButton_addClick(Sender: TObject);
    procedure SpeedButton_redClick(Sender: TObject);
    procedure ToolButton_delClick(Sender: TObject);
    procedure BudgetButtonClick(Sender: TObject);
    procedure NoteCheckBoxClick(Sender: TObject);
    procedure NoteButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditTaxButtonClick(Sender: TObject);
    procedure DateNaklDateEditKeyPress(Sender: TObject; var Key: Char);
    procedure OznakaCheckBoxClick(Sender: TObject);
    procedure DataPodpisCheckBoxClick(Sender: TObject);
  private
    id_Customer            : Integer;
    id_vid_nakl_Ins        : Integer;
    id_vid_nakl_doc_Ins    : Integer;
    id_Reestr_Ins          : Integer;
    id_Seller              : Integer;
    PRes                   : TTITaxInvoicesInfo;
    pLanguageIndex         : Byte;
    PDb_Handle             : TISC_DB_HANDLE;
    pStylesDM              : TStyleDM;
    PParameter             : TTITaxInvoicesInfo;
    TaxInvoicesUser        : TTaxInvocesUser;
    procedure ReadReg;
    procedure WriteReg;
    procedure FirstSummaAll;
    procedure TransportCosts;
    procedure MortgageTara;
    procedure ClearStatusBars;
    procedure EnableButtons(id:Integer);
  public
    id_university : Integer;
    provodka :Boolean;
    full_name_customer :string;
    TaxInvoicesKorigDM      : TTaxInvoicesKorigDM;
    procedure DoPrint; //старая налоговая
    procedure DoPrintDecember;  // новая накладная первый экземпляр
    procedure DoPrintDecemberTwoEkz;  // новая накладная второй экземпляр
    procedure DoPrintKorig; //печать расчета корректировки
    procedure DoPrintKorigTwoEkz; //печать расчета корректировки
    procedure replaceAbreviatures(short_name:string);
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;id_Vid_Nakl:Integer;id_Vid_Nakl_Doc:Integer;id_Reestr:Integer);reintroduce;
    property Res:TTITaxInvoicesInfo read PRes;
    property Parameter:TTITaxInvoicesInfo read PParameter;
  end;



var
  TaxInvoicesKorigAddForm: TTaxInvoicesKorigAddForm;

implementation

uses  FIBQuery,LoadDogManedger;

{$R *.dfm}
constructor TTaxInvoicesKorigAddForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE; id_Vid_Nakl:Integer;id_Vid_Nakl_Doc:Integer;id_Reestr:Integer);
var
  pk_id           : int64;
  sum_All_Nds     : Double;
  sum_All_Not_NDS : Double;
  i : Integer;
begin
  inherited Create(AOwner);
  PDb_Handle            := Db_Handle;
  id_vid_nakl_Ins       := id_Vid_Nakl;     //id накладной из справочника
  id_vid_nakl_doc_Ins   := id_Vid_Nakl_Doc; //id накладной (документа)
  id_Reestr_Ins         := id_Reestr;       //id реестра к которой относится документ
  TaxInvoicesKorigDM     := TTaxInvoicesKorigDM.Create(AOwner,Db_Handle);
//******************************************************************************
  pLanguageIndex                   := LanguageIndex;
  //PodNaklLabel.Caption             := GetConst('PodNakl',tcLabel);
  OsobaProdavecLabel.Caption       := GetConst('OsobaProdavec',tcLabel);
  OsobaPokupLabel.Caption          := GetConst('OsobaPokup',tcLabel);
  IPNProdavecLabel.Caption         := GetConst('IPNProdavec',tcLabel);
  IPNPokupLabel.Caption            := GetConst('IPNPokup',tcLabel);
  PlaceProdavecLabel.Caption       := GetConst('PlaceProdavec',tcLabel);
  //PlacePokupLabel.Caption          := GetConst('PlacePokup',tcLabel);
  TelProdavecLabel.Caption         := GetConst('TelProdavec',tcLabel);
  //TelPokupLabel.Caption            := GetConst('TelPokup',tcLabel);
  EdrpLabel.Caption                := GetConst('Edrp',tcLabel);
//*****************************************************************************
  TaxInvoicesKorigDM.UserDSet.Close;
  TaxInvoicesKorigDM.UserDSet.SelectSQL.Text := 'select * from TI_USER_INFO';
  TaxInvoicesKorigDM.UserDSet.Open;
  TaxInvoicesUser.id_user       := TaxInvoiceskorigDM.UserDSet['ID_USER'];
  TaxInvoicesUser.name_user     := TaxInvoicesKorigDM.UserDSet['USER_FIO'];
  TaxInvoicesUser.name_computer := TaxInvoicesKorigDM.UserDSet['HOST_NAME'];
  TaxInvoicesUser.ip_computer   := TaxInvoicesKorigDM.UserDSet['IP_ADRESS'];
//******************************************************************************
   PhoneCheckBox.Checked        := False;
   TelPokupTextEdit.Enabled     := False;
   SavePhoneButton.Visible      := False;

   FullNameCheckBox.Checked     := False;
   FullNameMemo.ReadOnly        := True;
   SaveFullNameButton.Visible   := False;

   PlacePokupCheckBox.Checked         := False;
   PlacePokupMemo.Properties.ReadOnly := True;
   SavePlacePokupButton.Visible       := False;
   //******************************************************************************
    TaxInvoicesKorigDM.Customer_DonnuDSet.Close;
    TaxInvoicesKorigDM.Customer_DonnuDSet.SelectSQL.Text          := 'select * from TI_CUSTOMER_INFO(:id)';
    TaxInvoicesKorigDM.Customer_DonnuDSet.ParamByName('id').Value := null;
    TaxInvoicesKorigDM.Customer_DonnuDSet.Open;
  //******************************************************************************

 if (id_vid_nakl_doc_Ins = -1) then    //вставка документа розрахунок корегування
  begin
    ReadReg;           //чтение из реестра (дополнительные справочники)
    Caption := GetConst('TaxInvEditAddDoc',tcForm);

    TaxInvoicesKorigDM.NaklDeliveryDSet.Close;
    TaxInvoicesKorigDM.NaklDeliveryDSet.SelectSQL.Text := 'select * from TI_SP_VID_NAKL_DOC where ID_VID_NAKL_DOC = -1';
    TaxInvoicesKorigDM.NaklDeliveryDSet.Open;

    TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
    TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                 := 'TI_LAST_NOMER_NAKL_SEARCH';
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_REESTR').Value := id_Reestr_Ins;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('TYPE_NAKL').Value := 1; //выданные накладные
    TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
    TaxInvoicesKorigDM.WriteTransaction.Commit;
    NumOrderTextEdit.Text := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('LAST_NUM_ORDER').AsString;
    NumOrderTextEdit.Text   := NumOrderTextEdit.Text;

    EdrpTextEdit.Text              := '';
    FullNameMemo.Text              := '';
    IPNPokupTextEdit.Text          := '';
    PlacePokupMemo.Text            := '';
    TelPokupTextEdit.Text          := '';
    NumReestrPokupTextEdit.Text    := '';
    OsobaPokupButtonEdit.Text      := '';
    IPNPokupTextEdit.Text          := '';
    NumTermsDeliveryTextEdit.Text  := '';
    PodNumTextEdit.Text            := '';
    DateOplDateEdit.Text           := '';
    DatePodpisDateEdit.Text        := '';
    NumOrdInReestrTextEdit.Text    := '';
    NumTermsDelTextEdit.Text       := '';
    OznakaTextEdit.Text            := '';

    //NoteButtonEdit.Text            := '';
    //NoteCheckBox.Checked           := False;
    //NoteButtonEdit.Enabled         := False;
    DataVipDateEdit.Date           := Now;
    PodZobButtonEdit.Enabled       := False;
    PodKreditButtonEdit.Enabled    := False;
    SpecialNotesButtonEdit.Enabled := False;
    PodZobCheckBox.Checked         := False;
    PodKreditCheckBox.Checked      := False;
    OsoblPrimCheckBox.Checked      := False;
    OznakaCheckBox.Checked         := False;
    OznakaTextEdit.Enabled         := False;
    //NotPDVCheckBox.Checked         := False;
    TelProdavecTextEdit.Text       := TaxInvoicesKorigDM.Customer_DonnuDSet['phone_customer'];
    ClearStatusBars;                    // чистим статус-бары
    EnableButtons(id_vid_nakl_doc_Ins); // делаем кнопки видимыми (невидимыми)

    PodZobButtonEdit.Properties.onButtonClick       := PodZobButtonEditPropertiesButtonClick;
    PodKreditButtonEdit.Properties.onButtonClick    := PodKreditButtonEditPropertiesButtonClick;
    SpecialNotesButtonEdit.Properties.onButtonClick := SpecialNotesButtonEditPropertiesButtonClick;
    PostavkaButtonEdit.Properties.onButtonClick     := PostavkaButtonEditPropertiesButtonClick;
    OsobaPokupButtonEdit.Properties.onButtonClick   := OsobaPokupButtonEditPropertiesButtonClick;
    RozraxunokButtonEdit.Properties.onButtonClick   := RozraxunokButtonEditPropertiesButtonClick;
    //TypeDocumentButtonEdit.Properties.onButtonClick := TypeDocumentButtonEditPropertiesButtonClick;
    //NoteButtonEdit.Properties.onButtonClick         := NoteButtonEditPropertiesButtonClick;

    PodNumTextEdit.Properties.ReadOnly         := False;
    NumOrderTextEdit.Properties.ReadOnly       := False;
    NumTermsDelTextEdit.Properties.ReadOnly    := False;
    PodNumTextEdit.Properties.ReadOnly         := False;
    DataVipDateEdit.Properties.ReadOnly        := False;
    DataTermsdelDateEdit.Properties.ReadOnly   := False;
    IPNPokupTextEdit.Properties.ReadOnly       := False;
    NumOrdInReestrTextEdit.Properties.ReadOnly := False;
    OznakaCheckBox.Properties.ReadOnly         := False;
    OznakaTextEdit.Properties.ReadOnly       := False;
    //NoteTextEdit.Properties.ReadOnly         := False;
    //NotPDVCheckBox.Properties.ReadOnly       := False;

    PodZobButtonEdit.Style.Color       := clWindow;
    PodKreditButtonEdit.Style.Color    := clWindow;
    DataVipDateEdit.Style.Color        := clWindow;
    SpecialNotesButtonEdit.Style.Color := clWindow;
    PostavkaButtonEdit.Style.Color     := clWindow;
    OsobaPokupButtonEdit.Style.Color   := clWindow;
    RozraxunokButtonEdit.Style.Color   := clWindow;
    PodNumTextEdit.Style.Color         := clWindow;
    NumOrderTextEdit.Style.Color       := clWindow;
    DataTermsdelDateEdit.Style.Color   := clWindow;
    NumTermsDelTextEdit.Style.Color    := clWindow;
    IPNPokupTextEdit.Style.Color       := clWindow;
    NumOrdInReestrTextEdit.Style.Color := clWindow;
    //TypeDocumentButtonEdit.Style.Color := clWindow;

    EditingButton.Visible := False;
    AddButton.Enabled     := False;
    UpdateButton.Enabled  := False;
    DeleteButton.Enabled  := False;
    RefreshButton.Enabled := False;
    BudgetButton.Enabled  := False;
    EditTaxButton.Enabled := False;

    is_issued_buyer_CheckBox.Checked := False;
    is_erpn_CheckBox.Checked         := False;
    OsoblPrimCheckBox.Checked        := False;
    SpecialNotesButtonEdit.Enabled   := False;
    is_copy_CheckBox.Checked         := False;
    PostavkaCheckBox.Checked         := False;
    PostavkaButtonEdit.Enabled       := False;
    DataTermsdelDateEdit.Enabled     := False;
    NumTermsDelTextEdit.Enabled      := False;
    RozraxunokCheckBox.Checked       := False;
    RozraxunokButtonEdit.Enabled     := False;

    is_issued_buyer_CheckBox.Properties.ReadOnly := False;
    is_erpn_CheckBox.Properties.ReadOnly         := False;
    is_issued_buyer_CheckBox.Properties.ReadOnly := False;
    OsoblPrimCheckBox.Properties.ReadOnly        := False;
    is_copy_CheckBox.Properties.ReadOnly         := False;
    PostavkaCheckBox.Properties.ReadOnly         := False;
    RozraxunokCheckBox.Properties.ReadOnly       := False;
    PodZobCheckBox.Properties.ReadOnly           := False;
    PodKreditCheckBox.Properties.ReadOnly        := False;
    provodka := True;
  end
 else
  begin
    Caption := GetConst('TaxInvEditUpdDoc',tcForm);
    RefreshButton.Click;
    EnableButtons(id_vid_nakl_doc_Ins);               // делаем кнопки видимыми (невидимыми)

    DataVipDateEdit.Date        := TaxInvoicesKorigDM.VidNaklInfoDSet['DATE_ROZR'];
    EdrpTextEdit.Text           := TaxInvoicesKorigDM.VidNaklInfoDSet['EDRPOU_CUSTOMER'];
    IPNPokupTextEdit.Text       := TaxInvoicesKorigDM.VidNaklInfoDSet['IPN_CUSTOMER'];
    PlacePokupMemo.Text         := TaxInvoicesKorigDM.VidNaklInfoDSet['PLACE_CUSTOMER'];
    TelPokupTextEdit.Text       := TaxInvoicesKorigDM.VidNaklInfoDSet['phone_customer'];;
    NumReestrPokupTextEdit.Text := TaxInvoicesKorigDM.VidNaklInfoDSet['NUMREESTR_CUSTOMER'];
    OsobaPokupButtonEdit.Text   := TaxInvoicesKorigDM.VidNaklInfoDSet['NAME_CUSTOMER'];
    PostavkaButtonEdit.Text     := TaxInvoicesKorigDM.VidNaklInfoDSet['NAME_TERMSDELIVERY'];
    RozraxunokButtonEdit.Text   := TaxInvoicesKorigDM.VidNaklInfoDSet['NAME_FORMCALCULATIONS'];
    IPNPokupTextEdit.Text       := TaxInvoicesKorigDM.VidNaklInfoDSet['IPN_CUSTOMER'];
    PodNumTextEdit.Text         := TaxInvoicesKorigDM.VidNaklInfoDSet['NUM_NAKL'];
    NumOrderTextEdit.Text       := TaxInvoicesKorigDM.VidNaklInfoDSet['num_rozr'];
    NumTermsDelTextEdit.Text    := TaxInvoicesKorigDM.VidNaklInfoDSet['num_termsdelivery'];
    DateNaklDateEdit.Date       := TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_VIPISKI'];
    NumTermsDeliveryTextEdit.Text := TaxInvoicesKorigDM.VidNaklInfoDSet['num_termsdelivery'];
    NumOrdInReestrTextEdit.Text := TaxInvoicesKorigDM.VidNaklInfoDSet['num_order'];
    TelProdavecTextEdit.Text    := TaxInvoicesKorigDM.VidNaklInfoDSet['phone_seller'];

    if (TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_OPL_KORRECT'] = null)then
    begin
      DateOplDateEdit.Text           := '';
    end
    else
    begin
      DateOplDateEdit.Date := TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_OPL_KORRECT'];
    end;

    if ((TaxInvoicesKorigDM.VidNaklInfoDSet['DATE_PODPIS_KORIG'] = null) or (TaxInvoicesKorigDM.VidNaklInfoDSet['DATE_PODPIS_KORIG'] = '01.01.1900')) then
    begin
      DatePodpisDateEdit.Text           := '';
    end
    else
    begin
      DatePodpisDateEdit.Date := TaxInvoicesKorigDM.VidNaklInfoDSet['DATE_PODPIS_KORIG'];
    end;

    //TypeDocumentButtonEdit.Text := TaxInvoicesKorigDM.VidNaklInfoDSet['name_type_document'];
    //NoteTextEdit.Text           := TaxInvoicesKorigDM.VidNaklInfoDSet['note'];

   { if (TaxInvoicesKorigDM.VidNaklInfoDSet['note']<>null) then
    begin
      NoteTextEdit.Text := TaxInvoicesKorigDM.VidNaklInfoDSet['note'];
    end
    else
    begin
      NoteTextEdit.Text := '';
    end;   }

   { if ((TaxInvoicesKorigDM.VidNaklInfoDSet['id_note']<>null) and (TaxInvoicesKorigDM.VidNaklInfoDSet['id_note']<>0))   then
    begin
      NoteButtonEdit.Text := TaxInvoicesKorigDM.VidNaklInfoDSet['note'];
      NoteButtonEdit.Enabled := True;
      NoteCheckBox.Checked := True;
    end
    else
    begin
      NoteButtonEdit.Text    := '';
      NoteButtonEdit.Enabled := False;
      NoteCheckBox.Checked   := False;
    end; }

    if (TaxInvoicesKorigDM.VidNaklInfoDSet['full_name_customer']<>null) then
    begin
      FullNameMemo.Text         := TaxInvoicesKorigDM.VidNaklInfoDSet['full_name_customer'];
      PParameter.Full_name_customer := TaxInvoicesKorigDM.VidNaklInfoDSet['full_name_customer'];
    end
    else
    begin
      FullNameMemo.Text             := '';
      FullNameMemo.ReadOnly         := False;
      FullNameCheckBox.Checked      := True;
      SaveFullNameButton.Visible    := True;
      PParameter.Full_name_customer := '';
    end;

    if (TaxInvoicesKorigDM.VidNaklInfoDSet['NAME_TAX_LIABILITIES']<>'')then
     begin
      PodZobCheckBox.Checked   := True;
      PodZobButtonEdit.Enabled := True;
      PodZobButtonEdit.Text    := TaxInvoicesKorigDM.VidNaklInfoDSet['NAME_TAX_LIABILITIES'];
     end
    else
     begin
      PodZobCheckBox.Checked   := False;
      PodZobButtonEdit.Enabled := False;
      PodZobButtonEdit.Text    := '';
     end;

    if (TaxInvoicesKorigDM.VidNaklInfoDSet['NAME_SPECIALNOTES']<>'')then
     begin
      OsoblPrimCheckBox.Checked      := True;
      SpecialNotesButtonEdit.Enabled := True;
      SpecialNotesButtonEdit.Text    := TaxInvoicesKorigDM.VidNaklInfoDSet['NAME_SPECIALNOTES'];
      PParameter.id_SpecialNotes     := TaxInvoicesKorigDM.VidNaklInfoDSet['id_SpecialNotes'];
      PParameter.Name_SpecialNotes   := TaxInvoicesKorigDM.VidNaklInfoDSet['NAME_SPECIALNOTES'];
      PParameter.Num_SpecialNotes    := TaxInvoicesKorigDM.VidNaklInfoDSet['NUM_SPECIALNOTES'];
     end
    else
     begin
      OsoblPrimCheckBox.Checked      := False;
      SpecialNotesButtonEdit.Enabled := False;
      SpecialNotesButtonEdit.Text    := '';
      PParameter.id_SpecialNotes     := 0;
      PParameter.Name_SpecialNotes   := '';
      PParameter.Num_SpecialNotes    := '';
     end;

    if (TaxInvoicesKorigDM.VidNaklInfoDSet['OZNAKA_NAKL']<>'')then
     begin
      OznakaCheckBox.Checked := True;
      OznakaTextEdit.Enabled := True;
      OznakaTextEdit.Text    := TaxInvoicesKorigDM.VidNaklInfoDSet['OZNAKA_NAKL'];
     end
    else
     begin
      OznakaCheckBox.Checked := False;
      OznakaTextEdit.Enabled := False;
      OznakaTextEdit.Text    := '';
     end;


    if (TaxInvoicesKorigDM.VidNaklInfoDSet['name_termsdelivery']<>'')then
     begin
      PostavkaCheckBox.Checked      := True;
      DataTermsdelDateEdit.Enabled  := True;
      NumTermsDelTextEdit.Enabled   := True;
      PostavkaButtonEdit.Enabled    := True;
      PostavkaButtonEdit.Text       := TaxInvoicesKorigDM.VidNaklInfoDSet['name_termsdelivery'];
      NumTermsDelTextEdit.Text      := TaxInvoicesKorigDM.VidNaklInfoDSet['num_termsdelivery'];
      NumTermsDeliveryTextEdit.Text := TaxInvoicesKorigDM.VidNaklInfoDSet['num_termsdelivery'];

      if (TaxInvoicesKorigDM.VidNaklInfoDSet['data_termsdelivery'] = StrToDate('01.01.1900')) then
      begin
        DataTermsdelDateEdit.Text := '';
        DateTermsDeliveryDateEdit.Text := '';
      end
      else
      begin
       DataTermsdelDateEdit.Date      := TaxInvoicesKorigDM.VidNaklInfoDSet['data_termsdelivery'];
       DateTermsDeliveryDateEdit.Date := TaxInvoicesKorigDM.VidNaklInfoDSet['data_termsdelivery'];
      end;

     end
    else
     begin
      PostavkaCheckBox.Checked     := False;
      DataTermsdelDateEdit.Enabled := False;
      NumTermsDelTextEdit.Enabled  := False;
      PostavkaButtonEdit.Enabled   := False;

      DataTermsdelDateEdit.Text := '';
      NumTermsDelTextEdit.Text  := '';
      PostavkaButtonEdit.Text   := '';
     end;

    if (TaxInvoicesKorigDM.VidNaklInfoDSet['name_formcalculations']<>'')then
     begin
      RozraxunokCheckBox.Checked   := True;
      RozraxunokButtonEdit.Enabled := True;
      RozraxunokButtonEdit.Text    := TaxInvoicesKorigDM.VidNaklInfoDSet['name_formcalculations'];
     end
    else
     begin
      RozraxunokCheckBox.Checked   := False;
      RozraxunokButtonEdit.Enabled := False;
      RozraxunokButtonEdit.Text    := '';
     end;

    if (TaxInvoicesKorigDM.VidNaklInfoDSet['NAME_TAXKREDIT']<>'')then
     begin
      PodKreditCheckBox.Checked   := True;
      PodKreditButtonEdit.Enabled := True;
      PodKreditButtonEdit.Text    := TaxInvoicesKorigDM.VidNaklInfoDSet['NAME_TAXKREDIT'];
     end
    else
     begin
      PodKreditCheckBox.Checked   := False;
      PodKreditButtonEdit.Enabled := False;
      PodKreditButtonEdit.Text    := '';
     end;

    if (TaxInvoicesKorigDM.VidNaklInfoDSet['is_issued_buyer'] = 1)then
      is_issued_buyer_CheckBox.Checked := True
    else
      is_issued_buyer_CheckBox.Checked := False;

    if (TaxInvoicesKorigDM.VidNaklInfoDSet['is_erpn'] = 1)then
      is_erpn_CheckBox.Checked := True
    else
      is_erpn_CheckBox.Checked := False;

    if (TaxInvoicesKorigDM.VidNaklInfoDSet['is_copy'] = 1)then
      is_copy_CheckBox.Checked := True
    else
      is_copy_CheckBox.Checked := False;

   { if (TaxInvoicesKorigDM.VidNaklInfoDSet['IS_NOT_PDV'] = 1)then
      NotPDVCheckBox.Checked := True
    else
      NotPDVCheckBox.Checked := False;}

    // отображение проводок
    for i := 0 to TaxInvoicesKorigDM.RxMemoryData_smet.RecordCount - 1 do
    TaxInvoicesKorigDM.RxMemoryData_smet.Delete;

    TaxInvoicesKorigDM.Smeta_Vid_N_DSet.Close;
    TaxInvoicesKorigDM.Smeta_Vid_N_DSet.SelectSQL.Text := 'select * from TI_BUDGET_NDS_SEL where id_nakl = :id and is_vid = 1';
    TaxInvoicesKorigDM.Smeta_Vid_N_DSet.ParamByName('id').Value := TaxInvoicesKorigDM.VidNaklInfoDSet['id_vid_nakl'];
    TaxInvoicesKorigDM.Smeta_Vid_N_DSet.Open;
    TaxInvoicesKorigDM.Smeta_Vid_N_DSet.FetchAll;
    TaxInvoicesKorigDM.Smeta_Vid_N_DSet.First;
    sum_All_Nds     := 0;
    sum_All_Not_NDS := 0;
    for i := 0 to TaxInvoicesKorigDM.Smeta_Vid_N_DSet.RecordCount-1 do
    begin
      TaxInvoicesKorigDM.RxMemoryData_smet.Open;
      TaxInvoicesKorigDM.RxMemoryData_smet.Insert;
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_smet').Value   := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['id_smet'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_razd').Value   := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['id_razd'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_stat').Value   := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['id_stat'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('sum_smet').Value  := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['sum_smet'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('name_smet').Value := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['name_smet'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('name_razd').Value := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['name_razd'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('name_stat').Value := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['name_stat'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('kod_smety').Value := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['kod_smety'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('n_razd').Value    := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['n_razd'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('n_stat').Value    := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['n_stat'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_kekv').Value   := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['id_kekv'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('kod_kekv').Value  := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['kod_kekv'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('name_kekv').Value := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['name_kekv'];
      TaxInvoicesKorigDM.RxMemoryData_smet.Post;
      TaxInvoicesKorigDM.Smeta_Vid_N_DSet.Next;

      if TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300' then
        sum_All_Nds     := sum_All_Nds + TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('sum_smet').Value
      else
        sum_All_Not_NDS := sum_All_Not_NDS + TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('sum_smet').Value;
    end;
          if TaxInvoicesKorigDM.VidNaklInfoDSet['pk_id']= null
           then pk_id := 0
           else pk_id := StrToInt64(TaxInvoicesKorigDM.VidNaklInfoDSet.FieldByName('pk_id').AsString);

          if ((pk_id = 0) or (pk_id = -1)) then
             provodka := False
          else
            provodka := True;

    PParameter.id_TaxLiabilities     := TaxInvoicesKorigDM.VidNaklInfoDSet['id_tax_liabilities'];
    PParameter.Name_TaxLiabilities   := TaxInvoicesKorigDM.VidNaklInfoDSet['name_tax_liabilities'];
    PParameter.Id_TaxKredit          := TaxInvoicesKorigDM.VidNaklInfoDSet['id_taxkredit'];
    PParameter.Name_TaxKredit        := TaxInvoicesKorigDM.VidNaklInfoDSet['NAME_TAXKREDIT'];
    PParameter.id_SpecialNotes       := TaxInvoicesKorigDM.VidNaklInfoDSet['id_specialnotes'];
    PParameter.Name_SpecialNotes     := TaxInvoicesKorigDM.VidNaklInfoDSet['name_specialnotes'];
    PParameter.id_customer           := TaxInvoicesKorigDM.VidNaklInfoDSet['id_customer'];
    PParameter.Name_customer         := TaxInvoicesKorigDM.VidNaklInfoDSet['name_customer'];
    PParameter.ipn_customer          := TaxInvoicesKorigDM.VidNaklInfoDSet['ipn_customer'];
    PParameter.place_customer        := TaxInvoicesKorigDM.VidNaklInfoDSet['place_customer'];
    PParameter.phone_customer        := TaxInvoicesKorigDM.VidNaklInfoDSet['phone_customer'];
    PParameter.NumReestr_customer    := TaxInvoicesKorigDM.VidNaklInfoDSet['numreestr_customer'];
    PParameter.EDRPOU_Customer       := TaxInvoicesKorigDM.VidNaklInfoDSet['edrpou_customer'];
    PParameter.id_TermsDelivery      := TaxInvoicesKorigDM.VidNaklInfoDSet['id_termsdelivery'];
    PParameter.Name_TermsDelivery    := TaxInvoicesKorigDM.VidNaklInfoDSet['name_termsdelivery'];
    PParameter.id_FormCalculations   := TaxInvoicesKorigDM.VidNaklInfoDSet['id_formcalculations'];
    PParameter.Name_FormCalculations := TaxInvoicesKorigDM.VidNaklInfoDSet['name_formcalculations'];
    PParameter.ID_TYPE_DOCUMENT      := TaxInvoicesKorigDM.VidNaklInfoDSet['id_type_document'];
    PParameter.NAME_TYPE_DOCUMENT    := TaxInvoicesKorigDM.VidNaklInfoDSet['name_type_document'];

    if (TaxInvoicesKorigDM.VidNaklInfoDSet['full_name_customer']<>null) then
      PParameter.Full_name_customer  := TaxInvoicesKorigDM.VidNaklInfoDSet['full_name_customer']
    else
      PParameter.Full_name_customer  := '';

    PParameter.id_vid_nakl_doc := -1;

    PodNumTextEdit.Properties.ReadOnly       := False;
    NumOrderTextEdit.Properties.ReadOnly     := False;
    NumTermsDelTextEdit.Properties.ReadOnly  := False;
    PodNumTextEdit.Properties.ReadOnly       := False;
    DataVipDateEdit.Properties.ReadOnly      := False;
    DataTermsdelDateEdit.Properties.ReadOnly := False;
    IPNPokupTextEdit.Properties.ReadOnly     := False;
    NumOrdInReestrTextEdit.Properties.ReadOnly := False;
    //NotPDVCheckBox.Properties.ReadOnly       := False;
    //NoteTextEdit.Properties.ReadOnly         := False;

    PodZobButtonEdit.Style.Color       := clWindow;
    PodKreditButtonEdit.Style.Color    := clWindow;
    DataVipDateEdit.Style.Color        := clWindow;
    SpecialNotesButtonEdit.Style.Color := clWindow;
    PostavkaButtonEdit.Style.Color     := clWindow;
    OsobaPokupButtonEdit.Style.Color   := clWindow;
    RozraxunokButtonEdit.Style.Color   := clWindow;
    PodNumTextEdit.Style.Color         := clWindow;
    NumOrderTextEdit.Style.Color       := clWindow;
    DataTermsdelDateEdit.Style.Color   := clWindow;
    NumTermsDelTextEdit.Style.Color    := clWindow;
    IPNPokupTextEdit.Style.Color       := clWindow;
    NumOrdInReestrTextEdit.Style.Color := clWindow;
    //TypeDocumentButtonEdit.Style.Color := clWindow;

    EditingButton.Visible := False;
    AddButton.Enabled     := False;
    UpdateButton.Enabled  := False;
    DeleteButton.Enabled  := False;
    RefreshButton.Enabled := False;
    BudgetButton.Enabled  := False;
    EditTaxButton.Enabled := False;

    is_issued_buyer_CheckBox.Properties.ReadOnly := False;
    is_erpn_CheckBox.Properties.ReadOnly         := False;
    is_issued_buyer_CheckBox.Properties.ReadOnly := False;
    OsoblPrimCheckBox.Properties.ReadOnly        := False;
    is_copy_CheckBox.Properties.ReadOnly         := False;
    PostavkaCheckBox.Properties.ReadOnly         := False;
    RozraxunokCheckBox.Properties.ReadOnly       := False;
    PodZobCheckBox.Properties.ReadOnly           := False;
    PodKreditCheckBox.Properties.ReadOnly        := False;
  end;
//******************************************************************************
  pStylesDM                        := TStyleDM.Create(Self);
  NaklDeliveryGridDBBandedTableView.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
  NaklDeliveryGridDBBandedTableView.DataController.DataSource := TaxInvoicesKorigDM.NaklDeliveryDSource;
  //******************************************************************************
  TaxInvoicesKorigDM.Pocupatel_DataSet.Close;
  TaxInvoicesKorigDM.Pocupatel_DataSet.SelectSQL.Text := 'select * from Z_SETUP_S';
  TaxInvoicesKorigDM.Pocupatel_DataSet.Open;
  //OsobaProdavecTextEdit.Text := TaxInvoicesKorigDM.Pocupatel_DataSet['FIRM_NAME_FULL'];
  //TelProdavecTextEdit.Text   := TaxInvoicesKorigDM.Pocupatel_DataSet['TELEFON'];
  //PlaceProdavecTextEdit.Text := TaxInvoicesKorigDM.Pocupatel_DataSet['TOWN']+', '+TaxInvoicesKorigDM.Pocupatel_DataSet['ADDRESS'];
  //PlaceProdavecTextEdit.Text := 'вул.Університетська, б.24, м.Донецьк, обл.Донецька, 83001';
  TaxInvoicesKorigDM.Customer_DonnuDSet.Close;
  TaxInvoicesKorigDM.Customer_DonnuDSet.SelectSQL.Text          := 'select * from TI_CUSTOMER_INFO(:id)';
  TaxInvoicesKorigDM.Customer_DonnuDSet.ParamByName('id').Value := null;
  TaxInvoicesKorigDM.Customer_DonnuDSet.Open;

  id_university                  := TaxInvoicesKorigDM.Customer_DonnuDSet['ID_UNIVERSITY'];

  if (id_university = 2)then
  begin
    TelProdavecTextEdit.Style.color := clBtnFace;
    TelProdavecTextEdit.Properties.ReadOnly := True; //для ХАИ
  end
  else
  begin
    TelProdavecTextEdit.Style.color := clWhite;
    TelProdavecTextEdit.Properties.ReadOnly := False; //для ДонНУ
  end;

  NumReestrProdavecTextEdit.Text := TaxInvoicesKorigDM.Customer_DonnuDSet['nns'];
  IPNProdavecTextEdit.Text       := TaxInvoicesKorigDM.Customer_DonnuDSet['nalog_nom'];
  id_Seller := TaxInvoicesKorigDM.Customer_DonnuDSet['ORGANIZATION'];
  PlaceProdavecTextEdit.Text := TaxInvoicesKorigDM.Customer_DonnuDSet['full_adress_customer'];
  OsobaProdavecTextEdit.Text := TaxInvoicesKorigDM.Customer_DonnuDSet['full_name_customer'];
  //TelProdavecTextEdit.Text   := TaxInvoicesKorigDM.Customer_DonnuDSet['phone_customer'];
end;

procedure TTaxInvoicesKorigAddForm.AddButtonClick(Sender: TObject);
var
  ViewForm             : TTaxInvoicesKorigAddInNaklForm;
  id_vid_nakl_korrect  : Integer;
  AddParametr          : TTITaxInvoicesAddVidNaklDelivery;
begin
  AddParametr.id_range_of_delivery   := 0;
  AddParametr.Name_range_of_delivery := '';
  AddParametr.Id_Measures            := 0;
  AddParametr.Name_Measures          := '';

  ViewForm := TTaxInvoicesKorigAddInNaklForm.Create(Self,TaxInvoicesKorigDM.DB.Handle,AddParametr);
  ViewForm.DataGroupBox.Visible              := True;
  ViewForm.MonthList.Items.Text              := GetMonthList2;
  ViewForm.Kod_Setup                         := CurrentKodSetup(PDb_Handle);
  ViewForm.YearSpinEdit.Value                := YearMonthFromKodSetup(ViewForm.Kod_Setup);
  ViewForm.MonthList.ItemIndex               := YearMonthFromKodSetup(ViewForm.Kod_Setup-1,False);
  ViewForm.ZaCheckBox.Checked                := False;
  ViewForm.MonthList.Enabled                 := False;
  ViewForm.YearSpinEdit.Enabled              := False;

  ViewForm.DateKorrectEdit.Text                       := '';
  ViewForm.ReasonTextEdit.Text                        := '';
  ViewForm.KodTovarButtonEdit.Text                    := '';
  ViewForm.KodTovarCheckBox.Checked                   := False;
  ViewForm.KodTovarButtonEdit.Enabled                 := False;
  ViewForm.edit_kolvoCurrencyEdit.EditValue           := 0;
  ViewForm.edit_priceCurrencyEdit.EditValue           := 0;
  ViewForm.edit_price_costCurrencyEdit.EditValue      := 0;
  ViewForm.edit_kolvo_costTextEdit.Text               := '';
  ViewForm.main_stavkaCurrencyEdit.EditValue          := 0;
  ViewForm.null_stavkaCurrencyEdit.EditValue          := 0;
  ViewForm.summa_not_pdvCurrencyEdit.EditValue        := 0;
 // ViewForm.ValueDeliveryVATexemptionsCurrencyEdit.EditValue := 0;
  ViewForm.ReadReg;
  ViewForm.ShowModal;
  if (ViewForm.ModalResult = mrok) then
  begin
    TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
    TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                              := 'TI_SP_VID_NAKL_KORRECT_INS';
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('date_korrect').Value          := ViewForm.DateKorrectEdit.Date;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_range_of_delivery').Value   := ViewForm.Parameter.id_range_of_delivery;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_range_of_delivery').Value := ViewForm.Parameter.Name_range_of_delivery;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_measures').Value            := ViewForm.Parameter.Id_Measures;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_measures').Value          := ViewForm.Parameter.Name_Measures;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('reason_korrect').Value         := ViewForm.ReasonTextEdit.Text;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('edit_kolvo').Value             := ViewForm.edit_kolvoCurrencyEdit.Value;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('edit_price').Value             := ViewForm.edit_priceCurrencyEdit.Value;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('edit_kolvo_cost').Value        := ViewForm.edit_kolvo_costTextEdit.Text;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('edit_price_cost').Value        := ViewForm.edit_price_costCurrencyEdit.Value;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('main_stavka').Value            := ViewForm.main_stavkaCurrencyEdit.Value;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('null_stavka').Value            := ViewForm.null_stavkaCurrencyEdit.Value;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('summa_not_pdv').Value          := ViewForm.summa_not_pdvCurrencyEdit.Value;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_vid_nakl_doc').Value        := id_vid_nakl_doc_Ins;

    if (ViewForm.KodTovarCheckBox.Checked = true) then
    begin
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_kod_tovar').Value   := ViewForm.Parameter.id_kod_tovar;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('num_kod_tovar').Value  := ViewForm.Parameter.Num_Kod_tovar;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_kod_tovar').Value := ViewForm.Parameter.Name_Kod_tovar;
    end
    else
    begin
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_kod_tovar').Value   := 0;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('num_kod_tovar').Value  := '';
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_kod_tovar').Value := '';
    end;

    if (ViewForm.ZaCheckBox.Checked = true) then
    begin
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('MONTH_RANGE_OF_DELIVERY').Value := ViewForm.MonthList.Text;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('YEAR_RANGE_OF_DELIVERY').Value  := ViewForm.YearSpinEdit.Text;
    end
    else
    begin
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('MONTH_RANGE_OF_DELIVERY').Value := '';
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('YEAR_RANGE_OF_DELIVERY').Value  := '';
    end;

    TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
    id_vid_nakl_korrect := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_vid_nakl_korrect_').AsInteger;

    //расчет общих сумм
    TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                       := 'TI_VID_NAKL_DOC_SUMMA_KORRECT';
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value := id_vid_nakl_doc_Ins;
    TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;

    TaxInvoicesKorigDM.WriteTransaction.Commit;


    RefreshButton.Click;
    TaxInvoicesKorigDM.NaklDeliveryDSet.Locate('id_vid_nakl_korrect',IntToStr(id_vid_nakl_korrect),[]);
  end;
end;

procedure TTaxInvoicesKorigAddForm.SpecialNotesButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  notes:Variant;
begin
  Parameter           := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesKorigDM.DB.Handle;
  Parameter.Owner     := self;
  notes               := DoFunctionFromPackage(Parameter,SpecialNotes_Const);
  Parameter.Destroy;
  If VarArrayDimCount(notes)>0 then
  begin
    PParameter.id_SpecialNotes   := notes[0];
    SpecialNotesButtonEdit.Text  := notes[1];
    PParameter.Name_SpecialNotes := notes[1];
    PParameter.Num_SpecialNotes  := notes[2];
    // отбор типа документа по типу причины
    TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
    TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName := 'TI_SELECT_TYPE_DOC_SPECIALNOTES';
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value := PParameter.id_SpecialNotes;
    TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
    TaxInvoicesKorigDM.WriteTransaction.Commit;

    PParameter.ID_TYPE_DOCUMENT   := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_TYPE_DOC').Value;
    PParameter.NAME_TYPE_DOCUMENT := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOC').Value;
    //TypeDocumentButtonEdit.Text   := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOC').Value;
  end;

end;

procedure TTaxInvoicesKorigAddForm.PostavkaButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  terms:Variant;
begin
  Parameter := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesKorigDM.DB.Handle;
  Parameter.Owner := self;
  terms := DoFunctionFromPackage(Parameter,TermsDelivery_Const);
  Parameter.Destroy;

  If VarArrayDimCount(terms)>0 then
  begin
    PostavkaButtonEdit.Text       := terms[1];
    PParameter.id_TermsDelivery   := terms[0];
    PParameter.Name_TermsDelivery := terms[1];
  end;

end;

procedure TTaxInvoicesKorigAddForm.RozraxunokButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  fCalc:Variant;
begin
  Parameter := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesKorigDM.DB.Handle;
  Parameter.Owner := self;
  fCalc := DoFunctionFromPackage(Parameter,FormCalculations_Const);
  Parameter.Destroy;
  If VarArrayDimCount(fCalc)>0 then
  begin
    RozraxunokButtonEdit.Text        := fCalc[1];
    PParameter.id_FormCalculations   := fCalc[0];
    PParameter.Name_FormCalculations := fCalc[1];
  end;
end;

procedure TTaxInvoicesKorigAddForm.OsobaPokupButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase'] := Integer(TaxInvoicesKorigDM.DB.Handle);
 i['FormStyle'] := fsNormal;
 i['bMultiSelect'] := false;
 i['id_session'] := -1;
 i['SelectMode'] := selCustomer;
 i['id_cistomer']   := -1;
 i['show_all'] := 1;
 LoadSysData(TaxInvoicesKorigDM.ReadTransaction);
 DogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self, i, o);

  if o['ModalResult'] = mrOk then
  begin
   id_Customer := o['ID_CUSTOMER'];
   TaxInvoicesKorigDM.Customer_DataSet.Close;
   TaxInvoicesKorigDM.Customer_DataSet.SelectSQL.Text :='select * from TI_CUSTOMER_INFO(:id)';
   TaxInvoicesKorigDM.Customer_DataSet.ParamByName('id').Value := id_Customer;
   TaxInvoicesKorigDM.Customer_DataSet.Open;
   OsobaPokupButtonEdit.Text     := TaxInvoicesKorigDM.Customer_DataSet['NAME_CUSTOMER'];
   PlacePokupMemo.Text           := TaxInvoicesKorigDM.Customer_DataSet['ADRESS_CONTRAGENT'];
   EdrpTextEdit.Text             := TaxInvoicesKorigDM.Customer_DataSet['KOD_EDRPOU'];
   IPNPokupTextEdit.Text         := TaxInvoicesKorigDM.Customer_DataSet['NALOG_NOM'];
   NumReestrPokupTextEdit.Text   := TaxInvoicesKorigDM.Customer_DataSet['NNS'];

   if (TaxInvoicesKorigDM.Customer_DataSet['PHONE_CUSTOMER']<>null)then
     TelPokupTextEdit.Text       := TaxInvoicesKorigDM.Customer_DataSet['PHONE_CUSTOMER']
   else
     TelPokupTextEdit.Text       :='---';

   PParameter.id_customer        := id_Customer;
   PParameter.Name_customer      := TaxInvoicesKorigDM.Customer_DataSet['NAME_CUSTOMER'];
   PParameter.ipn_customer       := TaxInvoicesKorigDM.Customer_DataSet['NALOG_NOM'];
   PParameter.place_customer     := TaxInvoicesKorigDM.Customer_DataSet['ADRESS_CONTRAGENT'];
   PParameter.phone_customer     := TaxInvoicesKorigDM.Customer_DataSet['PHONE_CUSTOMER'];
   PParameter.NumReestr_customer := TaxInvoicesKorigDM.Customer_DataSet['NNS'];
   PParameter.EDRPOU_Customer    := TaxInvoicesKorigDM.Customer_DataSet['KOD_EDRPOU'];

   if ((TaxInvoicesKorigDM.Customer_DataSet['full_name_customer'] = '') or (TaxInvoicesKorigDM.Customer_DataSet['full_name_customer']=null))then
   begin
     replaceAbreviatures(TaxInvoicesKorigDM.Customer_DataSet['NAME_CUSTOMER']);
     PParameter.Full_name_customer := '';
     FullNameCheckBox.Checked   := True;
     FullNameMemo.ReadOnly      := False;
     SaveFullNameButton.Visible := True;
   end
   else
   begin
     FullNameMemo.Text := TaxInvoicesKorigDM.Customer_DataSet['full_name_customer'];
     PParameter.Full_name_customer := TaxInvoicesKorigDM.Customer_DataSet['full_name_customer'];
     FullNameCheckBox.Checked   := False;
     FullNameMemo.ReadOnly      := True;
     SaveFullNameButton.Visible := False;
   end;

   if ((TaxInvoicesKorigDM.Customer_DataSet['full_adress_customer'] = '') or (TaxInvoicesKorigDM.Customer_DataSet['full_adress_customer']=null))then
   begin
     PlacePokupMemo.Text := TaxInvoicesKorigDM.Customer_DataSet['adress_contragent'];
     PParameter.place_customer := '';
     PlacePokupCheckBox.Checked         := True;
     PlacePokupMemo.Properties.ReadOnly := False;
     SavePlacePokupButton.Visible       := True;
   end
   else
   begin
     PlacePokupMemo.Text := TaxInvoicesKorigDM.Customer_DataSet['full_adress_customer'];
     PParameter.place_customer  := TaxInvoicesKorigDM.Customer_DataSet['full_adress_customer'];
     PlacePokupCheckBox.Checked         := False;
     PlacePokupMemo.Properties.ReadOnly := True;
     SavePlacePokupButton.Visible       := False;
   end;


  end;
  i.Free;
  o.Free;
end;

procedure TTaxInvoicesKorigAddForm.IPNPokupButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase'] := Integer(TaxInvoicesKorigDM.DB.Handle);
 i['FormStyle'] := fsNormal;
 i['bMultiSelect'] := false;
 i['id_session'] := -1;
 i['SelectMode'] := selRateAccount;
 i['show_all'] := 1;
 DogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self, i, o);
 i.Free;
 o.Free;
end;

procedure TTaxInvoicesKorigAddForm.PlacePokupButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase'] := Integer(TaxInvoicesKorigDM.DB.Handle);
 i['FormStyle'] := fsNormal;
 i['bMultiSelect'] := false;
 i['id_session'] := -1;
 i['SelectMode'] := selRateAccount;
 i['show_all'] := 1;
 DogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self, i, o);
 i.Free;
 o.Free;
end;

procedure TTaxInvoicesKorigAddForm.TelPokupButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase'] := Integer(TaxInvoicesKorigDM.DB.Handle);
 i['FormStyle'] := fsNormal;
 i['bMultiSelect'] := false;
 i['id_session'] := -1;
 i['SelectMode'] := selRateAccount;
 i['show_all'] := 1;
 DogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self, i, o);
 i.Free;
 o.Free;
end;

procedure TTaxInvoicesKorigAddForm.NumReestrPokupButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  terms:Variant;
begin
  Parameter := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesKorigDM.DB.Handle;
  Parameter.Owner := self;
  terms := DoFunctionFromPackage(Parameter,RangeOfDelivery_Const);
  Parameter.Destroy;

  If VarArrayDimCount(terms)>0 then
  begin
    PostavkaButtonEdit.Text := terms[1];
  end;

end;

procedure TTaxInvoicesKorigAddForm.EdrpButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase'] := Integer(TaxInvoicesKorigDM.DB.Handle);
 i['FormStyle'] := fsNormal;
 i['bMultiSelect'] := false;
 i['id_session'] := -1;
 i['SelectMode'] := selRateAccount;
 i['show_all'] := 1;
 DogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self, i, o);
 i.Free;
 o.Free;
end;

procedure TTaxInvoicesKorigAddForm.NumReestrProdavecButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  LoadTypeDocumentPackage(owner,TaxInvoicesKorigDM.DB.Handle,'TaxInvoices\TypeDocument.bpl','View_TypeDocument',1);
end;

procedure TTaxInvoicesKorigAddForm.PodKreditButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  kredit:Variant;
begin
  Parameter           := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesKorigDM.DB.Handle;
  Parameter.Owner     := self;
  kredit              := DoFunctionFromPackage(Parameter,TaxKredit_Const);
  Parameter.Destroy;
  If VarArrayDimCount(kredit)>0 then
  begin
    PParameter.Id_TaxKredit   := kredit[0];
    PParameter.Name_TaxKredit := kredit[1];
    PodKreditButtonEdit.Text  := kredit[2];
  end;
end;

procedure TTaxInvoicesKorigAddForm.PodZobButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  PodZob:Variant;
begin
  Parameter           := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesKorigDM.DB.Handle;
  Parameter.Owner     := self;
  PodZob              := DoFunctionFromPackage(Parameter,TaxLiabilities_Const);
  Parameter.Destroy;
  If VarArrayDimCount(PodZob)>0 then
  begin
    PParameter.id_TaxLiabilities   := PodZob[0];
    PParameter.Name_TaxLiabilities := PodZob[1];
    PodZobButtonEdit.Text          := PodZob[2];
  end;
end;

procedure TTaxInvoicesKorigAddForm.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TTaxInvoicesKorigAddForm.YesButtonClick(Sender: TObject);
var
  error_period,oznaka : string;
begin

 if (DataVipDateEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть дату виписки!',mtWarning,[mbOK]);
   DataVipDateEdit.SetFocus;
   Exit;
  end;

 if (DatePodpisDateEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть дату підпису розрахунку коригування!',mtWarning,[mbOK]);
   DatePodpisDateEdit.SetFocus;
   Exit;
  end;

  //проверка на корректность даты согласно реестра
  TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
  TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName := 'TI_DATE_NAKL_IS_KORRECT';
  TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_reestr').Value := id_Reestr_Ins;
  TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('date_nakl').Value := DataVipDateEdit.Date;
  TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
  TaxInvoicesKorigDM.WriteTransaction.Commit;

  if (TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_korrect').Value = 0) then
  begin
   error_period := 'Дата розрахунка корегування не може виходити за період реєстру! Період: з ' + TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('date_beg').AsString + 'по ' + TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('date_end').AsString;
   TiShowMessage('Увага!', error_period, mtWarning,[mbOK]);
   DataVipDateEdit.SetFocus;
   Exit;
  end;

  if (PodZobButtonEdit.Enabled = True) then
   begin
    if (PodZobButtonEdit.Text='') then
    begin
      TiShowMessage('Увага!','Заповніть податкові зобов язання!',mtWarning,[mbOK]);
      PodZobButtonEdit.SetFocus;
      Exit;
    end;
   end;

   if (PodKreditButtonEdit.Enabled = True) then
    begin
     if (PodKreditButtonEdit.Text='') then
      begin
        TiShowMessage('Увага!','Заповніть податковий кредит!',mtWarning,[mbOK]);
        PodKreditButtonEdit.SetFocus;
        Exit;
      end;
    end;

  if (PostavkaCheckBox.Checked)then
  begin
    if (PostavkaButtonEdit.Text='') then
    begin
      TiShowMessage('Увага!','Заповніть умови поставки!',mtWarning,[mbOK]);
      PostavkaButtonEdit.SetFocus;
      Exit;
    end;
  end;

  if (RozraxunokCheckBox.Checked)then
  begin
    if (RozraxunokButtonEdit.Text='') then
    begin
      TiShowMessage('Увага!','Заповніть форму проведених розрахунків!',mtWarning,[mbOK]);
      RozraxunokButtonEdit.SetFocus;
      Exit;
    end;
  end;


  if (SpecialNotesButtonEdit.Enabled = True) then
  begin
   if (SpecialNotesButtonEdit.Text='') then
    begin
      TiShowMessage('Увага!','Заповніть тип причини!',mtWarning,[mbOK]);
      SpecialNotesButtonEdit.SetFocus;
      Exit;
    end;
  end;

  if (PodNumTextEdit.Text='') then
  begin
    TiShowMessage('Увага!','Заповніть порядковий номер!',mtWarning,[mbOK]);
    PodNumTextEdit.SetFocus;
    Exit;
  end;

  if (OsobaPokupButtonEdit.Text='') then
  begin
    TiShowMessage('Увага!','Заповніть покупця!',mtWarning,[mbOK]);
    OsobaPokupButtonEdit.SetFocus;
    Exit;
  end;

  if (FullNameMemo.Text='') then
  begin
    TiShowMessage('Увага!','Заповніть повну назву покупця!',mtWarning,[mbOK]);
    FullNameMemo.SetFocus;
    Exit;
  end;

  if (PhoneCheckBox.Checked = True)then
  begin
    if (TelPokupTextEdit.Text='') then
    begin
      TiShowMessage('Увага!','Заповніть номер телефону або зніміть редагування номера телефону!',mtWarning,[mbOK]);
      TelPokupTextEdit.SetFocus;
      Exit;
    end;
  end;

  if (FullNameCheckBox.Checked = True)then
  begin
      TiShowMessage('Увага!','Заповніть повну назву контрагента або зніміть редагування повної назви контрагента!',mtWarning,[mbOK]);
      FullNameMemo.SetFocus;
      Exit;
  end;

  if (PlacePokupCheckBox.Checked = True)then
  begin
      TiShowMessage('Увага!','Заповніть повну адресу контрагента або зніміть редагування повної адреси контрагента!',mtWarning,[mbOK]);
      PlacePokupMemo.SetFocus;
      Exit;
  end;

  if (NumOrderTextEdit.Text = '')then
  begin
      TiShowMessage('Увага!','Заповніть номер розрахунка!',mtWarning,[mbOK]);
      NumOrderTextEdit.SetFocus;
      Exit;
  end;

  if (DataVipDateEdit.Text = '')then
  begin
      TiShowMessage('Увага!','Заповніть дату розрахунка!',mtWarning,[mbOK]);
      DataVipDateEdit.SetFocus;
      Exit;
  end;

  if (DateNaklDateEdit.Text = '')then
  begin
      TiShowMessage('Увага!','Заповніть дату податкової накладної!',mtWarning,[mbOK]);
      DateNaklDateEdit.SetFocus;
      Exit;
  end;

  if (DateOplDateEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть дату оплати коригування!',mtWarning,[mbOK]);
   DateOplDateEdit.SetFocus;
   Exit;
  end;

  if (OznakaCheckBox.Checked = True) then
  begin
    if (OznakaTextEdit.Text='') then
    begin
      TiShowMessage('Увага!','Заповніть ознаку або зніміть галочку!',mtWarning,[mbOK]);
      OznakaTextEdit.SetFocus;
      Exit;
    end;
    oznaka := Trim(OznakaTextEdit.Text);
    if (Length(oznaka) <> 1) then
    begin
      TiShowMessage('Увага!','Невірно заповнена ознака, вона повинна складатися з 1 літери!',mtWarning,[mbOK]);
      OznakaTextEdit.SetFocus;
      Exit;
    end;
  end;

//  try
   if (id_vid_nakl_doc_Ins = -1)  then  // вставка новой налоговой накладной КОРРЕКТИРОВКИ
   begin
     if (PParameter.Full_name_customer = '') then
     begin
       TiShowMessage('Увага!','Збережіть повну назву контрагента!',mtWarning,[mbOK]);
       Exit;
     end;
     if (PParameter.place_customer = '') then
     begin
       TiShowMessage('Увага!','Збережіть повну адресу контрагента!',mtWarning,[mbOK]);
       Exit;
     end;

     //ReadReg;
     TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
     //вставка самого документа
     TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                             := 'TI_SP_VID_NAKL_DOC_INS';
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate         := DateNaklDateEdit.Date;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value              := PodNumTextEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_SELLER').Value             := id_Seller;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_SELLER').Value           := OsobaProdavecTextEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ipn_seller').Value            := IPNProdavecTextEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('PLACE_SELLER').Value          := PlaceProdavecTextEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('PHONE_SELLER').Value          := TelProdavecTextEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NUMREESTR_SELLER').Value      := NumReestrProdavecTextEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value           := PParameter.Id_Customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value         := PParameter.Name_Customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value          := PParameter.ipn_customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('PLACE_CUSTOMER').Value        := PParameter.place_customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('PHONE_CUSTOMER').Value        := PParameter.phone_customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NUMREESTR_CUSTOMER').Value    := PParameter.NumReestr_customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('EDRPOU_CUSTOMER').Value       := PParameter.EDRPOU_Customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('full_name_customer').Value    := PParameter.Full_name_customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_korig').Value              := 1;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NUM_ROZR').Value              := NumOrderTextEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('DATE_ROZR').Value             := DataVipDateEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('DATA_OPL_KORRECT').AsDate     := DateOplDateEdit.Date;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('DATE_PODPIS_KORIG').AsDate    := DatePodpisDateEdit.Date;
     //TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('note').Value := NoteButtonEdit.Text;

     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_issued_buyer_two_ekz').Value   := 0;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_erpn_two_ekz').Value           := 0;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_remains_seller_two_ekz').Value := 0;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_copy_two_ekz').Value           := 0;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_specialnotes_two_ekz').Value   := 0;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_specialnotes_two_ekz').Value := '';

     if (is_issued_buyer_CheckBox.Checked = true) then
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_issued_buyer').Value := 1
     else
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_issued_buyer').Value := 0;

     if (is_erpn_CheckBox.Checked = true) then
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_erpn').Value := 1
     else
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_erpn').Value := 0;

     if (is_copy_CheckBox.Checked = true) then
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_copy').Value := 1
     else
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_copy').Value := 0;

     if (OsoblPrimCheckBox.Checked = true) then
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER').Value := 1
     else
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER').Value := 0;

    { if (NotPDVCheckBox.Checked = true) then
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_NOT_PDV').Value := 1
     else  }
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_NOT_PDV').Value := 0;

     if (PostavkaCheckBox.Checked=True)then
     begin
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_TERMSDELIVERY').Value      := PParameter.id_TermsDelivery;
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TERMSDELIVERY').Value    := PParameter.Name_TermsDelivery;
       if (DataTermsdelDateEdit.Text='') then
         TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value  := StrtoDate('01.01.1900')
       else
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value    := DataTermsdelDateEdit.Date ;
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value     := NumTermsDelTextEdit.Text;
     end
     else
     begin
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_TERMSDELIVERY').Value      := 0;
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TERMSDELIVERY').Value    := '';
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value    := StrtoDate('01.01.1900');
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value     := '';
     end;

    if (RozraxunokCheckBox.Checked=True)then
     begin
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_FORMCALCULATIONS').Value   := PParameter.id_FormCalculations;
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_FORMCALCULATIONS').Value := PParameter.Name_FormCalculations;
     end
    else
     begin
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_FORMCALCULATIONS').Value   := 0;
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_FORMCALCULATIONS').Value := '';
     end;

    { if (NoteCheckBox.Checked=True)then
      begin
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_NOTE').Value   := PParameter.id_note;
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NOTE').Value := PParameter.article_note;
      end
     else
     begin
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_NOTE').Value   := 0;
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NOTE').Value := '';
     end; }


     if (PodZobCheckBox.Checked)then
      begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_tax_liabilities').Value   := PParameter.id_TaxLiabilities;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TAX_LIABILITIES').Value := PParameter.Name_TaxLiabilities;
      end
     else
      begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_tax_liabilities').Value   := 0;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TAX_LIABILITIES').Value := '';
      end;

     if (PodKreditCheckBox.Checked)then
      begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_TAXKREDIT').Value   := PParameter.Id_TaxKredit;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TAXKREDIT').Value := PParameter.Name_TaxKredit;
      end
     else
      begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_TAXKREDIT').Value   := 0;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TAXKREDIT').Value := '';
      end;

     if (OsoblPrimCheckBox.Checked)then
      begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value   := PParameter.id_SpecialNotes;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value := PParameter.Name_SpecialNotes;
      end
     else
      begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value    := 0;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value  := '';
      end;


     TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
     id_vid_nakl_doc_Ins := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC_').Value;
     PParameter.id_vid_nakl_doc := id_vid_nakl_doc_Ins;
     //вставка документа в список выданных налоговых накладных
     TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                           := 'TI_SP_VID_NAKL_INS';
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate       := DataVipDateEdit.Date;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value            := NumOrderTextEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NUM_ORDER').Value           := NumOrdInReestrTextEdit.Text;
     //ищем тип документа РК
     TaxInvoicesKorigDM.TypeDocDataSet.Close;
     TaxInvoicesKorigDM.TypeDocDataSet.SelectSQL.Text := 'select * from TI_FIND_TYPE_DOC_FOR_CORRECT';
     TaxInvoicesKorigDM.TypeDocDataSet.Open;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value    := TaxInvoicesKorigDM.TypeDocDataSet['CODE_TYPE_DOC'];
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value  := TaxInvoicesKorigDM.TypeDocDataSet['NAME_TYPE_DOC'];
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := PParameter.id_TaxLiabilities;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := PParameter.Name_TaxLiabilities;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value         := PParameter.Id_Customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value       := PParameter.Full_name_customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value        := PParameter.ipn_customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('SUMMA_PDV_20').Value        := 0;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_20').Value    := 0;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_0').Value     := 0;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT').Value        := 0;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('SUMMA_EXPORT').Value        := 0;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_KORIG').Value            := 1;//!!!!!!!!!!!!
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value        := 0;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_SIGN').Value             := 0;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_REESTR').Value           := id_Reestr_Ins;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_NAKL_DOCUMENT').Value    := id_vid_nakl_doc_Ins;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_USER_CREATE').Value      := TaxInvoicesUser.id_user;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_USER_CREATE').Value    := TaxInvoicesUser.name_user;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('date_time_create').Value    := Now;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_IMPORT').Value           := 0;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_SYSTEM').Value         := '';
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_SCHET_IMPORT').Value     := 0;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('pk_id').Value               := 0;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_subdivision').Value      := 1;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_LGOTA').Value            := 0;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_LGOTA').Value          := '';

     if (OsoblPrimCheckBox.Checked = true) then
       begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value  := Pparameter.id_specialNotes;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value := Pparameter.Num_specialnotes;
        
       end
      else
       begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value   := 0;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value  := '';
       end;

      if (OznakaCheckBox.Checked = true) then
       begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value   := OznakaTextEdit.Text;
       end
      else
       begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value   := '';
       end;

     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('SUMMA_DELIVERY').Value := 0;
     TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;

     id_vid_nakl_Ins := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_').Value;
     PParameter.id_vid_nakl_doc := id_vid_nakl_Ins;
     PRes.id_vid_nakl_doc       := id_vid_nakl_Ins;
     PodZobButtonEdit.Properties.onButtonClick       := nil;
     PodKreditButtonEdit.Properties.onButtonClick    := nil;
     DataVipDateEdit.Properties.ReadOnly             := True;
     SpecialNotesButtonEdit.Properties.onButtonClick := nil;
     PostavkaButtonEdit.Properties.onButtonClick     := nil;
     OsobaPokupButtonEdit.Properties.onButtonClick   := nil;
     RozraxunokButtonEdit.Properties.onButtonClick   := nil;
     //TypeDocumentButtonEdit.Properties.onButtonClick := nil;

     PodNumTextEdit.Properties.ReadOnly       := True;
     NumOrderTextEdit.Properties.ReadOnly     := True;
     NumTermsDelTextEdit.Properties.ReadOnly  := True;
     PodNumTextEdit.Properties.ReadOnly       := True;
     DataVipDateEdit.Properties.ReadOnly      := True;
     DataTermsdelDateEdit.Properties.ReadOnly := True;
     IPNPokupTextEdit.Properties.ReadOnly     := True;
     //NoteTextEdit.Properties.ReadOnly         := True;
     {NoteCheckBox.Properties.ReadOnly         := True;
     NoteButtonEdit.Enabled := False;
     NotPDVCheckBox.Properties.ReadOnly       := True; }

     PodZobButtonEdit.Style.Color       := clBtnFace;
     PodKreditButtonEdit.Style.Color    := clBtnFace;
     DataVipDateEdit.Style.Color        := clBtnFace;
     SpecialNotesButtonEdit.Style.Color := clBtnFace;
     PostavkaButtonEdit.Style.Color     := clBtnFace;
     OsobaPokupButtonEdit.Style.Color   := clBtnFace;
     RozraxunokButtonEdit.Style.Color   := clBtnFace;
     PodNumTextEdit.Style.Color         := clBtnFace;
     NumOrderTextEdit.Style.Color       := clBtnFace;
     DataTermsdelDateEdit.Style.Color   := clBtnFace;
     NumTermsDelTextEdit.Style.Color    := clBtnFace;
     IPNPokupTextEdit.Style.Color       := clBtnFace;
     //TypeDocumentButtonEdit.Style.Color := clBtnFace;

     is_issued_buyer_CheckBox.Properties.ReadOnly := True;
     is_erpn_CheckBox.Properties.ReadOnly         := True;
     is_issued_buyer_CheckBox.Properties.ReadOnly := True;
     OsoblPrimCheckBox.Properties.ReadOnly        := True;
     is_copy_CheckBox.Properties.ReadOnly         := True;
     PostavkaCheckBox.Properties.ReadOnly         := True;
     RozraxunokCheckBox.Properties.ReadOnly       := True;
     PodZobCheckBox.Properties.ReadOnly           := True;
     PodKreditCheckBox.Properties.ReadOnly        := True;

     EditingButton.Visible := True;
     AddButton.Enabled     := True;
     UpdateButton.Enabled  := True;
     DeleteButton.Enabled  := True;
     RefreshButton.Enabled := True;
     YesButton.Visible     := False;
     BudgetButton.Enabled  := True;
     EditTaxButton.Enabled := True;

     TaxInvoicesKorigDM.WriteTransaction.Commit;
     TiShowMessage('Увага!','Документ додано.',mtWarning,[mbOK]);
   end
   else
   begin
     TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
     //изменение документа
     TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                             := 'TI_SP_VID_NAKL_DOC_UPD';
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_vid_nakl_doc').Value       := id_vid_nakl_doc_Ins;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('data_vipiski').Value          := DateNaklDateEdit.Date;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value              := PodNumTextEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_SELLER').Value             := id_Seller;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_SELLER').Value           := OsobaProdavecTextEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ipn_seller').Value            := IPNProdavecTextEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('PLACE_SELLER').Value          := PlaceProdavecTextEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('PHONE_SELLER').Value          := TelProdavecTextEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NUMREESTR_SELLER').Value      := NumReestrProdavecTextEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value           := PParameter.Id_Customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value         := PParameter.Name_Customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value          := PParameter.ipn_customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('PLACE_CUSTOMER').Value        := PParameter.place_customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('PHONE_CUSTOMER').Value        := PParameter.phone_customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NUMREESTR_CUSTOMER').Value    := PParameter.NumReestr_customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('EDRPOU_CUSTOMER').Value       := PParameter.EDRPOU_Customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_TERMSDELIVERY').Value      := PParameter.id_TermsDelivery;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TERMSDELIVERY').Value    := PParameter.Name_TermsDelivery;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value    := DataTermsdelDateEdit.Date;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value     := NumTermsDelTextEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_FORMCALCULATIONS').Value   := PParameter.id_FormCalculations;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_FORMCALCULATIONS').Value := PParameter.Name_FormCalculations;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('full_name_customer').Value    := PParameter.Full_name_customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('num_rozr').Value              := NumOrderTextEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('date_rozr').Value             := DataVipDateEdit.Date;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('DATA_OPL_KORRECT').AsDate     := DateOplDateEdit.Date;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('DATE_PODPIS_KORIG').AsDate    := DatePodpisDateEdit.Date;
     //TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('note').Value                  := NoteTextEdit.Text;
     {if (NoteCheckBox.Checked=True)then
      begin
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_NOTE').Value   := PParameter.id_note;
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NOTE').Value := PParameter.article_note;
      end
     else
     begin
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_NOTE').Value   := 0;
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NOTE').Value := '';
     end; }

     if (is_issued_buyer_CheckBox.Checked = true) then
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_issued_buyer').Value := 1
     else
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_issued_buyer').Value := 0;

     if (is_erpn_CheckBox.Checked = true) then
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_erpn').Value := 1
     else
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_erpn').Value := 0;

     if (is_copy_CheckBox.Checked = true) then
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_copy').Value := 1
     else
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_copy').Value := 0;

     if (OsoblPrimCheckBox.Checked = true) then
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER').Value := 1
     else
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER').Value := 0;

     {if (NotPDVCheckBox.Checked = true) then
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_NOT_PDV').Value := 1
     else
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_NOT_PDV').Value := 0; }

     if (PostavkaCheckBox.Checked=True)then
     begin
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_TERMSDELIVERY').Value      := PParameter.id_TermsDelivery;
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TERMSDELIVERY').Value    := PParameter.Name_TermsDelivery;
       if (DataTermsdelDateEdit.Text='') then
         TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value    := Strtodate('01.01.1900')
       else
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value    := DataTermsdelDateEdit.Date ;
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value     := NumTermsDelTextEdit.Text;
     end
     else
     begin
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_TERMSDELIVERY').Value      := 0;
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TERMSDELIVERY').Value    := '';
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value    := Strtodate('01.01.1900');
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value     := '';
     end;

    if (RozraxunokCheckBox.Checked=True)then
     begin
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_FORMCALCULATIONS').Value   := PParameter.id_FormCalculations;
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_FORMCALCULATIONS').Value := PParameter.Name_FormCalculations;
     end
    else
     begin
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_FORMCALCULATIONS').Value   := 0;
       TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_FORMCALCULATIONS').Value := '';
     end;


     if (PodZobCheckBox.Checked)then
      begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_tax_liabilities').Value   := PParameter.id_TaxLiabilities;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TAX_LIABILITIES').Value := PParameter.Name_TaxLiabilities;
      end
     else
      begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_tax_liabilities').Value   := 0;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TAX_LIABILITIES').Value := '';
      end;

     if (PodKreditCheckBox.Checked)then
      begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_TAXKREDIT').Value   := PParameter.Id_TaxKredit;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TAXKREDIT').Value := PParameter.Name_TaxKredit;
      end
     else
      begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_TAXKREDIT').Value   := 0;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TAXKREDIT').Value := '';
      end;

     if (OsoblPrimCheckBox.Checked)then
      begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value   := PParameter.id_SpecialNotes;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value := PParameter.Name_SpecialNotes;
      end
     else
      begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value    := 0;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value  := '';
      end;
     TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
     //изменение документа в списке выданных налоговых накладных
     TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                           := 'TI_SP_VID_NAKL_UPD';
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_VID_NAKL').Value         := id_vid_nakl_Ins;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('data_vipiski').Value        := DataVipDateEdit.Date;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value            := NumOrderTextEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NUM_ORDER').Value           := NumOrdInReestrTextEdit.Text;
     TaxInvoicesKorigDM.TypeDocDataSet.Close;
     TaxInvoicesKorigDM.TypeDocDataSet.SelectSQL.Text := 'select * from TI_FIND_TYPE_DOC_FOR_CORRECT';
     TaxInvoicesKorigDM.TypeDocDataSet.Open;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value    := TaxInvoicesKorigDM.TypeDocDataSet['CODE_TYPE_DOC'];
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value  := TaxInvoicesKorigDM.TypeDocDataSet['NAME_TYPE_DOC'];
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := PParameter.id_TaxLiabilities;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := PParameter.Name_TaxLiabilities;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value         := PParameter.Id_Customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value       := PParameter.Full_name_customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value        := PParameter.ipn_customer;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('SUMMA_PDV_20').Value        := null;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_20').Value    := null;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_0').Value     := null;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT').Value        := null;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('SUMMA_EXPORT').Value        := null;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_KORIG').Value            := null;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value        := null;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_SIGN').Value             := null;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_REESTR').Value           := id_Reestr_Ins;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_CHANGE').Value           := 1;// изменение документа в справочнике выд. накл. (номер, дата, под. обязат., покупатель)
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_NAKL_DOCUMENT').Value    := id_vid_nakl_doc_Ins;

     if (OsoblPrimCheckBox.Checked = true) then
       begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value  := Pparameter.id_specialNotes;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value := Pparameter.Num_specialnotes;
       end
     else
       begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value   := 0;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value  := '';
       end;

     if (OznakaCheckBox.Checked = true) then
       begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value   := OznakaTextEdit.Text;
       end
     else
       begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value   := '';
       end;

     TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
     PodZobButtonEdit.Properties.onButtonClick       := nil;
     PodKreditButtonEdit.Properties.onButtonClick    := nil;
     DataVipDateEdit.Properties.ReadOnly             := True;
     SpecialNotesButtonEdit.Properties.onButtonClick := nil;
     PostavkaButtonEdit.Properties.onButtonClick     := nil;
     OsobaPokupButtonEdit.Properties.onButtonClick   := nil;
     RozraxunokButtonEdit.Properties.onButtonClick   := nil;
     //TypeDocumentButtonEdit.Properties.onButtonClick := nil;

     PodZobButtonEdit.Style.Color       := clBtnFace;
     PodKreditButtonEdit.Style.Color    := clBtnFace;
     DataVipDateEdit.Style.Color        := clBtnFace;
     SpecialNotesButtonEdit.Style.Color := clBtnFace;
     PostavkaButtonEdit.Style.Color     := clBtnFace;
     OsobaPokupButtonEdit.Style.Color   := clBtnFace;
     RozraxunokButtonEdit.Style.Color   := clBtnFace;
     PodNumTextEdit.Style.Color         := clBtnFace;
     NumOrderTextEdit.Style.Color       := clBtnFace;
     DataTermsdelDateEdit.Style.Color   := clBtnFace;
     NumTermsDelTextEdit.Style.Color    := clBtnFace;
     NumOrdInReestrTextEdit.Style.Color    := clBtnFace;
     //TypeDocumentButtonEdit.Style.Color := clBtnFace;

     EditingButton.Visible := True;
     AddButton.Enabled     := True;
     UpdateButton.Enabled  := True;
     DeleteButton.Enabled  := True;
     RefreshButton.Enabled := True;
     YesButton.Visible     := False;
     BudgetButton.Enabled  := True;
     EditTaxButton.Enabled := True;

     is_issued_buyer_CheckBox.Properties.ReadOnly := True;
     is_erpn_CheckBox.Properties.ReadOnly         := True;
     is_issued_buyer_CheckBox.Properties.ReadOnly := True;
     OsoblPrimCheckBox.Properties.ReadOnly        := True;
     is_copy_CheckBox.Properties.ReadOnly         := True;
     PostavkaCheckBox.Properties.ReadOnly         := True;
     RozraxunokCheckBox.Properties.ReadOnly       := True;
     PodZobCheckBox.Properties.ReadOnly           := True;
     PodKreditCheckBox.Properties.ReadOnly        := True;
     NumOrdInReestrTextEdit.Properties.ReadOnly   := True;
     //NoteTextEdit.Properties.ReadOnly             := True;
     //NotPDVCheckBox.Properties.ReadOnly           := True;
     //NoteCheckBox.Properties.ReadOnly             := True;
     //NoteButtonEdit.Enabled                       := False;

     TaxInvoicesKorigDM.WriteTransaction.Commit;
     TiShowMessage('Увага!','Документ змінено.',mtWarning,[mbOK]);
   end;
  {except
    begin
      TiShowMessage('Увага!','Виникла помилка!',mtError,[mbOK]);
      TaxInvoicesKorigDM.WriteTransaction.Rollback;
      PodZobButtonEdit.Properties.onButtonClick       := PodZobButtonEditPropertiesButtonClick;
      PodKreditButtonEdit.Properties.onButtonClick    := PodKreditButtonEditPropertiesButtonClick;
      DataVipDateEdit.Properties.ReadOnly             := False;
      SpecialNotesButtonEdit.Properties.onButtonClick := SpecialNotesButtonEditPropertiesButtonClick;
      PostavkaButtonEdit.Properties.onButtonClick     := PostavkaButtonEditPropertiesButtonClick;
      OsobaPokupButtonEdit.Properties.onButtonClick   := OsobaPokupButtonEditPropertiesButtonClick;
      RozraxunokButtonEdit.Properties.onButtonClick   := RozraxunokButtonEditPropertiesButtonClick;
      //TypeDocumentButtonEdit.Properties.onButtonClick := TypeDocumentButtonEditPropertiesButtonClick;

      PodZobButtonEdit.Style.Color       := clWindow;
      PodKreditButtonEdit.Style.Color    := clWindow;
      DataVipDateEdit.Style.Color        := clWindow;
      SpecialNotesButtonEdit.Style.Color := clWindow;
      PostavkaButtonEdit.Style.Color     := clWindow;
      OsobaPokupButtonEdit.Style.Color   := clWindow;
      RozraxunokButtonEdit.Style.Color   := clWindow;
      PodNumTextEdit.Style.Color         := clWindow;
      NumOrderTextEdit.Style.Color       := clWindow;
      DataTermsdelDateEdit.Style.Color   := clWindow;
      NumTermsDelTextEdit.Style.Color    := clWindow;
      //TypeDocumentButtonEdit.Style.Color := clWindow;

      EditingButton.Visible := False;
      AddButton.Enabled     := False;
      UpdateButton.Enabled  := False;
      DeleteButton.Enabled  := False;
      RefreshButton.Enabled := False;
      BudgetButton.Enabled  := False;
      YesButton.Visible     := True;
      EditTaxButton.Enabled := False;
    end;
  end;}
end;

procedure TTaxInvoicesKorigAddForm.EditingButtonClick(Sender: TObject);
begin
  PodZobButtonEdit.Properties.onButtonClick       := PodZobButtonEditPropertiesButtonClick;
  PodKreditButtonEdit.Properties.onButtonClick    := PodKreditButtonEditPropertiesButtonClick;
  DataVipDateEdit.Properties.ReadOnly             := False;
  SpecialNotesButtonEdit.Properties.onButtonClick := SpecialNotesButtonEditPropertiesButtonClick;
  PostavkaButtonEdit.Properties.onButtonClick     := PostavkaButtonEditPropertiesButtonClick;
  OsobaPokupButtonEdit.Properties.onButtonClick   := OsobaPokupButtonEditPropertiesButtonClick;
  RozraxunokButtonEdit.Properties.onButtonClick   := RozraxunokButtonEditPropertiesButtonClick;
  //TypeDocumentButtonEdit.Properties.onButtonClick := TypeDocumentButtonEditPropertiesButtonClick;

  PodNumTextEdit.Properties.ReadOnly         := False;
  NumOrderTextEdit.Properties.ReadOnly       := False;
  NumTermsDelTextEdit.Properties.ReadOnly    := False;
  PodNumTextEdit.Properties.ReadOnly         := False;
  DataVipDateEdit.Properties.ReadOnly        := False;
  DataTermsdelDateEdit.Properties.ReadOnly   := False;
  IPNPokupTextEdit.Properties.ReadOnly       := False;
  NumOrdInReestrTextEdit.Properties.ReadOnly := False;
  //NoteTextEdit.Properties.ReadOnly         := False;
  //NotPDVCheckBox.Properties.ReadOnly       := False;

  PodZobButtonEdit.Style.Color       := clWindow;
  PodKreditButtonEdit.Style.Color    := clWindow;
  DataVipDateEdit.Style.Color        := clWindow;
  SpecialNotesButtonEdit.Style.Color := clWindow;
  PostavkaButtonEdit.Style.Color     := clWindow;
  OsobaPokupButtonEdit.Style.Color   := clWindow;
  RozraxunokButtonEdit.Style.Color   := clWindow;
  PodNumTextEdit.Style.Color         := clWindow;
  NumOrderTextEdit.Style.Color       := clWindow;
  DataTermsdelDateEdit.Style.Color   := clWindow;
  NumTermsDelTextEdit.Style.Color    := clWindow;
  IPNPokupTextEdit.Style.Color       := clWindow;
  NumOrdInReestrTextEdit.Style.Color := clWindow;
  //TypeDocumentButtonEdit.Style.Color := clWindow;

  EditingButton.Visible := False;
  AddButton.Enabled     := False;
  UpdateButton.Enabled  := False;
  DeleteButton.Enabled  := False;
  RefreshButton.Enabled := False;
  YesButton.Visible     := True;
  BudgetButton.Enabled  := False;
  EditTaxButton.Enabled := False;

  is_issued_buyer_CheckBox.Properties.ReadOnly := False;
  is_erpn_CheckBox.Properties.ReadOnly         := False;
  is_issued_buyer_CheckBox.Properties.ReadOnly := False;
  OsoblPrimCheckBox.Properties.ReadOnly        := False;
  is_copy_CheckBox.Properties.ReadOnly         := False;
  PostavkaCheckBox.Properties.ReadOnly         := False;
  RozraxunokCheckBox.Properties.ReadOnly       := False;
  PodZobCheckBox.Properties.ReadOnly           := False;
  PodKreditCheckBox.Properties.ReadOnly        := False;
  //NoteCheckBox.Properties.ReadOnly             := False;
  //NoteButtonEdit.Enabled                       := True;
end;

procedure TTaxInvoicesKorigAddForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  summa_val_deliv_20 :Double;
  summa_tax : Extended;
  summa_val_deliv_vat_extemptions : Double;
  summa_NDS_budget     : Extended;
  summa_not_NDS_budget : Double;
  summa_main_stavka    : Double;
  summa_not_PDV        : Double;
  summa_korrect        : Double;
begin
  RefreshButtonClick(Self);
  // ничего не делать, если старая налоговая
  if ((TaxInvoicesKorigDM.VidNaklInfoDSet['PK_ID']<>'-1') and (TaxInvoicesKorigDM.VidNaklInfoDSet['PK_ID'] <> null)) then
  begin
    //проверка на пустоту сумм
    if (TaxInvoicesKorigDM.VidNaklInfoDSet['summa_main_stavka'] = null) then
      summa_main_stavka := 0
    else
      summa_main_stavka := TaxInvoicesKorigDM.VidNaklInfoDSet['summa_main_stavka'];

    if (TaxInvoicesKorigDM.VidNaklInfoDSet['summa_not_pdv'] = null) then
      summa_not_pdv := 0
    else
      summa_not_pdv := TaxInvoicesKorigDM.VidNaklInfoDSet['summa_not_pdv'];

    if (TaxInvoicesKorigDM.VidNaklInfoDSet['summa_korrect'] = null) then
      summa_korrect := 0
    else
      summa_korrect := TaxInvoicesKorigDM.VidNaklInfoDSet['summa_korrect'];

      TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
      TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName := 'TI_SUMMA_BUDGET_VID_NAKL';
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_nakl').Value := id_vid_nakl_Ins;
      TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
      TaxInvoicesKorigDM.WriteTransaction.Commit;
      summa_NDS_budget     := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('SUMMA_NDS').Value;
      summa_not_NDS_budget := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('summa_not_nds').Value;

      if (summa_NDS_budget <> summa_korrect) then
      begin
        TiShowMessage('Увага!', 'Сума ПДВ (бюджети)='+Floattostr(summa_NDS_budget)+'.Введена сума ПДВ='+Floattostr(summa_korrect)+'.Суми повинні співпадати!Заповніть корректно бюджет або розрахунок.', mtWarning, [mbOK]);
        Action := caNone;
        Exit;
      end;

          // если сумма НДС не нулевая

    if summa_NDS_budget <> 0 then
     begin
        if summa_main_stavka <> summa_not_NDS_budget then
        begin
         TiShowMessage('Увага!', '"оподатковуються за основною ставкою" = ' + Floattostr(summa_not_NDS_budget)+'. Введена сума "оподатковуються за основною ставкою" ='+Floattostr(summa_main_stavka)+'. Суми повинні співпадати!Заповніть корректно бюджет або накладну.' , mtWarning, [mbOK]);
         Action := caNone;
         Exit;
        end
     end;

    if summa_NDS_budget = 0 then
      begin
        if summa_not_PDV <> summa_not_NDS_budget then
        begin
         TiShowMessage('Увага!', 'Звільнені від ПДВ.(бюджети) = ' + Floattostr(summa_not_NDS_budget)+'. Введена сума Звільнені від ПДВ ='+Floattostr(summa_val_deliv_vat_extemptions)+'. Суми повинні співпадати!Заповніть корректно бюджет або накладну.' , mtWarning, [mbOK]);
         Action := caNone;
         Exit;
        end;
      end;
  end;

  writeReg;

  if (TaxInvoicesKorigDM.ReadTransaction.Active) then
  TaxInvoicesKorigDM.ReadTransaction.Commit;

  if formstyle = fsMDIChild then
   begin
     action := caFree;
   end
  else
   Begin
    TaxInvoicesKorigDM.free;
    ModalResult := mrOk;
   end;
end;

procedure TTaxInvoicesKorigAddForm.ReadReg;
var
  reg : TRegistry;
begin
  try
   begin
     reg := TRegistry.Create;
     reg.RootKey := HKEY_CURRENT_USER;
     if reg.OpenKey('\Software\TaxInvoices\VidNaklDocIns\',False) then
     begin
       PodZobButtonEdit.Text            := reg.ReadString('Name_TaxLiabilities');
       PParameter.id_TaxLiabilities     := StrToInt(reg.ReadString('id_TaxLiabilities'));
       PParameter.Name_TaxLiabilities   := reg.ReadString('Name_TaxLiabilities');
       PodKreditButtonEdit.Text         := reg.ReadString('Name_TaxKredit');
       PParameter.Id_TaxKredit          := StrToInt(reg.ReadString('Id_TaxKredit'));
       PParameter.Name_TaxKredit        := reg.ReadString('Name_TaxKredit');
       SpecialNotesButtonEdit.Text      := reg.ReadString('Name_SpecialNotes');
       PParameter.id_SpecialNotes       := StrToInt(reg.ReadString('id_SpecialNotes'));
       PParameter.Name_SpecialNotes     := reg.ReadString('Name_SpecialNotes');
       PostavkaButtonEdit.Text          := reg.ReadString('Name_TermsDelivery');
       PParameter.id_TermsDelivery      := StrToInt(reg.ReadString('id_TermsDelivery'));
       PParameter.Name_TermsDelivery    := reg.ReadString('Name_TermsDelivery');
       RozraxunokButtonEdit.Text        := reg.ReadString('Name_FormCalculations');
       PParameter.id_FormCalculations   := StrToInt(reg.ReadString('id_FormCalculations'));
       PParameter.Name_FormCalculations := reg.ReadString('Name_FormCalculations');
       if reg.ReadString('ID_TYPE_DOCUMENT') = '' then
       begin
         PParameter.ID_TYPE_DOCUMENT      := 0;
         PParameter.NAME_TYPE_DOCUMENT    := '';
         //TypeDocumentButtonEdit.Text      := '';
       end
       else
       begin
         PParameter.ID_TYPE_DOCUMENT      := StrToInt(reg.ReadString('ID_TYPE_DOCUMENT'));
         PParameter.NAME_TYPE_DOCUMENT    := reg.ReadString('NAME_TYPE_DOCUMENT');
         //TypeDocumentButtonEdit.Text      := reg.ReadString('NAME_TYPE_DOCUMENT');
       end;
     end
     else
     begin
       PostavkaButtonEdit.Text     := '';
       RozraxunokButtonEdit.Text   := '';
       SpecialNotesButtonEdit.Text := '';
       PodZobButtonEdit.Text       := '';
       PodKreditButtonEdit.Text    := '';
       //TypeDocumentButtonEdit.Text := '';
     end;
   end;

   {if reg.OpenKey('\Software\TaxInvoices\VidNaklDocIns\ID_TYPE_DOCUMENT',False) then
     begin
       PParameter.ID_TYPE_DOCUMENT      := StrToInt(reg.ReadString('ID_TYPE_DOCUMENT'));
       PParameter.NAME_TYPE_DOCUMENT    := reg.ReadString('NAME_TYPE_DOCUMENT');
       TypeDocumentButtonEdit.Text      := reg.ReadString('NAME_TYPE_DOCUMENT');
     end
   else
     begin
       TypeDocumentButtonEdit.Text := '';
     end;   }

  finally
    reg.Free;
  end;
end;

procedure TTaxInvoicesKorigAddForm.WriteReg;
var
  reg : TRegistry;
begin
  reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if (reg.OpenKey('\Software\TaxInvoices\VidNaklDocIns\',True)) then
   begin
     reg.WriteString('Id_TaxLiabilities',IntToStr(PParameter.id_TaxLiabilities));
     reg.WriteString('Name_TaxLiabilities',PParameter.Name_TaxLiabilities);
     reg.WriteString('Id_TaxKredit',IntToStr(PParameter.Id_TaxKredit));
     reg.WriteString('Name_TaxKredit',PParameter.Name_TaxKredit);
     reg.WriteString('id_SpecialNotes',IntToStr(PParameter.id_SpecialNotes));
     reg.WriteString('Name_SpecialNotes',PParameter.Name_SpecialNotes);
     reg.WriteString('id_TermsDelivery',IntToStr(PParameter.id_TermsDelivery));
     reg.WriteString('Name_TermsDelivery',PParameter.Name_TermsDelivery);
     reg.WriteString('id_FormCalculations',IntToStr(PParameter.id_FormCalculations));
     reg.WriteString('Name_FormCalculations',PParameter.Name_FormCalculations);
     reg.WriteString('ID_TYPE_DOCUMENT',IntToStr(PParameter.ID_TYPE_DOCUMENT));
     reg.WriteString('NAME_TYPE_DOCUMENT',PParameter.NAME_TYPE_DOCUMENT);
   end;
  finally
   reg.Free;
  end;
end;

procedure TTaxInvoicesKorigAddForm.DeliveryInsBarButtonClick(Sender: TObject);
begin
  AddButton.Click;
end;

procedure TTaxInvoicesKorigAddForm.RefreshButtonClick(Sender: TObject);
var
  p: Double;
begin
//  ShowMessage(IntToStr(id_vid_nakl_doc_Ins));
  TaxInvoicesKorigDM.VidNaklInfoDSet.Close;
  TaxInvoicesKorigDM.VidNaklInfoDSet.SelectSQL.Text := 'select * from TI_SP_VID_NAKL_DOC_SEL(:ID)';
  TaxInvoicesKorigDM.VidNaklInfoDSet.ParamByName('id').Value := id_vid_nakl_doc_Ins;
  TaxInvoicesKorigDM.VidNaklInfoDSet.Open;

  if (TaxInvoicesKorigDM.VidNaklInfoDSet['SUMMA_MAIN_STAVKA'] = null) then
    FirstAllStatusBar.Panels[2].Text := ''
  else
  begin
    p:= TaxInvoicesKorigDM.VidNaklInfoDSet['SUMMA_MAIN_STAVKA'];
    if (trunc(p) = p) then
      begin
       FirstAllStatusBar.Panels[2].Text := FloatToStr(p) + ',00';
      end
    else
      FirstAllStatusBar.Panels[2].Text := FloatToStr(p);
  end;

  if (TaxInvoicesKorigDM.VidNaklInfoDSet['SUMMA_NULL_STAVKA'] = null) then
    FirstAllStatusBar.Panels[3].Text := ''
  else
  begin
    p:= TaxInvoicesKorigDM.VidNaklInfoDSet['SUMMA_NULL_STAVKA'];
    if (trunc(p) = p) then
      begin
       FirstAllStatusBar.Panels[3].Text := FloatToStr(p) + ',00';
      end
    else
      FirstAllStatusBar.Panels[3].Text := FloatToStr(p);
  end;

  if (TaxInvoicesKorigDM.VidNaklInfoDSet['SUMMA_NOT_PDV'] = null) then
    FirstAllStatusBar.Panels[4].Text := ''
  else
  begin
    p:= TaxInvoicesKorigDM.VidNaklInfoDSet['SUMMA_NOT_PDV'];
    if (trunc(p) = p) then
      begin
       FirstAllStatusBar.Panels[4].Text := FloatToStr(p) + ',00';
      end
    else
      FirstAllStatusBar.Panels[4].Text := FloatToStr(p);
  end;

  if (TaxInvoicesKorigDM.VidNaklInfoDSet['summa_korrect'] = null) then
    SummaAllPDVStatusBar.Panels[2].Text := ''
  else
  begin
    p:= TaxInvoicesKorigDM.VidNaklInfoDSet['summa_korrect'];
    if (trunc(p) = p) then
      begin
       SummaAllPDVStatusBar.Panels[2].Text := FloatToStr(p) + ',00';
      end
    else
      SummaAllPDVStatusBar.Panels[2].Text := FloatToStr(p);
  end;

  TaxInvoicesKorigDM.NaklDeliveryDSet.Close;
  TaxInvoicesKorigDM.NaklDeliveryDSet.SelectSQL.Text := 'select * from TI_SP_VID_NAKL_KORRECT_SEL where ID_VID_NAKL_DOC =:ID ';
  TaxInvoicesKorigDM.NaklDeliveryDSet.ParamByName('ID').Value := id_vid_nakl_doc_Ins;
  TaxInvoicesKorigDM.NaklDeliveryDSet.Open;

  FirstSummaAll;

end;

procedure TTaxInvoicesKorigAddForm.UpdateButtonClick(Sender: TObject);
var
  ViewForm : TTaxInvoicesKorigAddInNaklForm;
  id_vid_nakl_korrect :Integer;
  AddParametr :TTITaxInvoicesAddVidNaklDelivery;
begin
  if not (TaxInvoicesKorigDM.NaklDeliveryDSet.IsEmpty) then
  begin
    id_vid_nakl_korrect := TaxInvoicesKorigDM.NaklDeliveryDSet['id_vid_nakl_korrect'];
    if (TaxInvoicesKorigDM.NaklDeliveryDSet['id_range_of_delivery'] = null) then
     begin
      AddParametr.id_range_of_delivery   := 0;
      AddParametr.Name_range_of_delivery := '';
     end
    else
     begin
      AddParametr.id_range_of_delivery   := TaxInvoicesKorigDM.NaklDeliveryDSet['id_range_of_delivery'];
      AddParametr.Name_range_of_delivery := TaxInvoicesKorigDM.NaklDeliveryDSet['Name_range_of_delivery'];
     end;

    if (TaxInvoicesKorigDM.NaklDeliveryDSet['id_measures'] = null) then
     begin
      AddParametr.Id_Measures   := 0;
      AddParametr.Name_Measures := '';
     end
    else
     begin
      AddParametr.Id_Measures   := TaxInvoicesKorigDM.NaklDeliveryDSet['id_measures'];
      AddParametr.Name_Measures := TaxInvoicesKorigDM.NaklDeliveryDSet['Name_Measures'];
     end;

    if ((TaxInvoicesKorigDM.NaklDeliveryDSet['id_kod_tovar'] = null) or (TaxInvoicesKorigDM.NaklDeliveryDSet['id_kod_tovar'] = 0) ) then
     begin
      AddParametr.id_kod_tovar   := 0;
      AddParametr.Num_Kod_tovar  := '';
      AddParametr.Name_Kod_tovar := '';
     end
    else
     begin
      AddParametr.id_kod_tovar   := TaxInvoicesKorigDM.NaklDeliveryDSet['id_kod_tovar'];
      AddParametr.Num_Kod_tovar  := TaxInvoicesKorigDM.NaklDeliveryDSet['num_kod_tovar'];
      AddParametr.Name_Kod_tovar := TaxInvoicesKorigDM.NaklDeliveryDSet['name_kod_tovar'];
     end;

    ViewForm := TTaxInvoicesKorigAddInNaklForm.Create(Self,TaxInvoicesKorigDM.DB.Handle,AddParametr);
    if ((TaxInvoicesKorigDM.NaklDeliveryDSet['MONTH_RANGE_OF_DELIVERY'] = null) or (TaxInvoicesKorigDM.NaklDeliveryDSet['MONTH_RANGE_OF_DELIVERY'] = '') ) then
     begin
      ViewForm.ZaCheckBox.Checked   := False;
      ViewForm.MonthList.Enabled    := False;
      ViewForm.YearSpinEdit.Enabled := False;
      ViewForm.MonthList.Items.Text := GetMonthList2;
      ViewForm.Kod_Setup            := CurrentKodSetup(PDb_Handle);
      ViewForm.YearSpinEdit.Value   := YearMonthFromKodSetup(ViewForm.Kod_Setup);
      ViewForm.MonthList.ItemIndex  := YearMonthFromKodSetup(ViewForm.Kod_Setup-1,False);
     end
    else
     begin
      ViewForm.ZaCheckBox.Checked   := True;
      ViewForm.MonthList.Enabled    := True;
      ViewForm.YearSpinEdit.Enabled := True;
      ViewForm.MonthList.Text       := TaxInvoicesKorigDM.NaklDeliveryDSet['MONTH_RANGE_OF_DELIVERY'];
      ViewForm.YearSpinEdit.Text    := TaxInvoicesKorigDM.NaklDeliveryDSet['YEAR_RANGE_OF_DELIVERY'];
     end;

    ViewForm.DateKorrectEdit.Date                  := TaxInvoicesKorigDM.NaklDeliveryDSet['date_korrect'];
    ViewForm.ReasonTextEdit.Text                   := TaxInvoicesKorigDM.NaklDeliveryDSet['reason_korrect'];
    ViewForm.edit_kolvoCurrencyEdit.EditValue      := TaxInvoicesKorigDM.NaklDeliveryDSet['edit_kolvo'];
    ViewForm.edit_priceCurrencyEdit.EditValue      := TaxInvoicesKorigDM.NaklDeliveryDSet['edit_price'];
    ViewForm.edit_price_costCurrencyEdit.EditValue := TaxInvoicesKorigDM.NaklDeliveryDSet['edit_price_cost'];
    ViewForm.edit_kolvo_costTextEdit.Text          := TaxInvoicesKorigDM.NaklDeliveryDSet['edit_kolvo_cost'];
    ViewForm.main_stavkaCurrencyEdit.EditValue     := TaxInvoicesKorigDM.NaklDeliveryDSet['main_stavka'];
    ViewForm.null_stavkaCurrencyEdit.EditValue     := TaxInvoicesKorigDM.NaklDeliveryDSet['null_stavka'];
    ViewForm.summa_not_pdvCurrencyEdit.EditValue   := TaxInvoicesKorigDM.NaklDeliveryDSet['summa_not_pdv'];

    ViewForm.RangeOfDeliveryButtonEdit.Text := AddParametr.Name_range_of_delivery;
    ViewForm.MeasuresButtonEdit.Text        := AddParametr.Name_Measures;
    if (AddParametr.Name_Kod_tovar = '') then
    begin
      ViewForm.KodTovarCheckBox.Checked := False;
      ViewForm.KodTovarButtonEdit.Text := '';
    end
    else
    begin
      ViewForm.KodTovarCheckBox.Checked := True;
      ViewForm.KodTovarButtonEdit.Text := AddParametr.Name_Kod_tovar;
    end;

    if (AddParametr.Name_Kod_tovar = '') then
    begin
      ViewForm.KodTovarCheckBox.Checked := False;
      ViewForm.KodTovarButtonEdit.Text := '';
    end
    else
    begin
      ViewForm.KodTovarCheckBox.Checked := True;
      ViewForm.KodTovarButtonEdit.Text := AddParametr.Name_Kod_tovar;
    end;
    //ViewForm.ValueDeliveryVATexemptionsCurrencyEdit.Text := TaxInvoicesKorigDM.NaklDeliveryDSet['value_delivery_vat_exemption'];
    ViewForm.ShowModal;

    if (ViewForm.ModalResult = mrok) then
     begin
      TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
      TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                              := 'TI_SP_VID_NAKL_KORRECT_UPD';
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('date_korrect').Value           := ViewForm.DateKorrectEdit.Date;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('REASON_KORRECT').Value         := ViewForm.ReasonTextEdit.Text;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_range_of_delivery').Value   := ViewForm.Parameter.id_range_of_delivery;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_range_of_delivery').Value := ViewForm.Parameter.Name_range_of_delivery;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_measures').Value            := ViewForm.Parameter.Id_Measures;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_measures').Value          := ViewForm.Parameter.Name_Measures;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('edit_kolvo').Value             := ViewForm.edit_kolvoCurrencyEdit.Value;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('edit_price').Value             := ViewForm.edit_priceCurrencyEdit.Value;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('edit_kolvo_cost').Value        := ViewForm.edit_kolvo_costTextEdit.Text;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('edit_price_cost').Value        := ViewForm.edit_price_costCurrencyEdit.Value;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('main_stavka').Value            := ViewForm.main_stavkaCurrencyEdit.Value;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('null_stavka').Value            := ViewForm.null_stavkaCurrencyEdit.Value;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('summa_not_pdv').Value          := ViewForm.summa_not_pdvCurrencyEdit.Value;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_vid_nakl_doc').Value        := id_vid_nakl_doc_Ins;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_vid_nakl_korrect').Value    := id_vid_nakl_korrect;

      if (ViewForm.KodTovarCheckBox.Checked = true) then
      begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_kod_tovar').Value   := ViewForm.Parameter.id_kod_tovar;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('num_kod_tovar').Value  := ViewForm.Parameter.Num_Kod_tovar;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_kod_tovar').Value := ViewForm.Parameter.Name_Kod_tovar;
      end
      else
      begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_kod_tovar').Value   := 0;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('num_kod_tovar').Value  := '';
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_kod_tovar').Value := '';
      end;

      if (ViewForm.ZaCheckBox.Checked = true) then
      begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('MONTH_RANGE_OF_DELIVERY').Value := ViewForm.MonthList.Text;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('YEAR_RANGE_OF_DELIVERY').Value  := ViewForm.YearSpinEdit.Text;
      end
      else
      begin
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('MONTH_RANGE_OF_DELIVERY').Value := '';
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('YEAR_RANGE_OF_DELIVERY').Value  := '';
      end;

      TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;

      TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                       := 'TI_VID_NAKL_DOC_SUMMA_KORRECT';
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value := id_vid_nakl_doc_Ins;
      TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;

      TaxInvoicesKorigDM.WriteTransaction.Commit;
      RefreshButton.Click;
      TaxInvoicesKorigDM.NaklDeliveryDSet.Locate('id_vid_nakl_korrect',IntToStr(id_vid_nakl_korrect),[]);
     end;
  end;
end;

procedure TTaxInvoicesKorigAddForm.DeliveryUpdBarButtonClick(Sender: TObject);
begin
  UpdateButton.Click;
end;

procedure TTaxInvoicesKorigAddForm.DeleteButtonClick(Sender: TObject);
begin
  if TiShowMessage('Увага!','Ви дійсно бажаєте вилучити запис?',mtConfirmation,[mbYes, mbNo])=mrYes then
   begin
    try
      TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
      TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName:='TI_SP_VID_NAKL_KORRECT_DEL';
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_vid_nakl_korrect').Value:=TaxInvoicesKorigDM.NaklDeliveryDSet['id_vid_nakl_korrect'];
      TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
      //!!!!!!!!!!!!!!!!!! пересчет сумм
      TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                       := 'TI_VID_NAKL_DOC_SUMMA_KORRECT';
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value := id_vid_nakl_doc_Ins;
      TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
      TaxInvoicesKorigDM.WriteTransaction.Commit;
      RefreshButton.Click;
    except on E:Exception do
     begin
       TiShowMessage('Увага!','не можна видалити цей запис', mtError, [mbOK]);
       TaxInvoicesKorigDM.WriteTransaction.Rollback;
     end;
    end;
   end;
end;

procedure TTaxInvoicesKorigAddForm.DeliveryDelBarButtonClick(Sender: TObject);
begin
  DeleteButton.Click;
end;

procedure TTaxInvoicesKorigAddForm.FirstSummaAll;
var
  p:Double;
begin
  TaxInvoicesKorigDM.FirstSummaAllDSet.Close;
  TaxInvoicesKorigDM.FirstSummaAllDSet.SelectSQL.Text := 'select * from TI_FIRST_SUMMA_ALL_KORRECT(:id)';
  TaxInvoicesKorigDM.FirstSummaAllDSet.ParamByName('id').Value := id_vid_nakl_doc_Ins;
  TaxInvoicesKorigDM.FirstSummaAllDSet.Open;

  if (TaxInvoicesKorigDM.FirstSummaAllDSet['main_stavka'] = null) then
    FirstAllStatusBar.Panels[2].Text := ''
  else
  begin
    p:= TaxInvoicesKorigDM.FirstSummaAllDSet['main_stavka'];
    if (trunc(p) = p) then
      begin
       FirstAllStatusBar.Panels[2].Text := FloatToStr(p) + ',00';
      end
    else
      FirstAllStatusBar.Panels[2].Text := FloatToStr(p);
  end;

  if (TaxInvoicesKorigDM.FirstSummaAllDSet['null_stavka'] = null) then
    FirstAllStatusBar.Panels[3].Text := ''
  else
  begin
    p:= TaxInvoicesKorigDM.FirstSummaAllDSet['null_stavka'];
    if (trunc(p) = p) then
      begin
       FirstAllStatusBar.Panels[3].Text := FloatToStr(p) + ',00';
      end
    else
      FirstAllStatusBar.Panels[3].Text := FloatToStr(p);
  end;

  if (TaxInvoicesKorigDM.FirstSummaAllDSet['summa_not_pdv'] = null) then
    FirstAllStatusBar.Panels[4].Text := ''
  else
  begin
    p:= TaxInvoicesKorigDM.FirstSummaAllDSet['summa_not_pdv'];
    if (trunc(p) = p) then
      begin
       FirstAllStatusBar.Panels[4].Text := FloatToStr(p) + ',00';
      end
    else
      FirstAllStatusBar.Panels[4].Text := FloatToStr(p);
  end;


 { if (TaxInvoicesKorigDM.FirstSummaAllDSet['value_delivery_customs'] = null) then
    FirstAllStatusBar.Panels[6].Text := ''
  else
    FirstAllStatusBar.Panels[6].Text := TaxInvoicesKorigDM.FirstSummaAllDSet['value_delivery_customs'];

  if (TaxInvoicesKorigDM.FirstSummaAllDSet['value_delivery_export'] = null) then
    FirstAllStatusBar.Panels[7].Text := ''
  else
    FirstAllStatusBar.Panels[7].Text := TaxInvoicesKorigDM.FirstSummaAllDSet['value_delivery_export'];

  if (TaxInvoicesKorigDM.FirstSummaAllDSet['value_delivery_vat_exemption'] = null) then
    FirstAllStatusBar.Panels[8].Text := ''
  else
    FirstAllStatusBar.Panels[8].Text := TaxInvoicesKorigDM.FirstSummaAllDSet['value_delivery_vat_exemption'];

  if (TaxInvoicesKorigDM.FirstSummaAllDSet['summa_all'] = null) then
    FirstAllStatusBar.Panels[9].Text := ''
  else
    FirstAllStatusBar.Panels[9].Text := TaxInvoicesKorigDM.FirstSummaAllDSet['summa_all']; }

end;

procedure TTaxInvoicesKorigAddForm.TransportInsBarButtonClick(
  Sender: TObject);
var
  ViewForm             : TTaxInvoicesKorigAddInNaklForm;
  id_vid_nakl_delivery : Integer;
  AddParametr          : TTITaxInvoicesAddVidNaklDelivery;
begin
 { AddParametr.id_range_of_delivery   := 0;
  AddParametr.Name_range_of_delivery := '';
  AddParametr.Id_Measures   := 0;
  AddParametr.Name_Measures := '';

  ViewForm := TTaxInvoicesKorigAddInNaklForm.Create(Self,TaxInvoicesKorigDM.DB.Handle,AddParametr);

  ViewForm.DataGroupBox.Visible              := False;
  //ViewForm.DateShipmentLabel.Visible         := False;
 // ViewForm.DateShipmentEdit.Visible          := False;
  ViewForm.RangeOfDeliveryLabel.Visible      := False;
  ViewForm.RangeOfDeliveryButtonEdit.Visible := False;
  ViewForm.DataGroupBox.Visible              := False;

  ViewForm.ReadReg;
  ViewForm.ShowModal;
  if (ViewForm.ModalResult = mrok) then
  begin
    TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
    TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                              := 'TI_SP_VID_NAKL_DELIVERY_INS';
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_measures').Value            := ViewForm.Parameter.Id_Measures;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_measures').Value          := ViewForm.Parameter.Name_Measures;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('kol_vo_delivery_goods').Value  := ViewForm.KolVoTextEdit.Text;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('price_delivery_goods').Value   := ViewForm.PriceCurrencyEdit.Value;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('value_delivery_20').Value      := ViewForm.ValueDelivery20CurrencyEdit.Value;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('value_delivery_export').Value  := ViewForm.ValueDeliveryExportCurrencyEdit.Value;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('value_delivery_customs').Value := ViewForm.ValueDeliveryCustomsCurrencyEdit.Value;
//    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('value_delivery_vat_exemption').Value := ViewForm.ValueDeliveryVATexemptionsCurrencyEdit.Value;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_vid_nakl_doc').Value        := id_vid_nakl_doc_Ins;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('section').Value                := '2';
    TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
    TaxInvoicesKorigDM.WriteTransaction.Commit;
    id_vid_nakl_delivery := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DELIVERY_').AsInteger;
    RefreshButton.Click;
    TaxInvoicesKorigDM.NaklDeliveryDSet.Locate('ID_VID_NAKL_DELIVERY',IntToStr(id_vid_nakl_delivery),[]);
  end; }
end;

procedure TTaxInvoicesKorigAddForm.TransportCosts;
begin
  TaxInvoicesKorigDM.TransportCostsDSet.Close;
  TaxInvoicesKorigDM.TransportCostsDSet.SelectSQL.Text := 'select * from TI_TRANSPORT_COSTS(:ID) ';
  TaxInvoicesKorigDM.TransportCostsDSet.ParamByName('ID').Value := id_vid_nakl_doc_Ins;
  TaxInvoicesKorigDM.TransportCostsDSet.Open;

  if (TaxInvoicesKorigDM.TransportCostsDSet['summa_all'] = null) then
  begin
    TransportInsBarButton.Enabled := True;
    TransportUpdBarButton.Enabled := False;
  end
  else
  begin
    TransportInsBarButton.Enabled := False;
    TransportUpdBarButton.Enabled := True;
  end;

  if (id_vid_nakl_doc_Ins = -1) then
  begin
    TransportInsBarButton.Enabled := False;
    TransportUpdBarButton.Enabled := True;
  end;


  if (TaxInvoicesKorigDM.TransportCostsDSet['NAME_MEASURES'] = null) then
    //TransportCostsStatusBar.Panels[2].Text := ''
  else
    //TransportCostsStatusBar.Panels[2].Text := TaxInvoicesKorigDM.TransportCostsDSet['NAME_MEASURES'];

  if (TaxInvoicesKorigDM.TransportCostsDSet['kol_vo_delivery_goods'] = null) then
    //TransportCostsStatusBar.Panels[3].Text := ''
  else
    //TransportCostsStatusBar.Panels[3].Text := TaxInvoicesKorigDM.TransportCostsDSet['kol_vo_delivery_goods'];

  if (TaxInvoicesKorigDM.TransportCostsDSet['price_delivery_goods'] = null) then
    //TransportCostsStatusBar.Panels[4].Text := ''
  else
    //TransportCostsStatusBar.Panels[4].Text := TaxInvoicesKorigDM.TransportCostsDSet['price_delivery_goods'];

  if (TaxInvoicesKorigDM.TransportCostsDSet['value_delivery_20'] = null) then
    //TransportCostsStatusBar.Panels[5].Text := ''
  else
    //TransportCostsStatusBar.Panels[5].Text := TaxInvoicesKorigDM.TransportCostsDSet['value_delivery_20'];

  if (TaxInvoicesKorigDM.TransportCostsDSet['value_delivery_customs'] = null) then
    //TransportCostsStatusBar.Panels[6].Text := ''
  else
   // TransportCostsStatusBar.Panels[6].Text := TaxInvoicesKorigDM.TransportCostsDSet['value_delivery_customs'];

  if (TaxInvoicesKorigDM.TransportCostsDSet['value_delivery_export'] = null) then
   // TransportCostsStatusBar.Panels[7].Text := ''
  else
   // TransportCostsStatusBar.Panels[7].Text := TaxInvoicesKorigDM.TransportCostsDSet['value_delivery_export'];

  if (TaxInvoicesKorigDM.TransportCostsDSet['value_delivery_vat_exemption'] = null) then
    //TransportCostsStatusBar.Panels[8].Text := ''
  else
    //TransportCostsStatusBar.Panels[8].Text := TaxInvoicesKorigDM.TransportCostsDSet['value_delivery_vat_exemption'];

  if (TaxInvoicesKorigDM.TransportCostsDSet['summa_all'] = null) then
    //TransportCostsStatusBar.Panels[9].Text := ''
  else
   // TransportCostsStatusBar.Panels[9].Text := TaxInvoicesKorigDM.TransportCostsDSet['summa_all'];
end;

procedure TTaxInvoicesKorigAddForm.ClearStatusBars;
begin
  FirstAllStatusBar.Panels[2].Text := '';
  FirstAllStatusBar.Panels[3].Text := '';
  FirstAllStatusBar.Panels[4].Text := '';

  {TransportCostsStatusBar.Panels[2].Text := '';
  TransportCostsStatusBar.Panels[3].Text := '';
  TransportCostsStatusBar.Panels[4].Text := '';
  TransportCostsStatusBar.Panels[5].Text := '';
  TransportCostsStatusBar.Panels[6].Text := '';
  TransportCostsStatusBar.Panels[7].Text := '';
  TransportCostsStatusBar.Panels[8].Text := ''; }

 // MortgageTaraStatusBar.Panels[9].Text := '';
end;

procedure TTaxInvoicesKorigAddForm.EnableButtons(id:Integer);
begin
 if (id = -1) then    //вставка документа
  begin
    DeliveryInsBarButton.Enabled  := True;
    TransportInsBarButton.Enabled := True;
    TaraInsBarButton.Enabled      := True;
    DeliveryUpdBarButton.Enabled  := False;
    TransportUpdBarButton.Enabled := False;
    TaraUpdBarButton.Enabled      := False;
  end
 else
  begin
    DeliveryUpdBarButton.Enabled  := True;
  end;

end;

procedure TTaxInvoicesKorigAddForm.TransportUpdBarButtonClick(
  Sender: TObject);
var
  ViewForm             : TTaxInvoicesKorigAddInNaklForm;
  id_vid_nakl_delivery : Integer;
  AddParametr          : TTITaxInvoicesAddVidNaklDelivery;
begin
{  id_vid_nakl_delivery := TaxInvoicesKorigDM.TransportCostsDSet['id_vid_nakl_delivery'];
  AddParametr.id_range_of_delivery   := 0;
  AddParametr.Name_range_of_delivery := '';
  AddParametr.Id_Measures            := TaxInvoicesKorigDM.TransportCostsDSet['Id_Measures'];
  AddParametr.Name_Measures          := TaxInvoicesKorigDM.TransportCostsDSet['Name_Measures'];

  ViewForm := TTaxInvoicesKorigAddInNaklForm.Create(Self,TaxInvoicesKorigDM.DB.Handle,AddParametr);

  ViewForm.DataGroupBox.Visible              := False;
  ViewForm.DateShipmentLabel.Visible         := False;
  ViewForm.DateShipmentEdit.Visible          := False;
  ViewForm.RangeOfDeliveryLabel.Visible      := False;
  ViewForm.RangeOfDeliveryButtonEdit.Visible := False;

  ViewForm.MeasuresButtonEdit.Text               := TaxInvoicesKorigDM.TransportCostsDSet['name_measures'];
  ViewForm.KolVoTextEdit.Text                    := TaxInvoicesKorigDM.TransportCostsDSet['kol_vo_delivery_goods'];
  ViewForm.PriceCurrencyEdit.Text                := TaxInvoicesKorigDM.TransportCostsDSet['price_delivery_goods'];
  ViewForm.ValueDeliveryExportCurrencyEdit.Text  := TaxInvoicesKorigDM.TransportCostsDSet['value_delivery_export'];
  ViewForm.ValueDelivery20CurrencyEdit.Text      := TaxInvoicesKorigDM.TransportCostsDSet['value_delivery_20'];
  ViewForm.ValueDeliveryCustomsCurrencyEdit.Text := TaxInvoicesKorigDM.TransportCostsDSet['value_delivery_customs'];
//  ViewForm.ValueDeliveryVATexemptionsCurrencyEdit.Text := TaxInvoicesKorigDM.TransportCostsDSet['value_delivery_vat_exemption'];
  ViewForm.ShowModal;

  if (ViewForm.ModalResult = mrok) then
  begin
    TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
    TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                              := 'TI_SP_VID_NAKL_DELIVERY_UPD';
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_measures').Value            := ViewForm.Parameter.Id_Measures;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_measures').Value          := ViewForm.Parameter.Name_Measures;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('kol_vo_delivery_goods').Value  := ViewForm.KolVoTextEdit.Text;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('price_delivery_goods').Value   := ViewForm.PriceCurrencyEdit.Value;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('value_delivery_20').Value      := ViewForm.ValueDelivery20CurrencyEdit.Value;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('value_delivery_export').Value  := ViewForm.ValueDeliveryExportCurrencyEdit.Value;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('value_delivery_customs').Value := ViewForm.ValueDeliveryCustomsCurrencyEdit.Value;
//    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('value_delivery_vat_exemption').Value := ViewForm.ValueDeliveryVATexemptionsCurrencyEdit.Value;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_vid_nakl_doc').Value        := id_vid_nakl_doc_Ins;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('section').Value                := '2';
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_vid_nakl_delivery').Value   := id_vid_nakl_delivery;
    TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
    TaxInvoicesKorigDM.WriteTransaction.Commit;
    RefreshButton.Click;
    TaxInvoicesKorigDM.NaklDeliveryDSet.Locate('ID_VID_NAKL_DELIVERY',IntToStr(id_vid_nakl_delivery),[]);
  end; }
end;

procedure TTaxInvoicesKorigAddForm.TransportDelBarButtonClick(
  Sender: TObject);
begin
  if TiShowMessage('Увага!','Ви дійсно бажаєте вилучити запис?',mtConfirmation,[mbYes, mbNo])=mrYes then
  begin
   try
     TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
     TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName:='TI_SP_VID_NAKL_DELIVERY_DEL';
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_vid_nakl_delivery').Value := TaxInvoicesKorigDM.TransportCostsDSet['id_vid_nakl_delivery'];
     TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
     TaxInvoicesKorigDM.WriteTransaction.Commit;
     RefreshButton.Click;
   except on E:Exception do
    begin
     TiShowMessage('Увага!','не можна видалити цей запис', mtError, [mbOK]);
     TaxInvoicesKorigDM.WriteTransaction.Rollback;
    end;
   end;
  end;
end;

procedure TTaxInvoicesKorigAddForm.TaraInsBarButtonClick(Sender: TObject);
{var
  ViewForm             : TTaxInvoicesEditAddTaraForm;
  AddParametr          : TTITaxInvoicesAddTara;  }
begin
 { AddParametr.id_tara   := 0;
  AddParametr.Name_tara := '';
  ViewForm := TTaxInvoicesEditAddTaraForm.Create(Self,TaxInvoicesKorigDM.DB.Handle,AddParametr);
  //ViewForm.TaraButtonEdit.Text    := '';
  ViewForm.SummaCurrencyEdit.Text := '';
  ViewForm.ReadReg;
  ViewForm.ShowModal;
  if (ViewForm.ModalResult = mrok) then
  begin
    TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
    TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                       := 'TI_SP_VID_NAKL_TARE_INS';
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_TARE').Value         := ViewForm.Parameter.id_tara;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TARE').Value       := ViewForm.Parameter.Name_tara;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('SUMMA_ALL').Value       := ViewForm.SummaCurrencyEdit.Value;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value := id_vid_nakl_doc_Ins;
    TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;

    TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                       := 'TI_VID_NAKL_DOC_SUMMA_CALC';
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value := id_vid_nakl_doc_Ins;
    TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
    
    TaxInvoicesKorigDM.WriteTransaction.Commit;
    RefreshButton.Click;  }
 // end;
end;

procedure TTaxInvoicesKorigAddForm.PodZobCheckBoxClick(Sender: TObject);
begin
    PodZobButtonEdit.Enabled := PodZobCheckBox.Checked;
end;

procedure TTaxInvoicesKorigAddForm.PodKreditCheckBoxClick(Sender: TObject);
begin
  PodKreditButtonEdit.Enabled := PodKreditCheckBox.Checked;
end;

procedure TTaxInvoicesKorigAddForm.OsoblPrimCheckBoxClick(Sender: TObject);
begin
  SpecialNotesButtonEdit.Enabled := OsoblPrimCheckBox.Checked;
end;

procedure TTaxInvoicesKorigAddForm.MortgageTara;
begin
  TaxInvoicesKorigDM.MortgageTaraDSet.Close;
  TaxInvoicesKorigDM.MortgageTaraDSet.SelectSQL.Text := 'select * from TI_SP_VID_NAKL_TARE_SEL(:ID) ';
  TaxInvoicesKorigDM.MortgageTaraDSet.ParamByName('ID').Value := id_vid_nakl_doc_Ins;
  TaxInvoicesKorigDM.MortgageTaraDSet.Open;

  if (TaxInvoicesKorigDM.MortgageTaraDSet['summa_all'] = null) then
  begin
    TaraInsBarButton.Enabled := True;
    TaraUpdBarButton.Enabled := False;
    TaraDelBarButton.Enabled := False;
    //MortgageTaraStatusBar.Panels[9].Text := '';
    //MortgageTaraStatusBar.Panels[1].Text := 'Зворотна(заставна тара)';
  end
  else
  begin
    TaraInsBarButton.Enabled := False;
    TaraUpdBarButton.Enabled := True;
    TaraDelBarButton.Enabled := True;
    //MortgageTaraStatusBar.Panels[9].Text := TaxInvoicesKorigDM.MortgageTaraDSet['summa_all'];
    //MortgageTaraStatusBar.Panels[1].Text := TaxInvoicesKorigDM.MortgageTaraDSet['name_tare'];
  end;

  if (id_vid_nakl_doc_Ins = -1) then
  begin
    TaraInsBarButton.Enabled := True;
    TaraUpdBarButton.Enabled := False;
    TaraDelBarButton.Enabled := False;
    //MortgageTaraStatusBar.Panels[9].Text := '';
    //MortgageTaraStatusBar.Panels[1].Text := 'Зворотна(заставна тара)';
  end;
end;

procedure TTaxInvoicesKorigAddForm.TaraUpdBarButtonClick(Sender: TObject);
{var
  ViewForm             : TTaxInvoicesEditAddTaraForm;
  AddParametr          : TTITaxInvoicesAddTara;}
begin
 { AddParametr.id_tara   := TaxInvoicesKorigDM.MortgageTaraDSet['id_tare'];
  AddParametr.Name_tara := TaxInvoicesKorigDM.MortgageTaraDSet['Name_tare'];
  ViewForm := TTaxInvoicesEditAddTaraForm.Create(Self,TaxInvoicesKorigDM.DB.Handle,AddParametr);
  ViewForm.TaraButtonEdit.Text    := TaxInvoicesKorigDM.MortgageTaraDSet['Name_tare'];
  ViewForm.SummaCurrencyEdit.Text := TaxInvoicesKorigDM.MortgageTaraDSet['summa_all'];
//  ViewForm.ReadReg;
  ViewForm.ShowModal;
  if (ViewForm.ModalResult = mrok) then
  begin
    TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
    TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                        := 'TI_SP_VID_NAKL_TARE_UPD';
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_TARE').Value          := ViewForm.Parameter.id_tara;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_TARE').Value        := ViewForm.Parameter.Name_tara;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('SUMMA_ALL').Value        := ViewForm.SummaCurrencyEdit.Value;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value  := TaxInvoicesKorigDM.MortgageTaraDSet['ID_VID_NAKL_DOC'];
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_vid_nakl_tare').Value := TaxInvoicesKorigDM.MortgageTaraDSet['id_vid_nakl_tare'];
    TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;

    TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                       := 'TI_VID_NAKL_DOC_SUMMA_CALC';
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value := id_vid_nakl_doc_Ins;
    TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;

    TaxInvoicesKorigDM.WriteTransaction.Commit;
    RefreshButton.Click;
  end; }
end;

procedure TTaxInvoicesKorigAddForm.TaraDelBarButtonClick(Sender: TObject);
var
  error_message: string;
begin
  error_message := 'Ви дійсно бажаєте вилучити '+TaxInvoicesKorigDM.MortgageTaraDSet['name_tare']+' ?';
  if TiShowMessage('Увага!',error_message,mtConfirmation,[mbYes, mbNo])=mrYes then
  begin
   try
    TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
    TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName:='TI_SP_VID_NAKL_TARE_DEL';
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_vid_nakl_tare').Value:=TaxInvoicesKorigDM.MortgageTaraDSet['id_vid_nakl_tare'];
    TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
    TaxInvoicesKorigDM.WriteTransaction.Commit;
    RefreshButton.Click;
   except on E:Exception do
    begin
     TiShowMessage('Увага!','не можна видалити цей запис', mtError, [mbOK]);
     TaxInvoicesKorigDM.WriteTransaction.Rollback;
    end;
   end;
  end;
end;

procedure TTaxInvoicesKorigAddForm.DoPrint;
  const NameReport = '\Reports\TaxInvoices\1.fr3';
var
  num_specialnotes :string;
  data_nakl :string;
  data_termsdelivery :string;
begin
 TaxInvoicesKorigDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport,True);
  data_nakl := DateToStr(TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_VIPISKI']);
  TaxInvoicesKorigDM.Report.Variables.Clear;
  TaxInvoicesKorigDM.Report.Variables['D1']  := data_nakl[1];
  TaxInvoicesKorigDM.Report.Variables['D2']  := data_nakl[2];
  TaxInvoicesKorigDM.Report.Variables['D3']  := data_nakl[4];
  TaxInvoicesKorigDM.Report.Variables['D4']  := data_nakl[5];
  TaxInvoicesKorigDM.Report.Variables['D5']  := data_nakl[7];
  TaxInvoicesKorigDM.Report.Variables['D6']  := data_nakl[8];
  TaxInvoicesKorigDM.Report.Variables['D7']  := data_nakl[9];
  TaxInvoicesKorigDM.Report.Variables['D8']  := data_nakl[10];

  if not (TaxInvoicesKorigDM.VidNaklInfoDSet['NUM_SPECIALNOTES'] = null) then
  begin
    num_specialnotes := TaxInvoicesKorigDM.VidNaklInfoDSet['NUM_SPECIALNOTES'];
    TaxInvoicesKorigDM.Report.Variables['NUM1']:= num_specialnotes[1];
    TaxInvoicesKorigDM.Report.Variables['NUM2']:= num_specialnotes[2];
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['NUM1']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['NUM2']:= ''''+'''';
  end;

  if (not (TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'] = null) and (TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'] <> '01.01.1900')) then
  begin
    data_termsdelivery := TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'];
    TaxInvoicesKorigDM.Report.Variables['TD1']  := data_termsdelivery[1];
    TaxInvoicesKorigDM.Report.Variables['TD2']  := data_termsdelivery[2];
    TaxInvoicesKorigDM.Report.Variables['TD3']  := data_termsdelivery[4];
    TaxInvoicesKorigDM.Report.Variables['TD4']  := data_termsdelivery[5];
    TaxInvoicesKorigDM.Report.Variables['TD5']  := data_termsdelivery[7];
    TaxInvoicesKorigDM.Report.Variables['TD6']  := data_termsdelivery[8];
    TaxInvoicesKorigDM.Report.Variables['TD7']  := data_termsdelivery[9];
    TaxInvoicesKorigDM.Report.Variables['TD8']  := data_termsdelivery[10];
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['TD1']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD2']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD3']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD4']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD5']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD6']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD7']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD8']  := ''''+'''';
  end;


 ModalResult := mrCancel;
 //TaxInvoicesKorigDM.Report.DesignReport;
 //Close;
 TaxInvoicesKorigDM.Report.ShowReport;

 {DSet1.First;
 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;  }
end;

procedure TTaxInvoicesKorigAddForm.DataVipDateEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then PodNumTextEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddForm.PodNumTextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
 begin
   if ((DateNaklDateEdit.Text <> '') and (PodNumTextEdit.Text <> '')) then
   begin
     // необходимо поискать выданную налоговую накладную в списке
     TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
     TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                     := 'TI_FIND_VID_NAKL';
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value      := PodNumTextEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('DATE_VIP_NAKL').Value := DateNaklDateEdit.Date;
     TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
     TaxInvoicesKorigDM.WriteTransaction.Commit;
     if (TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_FIND').Value = 1) then
     begin
       PParameter.id_TaxLiabilities     := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_tax_liabilities').Value;
       PParameter.Name_TaxLiabilities   := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_tax_liabilities').Value;
       PParameter.Id_TaxKredit          := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_taxkredit').Value;
       PParameter.Name_TaxKredit        := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_taxkredit').Value;
       PParameter.id_SpecialNotes       := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_specialnotes').Value;
       PParameter.Name_SpecialNotes     := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_specialnotes').Value;
       PParameter.id_customer           := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_customer').Value;
       PParameter.Name_customer         := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_customer').Value;
       PParameter.ipn_customer          := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ipn_customer').Value;
       PParameter.place_customer        := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('place_customer').Value;
       PParameter.phone_customer        := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('phone_customer').Value;
       PParameter.NumReestr_customer    := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('numreestr_customer').Value;
       PParameter.EDRPOU_Customer       := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('edrpou_customer').Value;
       PParameter.id_TermsDelivery      := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_termsdelivery').Value;
       PParameter.Name_TermsDelivery    := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_termsdelivery').Value;
       PParameter.data_termsdelivery    := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value;
       PParameter.num_termsdelivery     := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value;
       PParameter.id_FormCalculations   := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_formcalculations').Value;
       PParameter.Name_FormCalculations := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_formcalculations').Value;

      if (TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('full_name_customer').Value <> null) then
        PParameter.Full_name_customer  := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('full_name_customer').Value
      else
        PParameter.Full_name_customer  := '';


      if (TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_tax_liabilities').Value<>'')then
       begin
        PodZobCheckBox.Checked   := True;
        PodZobButtonEdit.Enabled := True;
        PodZobButtonEdit.Text    := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_tax_liabilities').Value;
       end
      else
      begin
       PodZobCheckBox.Checked   := False;
       PodZobButtonEdit.Enabled := False;
       PodZobButtonEdit.Text    := '';
      end;

      if (PParameter.Name_SpecialNotes <> '')then
       begin
        OsoblPrimCheckBox.Checked   := True;
        SpecialNotesButtonEdit.Enabled := True;
        SpecialNotesButtonEdit.Text    := PParameter.Name_SpecialNotes;
       end
      else
      begin
        OsoblPrimCheckBox.Checked   := False;
        SpecialNotesButtonEdit.Enabled := False;
        SpecialNotesButtonEdit.Text    := '';
      end;

      if (PParameter.Name_TermsDelivery <> '')then
       begin
        PostavkaCheckBox.Checked     := True;
        DataTermsdelDateEdit.Enabled := True;
        NumTermsDelTextEdit.Enabled  := True;
        PostavkaButtonEdit.Enabled   := True;
        PostavkaButtonEdit.Text      := PParameter.Name_TermsDelivery;
        NumTermsDelTextEdit.Text     := PParameter.num_termsdelivery;

        if (PParameter.data_termsdelivery = StrToDate('01.01.1900')) then
        begin
          DataTermsdelDateEdit.Text := '';
          DateTermsDeliveryDateEdit.Text := '';
        end
        else
        begin
          DataTermsdelDateEdit.Date := PParameter.data_termsdelivery;
          DateTermsDeliveryDateEdit.Date := PParameter.data_termsdelivery;
        end;

       end
      else
      begin
       PostavkaCheckBox.Checked     := False;
       DataTermsdelDateEdit.Enabled := False;
       NumTermsDelTextEdit.Enabled  := False;
       PostavkaButtonEdit.Enabled   := False;

       DataTermsdelDateEdit.Text := '';
       NumTermsDelTextEdit.Text  := '';
       PostavkaButtonEdit.Text   := '';
      end;

      if (PParameter.Name_FormCalculations <> '')then
      begin
       RozraxunokCheckBox.Checked   := True;
       RozraxunokButtonEdit.Enabled := True;
       RozraxunokButtonEdit.Text    := PParameter.Name_FormCalculations;
      end
      else
      begin
       RozraxunokCheckBox.Checked   := False;
       RozraxunokButtonEdit.Enabled := False;
       RozraxunokButtonEdit.Text    := '';
      end;

      if (PParameter.Name_TaxKredit <> '')then
       begin
        PodKreditCheckBox.Checked   := True;
        PodKreditButtonEdit.Enabled := True;
        PodKreditButtonEdit.Text    := PParameter.Name_TaxKredit;
       end
      else
       begin
        PodKreditCheckBox.Checked   := False;
        PodKreditButtonEdit.Enabled := False;
        PodKreditButtonEdit.Text    := '';
       end;

      if (TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_issued_buyer').Value = 1)then
        is_issued_buyer_CheckBox.Checked := True
      else
        is_issued_buyer_CheckBox.Checked := False;

      if (TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_erpn').Value = 1)then
        is_erpn_CheckBox.Checked := True
      else
        is_erpn_CheckBox.Checked := False;

      if (TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_copy').Value = 1)then
        is_copy_CheckBox.Checked := True
      else
        is_copy_CheckBox.Checked := False;

      if (TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_remains_seller').Value = 1)then
        OsoblPrimCheckBox.Checked := True
      else
        OsoblPrimCheckBox.Checked := False;

        //DateTermsDeliveryDateEdit.Date := PParameter.data_termsdelivery;
        NumTermsDeliveryTextEdit.Text  := PParameter.num_termsdelivery;
        OsobaPokupButtonEdit.Text      := PParameter.Name_customer;
        IPNPokupTextEdit.Text          := PParameter.ipn_customer;
        FullNameMemo.Text              := PParameter.Full_name_customer;
        PlacePokupMemo.Text            := PParameter.place_customer;
        TelPokupTextEdit.Text          := PParameter.phone_customer;
        NumReestrPokupTextEdit.Text    := PParameter.NumReestr_customer;
        EdrpTextEdit.Text              := PParameter.EDRPOU_Customer;
        PostavkaButtonEdit.Text        := PParameter.Name_TermsDelivery;
        //DataTermsdelDateEdit.date      := PParameter.data_termsdelivery;
        NumTermsDelTextEdit.Text       := PParameter.num_termsdelivery;
        RozraxunokButtonEdit.Text      := PParameter.Name_FormCalculations;

        DateTermsDeliveryDateEdit.SetFocus;
     end
     else
     begin
       TiShowMessage('Увага!','Немає податкової накладної з таким номером та датою виписки!', mtError, [mbYes]);
       DateTermsDeliveryDateEdit.Text := '';
       NumTermsDeliveryTextEdit.Text  := '';
       OsobaPokupButtonEdit.Text      := '';
       IPNPokupTextEdit.Text          := '';
       FullNameMemo.Text              := '';
       PlacePokupMemo.Text            := '';
       TelPokupTextEdit.Text          := '';
       NumReestrPokupTextEdit.Text    := '';
       EdrpTextEdit.Text              := '';
       PostavkaButtonEdit.Text        := '';
       DataTermsdelDateEdit.Text      := '';
       NumTermsDelTextEdit.Text       := '';
       RozraxunokButtonEdit.Text      := '';

       DateTermsDeliveryDateEdit.SetFocus;
     end;
   end;

 end;

end;

procedure TTaxInvoicesKorigAddForm.OsobaPokupButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then YesButton.SetFocus;
end;

procedure TTaxInvoicesKorigAddForm.NumOrderTextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then IPNPokupTextEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddForm.FormActivate(Sender: TObject);
begin
  //PodNumTextEdit.SetFocus;
  DateNaklDateEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddForm.PostavkaButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
 if Key = #13 then DataTermsdelDateEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddForm.DataTermsdelDateEditKeyPress(
  Sender: TObject; var Key: Char);
begin
 if Key = #13 then NumTermsDelTextEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddForm.NumTermsDelTextEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then YesButton.SetFocus;
end;

procedure TTaxInvoicesKorigAddForm.RozraxunokButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  YesButton.SetFocus;
end;

procedure TTaxInvoicesKorigAddForm.PodZobButtonEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then PodNumTextEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddForm.PodKreditButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then PodNumTextEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddForm.SpecialNotesButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then PodNumTextEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddForm.IPNPokupTextEditKeyPress(Sender: TObject;
  var Key: Char);
var
  id_customer :Integer;
begin
 if Key = #13 then
 begin
   if(IPNPokupTextEdit.Text<>'') then
   begin
     TaxInvoicesKorigDM.Customer_DataSet.Close;
     TaxInvoicesKorigDM.Customer_DataSet.SelectSQL.Text :='select * from TI_CUSTOMER_INFO_IPN(:NALOG_NOM)';
     TaxInvoicesKorigDM.Customer_DataSet.ParamByName('NALOG_NOM').Value := IPNPokupTextEdit.Text;
     TaxInvoicesKorigDM.Customer_DataSet.Open;
     if not (TaxInvoicesKorigDM.Customer_DataSet['ID_CUSTOMER'] = null) then
      begin
        id_Customer := TaxInvoicesKorigDM.Customer_DataSet['ID_CUSTOMER'];
        TaxInvoicesKorigDM.Customer_DataSet.Close;
        TaxInvoicesKorigDM.Customer_DataSet.SelectSQL.Text :='select * from TI_CUSTOMER_INFO(:id)';
        TaxInvoicesKorigDM.Customer_DataSet.ParamByName('id').Value := id_Customer;
        TaxInvoicesKorigDM.Customer_DataSet.Open;
        OsobaPokupButtonEdit.Text     := TaxInvoicesKorigDM.Customer_DataSet['NAME_CUSTOMER'];
        PlacePokupMemo.Text       := TaxInvoicesKorigDM.Customer_DataSet['ADRESS_CONTRAGENT'];
        EdrpTextEdit.Text             := TaxInvoicesKorigDM.Customer_DataSet['KOD_EDRPOU'];
        IPNPokupTextEdit.Text         := TaxInvoicesKorigDM.Customer_DataSet['NALOG_NOM'];
        NumReestrPokupTextEdit.Text   := TaxInvoicesKorigDM.Customer_DataSet['NNS'];

        if (TaxInvoicesKorigDM.Customer_DataSet['PHONE_CUSTOMER']<>null)then
          TelPokupTextEdit.Text       := TaxInvoicesKorigDM.Customer_DataSet['PHONE_CUSTOMER']
        else
          TelPokupTextEdit.Text       :='---';

        PParameter.id_customer        := id_Customer;
        PParameter.Name_customer      := TaxInvoicesKorigDM.Customer_DataSet['NAME_CUSTOMER'];
        PParameter.ipn_customer       := TaxInvoicesKorigDM.Customer_DataSet['NALOG_NOM'];
        PParameter.place_customer     := TaxInvoicesKorigDM.Customer_DataSet['ADRESS_CONTRAGENT'];
        PParameter.phone_customer     := TelPokupTextEdit.Text;
        PParameter.NumReestr_customer := TaxInvoicesKorigDM.Customer_DataSet['NNS'];
        PParameter.EDRPOU_Customer    := TaxInvoicesKorigDM.Customer_DataSet['KOD_EDRPOU'];


        if ((TaxInvoicesKorigDM.Customer_DataSet['full_name_customer'] = '') or (TaxInvoicesKorigDM.Customer_DataSet['full_name_customer']=null))then
        begin
          replaceAbreviatures(TaxInvoicesKorigDM.Customer_DataSet['NAME_CUSTOMER']);
          PParameter.Full_name_customer := '';
          FullNameCheckBox.Checked   := True;
          FullNameMemo.ReadOnly      := False;
          SaveFullNameButton.Visible := True;
        end
        else
        begin
          FullNameMemo.Text := TaxInvoicesKorigDM.Customer_DataSet['full_name_customer'];
          PParameter.Full_name_customer := TaxInvoicesKorigDM.Customer_DataSet['full_name_customer'];
          FullNameCheckBox.Checked   := False;
          FullNameMemo.ReadOnly      := True;
          SaveFullNameButton.Visible := False;
        end;
        
        OsobaPokupButtonEdit.SetFocus;
      end
     else
     begin
       TiShowMessage('Увага!','Немає покупця з таким ІПН!', mtError, [mbYes]);
       OsobaPokupButtonEdit.Text   := '';
       PlacePokupMemo.Text         := '';
       EdrpTextEdit.Text           := '';
       NumReestrPokupTextEdit.Text := '';
     end;
   end
   else
     OsobaPokupButtonEdit.SetFocus;

 end;
end;

procedure TTaxInvoicesKorigAddForm.PostavkaCheckBox1Click(Sender: TObject);
begin
  PostavkaButtonEdit.Enabled   := PostavkaCheckBox.Checked;
  DataTermsdelDateEdit.Enabled := PostavkaCheckBox.Checked;
  NumTermsDelTextEdit.Enabled  := PostavkaCheckBox.Checked;
end;

procedure TTaxInvoicesKorigAddForm.RozraxunokCheckBox1Click(Sender: TObject);
begin
  RozraxunokButtonEdit.Enabled  := RozraxunokCheckBox.Checked;
end;

procedure TTaxInvoicesKorigAddForm.RozraxunokCheckBoxClick(Sender: TObject);
begin
  RozraxunokButtonEdit.Enabled  := RozraxunokCheckBox.Checked;
end;

procedure TTaxInvoicesKorigAddForm.PostavkaCheckBoxClick(Sender: TObject);
begin
  PostavkaButtonEdit.Enabled   := PostavkaCheckBox.Checked;
  DataTermsdelDateEdit.Enabled := PostavkaCheckBox.Checked;
  NumTermsDelTextEdit.Enabled  := PostavkaCheckBox.Checked;
end;

procedure TTaxInvoicesKorigAddForm.PhoneCheckBoxClick(Sender: TObject);
begin
  TelPokupTextEdit.Enabled := PhoneCheckBox.Checked;
  SavePhoneButton.Visible := PhoneCheckBox.Checked;
end;

procedure TTaxInvoicesKorigAddForm.FullNameCheckBoxClick(Sender: TObject);
begin
  FullNameMemo.ReadOnly := not(FullNameCheckBox.Checked);
  SaveFullNameButton.Visible := FullNameCheckBox.Checked;
end;

procedure TTaxInvoicesKorigAddForm.SavePhoneButtonClick(Sender: TObject);
begin
  {if (TelPokupTextEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть номер телефону!',mtWarning,[mbOK]);
   TelPokupTextEdit.SetFocus;
   Exit;
  end; }

  if (OsobaPokupButtonEdit.Text='') then
  begin
   TiShowMessage('Увага!','Спочатку оберіть покупця!',mtWarning,[mbOK]);
   OsobaPokupButtonEdit.SetFocus;
   Exit;
  end;

  //ShowMessage(IntToStr(PParameter.id_customer));
  TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
  TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName := 'TI_SP_CUSTOMER_PHONE_UPD';
  TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_customer').Value := PParameter.id_customer;
  TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('phone_customer').Value := TelPokupTextEdit.Text;
  TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
  TaxInvoicesKorigDM.WriteTransaction.Commit;

  PhoneCheckBox.Checked    := False;
  TelPokupTextEdit.Enabled := False;
  SavePhoneButton.Visible  := False;
  PParameter.phone_customer := TelPokupTextEdit.Text;

end;

procedure TTaxInvoicesKorigAddForm.replaceAbreviatures(short_name: string);
var
  i : Integer;
  short_name_abbreviature : string;
  long_name_abbreviature : string;
  p :Integer;
begin
  TaxInvoicesKorigDM.AbbreviatureDSet.Close;
  TaxInvoicesKorigDM.AbbreviatureDSet.SelectSQL.Text := 'select * from TI_SP_ABBREVIATIONS';
  TaxInvoicesKorigDM.AbbreviatureDSet.Open;
  TaxInvoicesKorigDM.AbbreviatureDSet.FetchAll;
  TaxInvoicesKorigDM.AbbreviatureDSet.First;
  //ShowMessage(IntToStr(TaxInvoicesKorigDM.AbbreviatureDSet.RecordCount));
  for i:=1 to TaxInvoicesKorigDM.AbbreviatureDSet.RecordCount do
  begin
   short_name_abbreviature := TaxInvoicesKorigDM.AbbreviatureDSet['short_name'];
   long_name_abbreviature := TaxInvoicesKorigDM.AbbreviatureDSet['long_name'];

   if Pos(short_name_abbreviature,short_name)<>0 then
   begin
     p :=Pos(short_name_abbreviature,short_name);
     if (p=1) then      //если стоит в начале строки
     begin
       if(short_name[p+Length(short_name_abbreviature)] = ' ') then
       begin
         Delete(short_name,1,Length(short_name_abbreviature));
         Insert(long_name_abbreviature,short_name,p);
       end;

     end;

     if (p = (Length(short_name) - Length(short_name_abbreviature)+1)) then   //в конце строки
     begin
       if(short_name[p-1] = ' ') then
       begin
         Delete(short_name,p,Length(short_name_abbreviature));
         Insert(long_name_abbreviature,short_name,1);
       end;
     end;


     if ((p<>1) and (p <> (Length(short_name) - Length(short_name_abbreviature)+1))) then  //если в середине
     begin
      if((short_name[p-1] = ' ') and (short_name[p+Length(short_name_abbreviature)] = ' '))then
       begin
         Delete(short_name,p,Length(short_name_abbreviature));
         Insert(long_name_abbreviature,short_name,p);
       end;
     end;
   end;
   TaxInvoicesKorigDM.AbbreviatureDSet.Next;
  end;
  full_name_customer := short_name;
  FullNameMemo.Text := full_name_customer;
end;

procedure TTaxInvoicesKorigAddForm.SaveFullNameButtonClick(Sender: TObject);
begin
  if (FullNameMemo.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть повну назву покупця!',mtWarning,[mbOK]);
   FullNameMemo.SetFocus;
   Exit;
  end;

  if (OsobaPokupButtonEdit.Text='') then
  begin
   TiShowMessage('Увага!','Спочатку оберіть покупця!',mtWarning,[mbOK]);
   OsobaPokupButtonEdit.SetFocus;
   Exit;
  end;

  //ShowMessage(IntToStr(PParameter.id_customer));
  TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
  TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName := 'TI_SP_CUSTOMER_FULL_NAME_UPD';
  TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_customer').Value := PParameter.id_customer;
  TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('full_name_customer').Value := FullNameMemo.Text;
  TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
  TaxInvoicesKorigDM.WriteTransaction.Commit;

  FullNameCheckBox.Checked      := False;
  FullNameMemo.ReadOnly         := True;
  SaveFullNameButton.Visible    := False;
  PParameter.Full_name_customer := FullNameMemo.Text;
end;

procedure TTaxInvoicesKorigAddForm.NumOrderTextEditExit(Sender: TObject);
begin
  PodNumTextEdit.Text := NumOrderTextEdit.Text;
end;

procedure TTaxInvoicesKorigAddForm.DataVipDateEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then NumOrderTextEdit.SetFocus;
end;

procedure TTaxInvoicesKorigAddForm.PlacePokupCheckBoxClick(Sender: TObject);
begin
  PlacePokupMemo.Properties.ReadOnly := not(PlacePokupCheckBox.Checked);
  SavePlacePokupButton.Visible := PlacePokupCheckBox.Checked;
end;

procedure TTaxInvoicesKorigAddForm.SavePlacePokupButtonClick(
  Sender: TObject);
begin
  if (PlacePokupMemo.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть повну адресу покупця!',mtWarning,[mbOK]);
   PlacePokupMemo.SetFocus;
   Exit;
  end;

  if (OsobaPokupButtonEdit.Text='') then
  begin
   TiShowMessage('Увага!','Спочатку оберіть покупця!',mtWarning,[mbOK]);
   OsobaPokupButtonEdit.SetFocus;
   Exit;
  end;

  //ShowMessage(IntToStr(PParameter.id_customer));
  TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
  TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName := 'TI_SP_CUSTOMER_FULL_ADR_UPD';
  TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_customer').Value := PParameter.id_customer;
  TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('FULL_ADR_CUSTOMER').Value := PlacePokupMemo.Text;
  TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
  TaxInvoicesKorigDM.WriteTransaction.Commit;

  PlacePokupCheckBox.Checked         := False;
  PlacePokupMemo.Properties.ReadOnly := True;
  SavePlacePokupButton.Visible       := False;
  PParameter.place_customer          := PlacePokupMemo.Text;
end;

procedure TTaxInvoicesKorigAddForm.DoPrintDecember;
  const NameReport = '\Reports\TaxInvoices\VidNaklDecember.fr3';
var
  num_specialnotes :string;
  data_nakl :string;
  data_termsdelivery :string;
  NotPDV : string;
  ipn_prodavec : string;
  ipn_customer : string;
  sv_prodavec  : string;
  sv_customer  : string;
  tel_prodavec : string;
  tel_customer : string;
  i : Integer;
begin
  NotPDV := 'без ПДВ';
  TaxInvoicesKorigDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport,True);
  data_nakl := DateToStr(TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_VIPISKI']);
  ipn_prodavec := (TaxInvoicesKorigDM.VidNaklInfoDSet['ipn_seller']);
  ipn_customer := (TaxInvoicesKorigDM.VidNaklInfoDSet['ipn_customer']);
  sv_prodavec  := (TaxInvoicesKorigDM.VidNaklInfoDSet['numreestr_seller']);
  sv_customer  := (TaxInvoicesKorigDM.VidNaklInfoDSet['numreestr_customer']);
  tel_prodavec := TaxInvoicesKorigDM.VidNaklInfoDSet['phone_seller'];
  tel_customer := TaxInvoicesKorigDM.VidNaklInfoDSet['phone_customer'];


  TaxInvoicesKorigDM.Report.Variables.Clear;

  TaxInvoicesKorigDM.Report.Variables['tp1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp7']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp8']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp9']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp10'] := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['tc1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc7']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc8']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc9']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc10'] := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['sp1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp7']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp8']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp9']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp10'] := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['sc1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc7']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc8']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc9']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc10'] := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['D1']  := data_nakl[1];
  TaxInvoicesKorigDM.Report.Variables['D2']  := data_nakl[2];
  TaxInvoicesKorigDM.Report.Variables['D3']  := data_nakl[4];
  TaxInvoicesKorigDM.Report.Variables['D4']  := data_nakl[5];
  TaxInvoicesKorigDM.Report.Variables['D5']  := data_nakl[7];
  TaxInvoicesKorigDM.Report.Variables['D6']  := data_nakl[8];
  TaxInvoicesKorigDM.Report.Variables['D7']  := data_nakl[9];
  TaxInvoicesKorigDM.Report.Variables['D8']  := data_nakl[10];

  i := 10;
  if (tel_prodavec <> '')then
  begin
   while Length(tel_prodavec)>0 do
   begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['tp1']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      2:TaxInvoicesKorigDM.Report.Variables['tp2']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      3:TaxInvoicesKorigDM.Report.Variables['tp3']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      4:TaxInvoicesKorigDM.Report.Variables['tp4']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      5:TaxInvoicesKorigDM.Report.Variables['tp5']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      6:TaxInvoicesKorigDM.Report.Variables['tp6']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      7:TaxInvoicesKorigDM.Report.Variables['tp7']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      8:TaxInvoicesKorigDM.Report.Variables['tp8']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      9:TaxInvoicesKorigDM.Report.Variables['tp9']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
     10:TaxInvoicesKorigDM.Report.Variables['tp10'] := Copy(tel_prodavec, Length(tel_prodavec), 1);
    end;
    Delete(tel_prodavec, Length(tel_prodavec), 1);
    i:=i-1;
   end;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['tp1']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp2']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp3']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp4']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp5']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp6']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp7']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp8']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp9']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp10'] := ''''+'''';
  end;


  i := 10;
  if (tel_customer<>'')then
  begin
   while Length(tel_customer)>0 do
   begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['tc1']  := Copy(tel_customer, Length(tel_customer), 1);
      2:TaxInvoicesKorigDM.Report.Variables['tc2']  := Copy(tel_customer, Length(tel_customer), 1);
      3:TaxInvoicesKorigDM.Report.Variables['tc3']  := Copy(tel_customer, Length(tel_customer), 1);
      4:TaxInvoicesKorigDM.Report.Variables['tc4']  := Copy(tel_customer, Length(tel_customer), 1);
      5:TaxInvoicesKorigDM.Report.Variables['tc5']  := Copy(tel_customer, Length(tel_customer), 1);
      6:TaxInvoicesKorigDM.Report.Variables['tc6']  := Copy(tel_customer, Length(tel_customer), 1);
      7:TaxInvoicesKorigDM.Report.Variables['tc7']  := Copy(tel_customer, Length(tel_customer), 1);
      8:TaxInvoicesKorigDM.Report.Variables['tc8']  := Copy(tel_customer, Length(tel_customer), 1);
      9:TaxInvoicesKorigDM.Report.Variables['tc9']  := Copy(tel_customer, Length(tel_customer), 1);
     10:TaxInvoicesKorigDM.Report.Variables['tc10'] := Copy(tel_customer, Length(tel_customer), 1);
    end;
    Delete(tel_customer, Length(tel_customer), 1);
    i:=i-1;
   end;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['tc1']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc2']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc3']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc4']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc5']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc6']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc7']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc8']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc9']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc10'] := ''''+'''';
  end;


  i := 10;
  while Length(sv_prodavec)>0 do
  begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['sp1']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      2:TaxInvoicesKorigDM.Report.Variables['sp2']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      3:TaxInvoicesKorigDM.Report.Variables['sp3']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      4:TaxInvoicesKorigDM.Report.Variables['sp4']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      5:TaxInvoicesKorigDM.Report.Variables['sp5']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      6:TaxInvoicesKorigDM.Report.Variables['sp6']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      7:TaxInvoicesKorigDM.Report.Variables['sp7']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      8:TaxInvoicesKorigDM.Report.Variables['sp8']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      9:TaxInvoicesKorigDM.Report.Variables['sp9']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
     10:TaxInvoicesKorigDM.Report.Variables['sp10'] := Copy(sv_prodavec, Length(sv_prodavec), 1);
    end;
   Delete(sv_prodavec, Length(sv_prodavec), 1);
   i:=i-1;
  end;

  i := 10;
  while Length(sv_customer)>0 do
  begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['sc1']  := Copy(sv_customer, Length(sv_customer), 1);
      2:TaxInvoicesKorigDM.Report.Variables['sc2']  := Copy(sv_customer, Length(sv_customer), 1);
      3:TaxInvoicesKorigDM.Report.Variables['sc3']  := Copy(sv_customer, Length(sv_customer), 1);
      4:TaxInvoicesKorigDM.Report.Variables['sc4']  := Copy(sv_customer, Length(sv_customer), 1);
      5:TaxInvoicesKorigDM.Report.Variables['sc5']  := Copy(sv_customer, Length(sv_customer), 1);
      6:TaxInvoicesKorigDM.Report.Variables['sc6']  := Copy(sv_customer, Length(sv_customer), 1);
      7:TaxInvoicesKorigDM.Report.Variables['sc7']  := Copy(sv_customer, Length(sv_customer), 1);
      8:TaxInvoicesKorigDM.Report.Variables['sc8']  := Copy(sv_customer, Length(sv_customer), 1);
      9:TaxInvoicesKorigDM.Report.Variables['sc9']  := Copy(sv_customer, Length(sv_customer), 1);
     10:TaxInvoicesKorigDM.Report.Variables['sc10'] := Copy(sv_customer, Length(sv_customer), 1);
    end;
   Delete(sv_customer, Length(sv_customer), 1);
   i:=i-1;
  end;

  if not (TaxInvoicesKorigDM.VidNaklInfoDSet['NUM_SPECIALNOTES'] = null) then
  begin
    num_specialnotes := TaxInvoicesKorigDM.VidNaklInfoDSet['NUM_SPECIALNOTES'];
    TaxInvoicesKorigDM.Report.Variables['NUM1']:= num_specialnotes[1];
    TaxInvoicesKorigDM.Report.Variables['NUM2']:= num_specialnotes[2];
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['NUM1']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['NUM2']:= ''''+'''';
  end;

  if (not (TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'] = null) and (TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'] <> '01.01.1900')) then
  begin
    data_termsdelivery := TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'];
    TaxInvoicesKorigDM.Report.Variables['TD1']  := data_termsdelivery[1];
    TaxInvoicesKorigDM.Report.Variables['TD2']  := data_termsdelivery[2];
    TaxInvoicesKorigDM.Report.Variables['TD3']  := data_termsdelivery[4];
    TaxInvoicesKorigDM.Report.Variables['TD4']  := data_termsdelivery[5];
    TaxInvoicesKorigDM.Report.Variables['TD5']  := data_termsdelivery[7];
    TaxInvoicesKorigDM.Report.Variables['TD6']  := data_termsdelivery[8];
    TaxInvoicesKorigDM.Report.Variables['TD7']  := data_termsdelivery[9];
    TaxInvoicesKorigDM.Report.Variables['TD8']  := data_termsdelivery[10];
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['TD1']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD2']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD3']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD4']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD5']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD6']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD7']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD8']  := ''''+'''';
  end;

  if ipn_prodavec = '0' then
  begin
    TaxInvoicesKorigDM.Report.Variables['IP1']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP2']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP3']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP4']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP5']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP6']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP7']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP8']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP9']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP10']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP11']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP12']:= ipn_prodavec;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['IP1'] := ipn_prodavec[1];
    TaxInvoicesKorigDM.Report.Variables['IP2'] := ipn_prodavec[2];
    TaxInvoicesKorigDM.Report.Variables['IP3'] := ipn_prodavec[3];
    TaxInvoicesKorigDM.Report.Variables['IP4'] := ipn_prodavec[4];
    TaxInvoicesKorigDM.Report.Variables['IP5'] := ipn_prodavec[5];
    TaxInvoicesKorigDM.Report.Variables['IP6'] := ipn_prodavec[6];
    TaxInvoicesKorigDM.Report.Variables['IP7'] := ipn_prodavec[7];
    TaxInvoicesKorigDM.Report.Variables['IP8'] := ipn_prodavec[8];
    TaxInvoicesKorigDM.Report.Variables['IP9'] := ipn_prodavec[9];
    TaxInvoicesKorigDM.Report.Variables['IP10']:= ipn_prodavec[10];
    TaxInvoicesKorigDM.Report.Variables['IP11']:= ipn_prodavec[11];
    TaxInvoicesKorigDM.Report.Variables['IP12']:= ipn_prodavec[12];
  end;

  if ipn_customer = '0' then
  begin
    TaxInvoicesKorigDM.Report.Variables['IC1']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC2']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC3']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC4']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC5']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC6']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC7']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC8']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC9']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC10']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC11']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC12']:= ipn_customer;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['IC1'] := ipn_customer[1];
    TaxInvoicesKorigDM.Report.Variables['IC2'] := ipn_customer[2];
    TaxInvoicesKorigDM.Report.Variables['IC3'] := ipn_customer[3];
    TaxInvoicesKorigDM.Report.Variables['IC4'] := ipn_customer[4];
    TaxInvoicesKorigDM.Report.Variables['IC5'] := ipn_customer[5];
    TaxInvoicesKorigDM.Report.Variables['IC6'] := ipn_customer[6];
    TaxInvoicesKorigDM.Report.Variables['IC7'] := ipn_customer[7];
    TaxInvoicesKorigDM.Report.Variables['IC8'] := ipn_customer[8];
    TaxInvoicesKorigDM.Report.Variables['IC9'] := ipn_customer[9];
    TaxInvoicesKorigDM.Report.Variables['IC10']:= ipn_customer[10];
    TaxInvoicesKorigDM.Report.Variables['IC11']:= ipn_customer[11];
    TaxInvoicesKorigDM.Report.Variables['IC12']:= ipn_customer[12];
  end;


 ModalResult := mrCancel;
 TaxInvoicesKorigDM.Report.DesignReport;
 //Close;
 TaxInvoicesKorigDM.Report.ShowReport;

 {DSet1.First;
 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;  }
end;

procedure TTaxInvoicesKorigAddForm.TypeDocumentButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  TypeDoc:Variant;
begin
  TypeDoc := LoadTypeDocumentPackage(owner,TaxInvoicesKorigDM.DB.Handle,'TaxInvoices\TypeDocument.bpl','View_TypeDocument',2);
  If VarArrayDimCount(TypeDoc)>0 then
  begin
    PParameter.ID_TYPE_DOCUMENT   := TypeDoc[0];
    PParameter.NAME_TYPE_DOCUMENT := TypeDoc[1];
    //TypeDocumentButtonEdit.Text   := TypeDoc[1];

    if (OsoblPrimCheckBox.Checked = True) then
    begin
      // отбор типа причины по типу документа
      TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
      TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName := 'TI_SELECT_SPECIALNOTES_TYPE_DOC';
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_TYPE_DOC').Value := PParameter.ID_TYPE_DOCUMENT;
      TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
      TaxInvoicesKorigDM.WriteTransaction.Commit;
      PParameter.id_SpecialNotes   := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value;
      PParameter.Name_SpecialNotes := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value;
      SpecialNotesButtonEdit.Text  := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value;
    end;

  end;
end;

procedure TTaxInvoicesKorigAddForm.DoPrintDecemberTwoEkz;
  const NameReport = '\Reports\TaxInvoices\VidNaklDecemberTwoEkz.fr3';
var
  num_specialnotes   : string;
  data_nakl          : string;
  data_termsdelivery : string;
  ipn_prodavec : string;
  ipn_customer : string;
  sv_prodavec  : string;
  sv_customer  : string;
  tel_prodavec : string;
  tel_customer : string;
  i : Integer;
  NotPDV       : string;
begin
  NotPDV := 'без ПДВ';
  TaxInvoicesKorigDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport,True);
  data_nakl := DateToStr(TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_VIPISKI']);
  ipn_prodavec := (TaxInvoicesKorigDM.VidNaklInfoDSet['ipn_seller']);
  ipn_customer := (TaxInvoicesKorigDM.VidNaklInfoDSet['ipn_customer']);
  sv_prodavec  := (TaxInvoicesKorigDM.VidNaklInfoDSet['numreestr_seller']);
  sv_customer  := (TaxInvoicesKorigDM.VidNaklInfoDSet['numreestr_customer']);
  tel_prodavec := TaxInvoicesKorigDM.VidNaklInfoDSet['phone_seller'];
  tel_customer := TaxInvoicesKorigDM.VidNaklInfoDSet['phone_customer'];


  TaxInvoicesKorigDM.Report.Variables.Clear;

  TaxInvoicesKorigDM.Report.Variables['tp1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp7']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp8']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp9']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp10'] := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['tc1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc7']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc8']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc9']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc10'] := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['sp1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp7']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp8']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp9']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp10'] := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['sc1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc7']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc8']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc9']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc10'] := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['D1']  := data_nakl[1];
  TaxInvoicesKorigDM.Report.Variables['D2']  := data_nakl[2];
  TaxInvoicesKorigDM.Report.Variables['D3']  := data_nakl[4];
  TaxInvoicesKorigDM.Report.Variables['D4']  := data_nakl[5];
  TaxInvoicesKorigDM.Report.Variables['D5']  := data_nakl[7];
  TaxInvoicesKorigDM.Report.Variables['D6']  := data_nakl[8];
  TaxInvoicesKorigDM.Report.Variables['D7']  := data_nakl[9];
  TaxInvoicesKorigDM.Report.Variables['D8']  := data_nakl[10];

  i := 10;
  if (tel_prodavec <> '')then
  begin
   while Length(tel_prodavec)>0 do
   begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['tp1']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      2:TaxInvoicesKorigDM.Report.Variables['tp2']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      3:TaxInvoicesKorigDM.Report.Variables['tp3']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      4:TaxInvoicesKorigDM.Report.Variables['tp4']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      5:TaxInvoicesKorigDM.Report.Variables['tp5']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      6:TaxInvoicesKorigDM.Report.Variables['tp6']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      7:TaxInvoicesKorigDM.Report.Variables['tp7']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      8:TaxInvoicesKorigDM.Report.Variables['tp8']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      9:TaxInvoicesKorigDM.Report.Variables['tp9']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
     10:TaxInvoicesKorigDM.Report.Variables['tp10'] := Copy(tel_prodavec, Length(tel_prodavec), 1);
    end;
    Delete(tel_prodavec, Length(tel_prodavec), 1);
    i:=i-1;
   end;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['tp1']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp2']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp3']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp4']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp5']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp6']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp7']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp8']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp9']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp10'] := ''''+'''';
  end;


  i := 10;
  if (tel_customer<>'')then
  begin
   while Length(tel_customer)>0 do
   begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['tc1']  := Copy(tel_customer, Length(tel_customer), 1);
      2:TaxInvoicesKorigDM.Report.Variables['tc2']  := Copy(tel_customer, Length(tel_customer), 1);
      3:TaxInvoicesKorigDM.Report.Variables['tc3']  := Copy(tel_customer, Length(tel_customer), 1);
      4:TaxInvoicesKorigDM.Report.Variables['tc4']  := Copy(tel_customer, Length(tel_customer), 1);
      5:TaxInvoicesKorigDM.Report.Variables['tc5']  := Copy(tel_customer, Length(tel_customer), 1);
      6:TaxInvoicesKorigDM.Report.Variables['tc6']  := Copy(tel_customer, Length(tel_customer), 1);
      7:TaxInvoicesKorigDM.Report.Variables['tc7']  := Copy(tel_customer, Length(tel_customer), 1);
      8:TaxInvoicesKorigDM.Report.Variables['tc8']  := Copy(tel_customer, Length(tel_customer), 1);
      9:TaxInvoicesKorigDM.Report.Variables['tc9']  := Copy(tel_customer, Length(tel_customer), 1);
     10:TaxInvoicesKorigDM.Report.Variables['tc10'] := Copy(tel_customer, Length(tel_customer), 1);
    end;
    Delete(tel_customer, Length(tel_customer), 1);
    i:=i-1;
   end;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['tc1']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc2']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc3']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc4']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc5']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc6']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc7']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc8']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc9']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc10'] := ''''+'''';
  end;


  i := 10;
  while Length(sv_prodavec)>0 do
  begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['sp1']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      2:TaxInvoicesKorigDM.Report.Variables['sp2']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      3:TaxInvoicesKorigDM.Report.Variables['sp3']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      4:TaxInvoicesKorigDM.Report.Variables['sp4']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      5:TaxInvoicesKorigDM.Report.Variables['sp5']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      6:TaxInvoicesKorigDM.Report.Variables['sp6']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      7:TaxInvoicesKorigDM.Report.Variables['sp7']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      8:TaxInvoicesKorigDM.Report.Variables['sp8']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      9:TaxInvoicesKorigDM.Report.Variables['sp9']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
     10:TaxInvoicesKorigDM.Report.Variables['sp10'] := Copy(sv_prodavec, Length(sv_prodavec), 1);
    end;
   Delete(sv_prodavec, Length(sv_prodavec), 1);
   i:=i-1;
  end;

  i := 10;
  while Length(sv_customer)>0 do
  begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['sc1']  := Copy(sv_customer, Length(sv_customer), 1);
      2:TaxInvoicesKorigDM.Report.Variables['sc2']  := Copy(sv_customer, Length(sv_customer), 1);
      3:TaxInvoicesKorigDM.Report.Variables['sc3']  := Copy(sv_customer, Length(sv_customer), 1);
      4:TaxInvoicesKorigDM.Report.Variables['sc4']  := Copy(sv_customer, Length(sv_customer), 1);
      5:TaxInvoicesKorigDM.Report.Variables['sc5']  := Copy(sv_customer, Length(sv_customer), 1);
      6:TaxInvoicesKorigDM.Report.Variables['sc6']  := Copy(sv_customer, Length(sv_customer), 1);
      7:TaxInvoicesKorigDM.Report.Variables['sc7']  := Copy(sv_customer, Length(sv_customer), 1);
      8:TaxInvoicesKorigDM.Report.Variables['sc8']  := Copy(sv_customer, Length(sv_customer), 1);
      9:TaxInvoicesKorigDM.Report.Variables['sc9']  := Copy(sv_customer, Length(sv_customer), 1);
     10:TaxInvoicesKorigDM.Report.Variables['sc10'] := Copy(sv_customer, Length(sv_customer), 1);
    end;
   Delete(sv_customer, Length(sv_customer), 1);
   i:=i-1;
  end;

  if  ((TaxInvoicesKorigDM.VidNaklInfoDSet['NAME_SPECIALNOTES_TWO_EKZ'] <>null) and  (TaxInvoicesKorigDM.VidNaklInfoDSet['NAME_SPECIALNOTES_TWO_EKZ'] <>''))then
  begin
    num_specialnotes := TaxInvoicesKorigDM.VidNaklInfoDSet['NUM_SPECIALNOTES_TWO_EKZ'];
    TaxInvoicesKorigDM.Report.Variables['NUM1']:= num_specialnotes[1];
    TaxInvoicesKorigDM.Report.Variables['NUM2']:= num_specialnotes[2];
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['NUM1']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['NUM2']:= ''''+'''';
  end;

  if (not (TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'] = null) and (TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'] <> '01.01.1900')) then
  begin
    data_termsdelivery := TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'];
    TaxInvoicesKorigDM.Report.Variables['TD1']  := data_termsdelivery[1];
    TaxInvoicesKorigDM.Report.Variables['TD2']  := data_termsdelivery[2];
    TaxInvoicesKorigDM.Report.Variables['TD3']  := data_termsdelivery[4];
    TaxInvoicesKorigDM.Report.Variables['TD4']  := data_termsdelivery[5];
    TaxInvoicesKorigDM.Report.Variables['TD5']  := data_termsdelivery[7];
    TaxInvoicesKorigDM.Report.Variables['TD6']  := data_termsdelivery[8];
    TaxInvoicesKorigDM.Report.Variables['TD7']  := data_termsdelivery[9];
    TaxInvoicesKorigDM.Report.Variables['TD8']  := data_termsdelivery[10];
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['TD1']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD2']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD3']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD4']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD5']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD6']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD7']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD8']  := ''''+'''';
  end;

  if ipn_prodavec = '0' then
  begin
    TaxInvoicesKorigDM.Report.Variables['IP1']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP2']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP3']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP4']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP5']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP6']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP7']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP8']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP9']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP10']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP11']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP12']:= ipn_prodavec;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['IP1'] := ipn_prodavec[1];
    TaxInvoicesKorigDM.Report.Variables['IP2'] := ipn_prodavec[2];
    TaxInvoicesKorigDM.Report.Variables['IP3'] := ipn_prodavec[3];
    TaxInvoicesKorigDM.Report.Variables['IP4'] := ipn_prodavec[4];
    TaxInvoicesKorigDM.Report.Variables['IP5'] := ipn_prodavec[5];
    TaxInvoicesKorigDM.Report.Variables['IP6'] := ipn_prodavec[6];
    TaxInvoicesKorigDM.Report.Variables['IP7'] := ipn_prodavec[7];
    TaxInvoicesKorigDM.Report.Variables['IP8'] := ipn_prodavec[8];
    TaxInvoicesKorigDM.Report.Variables['IP9'] := ipn_prodavec[9];
    TaxInvoicesKorigDM.Report.Variables['IP10']:= ipn_prodavec[10];
    TaxInvoicesKorigDM.Report.Variables['IP11']:= ipn_prodavec[11];
    TaxInvoicesKorigDM.Report.Variables['IP12']:= ipn_prodavec[12];
  end;

  if ipn_customer = '0' then
  begin
    TaxInvoicesKorigDM.Report.Variables['IC1']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC2']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC3']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC4']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC5']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC6']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC7']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC8']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC9']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC10']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC11']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC12']:= ipn_customer;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['IC1'] := ipn_customer[1];
    TaxInvoicesKorigDM.Report.Variables['IC2'] := ipn_customer[2];
    TaxInvoicesKorigDM.Report.Variables['IC3'] := ipn_customer[3];
    TaxInvoicesKorigDM.Report.Variables['IC4'] := ipn_customer[4];
    TaxInvoicesKorigDM.Report.Variables['IC5'] := ipn_customer[5];
    TaxInvoicesKorigDM.Report.Variables['IC6'] := ipn_customer[6];
    TaxInvoicesKorigDM.Report.Variables['IC7'] := ipn_customer[7];
    TaxInvoicesKorigDM.Report.Variables['IC8'] := ipn_customer[8];
    TaxInvoicesKorigDM.Report.Variables['IC9'] := ipn_customer[9];
    TaxInvoicesKorigDM.Report.Variables['IC10']:= ipn_customer[10];
    TaxInvoicesKorigDM.Report.Variables['IC11']:= ipn_customer[11];
    TaxInvoicesKorigDM.Report.Variables['IC12']:= ipn_customer[12];
  end;
 ModalResult := mrCancel;
 //TaxInvoicesKorigDM.Report.DesignReport;
 //Close;
 TaxInvoicesKorigDM.Report.ShowReport;

 {DSet1.First;
 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;  }
end;

procedure TTaxInvoicesKorigAddForm.ToolButton_addClick(Sender: TObject);
var
  Add: Variant;
  cnt,i: Integer;
  id_adding_flag:Integer;
  id_smeta : Int64;
  id_dt_smet : Int64;
  summa_NDS      : Double;
  summa_Not_NDS  : Double;
  num_st         : string;
begin
 id_adding_flag:=1;

  Add := LoadDogManedger.AddKosht(self,TaxInvoicesKorigDM.DB.Handle,-1,1,0,0,0,0,0,date);
      if VarArrayDimCount(Add) > 0 then
      begin
      {
      Cnt := VarArrayHighBound(Add, 1);
       Проверка, есть ли однаковые разделы, кеквы, статьи }

         i:=0;
        if TaxInvoicesKorigDM.rxMemoryData_smet.Locate('id_smet',Add[i][7],[])=true then
         begin
          if TaxInvoicesKorigDM.RxMemoryData_smet.Locate('id_razd',Add[i][8],[])=true then
           begin
            if TaxInvoicesKorigDM.rxMemoryData_smet.Locate('id_stat',Add[i][9],[])=true then
             begin
              if TaxInvoicesKorigDM.RxMemoryData_smet.Locate('id_kekv',Add[i][10],[])=true then
               begin
//                 MessageBox(0,'Found','Update',MB_OK);
                 TaxInvoicesKorigDM.RxMemoryData_smet.Open;
                 TaxInvoicesKorigDM.RxMemoryData_smet.Edit;
                 TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('sum_smet').Value := Add[i][3]+TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('sum_smet').Value;

                 TaxInvoicesKorigDM.RxMemoryData_smet.Post;
                 id_adding_flag:=0;
               end;
             end;
           end;
         end;

      //DoCheckBgt(Add[i][7],rate_acc_un);

      if id_adding_flag = 1 then
      begin
      for i := 0 to Cnt do
      begin
      //id_smeta := Add[i][7];
      //id_dt_smet := TaxInvoicesDM.RxMemoryData_smet.FieldByName('id').AsVariant;
      TaxInvoicesKorigDM.RxMemoryData_smet.Locate('id', id_dt_smet, []);
      TaxInvoicesKorigDM.RxMemoryData_smet.Open;
      TaxInvoicesKorigDM.RxMemoryData_smet.Insert;
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_smet').Value := Add[i][7];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_razd').Value := Add[i][8];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_stat').Value := Add[i][9];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('sum_smet').Value := Add[i][3];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('name_smet').Value := Add[i][0];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('name_razd').Value := Add[i][1];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('name_stat').Value := Add[i][2];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('kod_smety').Value := Add[i][4];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('n_razd').Value := Add[i][5];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('n_stat').Value := Add[i][6];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_kekv').Value := Add[i][10];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('kod_kekv').Value := Add[i][11];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('name_kekv').Value := Add[i][12];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id').Value := 0;
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('flag_del').Value := 0;
      TaxInvoicesKorigDM.RxMemoryData_smet.Post;


    end;
    end;
   // SumNds();
  end;
end;

procedure TTaxInvoicesKorigAddForm.SpeedButton_redClick(Sender: TObject);
var
  Add: Variant;
  cnt,i: Integer;
  id_adding_flag:Integer;
  id_smeta : Int64;
  id_dt_smet : Int64;
  summa_old_Not_NDS : Double;
  summa_old_NDS     : Double;
  summa_NDS         : Double;
  summa_Not_NDS     : Double;
begin
  if TaxInvoicesKorigDM.RxMemoryData_smet.RecordCount = 0 then Exit;

  if TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300' then
  begin
    summa_NDS := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('sum_smet').AsCurrency;
  end
  else
    summa_Not_NDS := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('sum_smet').AsCurrency;

   Add := LoadDogManedger.AddKosht(self,TaxInvoicesKorigDM.DB.Handle,-1,2,
                                   TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_smet').AsInteger,
                                   TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_razd').AsInteger,
                                   TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_stat').AsInteger,
                                   TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_kekv').AsInteger,
                                   TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('sum_smet').AsCurrency,date);
      if VarArrayDimCount(Add) > 0 then
      begin
        i:=0;
        TaxInvoicesKorigDM.RxMemoryData_smet.Open;
        TaxInvoicesKorigDM.RxMemoryData_smet.edit;
        TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_smet').Value   := Add[i][7];
        TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_razd').Value   := Add[i][8];
        TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_stat').Value   := Add[i][9];
        TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('sum_smet').Value  := Add[i][3];
        TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('name_smet').Value := Add[i][0];
        TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('name_razd').Value := Add[i][1];
        TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('name_stat').Value := Add[i][2];
        TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('kod_smety').Value := Add[i][4];
        TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('n_razd').Value    := Add[i][5];
        TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('n_stat').Value    := Add[i][6];
        TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_kekv').Value   := Add[i][10];
        TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('kod_kekv').Value  := Add[i][11];
        TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('name_kekv').Value := Add[i][12];
        TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id').Value := 0;
        TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('flag_del').Value := 0;
        TaxInvoicesKorigDM.RxMemoryData_smet.Post;

     end;
end;

procedure TTaxInvoicesKorigAddForm.ToolButton_delClick(Sender: TObject);
var
  summa_old_Not_NDS : Double;
  summa_old_NDS     : Double;
  summa_NDS         : Double;
  summa_Not_NDS     : Double;
begin
  if TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300' then
    begin
      summa_NDS := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('sum_smet').AsCurrency;
    end
  else


  if TaxInvoicesKorigDM.RxMemoryData_smet.RecordCount = 0 then Exit;
  TaxInvoicesKorigDM.RxMemoryData_smet.Delete;
end;

procedure TTaxInvoicesKorigAddForm.BudgetButtonClick(Sender: TObject);
var
  ViewForm       : TTaxInvoicesKorigBudgetForm;
  i              : Integer;
  KEY_SESSION    : Int64;
  STRU           : KERNEL_MODE_STRUCTURE;
  DoResult       : Boolean;
  ErrorList      : TStringList;
  s              : string;
  j              : integer;
  workdate       : TDate;
  pk_id          : int64;
  sum_All_Nds    : Double;
  sum_All_Not_NDS : Double;
  summa_val_deliv_20 :Double;
  summa_tax : Double;
  summa_val_deliv_vat_extemptions : Double;
  summa_main_stavka :Double;
  summa_not_PDV     :Double;
  summa_korrect     :Double;
begin
  RefreshButtonClick(Self);
  // ничего не делать, если старая налоговая
  if (TaxInvoicesKorigDM.VidNaklInfoDSet['pk_id'] = '-1') then Exit;

  //проверка на пустоту сумм
  if (TaxInvoicesKorigDM.VidNaklInfoDSet['summa_main_stavka'] = null) then
    summa_main_stavka := 0
  else
    summa_main_stavka := TaxInvoicesKorigDM.VidNaklInfoDSet['summa_main_stavka'];

  if (TaxInvoicesKorigDM.VidNaklInfoDSet['summa_not_pdv'] = null) then
    summa_not_pdv := 0
  else
    summa_not_pdv := TaxInvoicesKorigDM.VidNaklInfoDSet['summa_not_pdv'];

  if (TaxInvoicesKorigDM.VidNaklInfoDSet['summa_korrect'] = null) then
    summa_korrect := 0
  else
    summa_korrect := TaxInvoicesKorigDM.VidNaklInfoDSet['summa_korrect'];

  if ((summa_main_stavka = 0) and (summa_not_pdv = 0) and (summa_korrect = 0)) then
    begin
      ShowMessage('Заповніть суми розрахунка корегування');
      Exit;
    end;

  ViewForm := TTaxInvoicesKorigBudgetForm.Create(Self,TaxInvoicesKorigDM.DB.Handle, TaxInvoicesKorigDM);
  ViewForm.Label_val_deliv_20.Caption := FloatToStrF(summa_main_stavka,ffFixed,10,2);
  ViewForm.Label_Tax.Caption          := FloatToStrF(summa_korrect,ffFixed,10,2);
  ViewForm.Label_vat_extemption.Caption := FloatToStrF(summa_not_pdv,ffFixed,10,2);

  // отображение проводок
  for i := 0 to TaxInvoicesKorigDM.RxMemoryData_smet.RecordCount - 1 do
    TaxInvoicesKorigDM.RxMemoryData_smet.Delete;

    TaxInvoicesKorigDM.Smeta_Vid_N_DSet.Close;
    TaxInvoicesKorigDM.Smeta_Vid_N_DSet.SelectSQL.Text := 'select * from TI_BUDGET_NDS_SEL where id_nakl = :id and is_vid = 1';
    TaxInvoicesKorigDM.Smeta_Vid_N_DSet.ParamByName('id').Value := id_vid_nakl_Ins;
    TaxInvoicesKorigDM.Smeta_Vid_N_DSet.Open;
    TaxInvoicesKorigDM.Smeta_Vid_N_DSet.FetchAll;
    TaxInvoicesKorigDM.Smeta_Vid_N_DSet.First;
    sum_All_Nds     := 0;
    sum_All_Not_NDS := 0;
    for i := 0 to TaxInvoicesKorigDM.Smeta_Vid_N_DSet.RecordCount-1 do
    begin
      TaxInvoicesKorigDM.RxMemoryData_smet.Open;
      TaxInvoicesKorigDM.RxMemoryData_smet.Insert;
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_smet').Value   := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['id_smet'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_razd').Value   := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['id_razd'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_stat').Value   := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['id_stat'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('sum_smet').Value  := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['sum_smet'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('name_smet').Value := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['name_smet'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('name_razd').Value := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['name_razd'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('name_stat').Value := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['name_stat'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('kod_smety').Value := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['kod_smety'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('n_razd').Value    := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['n_razd'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('n_stat').Value    := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['n_stat'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('id_kekv').Value   := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['id_kekv'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('kod_kekv').Value  := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['kod_kekv'];
      TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('name_kekv').Value := TaxInvoicesKorigDM.Smeta_Vid_N_DSet['name_kekv'];
      TaxInvoicesKorigDM.RxMemoryData_smet.Post;
      TaxInvoicesKorigDM.Smeta_Vid_N_DSet.Next;

      if TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300' then
        sum_All_Nds     := sum_All_Nds + TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('sum_smet').Value
      else
        sum_All_Not_NDS := sum_All_Not_NDS + TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('sum_smet').Value;
    end;
    if TaxInvoicesKorigDM.Smeta_Vid_N_DSet.IsEmpty = True then
      begin
        ViewForm.Label21.Caption := '';
        ViewForm.Label22.Caption := '';
        ViewForm.Label23.Caption := '';
        ViewForm.Label26.Caption := '';
        ViewForm.LabelNotPDV.Caption := '0';
        ViewForm.LabelPDV.Caption := '0';
      end
    else
      begin
        ViewForm.LabelNotPDV.Caption := Floattostr(sum_All_Not_NDS);
        ViewForm.LabelPDV.Caption := Floattostr(sum_All_Nds);
      end;

          {if TaxInvoicesKorigDM.VidNaklInfoDSet['pk_id']= null
           then pk_id := 0
           else pk_id := StrToInt64(TaxInvoicesKorigDM.VidNaklInfoDSet.FieldByName('pk_id').AsString); }

          {if ((pk_id = 0) or (pk_id = -1))
           then
              ViewForm.provodka := False
            else
            ViewForm.provodka := True;}


  ViewForm.ShowModal;
  if (ViewForm.ModalResult = mrok) then
  begin
    if TaxInvoicesKorigDM.VidNaklInfoDSet['pk_id'] = '0' then
    begin
      //осуществить проводку
      TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
      //изменение проводок
      TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName               := 'TI_BUDGET_NDS_DEL';     // удаляем все проводки и перезаписываем
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_NAKL').Value := id_vid_nakl_Ins;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_vid').Value  := 1;
      TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;

      // добавление проводок в таблицу TI_BUDGET_NDS
      TaxInvoicesKorigDM.RxMemoryData_smet.First;
      for i:=0 to TaxInvoicesKorigDM.RxMemoryData_smet.RecordCount - 1 do
      begin
        TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                   := 'TI_BUDGET_NDS_INS';
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_NAKL').Value     := id_vid_nakl_Ins;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_SMET').Value     := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('ID_SMET').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_RAZD').Value     := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('ID_RAZD').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_STAT').Value     := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('ID_STAT').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('SUM_SMET').Value    := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('SUM_SMET').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_SMET').Value   := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('NAME_SMET').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_RAZD').Value   := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('NAME_RAZD').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_STAT').Value   := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('NAME_STAT').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('KOD_SMETY').Value   := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('KOD_SMETY').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('N_RAZD').Value      := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('N_RAZD').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('N_STAT').Value      := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('N_STAT').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_KEKV').Value     := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('ID_KEKV').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('KOD_KEKV').Value    := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('KOD_KEKV').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_KEKV').Value   := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('NAME_KEKV').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_VID').Value      := 1;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_LGOTA').Value    := 0;
        TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
        TaxInvoicesKorigDM.RxMemoryData_smet.Next;
      end;
      //если есть НДС - осуществляем проводку в бухгалтерию
      //TaxInvoicesKorigDM.WriteTransaction.Commit;
     // TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
      if StrToFloat(ViewForm.Label_Tax.Caption)<>0 then
      begin
        //добавление проводок в буфера
        TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                          := 'TI_PROVODKA_VID_NAKL';
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_VID_NAKL').Value        := id_vid_nakl_Ins;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IP_ADRESS_COMPUTER').Value := TaxInvoicesUser.ip_computer;
        TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;

        // добавление проводки
        KEY_SESSION := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('KEY_SESSION_DOC').value;
        workdate    := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('DATE_PROV').value;
        //ShowMessage(IntToStr(KEY_SESSION));

        STRU.KEY_SESSION   := KEY_SESSION;
        STRU.WORKDATE      := WORKDATE;
        STRU.DBHANDLE      := TaxInvoicesKorigDM.DB.Handle;
        STRU.TRHANDLE      := TaxInvoicesKorigDM.WriteTransaction.Handle;
        STRU.KERNEL_ACTION := 1;
        STRU.ID_USER       := TaxInvoicesUser.id_user;

        try
          DoResult:=Kernel.KernelDo(@STRU);
        except
         on E:Exception do
         begin
           ShowMessage('Помилка ядра ' + E.Message);
           TaxInvoicesKorigDM.WriteTransaction.Rollback;
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
         TaxInvoicesKorigDM.WriteTransaction.Rollback;
         Exit;
       end;
      end;
      TaxInvoicesKorigDM.WriteTransaction.Commit;
    end
    //если это изменение бюджетов удалить всё и записать новую проводку
    else
    begin
      TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
    //изменение проводок
      TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                   := 'TI_BUDGET_NDS_DEL';     // удаляем все проводки и перезаписываем
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_NAKL').Value := id_vid_nakl_Ins;
      TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_vid').Value := 1;
      TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;

      TaxInvoicesKorigDM.RxMemoryData_smet.First;
      for i:=0 to TaxInvoicesKorigDM.RxMemoryData_smet.RecordCount - 1 do   //записываем новые
      begin
        TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                   := 'TI_BUDGET_NDS_INS';
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_NAKL').Value := id_vid_nakl_Ins;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_SMET').Value     := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('ID_SMET').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_RAZD').Value     := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('ID_RAZD').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_STAT').Value     := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('ID_STAT').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('SUM_SMET').Value    := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('SUM_SMET').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_SMET').Value   := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('NAME_SMET').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_RAZD').Value   := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('NAME_RAZD').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_STAT').Value   := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('NAME_STAT').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('KOD_SMETY').Value   := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('KOD_SMETY').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('N_RAZD').Value      := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('N_RAZD').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('N_STAT').Value      := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('N_STAT').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_KEKV').Value     := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('ID_KEKV').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('KOD_KEKV').Value    := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('KOD_KEKV').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NAME_KEKV').Value   := TaxInvoicesKorigDM.RxMemoryData_smet.FieldByName('NAME_KEKV').Value;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_VID').Value      := 1;
        TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_LGOTA').Value    := 1;
        TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
        TaxInvoicesKorigDM.RxMemoryData_smet.Next;
      end;


              KEY_SESSION := TaxInvoicesKorigDM.DB.Gen_Id('KERNEL_GEN_ID_SESSION', 1);
              STRU.KEY_SESSION := KEY_SESSION;
              STRU.WORKDATE := TaxInvoicesKorigDM.VidNaklInfoDSet['date_prov'];
              STRU.DBHANDLE := TaxInvoicesKorigDM.DB.Handle;
              STRU.TRHANDLE := TaxInvoicesKorigDM.WriteTransaction.Handle;
              STRU.KERNEL_ACTION := 2;
              STRU.PK_ID := StrToInt64(TaxInvoicesKorigDM.VidNaklInfoDSet.FieldByName('pk_id').AsString);
              STRU.ID_USER := TaxInvoicesUser.id_user;

              try
                DoResult:=Kernel.KernelDo(@STRU);
              //  TaxInvoicesDM.WriteTransaction.Commit;
              except
               on E:Exception do
               begin
                 ShowMessage('Помилка ядра ' + E.Message);
                 TaxInvoicesKorigDM.WriteTransaction.Rollback;
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
                TaxInvoicesKorigDM.WriteTransaction.Rollback;
                Exit;
              end;

              //добавление проводок в буфера
              TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                          := 'TI_PROVODKA_VID_NAKL';
              TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_VID_NAKL').Value        := id_vid_nakl_Ins;
              TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IP_ADRESS_COMPUTER').Value := TaxInvoicesUser.ip_computer;
              TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
              // добавление проводки
              KEY_SESSION := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('KEY_SESSION_DOC').value;
              workdate    := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('DATE_PROV').value;

              STRU.KEY_SESSION   := KEY_SESSION;
              STRU.WORKDATE      := WORKDATE;
              STRU.DBHANDLE      := TaxInvoicesKorigDM.DB.Handle;
              STRU.TRHANDLE      := TaxInvoicesKorigDM.WriteTransaction.Handle;
              STRU.KERNEL_ACTION := 1;
              STRU.ID_USER       := TaxInvoicesUser.id_user;

              try
                DoResult:=Kernel.KernelDo(@STRU);
              except
                on E:Exception do
                begin
                 ShowMessage('Помилка ядра ' + E.Message);
                 TaxInvoicesKorigDM.WriteTransaction.Rollback;
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
                TaxInvoicesKorigDM.WriteTransaction.Rollback;
                Exit;
              end;
      TaxInvoicesKorigDM.WriteTransaction.commit;
    end;
  end;
end;

procedure TTaxInvoicesKorigAddForm.NoteCheckBoxClick(Sender: TObject);
begin
  //NoteButtonEdit.Enabled  := NoteCheckBox.Checked;
end;

procedure TTaxInvoicesKorigAddForm.NoteButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  Note:Variant;
begin
  Parameter := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesKorigDM.DB.Handle;
  Parameter.Owner := self;
  Note := DoFunctionFromPackage(Parameter,Notes_Const);
  Parameter.Destroy;
  If VarArrayDimCount(Note)>0 then
  begin
    //NoteButtonEdit.Text     := Note[1];
    PParameter.id_note      := Note[0];
    PParameter.article_note := Note[1];
  end;
end;

procedure TTaxInvoicesKorigAddForm.EditTaxButtonClick(Sender: TObject);
var
  ViewForm : TTaxInvoicesKorigTaxForm;
begin
  ViewForm                      := TTaxInvoicesKorigTaxForm.Create(Self,TaxInvoicesKorigDM.DB.Handle);
  ViewForm.TaxCurrencyEdit.Text := TaxInvoicesKorigDM.VidNaklInfoDSet['summa_korrect'];
  ViewForm.ShowModal;
  if (ViewForm.ModalResult = mrok) then
  begin
    TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
    TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                   := 'TI_UPD_TAX_KORRECT';
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ID_NAKL_DOC').Value := id_vid_nakl_doc_Ins;
    TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('SUMMA_KORRECT').Value   := ViewForm.TaxCurrencyEdit.Value;
    TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
    TaxInvoicesKorigDM.WriteTransaction.Commit;
  end;
  RefreshButton.Click;
end;

procedure TTaxInvoicesKorigAddForm.DateNaklDateEditKeyPress(
  Sender: TObject; var Key: Char);
begin
begin
 if Key = #13 then
 begin
   if ((DateNaklDateEdit.Text <> '') and (PodNumTextEdit.Text <> '')) then
   begin
     // необходимо поискать выданную налоговую накладную в списке
     TaxInvoicesKorigDM.WriteTransaction.StartTransaction;
     TaxInvoicesKorigDM.pFIBStoredProc.StoredProcName                     := 'TI_FIND_VID_NAKL';
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value      := PodNumTextEdit.Text;
     TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('DATE_VIP_NAKL').Value := DateNaklDateEdit.Date;
     TaxInvoicesKorigDM.pFIBStoredProc.ExecProc;
     TaxInvoicesKorigDM.WriteTransaction.Commit;
     if (TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('IS_FIND').Value = 1) then
     begin
       PParameter.id_TaxLiabilities     := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_tax_liabilities').Value;
       PParameter.Name_TaxLiabilities   := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_tax_liabilities').Value;
       PParameter.Id_TaxKredit          := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_taxkredit').Value;
       PParameter.Name_TaxKredit        := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_taxkredit').Value;
       PParameter.id_SpecialNotes       := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_specialnotes').Value;
       PParameter.Name_SpecialNotes     := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_specialnotes').Value;
       PParameter.id_customer           := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_customer').Value;
       PParameter.Name_customer         := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_customer').Value;
       PParameter.ipn_customer          := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('ipn_customer').Value;
       PParameter.place_customer        := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('place_customer').Value;
       PParameter.phone_customer        := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('phone_customer').Value;
       PParameter.NumReestr_customer    := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('numreestr_customer').Value;
       PParameter.EDRPOU_Customer       := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('edrpou_customer').Value;
       PParameter.id_TermsDelivery      := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_termsdelivery').Value;
       PParameter.Name_TermsDelivery    := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_termsdelivery').Value;
       PParameter.data_termsdelivery    := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value;
       PParameter.num_termsdelivery     := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value;
       PParameter.id_FormCalculations   := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('id_formcalculations').Value;
       PParameter.Name_FormCalculations := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_formcalculations').Value;

      if (TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('full_name_customer').Value <> null) then
        PParameter.Full_name_customer  := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('full_name_customer').Value
      else
        PParameter.Full_name_customer  := '';


      if (TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_tax_liabilities').Value<>'')then
       begin
        PodZobCheckBox.Checked   := True;
        PodZobButtonEdit.Enabled := True;
        PodZobButtonEdit.Text    := TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('name_tax_liabilities').Value;
       end
      else
      begin
       PodZobCheckBox.Checked   := False;
       PodZobButtonEdit.Enabled := False;
       PodZobButtonEdit.Text    := '';
      end;

      if (PParameter.Name_SpecialNotes <> '')then
       begin
        OsoblPrimCheckBox.Checked   := True;
        SpecialNotesButtonEdit.Enabled := True;
        SpecialNotesButtonEdit.Text    := PParameter.Name_SpecialNotes;
       end
      else
      begin
        OsoblPrimCheckBox.Checked   := False;
        SpecialNotesButtonEdit.Enabled := False;
        SpecialNotesButtonEdit.Text    := '';
      end;

      if (PParameter.Name_TermsDelivery <> '')then
       begin
        PostavkaCheckBox.Checked     := True;
        DataTermsdelDateEdit.Enabled := True;
        NumTermsDelTextEdit.Enabled  := True;
        PostavkaButtonEdit.Enabled   := True;
        PostavkaButtonEdit.Text      := PParameter.Name_TermsDelivery;
        NumTermsDelTextEdit.Text     := PParameter.num_termsdelivery;

        if (PParameter.data_termsdelivery = StrToDate('01.01.1900')) then
        begin
          DataTermsdelDateEdit.Text := '';
        end
        else
        begin
          DataTermsdelDateEdit.Date := PParameter.data_termsdelivery;
        end;

       end
      else
      begin
       PostavkaCheckBox.Checked     := False;
       DataTermsdelDateEdit.Enabled := False;
       NumTermsDelTextEdit.Enabled  := False;
       PostavkaButtonEdit.Enabled   := False;

       DataTermsdelDateEdit.Text := '';
       NumTermsDelTextEdit.Text  := '';
       PostavkaButtonEdit.Text   := '';
      end;

      if (PParameter.Name_FormCalculations <> '')then
      begin
       RozraxunokCheckBox.Checked   := True;
       RozraxunokButtonEdit.Enabled := True;
       RozraxunokButtonEdit.Text    := PParameter.Name_FormCalculations;
      end
      else
      begin
       RozraxunokCheckBox.Checked   := False;
       RozraxunokButtonEdit.Enabled := False;
       RozraxunokButtonEdit.Text    := '';
      end;

      if (PParameter.Name_TaxKredit <> '')then
       begin
        PodKreditCheckBox.Checked   := True;
        PodKreditButtonEdit.Enabled := True;
        PodKreditButtonEdit.Text    := PParameter.Name_TaxKredit;
       end
      else
       begin
        PodKreditCheckBox.Checked   := False;
        PodKreditButtonEdit.Enabled := False;
        PodKreditButtonEdit.Text    := '';
       end;

      if (TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_issued_buyer').Value = 1)then
        is_issued_buyer_CheckBox.Checked := True
      else
        is_issued_buyer_CheckBox.Checked := False;

      if (TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_erpn').Value = 1)then
        is_erpn_CheckBox.Checked := True
      else
        is_erpn_CheckBox.Checked := False;

      if (TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_copy').Value = 1)then
        is_copy_CheckBox.Checked := True
      else
        is_copy_CheckBox.Checked := False;

      if (TaxInvoicesKorigDM.pFIBStoredProc.ParamByName('is_remains_seller').Value = 1)then
        OsoblPrimCheckBox.Checked := True
      else
        OsoblPrimCheckBox.Checked := False;

        DateTermsDeliveryDateEdit.Date := PParameter.data_termsdelivery;
        NumTermsDeliveryTextEdit.Text  := PParameter.num_termsdelivery;
        OsobaPokupButtonEdit.Text      := PParameter.Name_customer;
        IPNPokupTextEdit.Text          := PParameter.ipn_customer;
        FullNameMemo.Text              := PParameter.Full_name_customer;
        PlacePokupMemo.Text            := PParameter.place_customer;
        TelPokupTextEdit.Text          := PParameter.phone_customer;
        NumReestrPokupTextEdit.Text    := PParameter.NumReestr_customer;
        EdrpTextEdit.Text              := PParameter.EDRPOU_Customer;
        PostavkaButtonEdit.Text        := PParameter.Name_TermsDelivery;
        DataTermsdelDateEdit.date      := PParameter.data_termsdelivery;
        NumTermsDelTextEdit.Text       := PParameter.num_termsdelivery;
        RozraxunokButtonEdit.Text      := PParameter.Name_FormCalculations;

        DateTermsDeliveryDateEdit.SetFocus;
     end
     else
     begin
       TiShowMessage('Увага!','Немає податкової накладної з таким номером та датою виписки!', mtError, [mbYes]);
       DateTermsDeliveryDateEdit.Text := '';
       NumTermsDeliveryTextEdit.Text  := '';
       OsobaPokupButtonEdit.Text      := '';
       IPNPokupTextEdit.Text          := '';
       FullNameMemo.Text              := '';
       PlacePokupMemo.Text            := '';
       TelPokupTextEdit.Text          := '';
       NumReestrPokupTextEdit.Text    := '';
       EdrpTextEdit.Text              := '';
       PostavkaButtonEdit.Text        := '';
       DataTermsdelDateEdit.Text      := '';
       NumTermsDelTextEdit.Text       := '';
       RozraxunokButtonEdit.Text      := '';

       DateTermsDeliveryDateEdit.SetFocus;
     end;
   end;

 end;
end;
end;

procedure TTaxInvoicesKorigAddForm.DoPrintKorig;
  const NameReport = '\Reports\TaxInvoices\VidNaklKorig.fr3';
  const NameReportMart2014 = '\Reports\TaxInvoices\VidNaklKorigMart.fr3';
  const NameReportDecember2014 = '\Reports\TaxInvoices\VidNaklKorigDecember2014.fr3';
var
  num_specialnotes :string;
  data_nakl    :string;
  data_termsdelivery :string;
  NotPDV       : string;
  ipn_prodavec : string;
  ipn_customer : string;
  sv_prodavec  : string;
  sv_customer  : string;
  tel_prodavec : string;
  tel_customer : string;
  i            : Integer;
  date_rozr    : string;
  num_nakl     : string;
  num_korig    : string;
  date_opl     : string;
begin
  NotPDV := 'без ПДВ';
  
  if (TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_VIPISKI']<StrtoDate('01.03.2014')) then
    TaxInvoicesKorigDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport,True)
  else
    if (TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_VIPISKI']>=StrtoDate('01.03.2014'))and
      (TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_VIPISKI']<StrtoDate('01.12.2014')) then
      TaxInvoicesKorigDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportMart2014,True)
    else
      TaxInvoicesKorigDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportDecember2014,True);

 // TaxInvoicesKorigDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport,True);
  data_nakl    := DateToStr(TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_VIPISKI']);
  ipn_prodavec := (TaxInvoicesKorigDM.VidNaklInfoDSet['ipn_seller']);
  ipn_customer := (TaxInvoicesKorigDM.VidNaklInfoDSet['ipn_customer']);
  sv_prodavec  := (TaxInvoicesKorigDM.VidNaklInfoDSet['numreestr_seller']);
  sv_customer  := (TaxInvoicesKorigDM.VidNaklInfoDSet['numreestr_customer']);
  tel_prodavec := TaxInvoicesKorigDM.VidNaklInfoDSet['phone_seller'];
  tel_customer := TaxInvoicesKorigDM.VidNaklInfoDSet['phone_customer'];
  date_rozr    := DateToStr(TaxInvoicesKorigDM.VidNaklInfoDSet['DATE_ROZR']);
  num_nakl     := IntToStr(TaxInvoicesKorigDM.VidNaklInfoDSet['num_nakl']);
  num_korig    := IntToStr(TaxInvoicesKorigDM.VidNaklInfoDSet['NUM_ROZR']);
  date_opl     := DateToStr(TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_OPL_KORRECT']);

  TaxInvoicesKorigDM.Report.Variables.Clear;

  TaxInvoicesKorigDM.Report.Variables['numn1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numn2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numn3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numn4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numn5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numn6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numn7']  := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['numk1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numk2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numk3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numk4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numk5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numk6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numk7']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numk8']  := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['tp1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp7']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp8']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp9']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp10'] := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['tc1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc7']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc8']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc9']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc10'] := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['sp1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp7']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp8']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp9']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp10'] := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['sc1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc7']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc8']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc9']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc10'] := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['D1']  := data_nakl[1];
  TaxInvoicesKorigDM.Report.Variables['D2']  := data_nakl[2];
  TaxInvoicesKorigDM.Report.Variables['D3']  := data_nakl[4];
  TaxInvoicesKorigDM.Report.Variables['D4']  := data_nakl[5];
  TaxInvoicesKorigDM.Report.Variables['D5']  := data_nakl[7];
  TaxInvoicesKorigDM.Report.Variables['D6']  := data_nakl[8];
  TaxInvoicesKorigDM.Report.Variables['D7']  := data_nakl[9];
  TaxInvoicesKorigDM.Report.Variables['D8']  := data_nakl[10];

  TaxInvoicesKorigDM.Report.Variables['Dk1']  := date_rozr[1];
  TaxInvoicesKorigDM.Report.Variables['Dk2']  := date_rozr[2];
  TaxInvoicesKorigDM.Report.Variables['Dk3']  := date_rozr[4];
  TaxInvoicesKorigDM.Report.Variables['Dk4']  := date_rozr[5];
  TaxInvoicesKorigDM.Report.Variables['Dk5']  := date_rozr[7];
  TaxInvoicesKorigDM.Report.Variables['Dk6']  := date_rozr[8];
  TaxInvoicesKorigDM.Report.Variables['Dk7']  := date_rozr[9];
  TaxInvoicesKorigDM.Report.Variables['Dk8']  := date_rozr[10];

  TaxInvoicesKorigDM.Report.Variables['Do1']  := date_opl[1];
  TaxInvoicesKorigDM.Report.Variables['Do2']  := date_opl[2];
  TaxInvoicesKorigDM.Report.Variables['Do3']  := date_opl[4];
  TaxInvoicesKorigDM.Report.Variables['Do4']  := date_opl[5];
  TaxInvoicesKorigDM.Report.Variables['Do5']  := date_opl[7];
  TaxInvoicesKorigDM.Report.Variables['Do6']  := date_opl[8];
  TaxInvoicesKorigDM.Report.Variables['Do7']  := date_opl[9];
  TaxInvoicesKorigDM.Report.Variables['Do8']  := date_opl[10];

  i := 7;
  if (num_nakl <> '')then
  begin
   while Length(num_nakl)>0 do
   begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['numn1']  := Copy(num_nakl, Length(num_nakl), 1);
      2:TaxInvoicesKorigDM.Report.Variables['numn2']  := Copy(num_nakl, Length(num_nakl), 1);
      3:TaxInvoicesKorigDM.Report.Variables['numn3']  := Copy(num_nakl, Length(num_nakl), 1);
      4:TaxInvoicesKorigDM.Report.Variables['numn4']  := Copy(num_nakl, Length(num_nakl), 1);
      5:TaxInvoicesKorigDM.Report.Variables['numn5']  := Copy(num_nakl, Length(num_nakl), 1);
      6:TaxInvoicesKorigDM.Report.Variables['numn6']  := Copy(num_nakl, Length(num_nakl), 1);
      7:TaxInvoicesKorigDM.Report.Variables['numn7']  := Copy(num_nakl, Length(num_nakl), 1);
    end;
    Delete(num_nakl, Length(num_nakl), 1);
    i:=i-1;
   end;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['numn1']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numn2']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numn3']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numn4']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numn5']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numn6']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numn7']  := ''''+'''';
  end;

  i := 8;
  if (num_korig <> '')then
  begin
   while Length(num_korig)>0 do
   begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['numk1']  := Copy(num_korig, Length(num_korig), 1);
      2:TaxInvoicesKorigDM.Report.Variables['numk2']  := Copy(num_korig, Length(num_korig), 1);
      3:TaxInvoicesKorigDM.Report.Variables['numk3']  := Copy(num_korig, Length(num_korig), 1);
      4:TaxInvoicesKorigDM.Report.Variables['numk4']  := Copy(num_korig, Length(num_korig), 1);
      5:TaxInvoicesKorigDM.Report.Variables['numk5']  := Copy(num_korig, Length(num_korig), 1);
      6:TaxInvoicesKorigDM.Report.Variables['numk6']  := Copy(num_korig, Length(num_korig), 1);
      7:TaxInvoicesKorigDM.Report.Variables['numk7']  := Copy(num_korig, Length(num_korig), 1);
      8:TaxInvoicesKorigDM.Report.Variables['numk8']  := Copy(num_korig, Length(num_korig), 1);
    end;
    Delete(num_korig, Length(num_korig), 1);
    i:=i-1;
   end;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['numk1']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numk2']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numk3']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numk4']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numk5']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numk6']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numk7']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numk8']  := ''''+'''';
  end;

  i := 10;
  if (tel_prodavec <> '')then
  begin
   while Length(tel_prodavec)>0 do
   begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['tp1']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      2:TaxInvoicesKorigDM.Report.Variables['tp2']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      3:TaxInvoicesKorigDM.Report.Variables['tp3']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      4:TaxInvoicesKorigDM.Report.Variables['tp4']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      5:TaxInvoicesKorigDM.Report.Variables['tp5']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      6:TaxInvoicesKorigDM.Report.Variables['tp6']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      7:TaxInvoicesKorigDM.Report.Variables['tp7']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      8:TaxInvoicesKorigDM.Report.Variables['tp8']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      9:TaxInvoicesKorigDM.Report.Variables['tp9']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
     10:TaxInvoicesKorigDM.Report.Variables['tp10'] := Copy(tel_prodavec, Length(tel_prodavec), 1);
    end;
    Delete(tel_prodavec, Length(tel_prodavec), 1);
    i:=i-1;
   end;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['tp1']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp2']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp3']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp4']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp5']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp6']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp7']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp8']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp9']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp10'] := ''''+'''';
  end;


  i := 10;
  if (tel_customer<>'')then
  begin
   while Length(tel_customer)>0 do
   begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['tc1']  := Copy(tel_customer, Length(tel_customer), 1);
      2:TaxInvoicesKorigDM.Report.Variables['tc2']  := Copy(tel_customer, Length(tel_customer), 1);
      3:TaxInvoicesKorigDM.Report.Variables['tc3']  := Copy(tel_customer, Length(tel_customer), 1);
      4:TaxInvoicesKorigDM.Report.Variables['tc4']  := Copy(tel_customer, Length(tel_customer), 1);
      5:TaxInvoicesKorigDM.Report.Variables['tc5']  := Copy(tel_customer, Length(tel_customer), 1);
      6:TaxInvoicesKorigDM.Report.Variables['tc6']  := Copy(tel_customer, Length(tel_customer), 1);
      7:TaxInvoicesKorigDM.Report.Variables['tc7']  := Copy(tel_customer, Length(tel_customer), 1);
      8:TaxInvoicesKorigDM.Report.Variables['tc8']  := Copy(tel_customer, Length(tel_customer), 1);
      9:TaxInvoicesKorigDM.Report.Variables['tc9']  := Copy(tel_customer, Length(tel_customer), 1);
     10:TaxInvoicesKorigDM.Report.Variables['tc10'] := Copy(tel_customer, Length(tel_customer), 1);
    end;
    Delete(tel_customer, Length(tel_customer), 1);
    i:=i-1;
   end;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['tc1']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc2']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc3']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc4']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc5']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc6']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc7']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc8']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc9']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc10'] := ''''+'''';
  end;


  i := 10;
  while Length(sv_prodavec)>0 do
  begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['sp1']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      2:TaxInvoicesKorigDM.Report.Variables['sp2']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      3:TaxInvoicesKorigDM.Report.Variables['sp3']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      4:TaxInvoicesKorigDM.Report.Variables['sp4']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      5:TaxInvoicesKorigDM.Report.Variables['sp5']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      6:TaxInvoicesKorigDM.Report.Variables['sp6']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      7:TaxInvoicesKorigDM.Report.Variables['sp7']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      8:TaxInvoicesKorigDM.Report.Variables['sp8']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      9:TaxInvoicesKorigDM.Report.Variables['sp9']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
     10:TaxInvoicesKorigDM.Report.Variables['sp10'] := Copy(sv_prodavec, Length(sv_prodavec), 1);
    end;
   Delete(sv_prodavec, Length(sv_prodavec), 1);
   i:=i-1;
  end;

  i := 10;
  while Length(sv_customer)>0 do
  begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['sc1']  := Copy(sv_customer, Length(sv_customer), 1);
      2:TaxInvoicesKorigDM.Report.Variables['sc2']  := Copy(sv_customer, Length(sv_customer), 1);
      3:TaxInvoicesKorigDM.Report.Variables['sc3']  := Copy(sv_customer, Length(sv_customer), 1);
      4:TaxInvoicesKorigDM.Report.Variables['sc4']  := Copy(sv_customer, Length(sv_customer), 1);
      5:TaxInvoicesKorigDM.Report.Variables['sc5']  := Copy(sv_customer, Length(sv_customer), 1);
      6:TaxInvoicesKorigDM.Report.Variables['sc6']  := Copy(sv_customer, Length(sv_customer), 1);
      7:TaxInvoicesKorigDM.Report.Variables['sc7']  := Copy(sv_customer, Length(sv_customer), 1);
      8:TaxInvoicesKorigDM.Report.Variables['sc8']  := Copy(sv_customer, Length(sv_customer), 1);
      9:TaxInvoicesKorigDM.Report.Variables['sc9']  := Copy(sv_customer, Length(sv_customer), 1);
     10:TaxInvoicesKorigDM.Report.Variables['sc10'] := Copy(sv_customer, Length(sv_customer), 1);
    end;
   Delete(sv_customer, Length(sv_customer), 1);
   i:=i-1;
  end;

  if not (TaxInvoicesKorigDM.VidNaklInfoDSet['NUM_SPECIALNOTES'] <> null) then
  begin
    num_specialnotes := TaxInvoicesKorigDM.VidNaklInfoDSet['NUM_SPECIALNOTES'];
    TaxInvoicesKorigDM.Report.Variables['NUM1']:= num_specialnotes[1];
    TaxInvoicesKorigDM.Report.Variables['NUM2']:= num_specialnotes[2];
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['NUM1']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['NUM2']:= ''''+'''';
  end;

  if (not (TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'] = null) and (TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'] <> '01.01.1900')) then
  begin
    data_termsdelivery := TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'];
    TaxInvoicesKorigDM.Report.Variables['TD1']  := data_termsdelivery[1];
    TaxInvoicesKorigDM.Report.Variables['TD2']  := data_termsdelivery[2];
    TaxInvoicesKorigDM.Report.Variables['TD3']  := data_termsdelivery[4];
    TaxInvoicesKorigDM.Report.Variables['TD4']  := data_termsdelivery[5];
    TaxInvoicesKorigDM.Report.Variables['TD5']  := data_termsdelivery[7];
    TaxInvoicesKorigDM.Report.Variables['TD6']  := data_termsdelivery[8];
    TaxInvoicesKorigDM.Report.Variables['TD7']  := data_termsdelivery[9];
    TaxInvoicesKorigDM.Report.Variables['TD8']  := data_termsdelivery[10];
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['TD1']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD2']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD3']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD4']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD5']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD6']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD7']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD8']  := ''''+'''';
  end;

  if ipn_prodavec = '0' then
  begin
    TaxInvoicesKorigDM.Report.Variables['IP1']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP2']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP3']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP4']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP5']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP6']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP7']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP8']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP9']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP10']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP11']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP12']:= ipn_prodavec;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['IP1'] := ipn_prodavec[1];
    TaxInvoicesKorigDM.Report.Variables['IP2'] := ipn_prodavec[2];
    TaxInvoicesKorigDM.Report.Variables['IP3'] := ipn_prodavec[3];
    TaxInvoicesKorigDM.Report.Variables['IP4'] := ipn_prodavec[4];
    TaxInvoicesKorigDM.Report.Variables['IP5'] := ipn_prodavec[5];
    TaxInvoicesKorigDM.Report.Variables['IP6'] := ipn_prodavec[6];
    TaxInvoicesKorigDM.Report.Variables['IP7'] := ipn_prodavec[7];
    TaxInvoicesKorigDM.Report.Variables['IP8'] := ipn_prodavec[8];
    TaxInvoicesKorigDM.Report.Variables['IP9'] := ipn_prodavec[9];
    TaxInvoicesKorigDM.Report.Variables['IP10']:= ipn_prodavec[10];
    TaxInvoicesKorigDM.Report.Variables['IP11']:= ipn_prodavec[11];
    TaxInvoicesKorigDM.Report.Variables['IP12']:= ipn_prodavec[12];
  end;

  if ipn_customer = '0' then
  begin
    TaxInvoicesKorigDM.Report.Variables['IC1']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC2']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC3']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC4']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC5']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC6']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC7']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC8']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC9']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC10']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC11']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC12']:= ipn_customer;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['IC1'] := ipn_customer[1];
    TaxInvoicesKorigDM.Report.Variables['IC2'] := ipn_customer[2];
    TaxInvoicesKorigDM.Report.Variables['IC3'] := ipn_customer[3];
    TaxInvoicesKorigDM.Report.Variables['IC4'] := ipn_customer[4];
    TaxInvoicesKorigDM.Report.Variables['IC5'] := ipn_customer[5];
    TaxInvoicesKorigDM.Report.Variables['IC6'] := ipn_customer[6];
    TaxInvoicesKorigDM.Report.Variables['IC7'] := ipn_customer[7];
    TaxInvoicesKorigDM.Report.Variables['IC8'] := ipn_customer[8];
    TaxInvoicesKorigDM.Report.Variables['IC9'] := ipn_customer[9];
    TaxInvoicesKorigDM.Report.Variables['IC10']:= ipn_customer[10];
    TaxInvoicesKorigDM.Report.Variables['IC11']:= ipn_customer[11];
    TaxInvoicesKorigDM.Report.Variables['IC12']:= ipn_customer[12];
  end;

  if not ((TaxInvoicesKorigDM.VidNaklInfoDSet['NUM_SPECIALNOTES'] = null) or (TaxInvoicesKorigDM.VidNaklInfoDSet['NUM_SPECIALNOTES'] = '') ) then
  begin
    num_specialnotes := TaxInvoicesKorigDM.VidNaklInfoDSet['NUM_SPECIALNOTES'];
    TaxInvoicesKorigDM.Report.Variables['NUM1']:= num_specialnotes[1];
    TaxInvoicesKorigDM.Report.Variables['NUM2']:= num_specialnotes[2];
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['NUM1']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['NUM2']:= ''''+'''';
  end;

 ModalResult := mrCancel;
 //TaxInvoicesKorigDM.Report.DesignReport;
 //Close;
 TaxInvoicesKorigDM.Report.ShowReport;

 {DSet1.First;
 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;  }
end;

procedure TTaxInvoicesKorigAddForm.DoPrintKorigTwoEkz;
  const NameReport = '\Reports\TaxInvoices\VidNaklKorigTwoEkz.fr3';
  const NameReportMart2014 = '\Reports\TaxInvoices\VidNaklKorigTwoEkzMart.fr3';
  const NameReportDecember2014 = '\Reports\TaxInvoices\VidNaklKorigTwoEkzDecember2014.fr3';
var
  num_specialnotes :string;
  data_nakl    :string;
  data_termsdelivery :string;
  NotPDV       : string;
  ipn_prodavec : string;
  ipn_customer : string;
  sv_prodavec  : string;
  sv_customer  : string;
  tel_prodavec : string;
  tel_customer : string;
  i            : Integer;
  date_rozr    : string;
  num_nakl     : string;
  num_korig    : string;
  date_opl     : string;
begin
  NotPDV := 'без ПДВ';

  if (TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_VIPISKI']<StrtoDate('01.03.2014')) then
    TaxInvoicesKorigDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport,True)
  else
    if (TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_VIPISKI']>=StrtoDate('01.03.2014'))and
      (TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_VIPISKI']<StrtoDate('01.12.2014')) then
      TaxInvoicesKorigDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportMart2014,True)
    else
      TaxInvoicesKorigDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportDecember2014,True);

  //TaxInvoicesKorigDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport,True);
  data_nakl    := DateToStr(TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_VIPISKI']);
  ipn_prodavec := (TaxInvoicesKorigDM.VidNaklInfoDSet['ipn_seller']);
  ipn_customer := (TaxInvoicesKorigDM.VidNaklInfoDSet['ipn_customer']);
  sv_prodavec  := (TaxInvoicesKorigDM.VidNaklInfoDSet['numreestr_seller']);
  sv_customer  := (TaxInvoicesKorigDM.VidNaklInfoDSet['numreestr_customer']);
  tel_prodavec := TaxInvoicesKorigDM.VidNaklInfoDSet['phone_seller'];
  tel_customer := TaxInvoicesKorigDM.VidNaklInfoDSet['phone_customer'];
  date_rozr    := DateToStr(TaxInvoicesKorigDM.VidNaklInfoDSet['DATE_ROZR']);
  num_nakl     := IntToStr(TaxInvoicesKorigDM.VidNaklInfoDSet['num_nakl']);
  num_korig    := IntToStr(TaxInvoicesKorigDM.VidNaklInfoDSet['NUM_ROZR']);
  date_opl     := DateToStr(TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_OPL_KORRECT']);

  TaxInvoicesKorigDM.Report.Variables.Clear;

  TaxInvoicesKorigDM.Report.Variables['numn1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numn2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numn3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numn4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numn5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numn6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numn7']  := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['numk1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numk2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numk3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numk4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numk5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numk6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numk7']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['numk8']  := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['tp1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp7']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp8']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp9']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tp10'] := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['tc1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc7']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc8']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc9']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['tc10'] := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['sp1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp7']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp8']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp9']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sp10'] := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['sc1']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc2']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc3']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc4']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc5']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc6']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc7']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc8']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc9']  := ''''+'''';
  TaxInvoicesKorigDM.Report.Variables['sc10'] := ''''+'''';

  TaxInvoicesKorigDM.Report.Variables['D1']  := data_nakl[1];
  TaxInvoicesKorigDM.Report.Variables['D2']  := data_nakl[2];
  TaxInvoicesKorigDM.Report.Variables['D3']  := data_nakl[4];
  TaxInvoicesKorigDM.Report.Variables['D4']  := data_nakl[5];
  TaxInvoicesKorigDM.Report.Variables['D5']  := data_nakl[7];
  TaxInvoicesKorigDM.Report.Variables['D6']  := data_nakl[8];
  TaxInvoicesKorigDM.Report.Variables['D7']  := data_nakl[9];
  TaxInvoicesKorigDM.Report.Variables['D8']  := data_nakl[10];

  TaxInvoicesKorigDM.Report.Variables['Dk1']  := date_rozr[1];
  TaxInvoicesKorigDM.Report.Variables['Dk2']  := date_rozr[2];
  TaxInvoicesKorigDM.Report.Variables['Dk3']  := date_rozr[4];
  TaxInvoicesKorigDM.Report.Variables['Dk4']  := date_rozr[5];
  TaxInvoicesKorigDM.Report.Variables['Dk5']  := date_rozr[7];
  TaxInvoicesKorigDM.Report.Variables['Dk6']  := date_rozr[8];
  TaxInvoicesKorigDM.Report.Variables['Dk7']  := date_rozr[9];
  TaxInvoicesKorigDM.Report.Variables['Dk8']  := date_rozr[10];

  TaxInvoicesKorigDM.Report.Variables['Do1']  := date_opl[1];
  TaxInvoicesKorigDM.Report.Variables['Do2']  := date_opl[2];
  TaxInvoicesKorigDM.Report.Variables['Do3']  := date_opl[4];
  TaxInvoicesKorigDM.Report.Variables['Do4']  := date_opl[5];
  TaxInvoicesKorigDM.Report.Variables['Do5']  := date_opl[7];
  TaxInvoicesKorigDM.Report.Variables['Do6']  := date_opl[8];
  TaxInvoicesKorigDM.Report.Variables['Do7']  := date_opl[9];
  TaxInvoicesKorigDM.Report.Variables['Do8']  := date_opl[10];

  i := 7;
  if (num_nakl <> '')then
  begin
   while Length(num_nakl)>0 do
   begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['numn1']  := Copy(num_nakl, Length(num_nakl), 1);
      2:TaxInvoicesKorigDM.Report.Variables['numn2']  := Copy(num_nakl, Length(num_nakl), 1);
      3:TaxInvoicesKorigDM.Report.Variables['numn3']  := Copy(num_nakl, Length(num_nakl), 1);
      4:TaxInvoicesKorigDM.Report.Variables['numn4']  := Copy(num_nakl, Length(num_nakl), 1);
      5:TaxInvoicesKorigDM.Report.Variables['numn5']  := Copy(num_nakl, Length(num_nakl), 1);
      6:TaxInvoicesKorigDM.Report.Variables['numn6']  := Copy(num_nakl, Length(num_nakl), 1);
      7:TaxInvoicesKorigDM.Report.Variables['numn7']  := Copy(num_nakl, Length(num_nakl), 1);
    end;
    Delete(num_nakl, Length(num_nakl), 1);
    i:=i-1;
   end;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['numn1']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numn2']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numn3']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numn4']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numn5']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numn6']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numn7']  := ''''+'''';
  end;

  i := 8;
  if (num_korig <> '')then
  begin
   while Length(num_korig)>0 do
   begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['numk1']  := Copy(num_korig, Length(num_korig), 1);
      2:TaxInvoicesKorigDM.Report.Variables['numk2']  := Copy(num_korig, Length(num_korig), 1);
      3:TaxInvoicesKorigDM.Report.Variables['numk3']  := Copy(num_korig, Length(num_korig), 1);
      4:TaxInvoicesKorigDM.Report.Variables['numk4']  := Copy(num_korig, Length(num_korig), 1);
      5:TaxInvoicesKorigDM.Report.Variables['numk5']  := Copy(num_korig, Length(num_korig), 1);
      6:TaxInvoicesKorigDM.Report.Variables['numk6']  := Copy(num_korig, Length(num_korig), 1);
      7:TaxInvoicesKorigDM.Report.Variables['numk7']  := Copy(num_korig, Length(num_korig), 1);
      8:TaxInvoicesKorigDM.Report.Variables['numk8']  := Copy(num_korig, Length(num_korig), 1);
    end;
    Delete(num_korig, Length(num_korig), 1);
    i:=i-1;
   end;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['numk1']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numk2']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numk3']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numk4']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numk5']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numk6']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numk7']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['numk8']  := ''''+'''';
  end;

  i := 10;
  if (tel_prodavec <> '')then
  begin
   while Length(tel_prodavec)>0 do
   begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['tp1']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      2:TaxInvoicesKorigDM.Report.Variables['tp2']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      3:TaxInvoicesKorigDM.Report.Variables['tp3']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      4:TaxInvoicesKorigDM.Report.Variables['tp4']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      5:TaxInvoicesKorigDM.Report.Variables['tp5']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      6:TaxInvoicesKorigDM.Report.Variables['tp6']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      7:TaxInvoicesKorigDM.Report.Variables['tp7']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      8:TaxInvoicesKorigDM.Report.Variables['tp8']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      9:TaxInvoicesKorigDM.Report.Variables['tp9']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
     10:TaxInvoicesKorigDM.Report.Variables['tp10'] := Copy(tel_prodavec, Length(tel_prodavec), 1);
    end;
    Delete(tel_prodavec, Length(tel_prodavec), 1);
    i:=i-1;
   end;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['tp1']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp2']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp3']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp4']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp5']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp6']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp7']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp8']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp9']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tp10'] := ''''+'''';
  end;


  i := 10;
  if (tel_customer<>'')then
  begin
   while Length(tel_customer)>0 do
   begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['tc1']  := Copy(tel_customer, Length(tel_customer), 1);
      2:TaxInvoicesKorigDM.Report.Variables['tc2']  := Copy(tel_customer, Length(tel_customer), 1);
      3:TaxInvoicesKorigDM.Report.Variables['tc3']  := Copy(tel_customer, Length(tel_customer), 1);
      4:TaxInvoicesKorigDM.Report.Variables['tc4']  := Copy(tel_customer, Length(tel_customer), 1);
      5:TaxInvoicesKorigDM.Report.Variables['tc5']  := Copy(tel_customer, Length(tel_customer), 1);
      6:TaxInvoicesKorigDM.Report.Variables['tc6']  := Copy(tel_customer, Length(tel_customer), 1);
      7:TaxInvoicesKorigDM.Report.Variables['tc7']  := Copy(tel_customer, Length(tel_customer), 1);
      8:TaxInvoicesKorigDM.Report.Variables['tc8']  := Copy(tel_customer, Length(tel_customer), 1);
      9:TaxInvoicesKorigDM.Report.Variables['tc9']  := Copy(tel_customer, Length(tel_customer), 1);
     10:TaxInvoicesKorigDM.Report.Variables['tc10'] := Copy(tel_customer, Length(tel_customer), 1);
    end;
    Delete(tel_customer, Length(tel_customer), 1);
    i:=i-1;
   end;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['tc1']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc2']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc3']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc4']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc5']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc6']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc7']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc8']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc9']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['tc10'] := ''''+'''';
  end;


  i := 10;
  while Length(sv_prodavec)>0 do
  begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['sp1']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      2:TaxInvoicesKorigDM.Report.Variables['sp2']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      3:TaxInvoicesKorigDM.Report.Variables['sp3']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      4:TaxInvoicesKorigDM.Report.Variables['sp4']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      5:TaxInvoicesKorigDM.Report.Variables['sp5']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      6:TaxInvoicesKorigDM.Report.Variables['sp6']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      7:TaxInvoicesKorigDM.Report.Variables['sp7']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      8:TaxInvoicesKorigDM.Report.Variables['sp8']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      9:TaxInvoicesKorigDM.Report.Variables['sp9']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
     10:TaxInvoicesKorigDM.Report.Variables['sp10'] := Copy(sv_prodavec, Length(sv_prodavec), 1);
    end;
   Delete(sv_prodavec, Length(sv_prodavec), 1);
   i:=i-1;
  end;

  i := 10;
  while Length(sv_customer)>0 do
  begin
    case i of
      1:TaxInvoicesKorigDM.Report.Variables['sc1']  := Copy(sv_customer, Length(sv_customer), 1);
      2:TaxInvoicesKorigDM.Report.Variables['sc2']  := Copy(sv_customer, Length(sv_customer), 1);
      3:TaxInvoicesKorigDM.Report.Variables['sc3']  := Copy(sv_customer, Length(sv_customer), 1);
      4:TaxInvoicesKorigDM.Report.Variables['sc4']  := Copy(sv_customer, Length(sv_customer), 1);
      5:TaxInvoicesKorigDM.Report.Variables['sc5']  := Copy(sv_customer, Length(sv_customer), 1);
      6:TaxInvoicesKorigDM.Report.Variables['sc6']  := Copy(sv_customer, Length(sv_customer), 1);
      7:TaxInvoicesKorigDM.Report.Variables['sc7']  := Copy(sv_customer, Length(sv_customer), 1);
      8:TaxInvoicesKorigDM.Report.Variables['sc8']  := Copy(sv_customer, Length(sv_customer), 1);
      9:TaxInvoicesKorigDM.Report.Variables['sc9']  := Copy(sv_customer, Length(sv_customer), 1);
     10:TaxInvoicesKorigDM.Report.Variables['sc10'] := Copy(sv_customer, Length(sv_customer), 1);
    end;
   Delete(sv_customer, Length(sv_customer), 1);
   i:=i-1;
  end;

  if not (TaxInvoicesKorigDM.VidNaklInfoDSet['NUM_SPECIALNOTES_TWO_EKZ'] <> null) then
  begin
    num_specialnotes := TaxInvoicesKorigDM.VidNaklInfoDSet['NUM_SPECIALNOTES_TWO_EKZ'];
    TaxInvoicesKorigDM.Report.Variables['NUM1']:= num_specialnotes[1];
    TaxInvoicesKorigDM.Report.Variables['NUM2']:= num_specialnotes[2];
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['NUM1']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['NUM2']:= ''''+'''';
  end;

  if (not (TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'] = null) and (TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'] <> '01.01.1900')) then
  begin
    data_termsdelivery := TaxInvoicesKorigDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'];
    TaxInvoicesKorigDM.Report.Variables['TD1']  := data_termsdelivery[1];
    TaxInvoicesKorigDM.Report.Variables['TD2']  := data_termsdelivery[2];
    TaxInvoicesKorigDM.Report.Variables['TD3']  := data_termsdelivery[4];
    TaxInvoicesKorigDM.Report.Variables['TD4']  := data_termsdelivery[5];
    TaxInvoicesKorigDM.Report.Variables['TD5']  := data_termsdelivery[7];
    TaxInvoicesKorigDM.Report.Variables['TD6']  := data_termsdelivery[8];
    TaxInvoicesKorigDM.Report.Variables['TD7']  := data_termsdelivery[9];
    TaxInvoicesKorigDM.Report.Variables['TD8']  := data_termsdelivery[10];
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['TD1']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD2']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD3']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD4']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD5']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD6']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD7']  := ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['TD8']  := ''''+'''';
  end;

  if ipn_prodavec = '0' then
  begin
    TaxInvoicesKorigDM.Report.Variables['IP1']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP2']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP3']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP4']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP5']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP6']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP7']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP8']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP9']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP10']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP11']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IP12']:= ipn_prodavec;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['IP1'] := ipn_prodavec[1];
    TaxInvoicesKorigDM.Report.Variables['IP2'] := ipn_prodavec[2];
    TaxInvoicesKorigDM.Report.Variables['IP3'] := ipn_prodavec[3];
    TaxInvoicesKorigDM.Report.Variables['IP4'] := ipn_prodavec[4];
    TaxInvoicesKorigDM.Report.Variables['IP5'] := ipn_prodavec[5];
    TaxInvoicesKorigDM.Report.Variables['IP6'] := ipn_prodavec[6];
    TaxInvoicesKorigDM.Report.Variables['IP7'] := ipn_prodavec[7];
    TaxInvoicesKorigDM.Report.Variables['IP8'] := ipn_prodavec[8];
    TaxInvoicesKorigDM.Report.Variables['IP9'] := ipn_prodavec[9];
    TaxInvoicesKorigDM.Report.Variables['IP10']:= ipn_prodavec[10];
    TaxInvoicesKorigDM.Report.Variables['IP11']:= ipn_prodavec[11];
    TaxInvoicesKorigDM.Report.Variables['IP12']:= ipn_prodavec[12];
  end;

  if ipn_customer = '0' then
  begin
    TaxInvoicesKorigDM.Report.Variables['IC1']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC2']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC3']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC4']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC5']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC6']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC7']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC8']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC9']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC10']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC11']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['IC12']:= ipn_customer;
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['IC1'] := ipn_customer[1];
    TaxInvoicesKorigDM.Report.Variables['IC2'] := ipn_customer[2];
    TaxInvoicesKorigDM.Report.Variables['IC3'] := ipn_customer[3];
    TaxInvoicesKorigDM.Report.Variables['IC4'] := ipn_customer[4];
    TaxInvoicesKorigDM.Report.Variables['IC5'] := ipn_customer[5];
    TaxInvoicesKorigDM.Report.Variables['IC6'] := ipn_customer[6];
    TaxInvoicesKorigDM.Report.Variables['IC7'] := ipn_customer[7];
    TaxInvoicesKorigDM.Report.Variables['IC8'] := ipn_customer[8];
    TaxInvoicesKorigDM.Report.Variables['IC9'] := ipn_customer[9];
    TaxInvoicesKorigDM.Report.Variables['IC10']:= ipn_customer[10];
    TaxInvoicesKorigDM.Report.Variables['IC11']:= ipn_customer[11];
    TaxInvoicesKorigDM.Report.Variables['IC12']:= ipn_customer[12];
  end;

  if not ((TaxInvoicesKorigDM.VidNaklInfoDSet['NUM_SPECIALNOTES_TWO_EKZ'] = null) or (TaxInvoicesKorigDM.VidNaklInfoDSet['NUM_SPECIALNOTES_TWO_EKZ'] = '') ) then
  begin
    num_specialnotes := TaxInvoicesKorigDM.VidNaklInfoDSet['NUM_SPECIALNOTES_TWO_EKZ'];
    TaxInvoicesKorigDM.Report.Variables['NUM1']:= num_specialnotes[1];
    TaxInvoicesKorigDM.Report.Variables['NUM2']:= num_specialnotes[2];
  end
  else
  begin
    TaxInvoicesKorigDM.Report.Variables['NUM1']:= ''''+'''';
    TaxInvoicesKorigDM.Report.Variables['NUM2']:= ''''+'''';
  end;

 ModalResult := mrCancel;
 //TaxInvoicesKorigDM.Report.DesignReport;
 //Close;
 TaxInvoicesKorigDM.Report.ShowReport;

 {DSet1.First;
 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;  }
end;

procedure TTaxInvoicesKorigAddForm.OznakaCheckBoxClick(Sender: TObject);
begin
  OznakaTextEdit.Enabled := OznakaCheckBox.Checked;
end;

procedure TTaxInvoicesKorigAddForm.DataPodpisCheckBoxClick(
  Sender: TObject);
begin
  DataTermsdelDateEdit.Enabled := PostavkaCheckBox.Checked;
end;

end.
