unit TITaxInvoicesEdit_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,IBase,TiCommonProc,TITaxinvoicesEdit_DM, cxButtonEdit,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxBar,
  TiCommonStyles, cxGridBandedTableView, dxBarExtItems, dxStatusBar,
  TITaxInvoicesEdit_AddInNakl,
  TICommonLoader,dogLoaderUnit, LoaderUnit, AArray,cxLookAndFeelPainters, cxButtons, ComCtrls,
  TiCommonTypes,TiMessages, Registry,
  cxGridDBBandedTableView,
  TITaxInvoicesEdit_AddTara, cxLabel, cxCheckBox, cxMemo, cxCurrencyEdit,
  Buttons, TITaxInvoicesEdit_Budget, kernel, TITaxInvoicesEdit_EditTax, TICommonDates;

type TTaxInvocesUser = record
 id_user:Integer;
 name_user:string;
 name_computer:string;
 ip_computer:string;
end;

type
  TTaxInvoicesEditAddForm = class(TForm)
    Panel1: TPanel;
    PodNaklLabel: TLabel;
    DataVipLabel: TLabel;
    PodNumLabel: TLabel;
    OsobaProdavecLabel: TLabel;
    OsobaPokupLabel: TLabel;
    IPNProdavecLabel: TLabel;
    IPNPokupLabel: TLabel;
    PlaceProdavecLabel: TLabel;
    TelProdavecLabel: TLabel;
    NumReestrProdavecLabel: TLabel;
    NumReestrPokupLabel: TLabel;
    PodNumTextEdit: TcxTextEdit;
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
    TransportCostsStatusBar: TdxStatusBar;
    MortgageTaraStatusBar: TdxStatusBar;
    dxStatusBar4: TdxStatusBar;
    dxStatusBar5: TdxStatusBar;
    dxStatusBar6: TdxStatusBar;
    TaxStatusBar: TdxStatusBar;
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
    NaklDeliveryGridDBBandedTableView_DATE_SHIPMENT: TcxGridDBBandedColumn;
    NaklDeliveryGridDBBandedTableView_NAME_MEASURES: TcxGridDBBandedColumn;
    NaklDeliveryGridDBBandedTableView_NAME_RANGE_OF_DELIVERY: TcxGridDBBandedColumn;
    NaklDeliveryGridDBBandedTableView_KOL_VO_DELIVERY_GOODS: TcxGridDBBandedColumn;
    NaklDeliveryGridDBBandedTableView_PRICE_DELIVERY_GOODS: TcxGridDBBandedColumn;
    NaklDeliveryGridDBBandedTableView_VALUE_DELIVERY_20: TcxGridDBBandedColumn;
    NaklDeliveryGridDBBandedTableView_VALUE_DELIVERY_CUSTOMS: TcxGridDBBandedColumn;
    NaklDeliveryGridDBBandedTableView_VALUE_DELIVERY_EXPORT: TcxGridDBBandedColumn;
    NaklDeliveryGridDBBandedTableView_VALUE_DELIVERY_VAT_EXEMPTION: TcxGridDBBandedColumn;
    NaklDeliveryGridDBBandedTableView_SUMMA_ALL: TcxGridDBBandedColumn;
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
    NumOrderTextEdit: TcxTextEdit;
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
    Label1: TLabel;
    TypeDocumentButtonEdit: TcxButtonEdit;
    NotPDVCheckBox: TcxCheckBox;
    BudgetButton: TdxBarLargeButton;
    NoteButtonEdit: TcxButtonEdit;
    NoteCheckBox: TcxCheckBox;
    EditTaxButton: TdxBarLargeButton;
    OznakaCheckBox: TcxCheckBox;
    OznakaTextEdit: TcxTextEdit;
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
    procedure OznakaCheckBoxClick(Sender: TObject);
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
    TaxInvoicesEditDM      : TTaxInvoicesEditDM;
    procedure DoPrint; //старая налоговая
    procedure DoPrintDecember;  // новая накладная первый экземпляр
    procedure DoPrintDecemberTwoEkz;  // новая накладная второй экземпляр
    procedure replaceAbreviatures(short_name:string);
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;id_Vid_Nakl:Integer;id_Vid_Nakl_Doc:Integer;id_Reestr:Integer);reintroduce;
    property Res:TTITaxInvoicesInfo read PRes;
    property Parameter:TTITaxInvoicesInfo read PParameter;
  end;



var
  TaxInvoicesEditAddForm: TTaxInvoicesEditAddForm;

implementation

uses  FIBQuery,LoadDogManedger;

{$R *.dfm}
constructor TTaxInvoicesEditAddForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE; id_Vid_Nakl:Integer;id_Vid_Nakl_Doc:Integer;id_Reestr:Integer);
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
  TaxInvoicesEditDM     := TTaxInvoicesEditDM.Create(AOwner,Db_Handle);
//******************************************************************************
  pLanguageIndex                   := LanguageIndex;
  PodNaklLabel.Caption             := GetConst('PodNakl',tcLabel);
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
  TaxInvoicesEditDM.UserDSet.Close;
  TaxInvoicesEditDM.UserDSet.SelectSQL.Text := 'select * from TI_USER_INFO';
  TaxInvoicesEditDM.UserDSet.Open;
  TaxInvoicesUser.id_user       := TaxInvoicesEditDM.UserDSet['ID_USER'];
  TaxInvoicesUser.name_user     := TaxInvoicesEditDM.UserDSet['USER_FIO'];
  TaxInvoicesUser.name_computer := TaxInvoicesEditDM.UserDSet['HOST_NAME'];
  TaxInvoicesUser.ip_computer   := TaxInvoicesEditDM.UserDSet['IP_ADRESS'];
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
    TaxInvoicesEditDM.Customer_DonnuDSet.Close;
    TaxInvoicesEditDM.Customer_DonnuDSet.SelectSQL.Text          := 'select * from TI_CUSTOMER_INFO(:id)';
    TaxInvoicesEditDM.Customer_DonnuDSet.ParamByName('id').Value := null;
    TaxInvoicesEditDM.Customer_DonnuDSet.Open;

//********************************************************************************
    TaxInvoicesEditDM.DSet.Close;
    TaxInvoicesEditDM.DSet.SelectSQL.Text := 'select * from TI_SETTING';
    TaxInvoicesEditDM.DSet.Open;

 if (id_vid_nakl_doc_Ins = -1) then    //вставка документа
  begin
    ReadReg;           //чтение из реестра (дополнительные справочники)
    Caption := GetConst('TaxInvEditAddDoc',tcForm);

    TaxInvoicesEditDM.NaklDeliveryDSet.Close;
    TaxInvoicesEditDM.NaklDeliveryDSet.SelectSQL.Text := 'select * from TI_SP_VID_NAKL_DOC where ID_VID_NAKL_DOC = -1';
    TaxInvoicesEditDM.NaklDeliveryDSet.Open;

    //***********автоматически ставить номер**************************************//
    TaxInvoicesEditDM.WriteTransaction.StartTransaction;
    TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                 := 'TI_LAST_NOMER_NAKL_SEARCH';
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_REESTR').Value := id_Reestr_Ins;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('TYPE_NAKL').Value := 1; //выданные накладные
    TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
    TaxInvoicesEditDM.WriteTransaction.Commit;
    NumOrderTextEdit.Text := TaxInvoicesEditDM.pFIBStoredProc.ParamByName('LAST_NUM_ORDER').AsString;

    if (TaxInvoicesEditDM.DSet['IS_SAME_NUM_NAKL'] = 1)then
    begin
      PodNumTextEdit.Text   := NumOrderTextEdit.Text;
    end
    else
    begin
      PodNumTextEdit.Text   := '';
    end;

    //****************************************************************************
    EdrpTextEdit.Text              := '';
    FullNameMemo.Text              := '';
    IPNPokupTextEdit.Text          := '';
    PlacePokupMemo.Text            := '';
    TelPokupTextEdit.Text          := '';
    NumReestrPokupTextEdit.Text    := '';
    OsobaPokupButtonEdit.Text      := '';
    IPNPokupTextEdit.Text          := '';
    //PodNumTextEdit.Text              := '';
    NumTermsDelTextEdit.Text       := '';
    NoteButtonEdit.Text            := '';
    OznakaTextEdit.Text            := '';
    NoteCheckBox.Checked           := False;
    NoteButtonEdit.Enabled         := False;
    DataVipDateEdit.Date           := Now;
    PodZobButtonEdit.Enabled       := False;
    PodKreditButtonEdit.Enabled    := False;
    SpecialNotesButtonEdit.Enabled := False;
    OznakaTextEdit.Enabled         := False;
    PodZobCheckBox.Checked         := False;
    PodKreditCheckBox.Checked      := False;
    OsoblPrimCheckBox.Checked      := False;
    NotPDVCheckBox.Checked         := False;
    TelProdavecTextEdit.Text       := TaxInvoicesEditDM.Customer_DonnuDSet['phone_customer'];
    OznakaCheckBox.Checked         := False;

    ClearStatusBars;                    // чистим статус-бары
    EnableButtons(id_vid_nakl_doc_Ins); // делаем кнопки видимыми (невидимыми)

    PodZobButtonEdit.Properties.onButtonClick       := PodZobButtonEditPropertiesButtonClick;
    PodKreditButtonEdit.Properties.onButtonClick    := PodKreditButtonEditPropertiesButtonClick;
    SpecialNotesButtonEdit.Properties.onButtonClick := SpecialNotesButtonEditPropertiesButtonClick;
    PostavkaButtonEdit.Properties.onButtonClick     := PostavkaButtonEditPropertiesButtonClick;
    OsobaPokupButtonEdit.Properties.onButtonClick   := OsobaPokupButtonEditPropertiesButtonClick;
    RozraxunokButtonEdit.Properties.onButtonClick   := RozraxunokButtonEditPropertiesButtonClick;
    TypeDocumentButtonEdit.Properties.onButtonClick := TypeDocumentButtonEditPropertiesButtonClick;
    NoteButtonEdit.Properties.onButtonClick         := NoteButtonEditPropertiesButtonClick;

    PodNumTextEdit.Properties.ReadOnly       := False;
    NumOrderTextEdit.Properties.ReadOnly     := False;
    NumTermsDelTextEdit.Properties.ReadOnly  := False;
    PodNumTextEdit.Properties.ReadOnly       := False;
    DataVipDateEdit.Properties.ReadOnly      := False;
    DataTermsdelDateEdit.Properties.ReadOnly := False;
    IPNPokupTextEdit.Properties.ReadOnly     := False;
    //NoteTextEdit.Properties.ReadOnly         := False;
    NotPDVCheckBox.Properties.ReadOnly       := False;
    OznakaTextEdit.Properties.ReadOnly       := False;
    OznakaCheckBox.Properties.ReadOnly       := False;

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
    TypeDocumentButtonEdit.Style.Color := clWindow;
    OznakaTextEdit.Style.Color         := clWindow;

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

    DataVipDateEdit.Date        := TaxInvoicesEditDM.VidNaklInfoDSet['DATA_VIPISKI'];
    EdrpTextEdit.Text           := TaxInvoicesEditDM.VidNaklInfoDSet['EDRPOU_CUSTOMER'];
    IPNPokupTextEdit.Text       := TaxInvoicesEditDM.VidNaklInfoDSet['IPN_CUSTOMER'];
    PlacePokupMemo.Text         := TaxInvoicesEditDM.VidNaklInfoDSet['PLACE_CUSTOMER'];
    TelPokupTextEdit.Text       := TaxInvoicesEditDM.VidNaklInfoDSet['phone_customer'];;
    NumReestrPokupTextEdit.Text := TaxInvoicesEditDM.VidNaklInfoDSet['NUMREESTR_CUSTOMER'];
    OsobaPokupButtonEdit.Text   := TaxInvoicesEditDM.VidNaklInfoDSet['NAME_CUSTOMER'];
    PostavkaButtonEdit.Text     := TaxInvoicesEditDM.VidNaklInfoDSet['NAME_TERMSDELIVERY'];
    RozraxunokButtonEdit.Text   := TaxInvoicesEditDM.VidNaklInfoDSet['NAME_FORMCALCULATIONS'];
    IPNPokupTextEdit.Text       := TaxInvoicesEditDM.VidNaklInfoDSet['IPN_CUSTOMER'];
    PodNumTextEdit.Text         := TaxInvoicesEditDM.VidNaklInfoDSet['NUM_NAKL'];
    NumOrderTextEdit.Text       := TaxInvoicesEditDM.VidNaklInfoDSet['num_order'];
    NumTermsDelTextEdit.Text    := TaxInvoicesEditDM.VidNaklInfoDSet['num_termsdelivery'];
    TypeDocumentButtonEdit.Text := TaxInvoicesEditDM.VidNaklInfoDSet['name_type_document'];
    TelProdavecTextEdit.Text    := TaxInvoicesEditDM.VidNaklInfoDSet['phone_seller'];
    //NoteTextEdit.Text           := TaxInvoicesEditDM.VidNaklInfoDSet['note'];

   { if (TaxInvoicesEditDM.VidNaklInfoDSet['note']<>null) then
    begin
      NoteTextEdit.Text := TaxInvoicesEditDM.VidNaklInfoDSet['note'];
    end
    else
    begin
      NoteTextEdit.Text := '';
    end;   }

    if ((TaxInvoicesEditDM.VidNaklInfoDSet['id_note']<>null) and (TaxInvoicesEditDM.VidNaklInfoDSet['id_note']<>0))   then
    begin
      NoteButtonEdit.Text := TaxInvoicesEditDM.VidNaklInfoDSet['note'];
      NoteButtonEdit.Enabled := True;
      NoteCheckBox.Checked := True;
      PParameter.id_note := TaxInvoicesEditDM.VidNaklInfoDSet['id_note'];
      PParameter.article_note := TaxInvoicesEditDM.VidNaklInfoDSet['note'];
    end
    else
    begin
      NoteButtonEdit.Text    := '';
      NoteButtonEdit.Enabled := False;
      NoteCheckBox.Checked   := False;
    end;

    if (TaxInvoicesEditDM.VidNaklInfoDSet['full_name_customer']<>null) then
    begin
      FullNameMemo.Text         := TaxInvoicesEditDM.VidNaklInfoDSet['full_name_customer'];
      PParameter.Full_name_customer := TaxInvoicesEditDM.VidNaklInfoDSet['full_name_customer'];
    end
    else
    begin
      FullNameMemo.Text             := '';
      FullNameMemo.ReadOnly         := False;
      FullNameCheckBox.Checked      := True;
      SaveFullNameButton.Visible    := True;
      PParameter.Full_name_customer := '';
    end;

    if (TaxInvoicesEditDM.VidNaklInfoDSet['NAME_TAX_LIABILITIES']<>'')then
     begin
      PodZobCheckBox.Checked   := True;
      PodZobButtonEdit.Enabled := True;
      PodZobButtonEdit.Text    := TaxInvoicesEditDM.VidNaklInfoDSet['NAME_TAX_LIABILITIES'];
     end
    else
     begin
      PodZobCheckBox.Checked   := False;
      PodZobButtonEdit.Enabled := False;
      PodZobButtonEdit.Text    := '';
     end;

    if (TaxInvoicesEditDM.VidNaklInfoDSet['NUM_SPECIALNOTES']<>'')then
     begin
      OsoblPrimCheckBox.Checked   := True;
      SpecialNotesButtonEdit.Enabled := True;
      SpecialNotesButtonEdit.Text    := TaxInvoicesEditDM.VidNaklInfoDSet['NUM_SPECIALNOTES'];
     end
    else
     begin
      OsoblPrimCheckBox.Checked   := False;
      SpecialNotesButtonEdit.Enabled := False;
      SpecialNotesButtonEdit.Text    := '';
     end;

    if (TaxInvoicesEditDM.VidNaklInfoDSet['OZNAKA_NAKL']<>'')then
     begin
      OznakaCheckBox.Checked := True;
      OznakaTextEdit.Enabled := True;
      OznakaTextEdit.Text    := TaxInvoicesEditDM.VidNaklInfoDSet['OZNAKA_NAKL'];
     end
    else
     begin
      OznakaCheckBox.Checked := False;
      OznakaTextEdit.Enabled := False;
      OznakaTextEdit.Text    := '';
     end;

    if (TaxInvoicesEditDM.VidNaklInfoDSet['name_termsdelivery']<>'')then
     begin
      PostavkaCheckBox.Checked     := True;
      DataTermsdelDateEdit.Enabled := True;
      NumTermsDelTextEdit.Enabled  := True;
      PostavkaButtonEdit.Enabled   := True;
      PostavkaButtonEdit.Text      := TaxInvoicesEditDM.VidNaklInfoDSet['name_termsdelivery'];
      NumTermsDelTextEdit.Text := TaxInvoicesEditDM.VidNaklInfoDSet['num_termsdelivery'];

      if (TaxInvoicesEditDM.VidNaklInfoDSet['data_termsdelivery'] = StrToDate('01.01.1900')) then
      begin
        DataTermsdelDateEdit.Text := '';
      end
      else
      begin
       DataTermsdelDateEdit.Date := TaxInvoicesEditDM.VidNaklInfoDSet['data_termsdelivery'];
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

    if (TaxInvoicesEditDM.VidNaklInfoDSet['name_formcalculations']<>'')then
     begin
      RozraxunokCheckBox.Checked   := True;
      RozraxunokButtonEdit.Enabled := True;
      RozraxunokButtonEdit.Text    := TaxInvoicesEditDM.VidNaklInfoDSet['name_formcalculations'];
     end
    else
     begin
      RozraxunokCheckBox.Checked   := False;
      RozraxunokButtonEdit.Enabled := False;
      RozraxunokButtonEdit.Text    := '';
     end;

    if (TaxInvoicesEditDM.VidNaklInfoDSet['NAME_TAXKREDIT']<>'')then
     begin
      PodKreditCheckBox.Checked   := True;
      PodKreditButtonEdit.Enabled := True;
      PodKreditButtonEdit.Text    := TaxInvoicesEditDM.VidNaklInfoDSet['NAME_TAXKREDIT'];
     end
    else
     begin
      PodKreditCheckBox.Checked   := False;
      PodKreditButtonEdit.Enabled := False;
      PodKreditButtonEdit.Text    := '';
     end;

    if (TaxInvoicesEditDM.VidNaklInfoDSet['is_issued_buyer'] = 1)then
      is_issued_buyer_CheckBox.Checked := True
    else
      is_issued_buyer_CheckBox.Checked := False;

    if (TaxInvoicesEditDM.VidNaklInfoDSet['is_erpn'] = 1)then
      is_erpn_CheckBox.Checked := True
    else
      is_erpn_CheckBox.Checked := False;

    if (TaxInvoicesEditDM.VidNaklInfoDSet['is_copy'] = 1)then
      is_copy_CheckBox.Checked := True
    else
      is_copy_CheckBox.Checked := False;

    if (TaxInvoicesEditDM.VidNaklInfoDSet['IS_NOT_PDV'] = 1)then
      NotPDVCheckBox.Checked := True
    else
      NotPDVCheckBox.Checked := False;

    // отображение проводок
    for i := 0 to TaxInvoicesEditDM.RxMemoryData_smet.RecordCount - 1 do
    TaxInvoicesEditDM.RxMemoryData_smet.Delete;

    TaxInvoicesEditDM.Smeta_Vid_N_DSet.Close;
    TaxInvoicesEditDM.Smeta_Vid_N_DSet.SelectSQL.Text := 'select * from TI_BUDGET_NDS_SEL where id_nakl = :id and is_vid = 1';
    TaxInvoicesEditDM.Smeta_Vid_N_DSet.ParamByName('id').Value := TaxInvoicesEditDM.VidNaklInfoDSet['id_vid_nakl'];
    TaxInvoicesEditDM.Smeta_Vid_N_DSet.Open;
    TaxInvoicesEditDM.Smeta_Vid_N_DSet.FetchAll;
    TaxInvoicesEditDM.Smeta_Vid_N_DSet.First;
    sum_All_Nds     := 0;
    sum_All_Not_NDS := 0;
    for i := 0 to TaxInvoicesEditDM.Smeta_Vid_N_DSet.RecordCount-1 do
    begin
      TaxInvoicesEditDM.RxMemoryData_smet.Open;
      TaxInvoicesEditDM.RxMemoryData_smet.Insert;
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_smet').Value   := TaxInvoicesEditDM.Smeta_Vid_N_DSet['id_smet'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_razd').Value   := TaxInvoicesEditDM.Smeta_Vid_N_DSet['id_razd'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_stat').Value   := TaxInvoicesEditDM.Smeta_Vid_N_DSet['id_stat'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').Value  := TaxInvoicesEditDM.Smeta_Vid_N_DSet['sum_smet'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_smet').Value := TaxInvoicesEditDM.Smeta_Vid_N_DSet['name_smet'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_razd').Value := TaxInvoicesEditDM.Smeta_Vid_N_DSet['name_razd'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_stat').Value := TaxInvoicesEditDM.Smeta_Vid_N_DSet['name_stat'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('kod_smety').Value := TaxInvoicesEditDM.Smeta_Vid_N_DSet['kod_smety'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_razd').Value    := TaxInvoicesEditDM.Smeta_Vid_N_DSet['n_razd'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_stat').Value    := TaxInvoicesEditDM.Smeta_Vid_N_DSet['n_stat'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_kekv').Value   := TaxInvoicesEditDM.Smeta_Vid_N_DSet['id_kekv'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('kod_kekv').Value  := TaxInvoicesEditDM.Smeta_Vid_N_DSet['kod_kekv'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_kekv').Value := TaxInvoicesEditDM.Smeta_Vid_N_DSet['name_kekv'];
      TaxInvoicesEditDM.RxMemoryData_smet.Post;
      TaxInvoicesEditDM.Smeta_Vid_N_DSet.Next;

      if TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300' then
        sum_All_Nds     := sum_All_Nds + TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').Value
      else
        sum_All_Not_NDS := sum_All_Not_NDS + TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').Value;
    end;
          if TaxInvoicesEditDM.VidNaklInfoDSet['pk_id']= null
           then pk_id := 0
           else pk_id := StrToInt64(TaxInvoicesEditDM.VidNaklInfoDSet.FieldByName('pk_id').AsString);

          if ((pk_id = 0) or (pk_id = -1)) then
             provodka := False
          else
            provodka := True;

    PParameter.id_TaxLiabilities     := TaxInvoicesEditDM.VidNaklInfoDSet['id_tax_liabilities'];
    PParameter.Name_TaxLiabilities   := TaxInvoicesEditDM.VidNaklInfoDSet['name_tax_liabilities'];
    PParameter.Id_TaxKredit          := TaxInvoicesEditDM.VidNaklInfoDSet['id_taxkredit'];
    PParameter.Name_TaxKredit        := TaxInvoicesEditDM.VidNaklInfoDSet['NAME_TAXKREDIT'];
    PParameter.id_SpecialNotes       := TaxInvoicesEditDM.VidNaklInfoDSet['id_specialnotes'];
    PParameter.Name_SpecialNotes     := TaxInvoicesEditDM.VidNaklInfoDSet['name_specialnotes'];
    PParameter.id_customer           := TaxInvoicesEditDM.VidNaklInfoDSet['id_customer'];
    PParameter.Name_customer         := TaxInvoicesEditDM.VidNaklInfoDSet['name_customer'];
    PParameter.ipn_customer          := TaxInvoicesEditDM.VidNaklInfoDSet['ipn_customer'];
    PParameter.place_customer        := TaxInvoicesEditDM.VidNaklInfoDSet['place_customer'];
    PParameter.phone_customer        := TaxInvoicesEditDM.VidNaklInfoDSet['phone_customer'];
    PParameter.NumReestr_customer    := TaxInvoicesEditDM.VidNaklInfoDSet['numreestr_customer'];
    PParameter.EDRPOU_Customer       := TaxInvoicesEditDM.VidNaklInfoDSet['edrpou_customer'];
    PParameter.id_TermsDelivery      := TaxInvoicesEditDM.VidNaklInfoDSet['id_termsdelivery'];
    PParameter.Name_TermsDelivery    := TaxInvoicesEditDM.VidNaklInfoDSet['name_termsdelivery'];
    PParameter.id_FormCalculations   := TaxInvoicesEditDM.VidNaklInfoDSet['id_formcalculations'];
    PParameter.Name_FormCalculations := TaxInvoicesEditDM.VidNaklInfoDSet['name_formcalculations'];
    PParameter.ID_TYPE_DOCUMENT      := TaxInvoicesEditDM.VidNaklInfoDSet['id_type_document'];
    PParameter.NAME_TYPE_DOCUMENT    := TaxInvoicesEditDM.VidNaklInfoDSet['name_type_document'];
    PParameter.Num_SpecialNotes      := TaxInvoicesEditDM.VidNaklInfoDSet['Num_SpecialNotes'];


    if (TaxInvoicesEditDM.VidNaklInfoDSet['full_name_customer']<>null) then
      PParameter.Full_name_customer  := TaxInvoicesEditDM.VidNaklInfoDSet['full_name_customer']
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
    NotPDVCheckBox.Properties.ReadOnly       := False;
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
    TypeDocumentButtonEdit.Style.Color := clWindow;
    OznakaTextEdit.Style.Color         := clWindow;

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
    OznakaTextEdit.Properties.ReadOnly           := false;
  end;
//******************************************************************************
  pStylesDM                        := TStyleDM.Create(Self);
  NaklDeliveryGridDBBandedTableView.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
  NaklDeliveryGridDBBandedTableView.DataController.DataSource := TaxInvoicesEditDM.NaklDeliveryDSource;
  //******************************************************************************
  TaxInvoicesEditDM.Pocupatel_DataSet.Close;
  TaxInvoicesEditDM.Pocupatel_DataSet.SelectSQL.Text := 'select * from Z_SETUP_S';
  TaxInvoicesEditDM.Pocupatel_DataSet.Open;
  //OsobaProdavecTextEdit.Text := TaxInvoicesEditDM.Pocupatel_DataSet['FIRM_NAME_FULL'];
  //TelProdavecTextEdit.Text   := TaxInvoicesEditDM.Pocupatel_DataSet['TELEFON'];
  //PlaceProdavecTextEdit.Text := TaxInvoicesEditDM.Pocupatel_DataSet['TOWN']+', '+TaxInvoicesEditDM.Pocupatel_DataSet['ADDRESS'];
  //PlaceProdavecTextEdit.Text := 'вул.Університетська, б.24, м.Донецьк, обл.Донецька, 83001';

  id_university                  := TaxInvoicesEditDM.Customer_DonnuDSet['ID_UNIVERSITY'];
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

  NumReestrProdavecTextEdit.Text := TaxInvoicesEditDM.Customer_DonnuDSet['nns'];
  IPNProdavecTextEdit.Text       := TaxInvoicesEditDM.Customer_DonnuDSet['nalog_nom'];
  id_Seller                  := TaxInvoicesEditDM.Customer_DonnuDSet['ORGANIZATION'];
  PlaceProdavecTextEdit.Text := TaxInvoicesEditDM.Customer_DonnuDSet['full_adress_customer'];
  OsobaProdavecTextEdit.Text := TaxInvoicesEditDM.Customer_DonnuDSet['full_name_customer'];
  //TelProdavecTextEdit.Text   := TaxInvoicesEditDM.Customer_DonnuDSet['phone_customer'];
end;

procedure TTaxInvoicesEditAddForm.AddButtonClick(Sender: TObject);
var
  ViewForm             : TTaxInvoicesEditAddInNaklForm;
  id_vid_nakl_delivery : Integer;
  AddParametr          : TTITaxInvoicesAddVidNaklDelivery;
begin
  AddParametr.id_range_of_delivery   := 0;
  AddParametr.Name_range_of_delivery := '';
  AddParametr.Id_Measures   := 0;
  AddParametr.Name_Measures := '';

  ViewForm := TTaxInvoicesEditAddInNaklForm.Create(Self,TaxInvoicesEditDM.DB.Handle,AddParametr);
  ViewForm.MeasuresButtonEdit.Text           := 'послуга';
  ViewForm.DateShipmentLabel.Visible         := True;
  ViewForm.DateShipmentEdit.Visible          := True;
  ViewForm.RangeOfDeliveryLabel.Visible      := True;
  ViewForm.RangeOfDeliveryButtonEdit.Visible := True;
  ViewForm.DataGroupBox.Visible              := True;
  ViewForm.MonthList.Items.Text              := GetMonthList2;
  ViewForm.Kod_Setup                         := CurrentKodSetup(PDb_Handle);
  ViewForm.YearSpinEdit.Value                := YearMonthFromKodSetup(ViewForm.Kod_Setup);
  ViewForm.MonthList.ItemIndex               := YearMonthFromKodSetup(ViewForm.Kod_Setup-1,False);
  ViewForm.ZaCheckBox.Checked                := False;
  ViewForm.MonthList.Enabled                 := False;
  ViewForm.YearSpinEdit.Enabled              := False;

  ViewForm.DateShipmentEdit.Text                 := '';
  ViewForm.KolVoTextEdit.Text                    := '';
  ViewForm.PriceCurrencyEdit.Text                := '';
  ViewForm.KodTovarButtonEdit.Text               := '';
  ViewForm.KodTovarCheckBox.Checked              := False;
  ViewForm.KodTovarButtonEdit.Enabled            := False;
  ViewForm.ValueDeliveryExportCurrencyEdit.EditValue        := 0;
  ViewForm.ValueDelivery20CurrencyEdit.EditValue            := 0;
  ViewForm.ValueDeliveryCustomsCurrencyEdit.EditValue       := 0;
  ViewForm.ValueDeliveryVATexemptionsCurrencyEdit.EditValue := 0;
  ViewForm.ReadReg;
  ViewForm.ShowModal;
  if (ViewForm.ModalResult = mrok) then
  begin
    TaxInvoicesEditDM.WriteTransaction.StartTransaction;
    TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                              := 'TI_SP_VID_NAKL_DELIVERY_INS';
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('date_shipment').Value          := ViewForm.DateShipmentEdit.Date;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_range_of_delivery').Value   := ViewForm.Parameter.id_range_of_delivery;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('name_range_of_delivery').Value := ViewForm.Parameter.Name_range_of_delivery;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_measures').Value            := ViewForm.Parameter.Id_Measures;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('name_measures').Value          := ViewForm.MeasuresButtonEdit.Text;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('kol_vo_delivery_goods').Value  := ViewForm.KolVoTextEdit.Text;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('price_delivery_goods').Value   := ViewForm.PriceCurrencyEdit.Value;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('value_delivery_20').Value      := ViewForm.ValueDelivery20CurrencyEdit.Value;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('value_delivery_export').Value  := ViewForm.ValueDeliveryExportCurrencyEdit.Value;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('value_delivery_customs').Value := ViewForm.ValueDeliveryCustomsCurrencyEdit.Value;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('value_delivery_vat_exemption').Value := ViewForm.ValueDeliveryVATexemptionsCurrencyEdit.Value;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_vid_nakl_doc').Value        := id_vid_nakl_doc_Ins;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('section').Value                := '1';

    if (ViewForm.KodTovarCheckBox.Checked = true) then
    begin
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_kod_tovar').Value   := ViewForm.Parameter.id_kod_tovar;
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('num_kod_tovar').Value  := ViewForm.Parameter.Num_Kod_tovar;
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('name_kod_tovar').Value := ViewForm.Parameter.Name_Kod_tovar;
    end
    else
    begin
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_kod_tovar').Value   := 0;
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('num_kod_tovar').Value  := '';
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('name_kod_tovar').Value := '';
    end;

    if (ViewForm.ZaCheckBox.Checked = true) then
    begin
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('MONTH_RANGE_OF_DELIVERY').Value := ViewForm.MonthList.Text;
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('YEAR_RANGE_OF_DELIVERY').Value  := ViewForm.YearSpinEdit.Text;
    end
    else
    begin
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('MONTH_RANGE_OF_DELIVERY').Value := '';
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('YEAR_RANGE_OF_DELIVERY').Value  := '';
    end;

    TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
    id_vid_nakl_delivery := TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DELIVERY_').AsInteger;

    TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                       := 'TI_VID_NAKL_DOC_SUMMA_CALC';
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value := id_vid_nakl_doc_Ins;
    TaxInvoicesEditDM.pFIBStoredProc.ExecProc;

    TaxInvoicesEditDM.WriteTransaction.Commit;


    RefreshButton.Click;
    TaxInvoicesEditDM.NaklDeliveryDSet.Locate('ID_VID_NAKL_DELIVERY',IntToStr(id_vid_nakl_delivery),[]);
  end;
end;

procedure TTaxInvoicesEditAddForm.SpecialNotesButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  notes:Variant;
begin
  Parameter           := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesEditDM.DB.Handle;
  Parameter.Owner     := self;
  notes               := DoFunctionFromPackage(Parameter,SpecialNotes_Const);
  Parameter.Destroy;
  If VarArrayDimCount(notes)>0 then
  begin
    PParameter.id_SpecialNotes   := notes[0];
    SpecialNotesButtonEdit.Text  := notes[2];
    PParameter.Name_SpecialNotes := notes[1];
    PParameter.Num_SpecialNotes  := notes[2];
    {// отбор типа документа по типу причины
    TaxInvoicesEditDM.WriteTransaction.StartTransaction;
    TaxInvoicesEditDM.pFIBStoredProc.StoredProcName := 'TI_SELECT_TYPE_DOC_SPECIALNOTES';
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value := PParameter.id_SpecialNotes;
    TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
    TaxInvoicesEditDM.WriteTransaction.Commit;

    PParameter.ID_TYPE_DOCUMENT   := TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_TYPE_DOC').Value;
    PParameter.NAME_TYPE_DOCUMENT := TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOC').Value;
    TypeDocumentButtonEdit.Text   := TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOC').Value;}
  end;
end;

procedure TTaxInvoicesEditAddForm.PostavkaButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  terms:Variant;
begin
  Parameter := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesEditDM.DB.Handle;
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

procedure TTaxInvoicesEditAddForm.RozraxunokButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  fCalc:Variant;
begin
  Parameter := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesEditDM.DB.Handle;
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

procedure TTaxInvoicesEditAddForm.OsobaPokupButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase'] := Integer(TaxInvoicesEditDM.DB.Handle);
 i['FormStyle'] := fsNormal;
 i['bMultiSelect'] := false;
 i['id_session'] := -1;
 i['SelectMode'] := selCustomer;
 i['id_cistomer']   := -1;
 i['show_all'] := 1;
 LoadSysData(TaxInvoicesEditDM.ReadTransaction);
 DogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self, i, o);

  if o['ModalResult'] = mrOk then
  begin
   id_Customer := o['ID_CUSTOMER'];
   TaxInvoicesEditDM.Customer_DataSet.Close;
   TaxInvoicesEditDM.Customer_DataSet.SelectSQL.Text :='select * from TI_CUSTOMER_INFO(:id)';
   TaxInvoicesEditDM.Customer_DataSet.ParamByName('id').Value := id_Customer;
   TaxInvoicesEditDM.Customer_DataSet.Open;
   OsobaPokupButtonEdit.Text     := TaxInvoicesEditDM.Customer_DataSet['NAME_CUSTOMER'];
   PlacePokupMemo.Text           := TaxInvoicesEditDM.Customer_DataSet['ADRESS_CONTRAGENT'];
   EdrpTextEdit.Text             := TaxInvoicesEditDM.Customer_DataSet['KOD_EDRPOU'];
   IPNPokupTextEdit.Text         := TaxInvoicesEditDM.Customer_DataSet['NALOG_NOM'];
   NumReestrPokupTextEdit.Text   := TaxInvoicesEditDM.Customer_DataSet['NNS'];

   if (TaxInvoicesEditDM.Customer_DataSet['PHONE_CUSTOMER']<>null)then
     TelPokupTextEdit.Text       := TaxInvoicesEditDM.Customer_DataSet['PHONE_CUSTOMER']
   else
     TelPokupTextEdit.Text       :='---';

   PParameter.id_customer        := id_Customer;
   PParameter.Name_customer      := TaxInvoicesEditDM.Customer_DataSet['NAME_CUSTOMER'];
   PParameter.ipn_customer       := TaxInvoicesEditDM.Customer_DataSet['NALOG_NOM'];
   PParameter.place_customer     := TaxInvoicesEditDM.Customer_DataSet['ADRESS_CONTRAGENT'];
   PParameter.phone_customer     := TaxInvoicesEditDM.Customer_DataSet['PHONE_CUSTOMER'];
   PParameter.NumReestr_customer := TaxInvoicesEditDM.Customer_DataSet['NNS'];
   PParameter.EDRPOU_Customer    := TaxInvoicesEditDM.Customer_DataSet['KOD_EDRPOU'];

   if ((TaxInvoicesEditDM.Customer_DataSet['full_name_customer'] = '') or (TaxInvoicesEditDM.Customer_DataSet['full_name_customer']=null))then
   begin
     replaceAbreviatures(TaxInvoicesEditDM.Customer_DataSet['NAME_CUSTOMER']);
     PParameter.Full_name_customer := '';
     FullNameCheckBox.Checked   := True;
     FullNameMemo.ReadOnly      := False;
     SaveFullNameButton.Visible := True;
   end
   else
   begin
     FullNameMemo.Text := TaxInvoicesEditDM.Customer_DataSet['full_name_customer'];
     PParameter.Full_name_customer := TaxInvoicesEditDM.Customer_DataSet['full_name_customer'];
     FullNameCheckBox.Checked   := False;
     FullNameMemo.ReadOnly      := True;
     SaveFullNameButton.Visible := False;
   end;

   if ((TaxInvoicesEditDM.Customer_DataSet['full_adress_customer'] = '') or (TaxInvoicesEditDM.Customer_DataSet['full_adress_customer']=null))then
   begin
     PlacePokupMemo.Text := TaxInvoicesEditDM.Customer_DataSet['adress_contragent'];
     PParameter.place_customer := '';
     PlacePokupCheckBox.Checked         := True;
     PlacePokupMemo.Properties.ReadOnly := False;
     SavePlacePokupButton.Visible       := True;
   end
   else
   begin
     PlacePokupMemo.Text := TaxInvoicesEditDM.Customer_DataSet['full_adress_customer'];
     PParameter.place_customer  := TaxInvoicesEditDM.Customer_DataSet['full_adress_customer'];
     PlacePokupCheckBox.Checked         := False;
     PlacePokupMemo.Properties.ReadOnly := True;
     SavePlacePokupButton.Visible       := False;
   end;


  end;
  i.Free;
  o.Free;
end;

procedure TTaxInvoicesEditAddForm.IPNPokupButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase'] := Integer(TaxInvoicesEditDM.DB.Handle);
 i['FormStyle'] := fsNormal;
 i['bMultiSelect'] := false;
 i['id_session'] := -1;
 i['SelectMode'] := selRateAccount;
 i['show_all'] := 1;
 DogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self, i, o);
 i.Free;
 o.Free;
end;

procedure TTaxInvoicesEditAddForm.PlacePokupButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase'] := Integer(TaxInvoicesEditDM.DB.Handle);
 i['FormStyle'] := fsNormal;
 i['bMultiSelect'] := false;
 i['id_session'] := -1;
 i['SelectMode'] := selRateAccount;
 i['show_all'] := 1;
 DogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self, i, o);
 i.Free;
 o.Free;
end;

procedure TTaxInvoicesEditAddForm.TelPokupButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase'] := Integer(TaxInvoicesEditDM.DB.Handle);
 i['FormStyle'] := fsNormal;
 i['bMultiSelect'] := false;
 i['id_session'] := -1;
 i['SelectMode'] := selRateAccount;
 i['show_all'] := 1;
 DogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self, i, o);
 i.Free;
 o.Free;
end;

procedure TTaxInvoicesEditAddForm.NumReestrPokupButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  terms:Variant;
begin
  Parameter := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesEditDM.DB.Handle;
  Parameter.Owner := self;
  terms := DoFunctionFromPackage(Parameter,RangeOfDelivery_Const);
  Parameter.Destroy;

  If VarArrayDimCount(terms)>0 then
  begin
    PostavkaButtonEdit.Text := terms[1];
  end;

end;

procedure TTaxInvoicesEditAddForm.EdrpButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase'] := Integer(TaxInvoicesEditDM.DB.Handle);
 i['FormStyle'] := fsNormal;
 i['bMultiSelect'] := false;
 i['id_session'] := -1;
 i['SelectMode'] := selRateAccount;
 i['show_all'] := 1;
 DogLoaderUnit.LoadSprav('Customer\CustPackage.bpl', Self, i, o);
 i.Free;
 o.Free;
end;

procedure TTaxInvoicesEditAddForm.NumReestrProdavecButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  LoadTypeDocumentPackage(owner,TaxInvoicesEditDM.DB.Handle,'TaxInvoices\TypeDocument.bpl','View_TypeDocument',1);
end;

procedure TTaxInvoicesEditAddForm.PodKreditButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  kredit:Variant;
begin
  Parameter           := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesEditDM.DB.Handle;
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

procedure TTaxInvoicesEditAddForm.PodZobButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  PodZob:Variant;
begin
  Parameter           := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesEditDM.DB.Handle;
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

procedure TTaxInvoicesEditAddForm.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TTaxInvoicesEditAddForm.YesButtonClick(Sender: TObject);
var
  error_period : string;
  oznaka : string;
begin

 if (DataVipDateEdit.Text='') then
  begin
   TiShowMessage('Увага!','Заповніть дату виписки!',mtWarning,[mbOK]);
   DataVipDateEdit.SetFocus;
   Exit;
  end;

  //проверка на корректность даты согласно реестра
  TaxInvoicesEditDM.WriteTransaction.StartTransaction;
  TaxInvoicesEditDM.pFIBStoredProc.StoredProcName := 'TI_DATE_NAKL_IS_KORRECT';
  TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_reestr').Value := id_Reestr_Ins;
  TaxInvoicesEditDM.pFIBStoredProc.ParamByName('date_nakl').Value := DataVipDateEdit.Date;
  TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
  TaxInvoicesEditDM.WriteTransaction.Commit;

  if (TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_korrect').Value = 0) then
  begin
   error_period := 'Дата податкової накладної не може виходити за період реєстру! Період: з ' + TaxInvoicesEditDM.pFIBStoredProc.ParamByName('date_beg').AsString + 'по ' + TaxInvoicesEditDM.pFIBStoredProc.ParamByName('date_end').AsString;
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
      TiShowMessage('Увага!','Заповніть особливі примітки!',mtWarning,[mbOK]);
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

  if (NoteCheckBox.Checked = True)then
  begin
    if (NoteButtonEdit.Text='') then
    begin
      TiShowMessage('Увага!','Заповніть примітку под. накладної або зніміть галочку!',mtWarning,[mbOK]);
      NoteButtonEdit.SetFocus;
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

  if (TypeDocumentButtonEdit.Text='') then
  begin
    TiShowMessage('Увага!','Заповніть тип документу!',mtWarning,[mbOK]);
    TypeDocumentButtonEdit.SetFocus;
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

  try
   if (id_vid_nakl_doc_Ins = -1)  then  // вставка новой налоговой накладной
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
     TaxInvoicesEditDM.WriteTransaction.StartTransaction;
     //вставка самого документа
     TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                             := 'TI_SP_VID_NAKL_DOC_INS';
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate         := DataVipDateEdit.Date;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value              := PodNumTextEdit.Text;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_SELLER').Value             := id_Seller;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_SELLER').Value           := OsobaProdavecTextEdit.Text;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ipn_seller').Value            := IPNProdavecTextEdit.Text;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('PLACE_SELLER').Value          := PlaceProdavecTextEdit.Text;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('PHONE_SELLER').Value          := TelProdavecTextEdit.Text;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NUMREESTR_SELLER').Value      := NumReestrProdavecTextEdit.Text;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value           := PParameter.Id_Customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value         := PParameter.Name_Customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value          := PParameter.ipn_customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('PLACE_CUSTOMER').Value        := PParameter.place_customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('PHONE_CUSTOMER').Value        := PParameter.phone_customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NUMREESTR_CUSTOMER').Value    := PParameter.NumReestr_customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('EDRPOU_CUSTOMER').Value       := PParameter.EDRPOU_Customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('full_name_customer').Value    := PParameter.Full_name_customer;
     //TaxInvoicesEditDM.pFIBStoredProc.ParamByName('note').Value := NoteButtonEdit.Text;

     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_issued_buyer_two_ekz').Value   := 0;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_erpn_two_ekz').Value           := 0;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_remains_seller_two_ekz').Value := 0;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_copy_two_ekz').Value           := 0;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_specialnotes_two_ekz').Value   := 0;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('name_specialnotes_two_ekz').Value := '';

     if (is_issued_buyer_CheckBox.Checked = true) then
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_issued_buyer').Value := 1
     else
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_issued_buyer').Value := 0;

     if (is_erpn_CheckBox.Checked = true) then
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_erpn').Value := 1
     else
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_erpn').Value := 0;

     if (is_copy_CheckBox.Checked = true) then
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_copy').Value := 1
     else
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_copy').Value := 0;

     if (OsoblPrimCheckBox.Checked = true) then
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER').Value := 1
     else
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER').Value := 0;

     if (NotPDVCheckBox.Checked = true) then
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_NOT_PDV').Value := 1
     else
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_NOT_PDV').Value := 0;

     if (PostavkaCheckBox.Checked=True)then
     begin
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_TERMSDELIVERY').Value      := PParameter.id_TermsDelivery;
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TERMSDELIVERY').Value    := PParameter.Name_TermsDelivery;
       if (DataTermsdelDateEdit.Text='') then
         TaxInvoicesEditDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value  := StrtoDate('01.01.1900')
       else
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value    := DataTermsdelDateEdit.Date ;
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value     := NumTermsDelTextEdit.Text;
     end
     else
     begin
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_TERMSDELIVERY').Value      := 0;
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TERMSDELIVERY').Value    := '';
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value    := StrtoDate('01.01.1900');
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value     := '';
     end;

    if (RozraxunokCheckBox.Checked=True)then
     begin
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_FORMCALCULATIONS').Value   := PParameter.id_FormCalculations;
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_FORMCALCULATIONS').Value := PParameter.Name_FormCalculations;
     end
    else
     begin
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_FORMCALCULATIONS').Value   := 0;
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_FORMCALCULATIONS').Value := '';
     end;

     if (NoteCheckBox.Checked=True)then
      begin
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_NOTE').Value   := PParameter.id_note;
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NOTE').Value := PParameter.article_note;
      end
     else
     begin
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_NOTE').Value   := 0;
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NOTE').Value := '';
     end;


     if (PodZobCheckBox.Checked)then
      begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_tax_liabilities').Value   := PParameter.id_TaxLiabilities;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TAX_LIABILITIES').Value := PParameter.Name_TaxLiabilities;
      end
     else
      begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_tax_liabilities').Value   := 0;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TAX_LIABILITIES').Value := '';
      end;

     if (PodKreditCheckBox.Checked)then
      begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_TAXKREDIT').Value   := PParameter.Id_TaxKredit;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TAXKREDIT').Value := PParameter.Name_TaxKredit;
      end
     else
      begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_TAXKREDIT').Value   := 0;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TAXKREDIT').Value := '';
      end;

     if (OsoblPrimCheckBox.Checked)then
      begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value   := PParameter.id_SpecialNotes;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value := PParameter.Name_SpecialNotes;
      end
     else
      begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value    := 0;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value  := '';
      end;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_korig').Value              := 0;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NUM_ROZR').Value              := '';
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('DATE_ROZR').Value             := StrtoDate('01.01.1900');
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('DATE_PODPIS_KORIG').Value     := StrtoDate('01.01.1900');

     TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
     id_vid_nakl_doc_Ins        := TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC_').Value;

     //вставка документа в список выданных налоговых накладных
     TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                           := 'TI_SP_VID_NAKL_INS';
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('data_vipiski').AsDate       := DataVipDateEdit.Date;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value            := PodNumTextEdit.Text;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NUM_ORDER').Value           := NumOrderTextEdit.Text;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value    := PParameter.ID_TYPE_DOCUMENT;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value  := PParameter.NAME_TYPE_DOCUMENT;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := PParameter.id_TaxLiabilities;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := PParameter.Name_TaxLiabilities;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value         := PParameter.Id_Customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value       := PParameter.Full_name_customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value        := PParameter.ipn_customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('SUMMA_PDV_20').Value        := 0;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_20').Value    := 0;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_0').Value     := 0;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT').Value        := 0;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('SUMMA_EXPORT').Value        := 0;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_KORIG').Value            := 0;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value        := 0;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_SIGN').Value             := 0;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_REESTR').Value           := id_Reestr_Ins;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_NAKL_DOCUMENT').Value    := id_vid_nakl_doc_Ins;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_USER_CREATE').Value      := TaxInvoicesUser.id_user;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_USER_CREATE').Value    := TaxInvoicesUser.name_user;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('date_time_create').Value    := Now;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_IMPORT').Value           := 0;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_SYSTEM').Value         := '';
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_SCHET_IMPORT').Value     := 0;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('pk_id').Value               := 0;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_subdivision').Value      := 1;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_LGOTA').Value            := 0;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_LGOTA').Value          := '';

      if (OsoblPrimCheckBox.Checked = true) then
       begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value  := Pparameter.id_specialNotes;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value := Pparameter.Num_specialnotes;
       end
      else
       begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value   := 0;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value  := '';
       end;

      if (OznakaCheckBox.Checked = true) then
       begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value   := OznakaTextEdit.Text;
       end
      else
       begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value   := '';
       end;

     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('SUMMA_DELIVERY').Value := 0;

     TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
     id_vid_nakl_Ins := TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_').Value;
     PParameter.id_vid_nakl_doc := id_vid_nakl_Ins;
     PRes.id_vid_nakl_doc       := id_vid_nakl_Ins;
     PodZobButtonEdit.Properties.onButtonClick       := nil;
     PodKreditButtonEdit.Properties.onButtonClick    := nil;
     DataVipDateEdit.Properties.ReadOnly             := True;
     SpecialNotesButtonEdit.Properties.onButtonClick := nil;
     PostavkaButtonEdit.Properties.onButtonClick     := nil;
     OsobaPokupButtonEdit.Properties.onButtonClick   := nil;
     RozraxunokButtonEdit.Properties.onButtonClick   := nil;
     TypeDocumentButtonEdit.Properties.onButtonClick := nil;

     PodNumTextEdit.Properties.ReadOnly       := True;
     NumOrderTextEdit.Properties.ReadOnly     := True;
     NumTermsDelTextEdit.Properties.ReadOnly  := True;
     PodNumTextEdit.Properties.ReadOnly       := True;
     DataVipDateEdit.Properties.ReadOnly      := True;
     DataTermsdelDateEdit.Properties.ReadOnly := True;
     IPNPokupTextEdit.Properties.ReadOnly     := True;
     //NoteTextEdit.Properties.ReadOnly         := True;
     NoteCheckBox.Properties.ReadOnly         := True;
     NoteButtonEdit.Enabled := False;
     NotPDVCheckBox.Properties.ReadOnly       := True;

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
     TypeDocumentButtonEdit.Style.Color := clBtnFace;

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

     TaxInvoicesEditDM.WriteTransaction.Commit;
     TiShowMessage('Увага!','Документ додано.',mtWarning,[mbOK]);
   end
   else
   begin
     TaxInvoicesEditDM.WriteTransaction.StartTransaction;
     //изменение документа
     TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                             := 'TI_SP_VID_NAKL_DOC_UPD';
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_vid_nakl_doc').Value       := id_vid_nakl_doc_Ins;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('data_vipiski').Value          := DataVipDateEdit.Date;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value              := PodNumTextEdit.Text;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_SELLER').Value             := id_Seller;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_SELLER').Value           := OsobaProdavecTextEdit.Text;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ipn_seller').Value            := IPNProdavecTextEdit.Text;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('PLACE_SELLER').Value          := PlaceProdavecTextEdit.Text;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('PHONE_SELLER').Value          := TelProdavecTextEdit.Text;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NUMREESTR_SELLER').Value      := NumReestrProdavecTextEdit.Text;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value           := PParameter.Id_Customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value         := PParameter.Name_Customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value          := PParameter.ipn_customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('PLACE_CUSTOMER').Value        := PParameter.place_customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('PHONE_CUSTOMER').Value        := PParameter.phone_customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NUMREESTR_CUSTOMER').Value    := PParameter.NumReestr_customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('EDRPOU_CUSTOMER').Value       := PParameter.EDRPOU_Customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_TERMSDELIVERY').Value      := PParameter.id_TermsDelivery;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TERMSDELIVERY').Value    := PParameter.Name_TermsDelivery;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value    := DataTermsdelDateEdit.Date;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value     := NumTermsDelTextEdit.Text;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_FORMCALCULATIONS').Value   := PParameter.id_FormCalculations;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_FORMCALCULATIONS').Value := PParameter.Name_FormCalculations;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('full_name_customer').Value    := PParameter.Full_name_customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('num_rozr').Value              := '';
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('date_rozr').Value             := StrToDate('01.01.1900');
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('DATE_PODPIS_KORIG').Value     := StrToDate('01.01.1900');
     //TaxInvoicesEditDM.pFIBStoredProc.ParamByName('note').Value                  := NoteTextEdit.Text;
     if (NoteCheckBox.Checked=True)then
      begin
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_NOTE').Value   := PParameter.id_note;
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NOTE').Value := PParameter.article_note;
      end
     else
     begin
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_NOTE').Value   := 0;
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NOTE').Value := '';
     end;

     if (is_issued_buyer_CheckBox.Checked = true) then
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_issued_buyer').Value := 1
     else
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_issued_buyer').Value := 0;

     if (is_erpn_CheckBox.Checked = true) then
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_erpn').Value := 1
     else
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_erpn').Value := 0;

     if (is_copy_CheckBox.Checked = true) then
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_copy').Value := 1
     else
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_copy').Value := 0;

     if (OsoblPrimCheckBox.Checked = true) then
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER').Value := 1
     else
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_REMAINS_SELLER').Value := 0;

     if (NotPDVCheckBox.Checked = true) then
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_NOT_PDV').Value := 1
     else
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_NOT_PDV').Value := 0;

     if (PostavkaCheckBox.Checked=True)then
     begin
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_TERMSDELIVERY').Value      := PParameter.id_TermsDelivery;
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TERMSDELIVERY').Value    := PParameter.Name_TermsDelivery;
       if (DataTermsdelDateEdit.Text='') then
         TaxInvoicesEditDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value    := Strtodate('01.01.1900')
       else
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value    := DataTermsdelDateEdit.Date ;
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value     := NumTermsDelTextEdit.Text;
     end
     else
     begin
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_TERMSDELIVERY').Value      := 0;
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TERMSDELIVERY').Value    := '';
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('data_termsdelivery').Value    := Strtodate('01.01.1900');
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('num_termsdelivery').Value     := '';
     end;

    if (RozraxunokCheckBox.Checked=True)then
     begin
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_FORMCALCULATIONS').Value   := PParameter.id_FormCalculations;
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_FORMCALCULATIONS').Value := PParameter.Name_FormCalculations;
     end
    else
     begin
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_FORMCALCULATIONS').Value   := 0;
       TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_FORMCALCULATIONS').Value := '';
     end;


     if (PodZobCheckBox.Checked)then
      begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_tax_liabilities').Value   := PParameter.id_TaxLiabilities;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TAX_LIABILITIES').Value := PParameter.Name_TaxLiabilities;
      end
     else
      begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_tax_liabilities').Value   := 0;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TAX_LIABILITIES').Value := '';
      end;

     if (PodKreditCheckBox.Checked)then
      begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_TAXKREDIT').Value   := PParameter.Id_TaxKredit;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TAXKREDIT').Value := PParameter.Name_TaxKredit;
      end
     else
      begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_TAXKREDIT').Value   := 0;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TAXKREDIT').Value := '';
      end;

     if (OsoblPrimCheckBox.Checked)then
      begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value   := PParameter.id_SpecialNotes;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value := PParameter.Name_SpecialNotes;
      end
     else
      begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value    := 0;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value  := '';
      end;
     TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
     //изменение документа в списке выданных налоговых накладных
     TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                           := 'TI_SP_VID_NAKL_UPD';
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_VID_NAKL').Value         := id_vid_nakl_Ins;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('data_vipiski').Value        := DataVipDateEdit.Date;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NUM_NAKL').Value            := PodNumTextEdit.Text;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NUM_ORDER').Value           := NumOrderTextEdit.Text;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_TYPE_DOCUMENT').Value    := PParameter.ID_TYPE_DOCUMENT;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TYPE_DOCUMENT').Value  := PParameter.NAME_TYPE_DOCUMENT;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_TAXLIABILITIES').Value   := PParameter.id_TaxLiabilities;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TAXLIABILITIES').Value := PParameter.Name_TaxLiabilities;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_CUSTOMER').Value         := PParameter.Id_Customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_CUSTOMER').Value       := PParameter.Full_name_customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IPN_CUSTOMER').Value        := PParameter.ipn_customer;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('SUMMA_PDV_20').Value        := null;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_20').Value    := null;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('SUMMA_TAXABLE_0').Value     := null;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('SUMMA_EXEMPT').Value        := null;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('SUMMA_EXPORT').Value        := null;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_KORIG').Value            := null;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_EXPANSION').Value        := null;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_SIGN').Value             := null;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_REESTR').Value           := id_Reestr_Ins;
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_CHANGE').Value           := 1;// изменение документа в справочнике выд. накл. (номер, дата, под. обязат., покупатель)
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_NAKL_DOCUMENT').Value    := id_vid_nakl_doc_Ins;
      if (OsoblPrimCheckBox.Checked = true) then
       begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value  := Pparameter.id_specialNotes;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value := Pparameter.Num_specialnotes;
       end
      else
       begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value   := 0;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value  := '';
       end;

      if (OznakaCheckBox.Checked = true) then
       begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value   := OznakaTextEdit.Text;
       end
      else
       begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('OZNAKA_NAKL').Value   := '';
       end;

     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('SUMMA_DELIVERY').Value := 0;
     TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
     PodZobButtonEdit.Properties.onButtonClick       := nil;
     PodKreditButtonEdit.Properties.onButtonClick    := nil;
     DataVipDateEdit.Properties.ReadOnly             := True;
     SpecialNotesButtonEdit.Properties.onButtonClick := nil;
     PostavkaButtonEdit.Properties.onButtonClick     := nil;
     OsobaPokupButtonEdit.Properties.onButtonClick   := nil;
     RozraxunokButtonEdit.Properties.onButtonClick   := nil;
     TypeDocumentButtonEdit.Properties.onButtonClick := nil;

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
     TypeDocumentButtonEdit.Style.Color := clBtnFace;

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
     //NoteTextEdit.Properties.ReadOnly             := True;
     NotPDVCheckBox.Properties.ReadOnly           := True;
     NoteCheckBox.Properties.ReadOnly             := True;
     NoteButtonEdit.Enabled                       := False;

     TaxInvoicesEditDM.WriteTransaction.Commit;
     TiShowMessage('Увага!','Документ змінено.',mtWarning,[mbOK]);
   end;
  except
    begin
      TiShowMessage('Увага!','Виникла помилка!',mtError,[mbOK]);
      TaxInvoicesEditDM.WriteTransaction.Rollback;
      PodZobButtonEdit.Properties.onButtonClick       := PodZobButtonEditPropertiesButtonClick;
      PodKreditButtonEdit.Properties.onButtonClick    := PodKreditButtonEditPropertiesButtonClick;
      DataVipDateEdit.Properties.ReadOnly             := False;
      SpecialNotesButtonEdit.Properties.onButtonClick := SpecialNotesButtonEditPropertiesButtonClick;
      PostavkaButtonEdit.Properties.onButtonClick     := PostavkaButtonEditPropertiesButtonClick;
      OsobaPokupButtonEdit.Properties.onButtonClick   := OsobaPokupButtonEditPropertiesButtonClick;
      RozraxunokButtonEdit.Properties.onButtonClick   := RozraxunokButtonEditPropertiesButtonClick;
      TypeDocumentButtonEdit.Properties.onButtonClick := TypeDocumentButtonEditPropertiesButtonClick;

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
      TypeDocumentButtonEdit.Style.Color := clWindow;

      EditingButton.Visible := False;
      AddButton.Enabled     := False;
      UpdateButton.Enabled  := False;
      DeleteButton.Enabled  := False;
      RefreshButton.Enabled := False;
      BudgetButton.Enabled  := False;
      YesButton.Visible     := True;
      EditTaxButton.Enabled := False;
    end;
  end;
end;

procedure TTaxInvoicesEditAddForm.EditingButtonClick(Sender: TObject);
begin
  PodZobButtonEdit.Properties.onButtonClick       := PodZobButtonEditPropertiesButtonClick;
  PodKreditButtonEdit.Properties.onButtonClick    := PodKreditButtonEditPropertiesButtonClick;
  DataVipDateEdit.Properties.ReadOnly             := False;
  SpecialNotesButtonEdit.Properties.onButtonClick := SpecialNotesButtonEditPropertiesButtonClick;
  PostavkaButtonEdit.Properties.onButtonClick     := PostavkaButtonEditPropertiesButtonClick;
  OsobaPokupButtonEdit.Properties.onButtonClick   := OsobaPokupButtonEditPropertiesButtonClick;
  RozraxunokButtonEdit.Properties.onButtonClick   := RozraxunokButtonEditPropertiesButtonClick;
  TypeDocumentButtonEdit.Properties.onButtonClick := TypeDocumentButtonEditPropertiesButtonClick;

  PodNumTextEdit.Properties.ReadOnly       := False;
  NumOrderTextEdit.Properties.ReadOnly     := False;
  NumTermsDelTextEdit.Properties.ReadOnly  := False;
  PodNumTextEdit.Properties.ReadOnly       := False;
  DataVipDateEdit.Properties.ReadOnly      := False;
  DataTermsdelDateEdit.Properties.ReadOnly := False;
  IPNPokupTextEdit.Properties.ReadOnly     := False;
  //NoteTextEdit.Properties.ReadOnly         := False;
  NotPDVCheckBox.Properties.ReadOnly       := False;

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
  TypeDocumentButtonEdit.Style.Color := clWindow;

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
  NoteCheckBox.Properties.ReadOnly             := False;
  NoteButtonEdit.Enabled                       := True;
end;

procedure TTaxInvoicesEditAddForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  summa_val_deliv_20 :Double;
  summa_tax : Extended;
  summa_val_deliv_vat_extemptions : Double;
  summa_NDS_budget :Extended;
  summa_not_NDS_budget :Double;
begin
  RefreshButtonClick(Self);
  // ничего не делать, если старая налоговая
  if ((TaxInvoicesEditDM.VidNaklInfoDSet['PK_ID']<>'-1') and (TaxInvoicesEditDM.VidNaklInfoDSet['PK_ID'] <> null)) then
  begin
    //проверка на пустоту сумм
    if (TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_20'] = null) then
      summa_val_deliv_20 := 0
    else
      summa_val_deliv_20 := TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_20'];

    if (TaxInvoicesEditDM.VidNaklInfoDSet['summa_tax'] = null) then
      summa_tax := 0
    else
      summa_tax := TaxInvoicesEditDM.VidNaklInfoDSet['summa_tax'];

    if (TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_vat_extemptions'] = null) then
      summa_val_deliv_vat_extemptions := 0
    else
      summa_val_deliv_vat_extemptions := TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_vat_extemptions'];

      TaxInvoicesEditDM.WriteTransaction.StartTransaction;
      TaxInvoicesEditDM.pFIBStoredProc.StoredProcName := 'TI_SUMMA_BUDGET_VID_NAKL';
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_nakl').Value := id_vid_nakl_Ins;
      TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
      TaxInvoicesEditDM.WriteTransaction.Commit;
      summa_NDS_budget     := TaxInvoicesEditDM.pFIBStoredProc.ParamByName('SUMMA_NDS').Value;
      summa_not_NDS_budget := TaxInvoicesEditDM.pFIBStoredProc.ParamByName('summa_not_nds').Value;

      if (summa_NDS_budget <> summa_tax) then
      begin
        TiShowMessage('Увага!', 'Сума ПДВ (бюджети)='+Floattostr(summa_NDS_budget)+'.Введена сума ПДВ='+Floattostr(summa_tax)+'.Суми повинні співпадати!Заповніть корректно бюджет або накладну.', mtWarning, [mbOK]);
        Action := caNone;
        Exit;
      end;

          // если сумма НДС не нулевая

    if summa_NDS_budget <> 0 then
     begin
        if summa_val_deliv_20 <> summa_not_NDS_budget then
        begin
         TiShowMessage('Увага!', '20% ,обсяг без ПДВ(бюджети) = ' + Floattostr(summa_not_NDS_budget)+'. Введена сума 20%, обсяг без ПДВ ='+Floattostr(summa_val_deliv_20)+'. Суми повинні співпадати!Заповніть корректно бюджет або накладну.' , mtWarning, [mbOK]);
         Action := caNone;
         Exit;
        end
     end;

    if summa_NDS_budget = 0 then
      begin
        if summa_val_deliv_vat_extemptions <> summa_not_NDS_budget then
        begin
         TiShowMessage('Увага!', 'Звільнені від оподаткув.(бюджети) = ' + Floattostr(summa_not_NDS_budget)+'. Введена сума Звільнені від оподаткув. ='+Floattostr(summa_val_deliv_vat_extemptions)+'. Суми повинні співпадати!Заповніть корректно бюджет або накладну.' , mtWarning, [mbOK]);
         Action := caNone;
         Exit;
        end;
      end;
  end;

  writeReg;

  if (TaxInvoicesEditDM.ReadTransaction.Active) then
  TaxInvoicesEditDM.ReadTransaction.Commit;

  if formstyle = fsMDIChild then
   begin
     action := caFree;
   end
  else
   Begin
    TaxInvoicesEditDM.free;
    ModalResult := mrOk;
   end;
end;

procedure TTaxInvoicesEditAddForm.ReadReg;
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
       SpecialNotesButtonEdit.Text      := reg.ReadString('Num_SpecialNotes');
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
         TypeDocumentButtonEdit.Text      := '';
       end
       else
       begin
         PParameter.ID_TYPE_DOCUMENT      := StrToInt(reg.ReadString('ID_TYPE_DOCUMENT'));
         PParameter.NAME_TYPE_DOCUMENT    := reg.ReadString('NAME_TYPE_DOCUMENT');
         TypeDocumentButtonEdit.Text      := reg.ReadString('NAME_TYPE_DOCUMENT');
       end;
     end
     else
     begin
       PostavkaButtonEdit.Text     := '';
       RozraxunokButtonEdit.Text   := '';
       SpecialNotesButtonEdit.Text := '';
       PodZobButtonEdit.Text       := '';
       PodKreditButtonEdit.Text    := '';
       TypeDocumentButtonEdit.Text := '';
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

procedure TTaxInvoicesEditAddForm.WriteReg;
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

procedure TTaxInvoicesEditAddForm.DeliveryInsBarButtonClick(Sender: TObject);
begin
  AddButton.Click;
end;

procedure TTaxInvoicesEditAddForm.RefreshButtonClick(Sender: TObject);
var
  p: Double;
begin
//  ShowMessage(IntToStr(id_vid_nakl_doc_Ins));
  TaxInvoicesEditDM.VidNaklInfoDSet.Close;
  TaxInvoicesEditDM.VidNaklInfoDSet.SelectSQL.Text := 'select * from TI_SP_VID_NAKL_DOC_SEL(:ID)';
  TaxInvoicesEditDM.VidNaklInfoDSet.ParamByName('id').Value := id_vid_nakl_doc_Ins;
  TaxInvoicesEditDM.VidNaklInfoDSet.Open;

  if (TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_20'] = null) then
    FirstAllStatusBar.Panels[5].Text := ''
  else
  begin
    p:= TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_20'];
    if (trunc(p) = p) then
      begin
       FirstAllStatusBar.Panels[5].Text := FloatToStr(p) + ',00';
      end
    else
      FirstAllStatusBar.Panels[5].Text := FloatToStr(p);
  end;

  if (TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_customs'] = null) then
    FirstAllStatusBar.Panels[6].Text := ''
  else
  begin
    p:= TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_customs'];
    if (trunc(p) = p) then
      begin
       FirstAllStatusBar.Panels[6].Text := FloatToStr(p) + ',00';
      end
    else
      FirstAllStatusBar.Panels[6].Text := FloatToStr(p);
  end;

  if (TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_export'] = null) then
    FirstAllStatusBar.Panels[6].Text := ''
  else
  begin
    p:= TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_export'];
    if (trunc(p) = p) then
      begin
       FirstAllStatusBar.Panels[7].Text := FloatToStr(p) + ',00';
      end
    else
      FirstAllStatusBar.Panels[7].Text := FloatToStr(p);
  end;

  if (TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_vat_extemptions'] = null) then
    FirstAllStatusBar.Panels[8].Text := ''
  else
  begin
    p:= TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_vat_extemptions'];
    if (trunc(p) = p) then
      begin
       FirstAllStatusBar.Panels[8].Text := FloatToStr(p) + ',00';
      end
    else
      FirstAllStatusBar.Panels[8].Text := FloatToStr(p);
  end;

  if (TaxInvoicesEditDM.VidNaklInfoDSet['summa_all_oplata'] = null) then
    FirstAllStatusBar.Panels[9].Text := ''
  else
  begin
    p:= TaxInvoicesEditDM.VidNaklInfoDSet['summa_all_oplata'];
    if (trunc(p) = p) then
      begin
       FirstAllStatusBar.Panels[9].Text := FloatToStr(p) + ',00';
      end
    else
      FirstAllStatusBar.Panels[9].Text := FloatToStr(p);
  end;

  if (TaxInvoicesEditDM.VidNaklInfoDSet['summa_tax'] = null) then
  begin
    TaxStatusBar.Panels[5].Text := '';
    TaxStatusBar.Panels[9].Text := '';
  end
  else
  begin
    p:= TaxInvoicesEditDM.VidNaklInfoDSet['summa_tax'];
    if (trunc(p) = p) then
      begin
       TaxStatusBar.Panels[5].Text := FloatToStr(p) + ',00';
       TaxStatusBar.Panels[9].Text := FloatToStr(p) + ',00';
      end
    else
    begin
      TaxStatusBar.Panels[5].Text := FloatToStr(p);
      TaxStatusBar.Panels[9].Text := FloatToStr(p);
    end;
  end;

  if (TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_20_pdv'] = null) then
    SummaAllPDVStatusBar.Panels[5].Text := ''
  else
  begin
    p:= TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_20_pdv'];
    if (trunc(p) = p) then
      begin
       SummaAllPDVStatusBar.Panels[5].Text := FloatToStr(p) + ',00';
      end
    else
      SummaAllPDVStatusBar.Panels[5].Text := FloatToStr(p);
  end;

  if (TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_customs'] = null) then
    SummaAllPDVStatusBar.Panels[6].Text := ''
  else
  begin
    p:= TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_customs'];
    if (trunc(p) = p) then
      begin
       SummaAllPDVStatusBar.Panels[6].Text := FloatToStr(p) + ',00';
      end
    else
      SummaAllPDVStatusBar.Panels[6].Text := FloatToStr(p);
  end;

  if (TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_export'] = null) then
    SummaAllPDVStatusBar.Panels[7].Text := ''
  else
  begin
    p:= TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_export'];
    if (trunc(p) = p) then
      begin
       SummaAllPDVStatusBar.Panels[7].Text := FloatToStr(p) + ',00';
      end
    else
      SummaAllPDVStatusBar.Panels[7].Text := FloatToStr(p);
  end;

  if (TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_vat_extemptions'] = null) then
    SummaAllPDVStatusBar.Panels[8].Text := ''
  else
  begin
    p:= TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_vat_extemptions'];
    if (trunc(p) = p) then
      begin
       SummaAllPDVStatusBar.Panels[8].Text := FloatToStr(p) + ',00';
      end
    else
      SummaAllPDVStatusBar.Panels[8].Text := FloatToStr(p);
  end;

  if (TaxInvoicesEditDM.VidNaklInfoDSet['summa_all_oplata_pdv'] = null) then
    SummaAllPDVStatusBar.Panels[9].Text := ''
  else
  begin
    p:= TaxInvoicesEditDM.VidNaklInfoDSet['summa_all_oplata_pdv'];
    if (trunc(p) = p) then
      begin
       SummaAllPDVStatusBar.Panels[9].Text := FloatToStr(p) + ',00';
      end
    else
      SummaAllPDVStatusBar.Panels[9].Text := FloatToStr(p);
  end;

  TaxInvoicesEditDM.NaklDeliveryDSet.Close;
  TaxInvoicesEditDM.NaklDeliveryDSet.SelectSQL.Text := 'select * from TI_SP_VID_NAKL_DELIVERY_SEL where ID_VID_NAKL_DOC =:ID and SECTION = :section ';
  TaxInvoicesEditDM.NaklDeliveryDSet.ParamByName('ID').Value := id_vid_nakl_doc_Ins;
  TaxInvoicesEditDM.NaklDeliveryDSet.ParamByName('section').Value := '1';
  TaxInvoicesEditDM.NaklDeliveryDSet.Open;

  FirstSummaAll;
  TransportCosts;
  MortgageTara;
end;

procedure TTaxInvoicesEditAddForm.UpdateButtonClick(Sender: TObject);
var
  ViewForm : TTaxInvoicesEditAddInNaklForm;
  id_vid_nakl_delivery :Integer;
  AddParametr :TTITaxInvoicesAddVidNaklDelivery;
begin
  if not (TaxInvoicesEditDM.NaklDeliveryDSet.IsEmpty) then
  begin
    id_vid_nakl_delivery := TaxInvoicesEditDM.NaklDeliveryDSet['id_vid_nakl_delivery'];
    if (TaxInvoicesEditDM.NaklDeliveryDSet['id_range_of_delivery'] = null) then
     begin
      AddParametr.id_range_of_delivery   := 0;
      AddParametr.Name_range_of_delivery := '';
     end
    else
     begin
      AddParametr.id_range_of_delivery   := TaxInvoicesEditDM.NaklDeliveryDSet['id_range_of_delivery'];
      AddParametr.Name_range_of_delivery := TaxInvoicesEditDM.NaklDeliveryDSet['Name_range_of_delivery'];
     end;

    if (TaxInvoicesEditDM.NaklDeliveryDSet['id_measures'] = null) then
     begin
      AddParametr.Id_Measures   := 0;
      AddParametr.Name_Measures := '';
     end
    else
     begin
      AddParametr.Id_Measures   := TaxInvoicesEditDM.NaklDeliveryDSet['id_measures'];
      AddParametr.Name_Measures := TaxInvoicesEditDM.NaklDeliveryDSet['Name_Measures'];
     end;

    if ((TaxInvoicesEditDM.NaklDeliveryDSet['id_kod_tovar'] = null) or (TaxInvoicesEditDM.NaklDeliveryDSet['id_kod_tovar'] = 0) ) then
     begin
      AddParametr.id_kod_tovar   := 0;
      AddParametr.Num_Kod_tovar  := '';
      AddParametr.Name_Kod_tovar := '';
     end
    else
     begin
      AddParametr.id_kod_tovar   := TaxInvoicesEditDM.NaklDeliveryDSet['id_kod_tovar'];
      AddParametr.Num_Kod_tovar  := TaxInvoicesEditDM.NaklDeliveryDSet['num_kod_tovar'];
      AddParametr.Name_Kod_tovar := TaxInvoicesEditDM.NaklDeliveryDSet['name_kod_tovar'];
     end;

    ViewForm := TTaxInvoicesEditAddInNaklForm.Create(Self,TaxInvoicesEditDM.DB.Handle,AddParametr);
    if ((TaxInvoicesEditDM.NaklDeliveryDSet['MONTH_RANGE_OF_DELIVERY'] = null) or (TaxInvoicesEditDM.NaklDeliveryDSet['MONTH_RANGE_OF_DELIVERY'] = '') ) then
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
      ViewForm.MonthList.Text       := TaxInvoicesEditDM.NaklDeliveryDSet['MONTH_RANGE_OF_DELIVERY'];
      ViewForm.YearSpinEdit.Text    := TaxInvoicesEditDM.NaklDeliveryDSet['YEAR_RANGE_OF_DELIVERY'];
     end;

    ViewForm.DateShipmentLabel.Visible         := True;
    ViewForm.DateShipmentEdit.Visible          := True;
    ViewForm.RangeOfDeliveryLabel.Visible      := True;
    ViewForm.RangeOfDeliveryButtonEdit.Visible := True;
    ViewForm.DataGroupBox.Visible              := True;

    ViewForm.DateShipmentEdit.Date          := TaxInvoicesEditDM.NaklDeliveryDSet['date_shipment'];
    ViewForm.KolVoTextEdit.Text             := TaxInvoicesEditDM.NaklDeliveryDSet['kol_vo_delivery_goods'];
    ViewForm.PriceCurrencyEdit.Text         := TaxInvoicesEditDM.NaklDeliveryDSet['price_delivery_goods'];
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

    ViewForm.ValueDeliveryExportCurrencyEdit.Text  := TaxInvoicesEditDM.NaklDeliveryDSet['value_delivery_export'];
    ViewForm.ValueDelivery20CurrencyEdit.Text      := TaxInvoicesEditDM.NaklDeliveryDSet['value_delivery_20'];
    ViewForm.ValueDeliveryCustomsCurrencyEdit.Text := TaxInvoicesEditDM.NaklDeliveryDSet['value_delivery_customs'];
    ViewForm.ValueDeliveryVATexemptionsCurrencyEdit.Text := TaxInvoicesEditDM.NaklDeliveryDSet['value_delivery_vat_exemption'];
    ViewForm.ShowModal;

    if (ViewForm.ModalResult = mrok) then
     begin
      TaxInvoicesEditDM.WriteTransaction.StartTransaction;
      TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                              := 'TI_SP_VID_NAKL_DELIVERY_UPD';
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('date_shipment').Value          := ViewForm.DateShipmentEdit.Date;
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_range_of_delivery').Value   := ViewForm.Parameter.id_range_of_delivery;
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('name_range_of_delivery').Value := ViewForm.Parameter.Name_range_of_delivery;
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_measures').Value            := ViewForm.Parameter.Id_Measures;
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('name_measures').Value          := ViewForm.MeasuresButtonEdit.Text;
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('kol_vo_delivery_goods').Value  := ViewForm.KolVoTextEdit.Text;
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('price_delivery_goods').Value   := ViewForm.PriceCurrencyEdit.Value;
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('value_delivery_20').Value      := ViewForm.ValueDelivery20CurrencyEdit.Value;
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('value_delivery_export').Value  := ViewForm.ValueDeliveryExportCurrencyEdit.Value;
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('value_delivery_customs').Value := ViewForm.ValueDeliveryCustomsCurrencyEdit.Value;
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('value_delivery_vat_exemption').Value := ViewForm.ValueDeliveryVATexemptionsCurrencyEdit.Value;
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_vid_nakl_doc').Value        := id_vid_nakl_doc_Ins;
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('section').Value                := '1';
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_vid_nakl_delivery').Value   := id_vid_nakl_delivery;

      if (ViewForm.KodTovarCheckBox.Checked = true) then
      begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_kod_tovar').Value   := ViewForm.Parameter.id_kod_tovar;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('num_kod_tovar').Value  := ViewForm.Parameter.Num_Kod_tovar;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('name_kod_tovar').Value := ViewForm.Parameter.Name_Kod_tovar;
      end
      else
      begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_kod_tovar').Value   := 0;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('num_kod_tovar').Value  := '';
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('name_kod_tovar').Value := '';
      end;

      if (ViewForm.ZaCheckBox.Checked = true) then
      begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('MONTH_RANGE_OF_DELIVERY').Value := ViewForm.MonthList.Text;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('YEAR_RANGE_OF_DELIVERY').Value  := ViewForm.YearSpinEdit.Text;
      end
      else
      begin
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('MONTH_RANGE_OF_DELIVERY').Value := '';
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('YEAR_RANGE_OF_DELIVERY').Value  := '';
      end;

      TaxInvoicesEditDM.pFIBStoredProc.ExecProc;

      TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                       := 'TI_VID_NAKL_DOC_SUMMA_CALC';
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value := id_vid_nakl_doc_Ins;
      TaxInvoicesEditDM.pFIBStoredProc.ExecProc;

      TaxInvoicesEditDM.WriteTransaction.Commit;
      RefreshButton.Click;
      TaxInvoicesEditDM.NaklDeliveryDSet.Locate('ID_VID_NAKL_DELIVERY',IntToStr(id_vid_nakl_delivery),[]);
     end;
  end;
end;

procedure TTaxInvoicesEditAddForm.DeliveryUpdBarButtonClick(Sender: TObject);
begin
  UpdateButton.Click;
end;

procedure TTaxInvoicesEditAddForm.DeleteButtonClick(Sender: TObject);
begin
  if TiShowMessage('Увага!','Ви дійсно бажаєте вилучити поставку?',mtConfirmation,[mbYes, mbNo])=mrYes then
   begin
    try
      TaxInvoicesEditDM.WriteTransaction.StartTransaction;
      TaxInvoicesEditDM.pFIBStoredProc.StoredProcName:='TI_SP_VID_NAKL_DELIVERY_DEL';
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_vid_nakl_delivery').Value:=TaxInvoicesEditDM.NaklDeliveryDSet['id_vid_nakl_delivery'];
      TaxInvoicesEditDM.pFIBStoredProc.ExecProc;

      TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                       := 'TI_VID_NAKL_DOC_SUMMA_CALC';
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value := id_vid_nakl_doc_Ins;
      TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
      TaxInvoicesEditDM.WriteTransaction.Commit;
      RefreshButton.Click;
    except on E:Exception do
     begin
       TiShowMessage('Увага!','не можна видалити цей запис', mtError, [mbOK]);
       TaxInvoicesEditDM.WriteTransaction.Rollback;
     end;
    end;
   end;
end;

procedure TTaxInvoicesEditAddForm.DeliveryDelBarButtonClick(Sender: TObject);
begin
  DeleteButton.Click;
end;

procedure TTaxInvoicesEditAddForm.FirstSummaAll;
var
  p:Double;
begin
  TaxInvoicesEditDM.FirstSummaAllDSet.Close;
  TaxInvoicesEditDM.FirstSummaAllDSet.SelectSQL.Text := 'select * from TI_FIRST_SUMMA_ALL(:id)';
  TaxInvoicesEditDM.FirstSummaAllDSet.ParamByName('id').Value := id_vid_nakl_doc_Ins;
  TaxInvoicesEditDM.FirstSummaAllDSet.Open;

  if (TaxInvoicesEditDM.FirstSummaAllDSet['value_delivery_20'] = null) then
    FirstAllStatusBar.Panels[5].Text := ''
  else
  begin
    p:= TaxInvoicesEditDM.FirstSummaAllDSet['value_delivery_20'];
    if (trunc(p) = p) then
      begin
       FirstAllStatusBar.Panels[5].Text := FloatToStr(p) + ',00';
      end
    else
      FirstAllStatusBar.Panels[5].Text := FloatToStr(p);
  end;

  if (TaxInvoicesEditDM.FirstSummaAllDSet['value_delivery_customs'] = null) then
    FirstAllStatusBar.Panels[6].Text := ''
  else
  begin
    p:= TaxInvoicesEditDM.FirstSummaAllDSet['value_delivery_customs'];
    if (trunc(p) = p) then
      begin
       FirstAllStatusBar.Panels[6].Text := FloatToStr(p) + ',00';
      end
    else
      FirstAllStatusBar.Panels[6].Text := FloatToStr(p);
  end;

  if (TaxInvoicesEditDM.FirstSummaAllDSet['value_delivery_export'] = null) then
    FirstAllStatusBar.Panels[7].Text := ''
  else
  begin
    p:= TaxInvoicesEditDM.FirstSummaAllDSet['value_delivery_export'];
    if (trunc(p) = p) then
      begin
       FirstAllStatusBar.Panels[7].Text := FloatToStr(p) + ',00';
      end
    else
      FirstAllStatusBar.Panels[7].Text := FloatToStr(p);
  end;

  if (TaxInvoicesEditDM.FirstSummaAllDSet['value_delivery_vat_exemption'] = null) then
    FirstAllStatusBar.Panels[8].Text := ''
  else
  begin
    p:= TaxInvoicesEditDM.FirstSummaAllDSet['value_delivery_vat_exemption'];
    if (trunc(p) = p) then
      begin
       FirstAllStatusBar.Panels[8].Text := FloatToStr(p) + ',00';
      end
    else
      FirstAllStatusBar.Panels[8].Text := FloatToStr(p);
  end;

  if (TaxInvoicesEditDM.FirstSummaAllDSet['summa_all'] = null) then
    FirstAllStatusBar.Panels[9].Text := ''
  else
  begin
    p:= TaxInvoicesEditDM.FirstSummaAllDSet['summa_all'];
    if (trunc(p) = p) then
      begin
       FirstAllStatusBar.Panels[9].Text := FloatToStr(p) + ',00';
      end
    else
      FirstAllStatusBar.Panels[9].Text := FloatToStr(p);
  end;

 { if (TaxInvoicesEditDM.FirstSummaAllDSet['value_delivery_customs'] = null) then
    FirstAllStatusBar.Panels[6].Text := ''
  else
    FirstAllStatusBar.Panels[6].Text := TaxInvoicesEditDM.FirstSummaAllDSet['value_delivery_customs'];

  if (TaxInvoicesEditDM.FirstSummaAllDSet['value_delivery_export'] = null) then
    FirstAllStatusBar.Panels[7].Text := ''
  else
    FirstAllStatusBar.Panels[7].Text := TaxInvoicesEditDM.FirstSummaAllDSet['value_delivery_export'];

  if (TaxInvoicesEditDM.FirstSummaAllDSet['value_delivery_vat_exemption'] = null) then
    FirstAllStatusBar.Panels[8].Text := ''
  else
    FirstAllStatusBar.Panels[8].Text := TaxInvoicesEditDM.FirstSummaAllDSet['value_delivery_vat_exemption'];

  if (TaxInvoicesEditDM.FirstSummaAllDSet['summa_all'] = null) then
    FirstAllStatusBar.Panels[9].Text := ''
  else
    FirstAllStatusBar.Panels[9].Text := TaxInvoicesEditDM.FirstSummaAllDSet['summa_all']; }

end;

procedure TTaxInvoicesEditAddForm.TransportInsBarButtonClick(
  Sender: TObject);
var
  ViewForm             : TTaxInvoicesEditAddInNaklForm;
  id_vid_nakl_delivery : Integer;
  AddParametr          : TTITaxInvoicesAddVidNaklDelivery;
begin
  AddParametr.id_range_of_delivery   := 0;
  AddParametr.Name_range_of_delivery := '';
  AddParametr.Id_Measures   := 0;
  AddParametr.Name_Measures := '';

  ViewForm := TTaxInvoicesEditAddInNaklForm.Create(Self,TaxInvoicesEditDM.DB.Handle,AddParametr);

  ViewForm.DataGroupBox.Visible              := False;
  ViewForm.DateShipmentLabel.Visible         := False;
  ViewForm.DateShipmentEdit.Visible          := False;
  ViewForm.RangeOfDeliveryLabel.Visible      := False;
  ViewForm.RangeOfDeliveryButtonEdit.Visible := False;
  ViewForm.DataGroupBox.Visible              := False;

  ViewForm.KolVoTextEdit.Text                    := '';
  ViewForm.PriceCurrencyEdit.Text                := '';
  ViewForm.ValueDeliveryExportCurrencyEdit.Text  := '';
  ViewForm.ValueDelivery20CurrencyEdit.Text      := '';
  ViewForm.ValueDeliveryCustomsCurrencyEdit.Text := '';
  ViewForm.ValueDeliveryVATexemptionsCurrencyEdit.Text := '';
  ViewForm.ReadReg;
  ViewForm.ShowModal;
  if (ViewForm.ModalResult = mrok) then
  begin
    TaxInvoicesEditDM.WriteTransaction.StartTransaction;
    TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                              := 'TI_SP_VID_NAKL_DELIVERY_INS';
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_measures').Value            := ViewForm.Parameter.Id_Measures;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('name_measures').Value          := ViewForm.Parameter.Name_Measures;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('kol_vo_delivery_goods').Value  := ViewForm.KolVoTextEdit.Text;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('price_delivery_goods').Value   := ViewForm.PriceCurrencyEdit.Value;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('value_delivery_20').Value      := ViewForm.ValueDelivery20CurrencyEdit.Value;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('value_delivery_export').Value  := ViewForm.ValueDeliveryExportCurrencyEdit.Value;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('value_delivery_customs').Value := ViewForm.ValueDeliveryCustomsCurrencyEdit.Value;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('value_delivery_vat_exemption').Value := ViewForm.ValueDeliveryVATexemptionsCurrencyEdit.Value;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_vid_nakl_doc').Value        := id_vid_nakl_doc_Ins;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('section').Value                := '2';
    TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
    TaxInvoicesEditDM.WriteTransaction.Commit;
    id_vid_nakl_delivery := TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DELIVERY_').AsInteger;
    RefreshButton.Click;
    TaxInvoicesEditDM.NaklDeliveryDSet.Locate('ID_VID_NAKL_DELIVERY',IntToStr(id_vid_nakl_delivery),[]);
  end;
end;

procedure TTaxInvoicesEditAddForm.TransportCosts;
begin
  TaxInvoicesEditDM.TransportCostsDSet.Close;
  TaxInvoicesEditDM.TransportCostsDSet.SelectSQL.Text := 'select * from TI_TRANSPORT_COSTS(:ID) ';
  TaxInvoicesEditDM.TransportCostsDSet.ParamByName('ID').Value := id_vid_nakl_doc_Ins;
  TaxInvoicesEditDM.TransportCostsDSet.Open;

  if (TaxInvoicesEditDM.TransportCostsDSet['summa_all'] = null) then
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


  if (TaxInvoicesEditDM.TransportCostsDSet['NAME_MEASURES'] = null) then
    TransportCostsStatusBar.Panels[2].Text := ''
  else
    TransportCostsStatusBar.Panels[2].Text := TaxInvoicesEditDM.TransportCostsDSet['NAME_MEASURES'];

  if (TaxInvoicesEditDM.TransportCostsDSet['kol_vo_delivery_goods'] = null) then
    TransportCostsStatusBar.Panels[3].Text := ''
  else
    TransportCostsStatusBar.Panels[3].Text := TaxInvoicesEditDM.TransportCostsDSet['kol_vo_delivery_goods'];

  if (TaxInvoicesEditDM.TransportCostsDSet['price_delivery_goods'] = null) then
    TransportCostsStatusBar.Panels[4].Text := ''
  else
    TransportCostsStatusBar.Panels[4].Text := TaxInvoicesEditDM.TransportCostsDSet['price_delivery_goods'];

  if (TaxInvoicesEditDM.TransportCostsDSet['value_delivery_20'] = null) then
    TransportCostsStatusBar.Panels[5].Text := ''
  else
    TransportCostsStatusBar.Panels[5].Text := TaxInvoicesEditDM.TransportCostsDSet['value_delivery_20'];

  if (TaxInvoicesEditDM.TransportCostsDSet['value_delivery_customs'] = null) then
    TransportCostsStatusBar.Panels[6].Text := ''
  else
    TransportCostsStatusBar.Panels[6].Text := TaxInvoicesEditDM.TransportCostsDSet['value_delivery_customs'];

  if (TaxInvoicesEditDM.TransportCostsDSet['value_delivery_export'] = null) then
    TransportCostsStatusBar.Panels[7].Text := ''
  else
    TransportCostsStatusBar.Panels[7].Text := TaxInvoicesEditDM.TransportCostsDSet['value_delivery_export'];

  if (TaxInvoicesEditDM.TransportCostsDSet['value_delivery_vat_exemption'] = null) then
    TransportCostsStatusBar.Panels[8].Text := ''
  else
    TransportCostsStatusBar.Panels[8].Text := TaxInvoicesEditDM.TransportCostsDSet['value_delivery_vat_exemption'];

  if (TaxInvoicesEditDM.TransportCostsDSet['summa_all'] = null) then
    TransportCostsStatusBar.Panels[9].Text := ''
  else
    TransportCostsStatusBar.Panels[9].Text := TaxInvoicesEditDM.TransportCostsDSet['summa_all'];
end;

procedure TTaxInvoicesEditAddForm.ClearStatusBars;
begin
  FirstAllStatusBar.Panels[5].Text := '';
  FirstAllStatusBar.Panels[6].Text := '';
  FirstAllStatusBar.Panels[7].Text := '';
  FirstAllStatusBar.Panels[8].Text := '';
  FirstAllStatusBar.Panels[9].Text := '';

  TransportCostsStatusBar.Panels[2].Text := '';
  TransportCostsStatusBar.Panels[3].Text := '';
  TransportCostsStatusBar.Panels[4].Text := '';
  TransportCostsStatusBar.Panels[5].Text := '';
  TransportCostsStatusBar.Panels[6].Text := '';
  TransportCostsStatusBar.Panels[7].Text := '';
  TransportCostsStatusBar.Panels[8].Text := '';

  MortgageTaraStatusBar.Panels[9].Text := '';
end;

procedure TTaxInvoicesEditAddForm.EnableButtons(id:Integer);
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

procedure TTaxInvoicesEditAddForm.TransportUpdBarButtonClick(
  Sender: TObject);
var
  ViewForm             : TTaxInvoicesEditAddInNaklForm;
  id_vid_nakl_delivery : Integer;
  AddParametr          : TTITaxInvoicesAddVidNaklDelivery;
begin
  id_vid_nakl_delivery := TaxInvoicesEditDM.TransportCostsDSet['id_vid_nakl_delivery'];
  AddParametr.id_range_of_delivery   := 0;
  AddParametr.Name_range_of_delivery := '';
  AddParametr.Id_Measures            := TaxInvoicesEditDM.TransportCostsDSet['Id_Measures'];
  AddParametr.Name_Measures          := TaxInvoicesEditDM.TransportCostsDSet['Name_Measures'];

  ViewForm := TTaxInvoicesEditAddInNaklForm.Create(Self,TaxInvoicesEditDM.DB.Handle,AddParametr);

  ViewForm.DataGroupBox.Visible              := False;
  ViewForm.DateShipmentLabel.Visible         := False;
  ViewForm.DateShipmentEdit.Visible          := False;
  ViewForm.RangeOfDeliveryLabel.Visible      := False;
  ViewForm.RangeOfDeliveryButtonEdit.Visible := False;

  ViewForm.MeasuresButtonEdit.Text               := TaxInvoicesEditDM.TransportCostsDSet['name_measures'];
  ViewForm.KolVoTextEdit.Text                    := TaxInvoicesEditDM.TransportCostsDSet['kol_vo_delivery_goods'];
  ViewForm.PriceCurrencyEdit.Text                := TaxInvoicesEditDM.TransportCostsDSet['price_delivery_goods'];
  ViewForm.ValueDeliveryExportCurrencyEdit.Text  := TaxInvoicesEditDM.TransportCostsDSet['value_delivery_export'];
  ViewForm.ValueDelivery20CurrencyEdit.Text      := TaxInvoicesEditDM.TransportCostsDSet['value_delivery_20'];
  ViewForm.ValueDeliveryCustomsCurrencyEdit.Text := TaxInvoicesEditDM.TransportCostsDSet['value_delivery_customs'];
  ViewForm.ValueDeliveryVATexemptionsCurrencyEdit.Text := TaxInvoicesEditDM.TransportCostsDSet['value_delivery_vat_exemption'];
  ViewForm.ShowModal;

  if (ViewForm.ModalResult = mrok) then
  begin
    TaxInvoicesEditDM.WriteTransaction.StartTransaction;
    TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                              := 'TI_SP_VID_NAKL_DELIVERY_UPD';
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_measures').Value            := ViewForm.Parameter.Id_Measures;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('name_measures').Value          := ViewForm.Parameter.Name_Measures;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('kol_vo_delivery_goods').Value  := ViewForm.KolVoTextEdit.Text;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('price_delivery_goods').Value   := ViewForm.PriceCurrencyEdit.Value;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('value_delivery_20').Value      := ViewForm.ValueDelivery20CurrencyEdit.Value;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('value_delivery_export').Value  := ViewForm.ValueDeliveryExportCurrencyEdit.Value;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('value_delivery_customs').Value := ViewForm.ValueDeliveryCustomsCurrencyEdit.Value;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('value_delivery_vat_exemption').Value := ViewForm.ValueDeliveryVATexemptionsCurrencyEdit.Value;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_vid_nakl_doc').Value        := id_vid_nakl_doc_Ins;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('section').Value                := '2';
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_vid_nakl_delivery').Value   := id_vid_nakl_delivery;
    TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
    TaxInvoicesEditDM.WriteTransaction.Commit;
    RefreshButton.Click;
    TaxInvoicesEditDM.NaklDeliveryDSet.Locate('ID_VID_NAKL_DELIVERY',IntToStr(id_vid_nakl_delivery),[]);
  end;
end;

procedure TTaxInvoicesEditAddForm.TransportDelBarButtonClick(
  Sender: TObject);
begin
  if TiShowMessage('Увага!','Ви дійсно бажаєте вилучити запис?',mtConfirmation,[mbYes, mbNo])=mrYes then
  begin
   try
     TaxInvoicesEditDM.WriteTransaction.StartTransaction;
     TaxInvoicesEditDM.pFIBStoredProc.StoredProcName:='TI_SP_VID_NAKL_DELIVERY_DEL';
     TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_vid_nakl_delivery').Value := TaxInvoicesEditDM.TransportCostsDSet['id_vid_nakl_delivery'];
     TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
     TaxInvoicesEditDM.WriteTransaction.Commit;
     RefreshButton.Click;
   except on E:Exception do
    begin
     TiShowMessage('Увага!','не можна видалити цей запис', mtError, [mbOK]);
     TaxInvoicesEditDM.WriteTransaction.Rollback;
    end;
   end;
  end;
end;

procedure TTaxInvoicesEditAddForm.TaraInsBarButtonClick(Sender: TObject);
var
  ViewForm             : TTaxInvoicesEditAddTaraForm;
  AddParametr          : TTITaxInvoicesAddTara;
begin
  AddParametr.id_tara   := 0;
  AddParametr.Name_tara := '';
  ViewForm := TTaxInvoicesEditAddTaraForm.Create(Self,TaxInvoicesEditDM.DB.Handle,AddParametr);
  //ViewForm.TaraButtonEdit.Text    := '';
  ViewForm.SummaCurrencyEdit.Text := '';
  ViewForm.ReadReg;
  ViewForm.ShowModal;
  if (ViewForm.ModalResult = mrok) then
  begin
    TaxInvoicesEditDM.WriteTransaction.StartTransaction;
    TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                       := 'TI_SP_VID_NAKL_TARE_INS';
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_TARE').Value         := ViewForm.Parameter.id_tara;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TARE').Value       := ViewForm.Parameter.Name_tara;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('SUMMA_ALL').Value       := ViewForm.SummaCurrencyEdit.Value;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value := id_vid_nakl_doc_Ins;
    TaxInvoicesEditDM.pFIBStoredProc.ExecProc;

    TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                       := 'TI_VID_NAKL_DOC_SUMMA_CALC';
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value := id_vid_nakl_doc_Ins;
    TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
    
    TaxInvoicesEditDM.WriteTransaction.Commit;
    RefreshButton.Click;
  end;
end;

procedure TTaxInvoicesEditAddForm.PodZobCheckBoxClick(Sender: TObject);
begin
    PodZobButtonEdit.Enabled := PodZobCheckBox.Checked;
end;

procedure TTaxInvoicesEditAddForm.PodKreditCheckBoxClick(Sender: TObject);
begin
  PodKreditButtonEdit.Enabled := PodKreditCheckBox.Checked;
end;

procedure TTaxInvoicesEditAddForm.OsoblPrimCheckBoxClick(Sender: TObject);
begin
  SpecialNotesButtonEdit.Enabled := OsoblPrimCheckBox.Checked;
end;

procedure TTaxInvoicesEditAddForm.MortgageTara;
begin
  TaxInvoicesEditDM.MortgageTaraDSet.Close;
  TaxInvoicesEditDM.MortgageTaraDSet.SelectSQL.Text := 'select * from TI_SP_VID_NAKL_TARE_SEL(:ID) ';
  TaxInvoicesEditDM.MortgageTaraDSet.ParamByName('ID').Value := id_vid_nakl_doc_Ins;
  TaxInvoicesEditDM.MortgageTaraDSet.Open;

  if (TaxInvoicesEditDM.MortgageTaraDSet['summa_all'] = null) then
  begin
    TaraInsBarButton.Enabled := True;
    TaraUpdBarButton.Enabled := False;
    TaraDelBarButton.Enabled := False;
    MortgageTaraStatusBar.Panels[9].Text := '';
    MortgageTaraStatusBar.Panels[1].Text := 'Зворотна(заставна тара)';
  end
  else
  begin
    TaraInsBarButton.Enabled := False;
    TaraUpdBarButton.Enabled := True;
    TaraDelBarButton.Enabled := True;
    MortgageTaraStatusBar.Panels[9].Text := TaxInvoicesEditDM.MortgageTaraDSet['summa_all'];
    MortgageTaraStatusBar.Panels[1].Text := TaxInvoicesEditDM.MortgageTaraDSet['name_tare'];
  end;

  if (id_vid_nakl_doc_Ins = -1) then
  begin
    TaraInsBarButton.Enabled := True;
    TaraUpdBarButton.Enabled := False;
    TaraDelBarButton.Enabled := False;
    MortgageTaraStatusBar.Panels[9].Text := '';
    MortgageTaraStatusBar.Panels[1].Text := 'Зворотна(заставна тара)';
  end;
end;

procedure TTaxInvoicesEditAddForm.TaraUpdBarButtonClick(Sender: TObject);
var
  ViewForm             : TTaxInvoicesEditAddTaraForm;
  AddParametr          : TTITaxInvoicesAddTara;
begin
  AddParametr.id_tara   := TaxInvoicesEditDM.MortgageTaraDSet['id_tare'];
  AddParametr.Name_tara := TaxInvoicesEditDM.MortgageTaraDSet['Name_tare'];
  ViewForm := TTaxInvoicesEditAddTaraForm.Create(Self,TaxInvoicesEditDM.DB.Handle,AddParametr);
  ViewForm.TaraButtonEdit.Text    := TaxInvoicesEditDM.MortgageTaraDSet['Name_tare'];
  ViewForm.SummaCurrencyEdit.Text := TaxInvoicesEditDM.MortgageTaraDSet['summa_all'];
//  ViewForm.ReadReg;
  ViewForm.ShowModal;
  if (ViewForm.ModalResult = mrok) then
  begin
    TaxInvoicesEditDM.WriteTransaction.StartTransaction;
    TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                        := 'TI_SP_VID_NAKL_TARE_UPD';
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_TARE').Value          := ViewForm.Parameter.id_tara;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_TARE').Value        := ViewForm.Parameter.Name_tara;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('SUMMA_ALL').Value        := ViewForm.SummaCurrencyEdit.Value;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value  := TaxInvoicesEditDM.MortgageTaraDSet['ID_VID_NAKL_DOC'];
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_vid_nakl_tare').Value := TaxInvoicesEditDM.MortgageTaraDSet['id_vid_nakl_tare'];
    TaxInvoicesEditDM.pFIBStoredProc.ExecProc;

    TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                       := 'TI_VID_NAKL_DOC_SUMMA_CALC';
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_VID_NAKL_DOC').Value := id_vid_nakl_doc_Ins;
    TaxInvoicesEditDM.pFIBStoredProc.ExecProc;

    TaxInvoicesEditDM.WriteTransaction.Commit;
    RefreshButton.Click;
  end;
end;

procedure TTaxInvoicesEditAddForm.TaraDelBarButtonClick(Sender: TObject);
var
  error_message: string;
begin
  error_message := 'Ви дійсно бажаєте вилучити '+TaxInvoicesEditDM.MortgageTaraDSet['name_tare']+' ?';
  if TiShowMessage('Увага!',error_message,mtConfirmation,[mbYes, mbNo])=mrYes then
  begin
   try
    TaxInvoicesEditDM.WriteTransaction.StartTransaction;
    TaxInvoicesEditDM.pFIBStoredProc.StoredProcName:='TI_SP_VID_NAKL_TARE_DEL';
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_vid_nakl_tare').Value:=TaxInvoicesEditDM.MortgageTaraDSet['id_vid_nakl_tare'];
    TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
    TaxInvoicesEditDM.WriteTransaction.Commit;
    RefreshButton.Click;
   except on E:Exception do
    begin
     TiShowMessage('Увага!','не можна видалити цей запис', mtError, [mbOK]);
     TaxInvoicesEditDM.WriteTransaction.Rollback;
    end;
   end;
  end;
end;

procedure TTaxInvoicesEditAddForm.DoPrint;
  const NameReport = '\Reports\TaxInvoices\1.fr3';
var
  num_specialnotes :string;
  data_nakl :string;
  data_termsdelivery :string;
begin
 TaxInvoicesEditDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReport,True);
  data_nakl := DateToStr(TaxInvoicesEditDM.VidNaklInfoDSet['DATA_VIPISKI']);
  TaxInvoicesEditDM.Report.Variables.Clear;
  TaxInvoicesEditDM.Report.Variables['D1']  := data_nakl[1];
  TaxInvoicesEditDM.Report.Variables['D2']  := data_nakl[2];
  TaxInvoicesEditDM.Report.Variables['D3']  := data_nakl[4];
  TaxInvoicesEditDM.Report.Variables['D4']  := data_nakl[5];
  TaxInvoicesEditDM.Report.Variables['D5']  := data_nakl[7];
  TaxInvoicesEditDM.Report.Variables['D6']  := data_nakl[8];
  TaxInvoicesEditDM.Report.Variables['D7']  := data_nakl[9];
  TaxInvoicesEditDM.Report.Variables['D8']  := data_nakl[10];

  if not (TaxInvoicesEditDM.VidNaklInfoDSet['NUM_SPECIALNOTES'] = null) then
  begin
    num_specialnotes := TaxInvoicesEditDM.VidNaklInfoDSet['NUM_SPECIALNOTES'];
    TaxInvoicesEditDM.Report.Variables['NUM1']:= num_specialnotes[1];
    TaxInvoicesEditDM.Report.Variables['NUM2']:= num_specialnotes[2];
  end
  else
  begin
    TaxInvoicesEditDM.Report.Variables['NUM1']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['NUM2']:= ''''+'''';
  end;

  if (not (TaxInvoicesEditDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'] = null) and (TaxInvoicesEditDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'] <> '01.01.1900')) then
  begin
    data_termsdelivery := TaxInvoicesEditDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'];
    TaxInvoicesEditDM.Report.Variables['TD1']  := data_termsdelivery[1];
    TaxInvoicesEditDM.Report.Variables['TD2']  := data_termsdelivery[2];
    TaxInvoicesEditDM.Report.Variables['TD3']  := data_termsdelivery[4];
    TaxInvoicesEditDM.Report.Variables['TD4']  := data_termsdelivery[5];
    TaxInvoicesEditDM.Report.Variables['TD5']  := data_termsdelivery[7];
    TaxInvoicesEditDM.Report.Variables['TD6']  := data_termsdelivery[8];
    TaxInvoicesEditDM.Report.Variables['TD7']  := data_termsdelivery[9];
    TaxInvoicesEditDM.Report.Variables['TD8']  := data_termsdelivery[10];
  end
  else
  begin
    TaxInvoicesEditDM.Report.Variables['TD1']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD2']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD3']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD4']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD5']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD6']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD7']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD8']  := ''''+'''';
  end;


 ModalResult := mrCancel;
 //TaxInvoicesEditDM.Report.DesignReport;
 //Close;
 TaxInvoicesEditDM.Report.ShowReport;

 {DSet1.First;
 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;  }
end;

procedure TTaxInvoicesEditAddForm.DataVipDateEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then PodNumTextEdit.SetFocus;
end;

procedure TTaxInvoicesEditAddForm.PodNumTextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then NumOrderTextEdit.SetFocus;
end;

procedure TTaxInvoicesEditAddForm.OsobaPokupButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then YesButton.SetFocus;
end;

procedure TTaxInvoicesEditAddForm.NumOrderTextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then IPNPokupTextEdit.SetFocus;
end;

procedure TTaxInvoicesEditAddForm.FormActivate(Sender: TObject);
begin
  PodNumTextEdit.SetFocus;
end;

procedure TTaxInvoicesEditAddForm.PostavkaButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
 if Key = #13 then DataTermsdelDateEdit.SetFocus;
end;

procedure TTaxInvoicesEditAddForm.DataTermsdelDateEditKeyPress(
  Sender: TObject; var Key: Char);
begin
 if Key = #13 then NumTermsDelTextEdit.SetFocus;
end;

procedure TTaxInvoicesEditAddForm.NumTermsDelTextEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then YesButton.SetFocus;
end;

procedure TTaxInvoicesEditAddForm.RozraxunokButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  YesButton.SetFocus;
end;

procedure TTaxInvoicesEditAddForm.PodZobButtonEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then PodNumTextEdit.SetFocus;
end;

procedure TTaxInvoicesEditAddForm.PodKreditButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then PodNumTextEdit.SetFocus;
end;

procedure TTaxInvoicesEditAddForm.SpecialNotesButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then PodNumTextEdit.SetFocus;
end;

procedure TTaxInvoicesEditAddForm.IPNPokupTextEditKeyPress(Sender: TObject;
  var Key: Char);
var
  id_customer :Integer;
begin
 if Key = #13 then
 begin
   if(IPNPokupTextEdit.Text<>'') then
   begin
     TaxInvoicesEditDM.Customer_DataSet.Close;
     TaxInvoicesEditDM.Customer_DataSet.SelectSQL.Text :='select * from TI_CUSTOMER_INFO_IPN(:NALOG_NOM)';
     TaxInvoicesEditDM.Customer_DataSet.ParamByName('NALOG_NOM').Value := IPNPokupTextEdit.Text;
     TaxInvoicesEditDM.Customer_DataSet.Open;
     if not (TaxInvoicesEditDM.Customer_DataSet['ID_CUSTOMER'] = null) then
      begin
        id_Customer := TaxInvoicesEditDM.Customer_DataSet['ID_CUSTOMER'];
        TaxInvoicesEditDM.Customer_DataSet.Close;
        TaxInvoicesEditDM.Customer_DataSet.SelectSQL.Text :='select * from TI_CUSTOMER_INFO(:id)';
        TaxInvoicesEditDM.Customer_DataSet.ParamByName('id').Value := id_Customer;
        TaxInvoicesEditDM.Customer_DataSet.Open;
        OsobaPokupButtonEdit.Text     := TaxInvoicesEditDM.Customer_DataSet['NAME_CUSTOMER'];
        PlacePokupMemo.Text       := TaxInvoicesEditDM.Customer_DataSet['ADRESS_CONTRAGENT'];
        EdrpTextEdit.Text             := TaxInvoicesEditDM.Customer_DataSet['KOD_EDRPOU'];
        IPNPokupTextEdit.Text         := TaxInvoicesEditDM.Customer_DataSet['NALOG_NOM'];
        NumReestrPokupTextEdit.Text   := TaxInvoicesEditDM.Customer_DataSet['NNS'];

        if (TaxInvoicesEditDM.Customer_DataSet['PHONE_CUSTOMER']<>null)then
          TelPokupTextEdit.Text       := TaxInvoicesEditDM.Customer_DataSet['PHONE_CUSTOMER']
        else
          TelPokupTextEdit.Text       :='---';

        PParameter.id_customer        := id_Customer;
        PParameter.Name_customer      := TaxInvoicesEditDM.Customer_DataSet['NAME_CUSTOMER'];
        PParameter.ipn_customer       := TaxInvoicesEditDM.Customer_DataSet['NALOG_NOM'];
        PParameter.place_customer     := TaxInvoicesEditDM.Customer_DataSet['ADRESS_CONTRAGENT'];
        PParameter.phone_customer     := TelPokupTextEdit.Text;
        PParameter.NumReestr_customer := TaxInvoicesEditDM.Customer_DataSet['NNS'];
        PParameter.EDRPOU_Customer    := TaxInvoicesEditDM.Customer_DataSet['KOD_EDRPOU'];


        if ((TaxInvoicesEditDM.Customer_DataSet['full_name_customer'] = '') or (TaxInvoicesEditDM.Customer_DataSet['full_name_customer']=null))then
        begin
          replaceAbreviatures(TaxInvoicesEditDM.Customer_DataSet['NAME_CUSTOMER']);
          PParameter.Full_name_customer := '';
          FullNameCheckBox.Checked   := True;
          FullNameMemo.ReadOnly      := False;
          SaveFullNameButton.Visible := True;
        end
        else
        begin
          FullNameMemo.Text := TaxInvoicesEditDM.Customer_DataSet['full_name_customer'];
          PParameter.Full_name_customer := TaxInvoicesEditDM.Customer_DataSet['full_name_customer'];
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
       PlacePokupMemo.Text     := '';
       EdrpTextEdit.Text           := '';
       NumReestrPokupTextEdit.Text := '';
     end;
   end
   else
     OsobaPokupButtonEdit.SetFocus;

 end;
end;

procedure TTaxInvoicesEditAddForm.PostavkaCheckBox1Click(Sender: TObject);
begin
  PostavkaButtonEdit.Enabled   := PostavkaCheckBox.Checked;
  DataTermsdelDateEdit.Enabled := PostavkaCheckBox.Checked;
  NumTermsDelTextEdit.Enabled  := PostavkaCheckBox.Checked;
end;

procedure TTaxInvoicesEditAddForm.RozraxunokCheckBox1Click(Sender: TObject);
begin
  RozraxunokButtonEdit.Enabled  := RozraxunokCheckBox.Checked;
end;

procedure TTaxInvoicesEditAddForm.RozraxunokCheckBoxClick(Sender: TObject);
begin
  RozraxunokButtonEdit.Enabled  := RozraxunokCheckBox.Checked;
end;

procedure TTaxInvoicesEditAddForm.PostavkaCheckBoxClick(Sender: TObject);
begin
  PostavkaButtonEdit.Enabled   := PostavkaCheckBox.Checked;
  DataTermsdelDateEdit.Enabled := PostavkaCheckBox.Checked;
  NumTermsDelTextEdit.Enabled  := PostavkaCheckBox.Checked;
end;

procedure TTaxInvoicesEditAddForm.PhoneCheckBoxClick(Sender: TObject);
begin
  TelPokupTextEdit.Enabled := PhoneCheckBox.Checked;
  SavePhoneButton.Visible := PhoneCheckBox.Checked;
end;

procedure TTaxInvoicesEditAddForm.FullNameCheckBoxClick(Sender: TObject);
begin
  FullNameMemo.ReadOnly := not(FullNameCheckBox.Checked);
  SaveFullNameButton.Visible := FullNameCheckBox.Checked;
end;

procedure TTaxInvoicesEditAddForm.SavePhoneButtonClick(Sender: TObject);
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
  TaxInvoicesEditDM.WriteTransaction.StartTransaction;
  TaxInvoicesEditDM.pFIBStoredProc.StoredProcName := 'TI_SP_CUSTOMER_PHONE_UPD';
  TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_customer').Value := PParameter.id_customer;
  TaxInvoicesEditDM.pFIBStoredProc.ParamByName('phone_customer').Value := TelPokupTextEdit.Text;
  TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
  TaxInvoicesEditDM.WriteTransaction.Commit;

  PhoneCheckBox.Checked    := False;
  TelPokupTextEdit.Enabled := False;
  SavePhoneButton.Visible  := False;
  PParameter.phone_customer := TelPokupTextEdit.Text;

end;

procedure TTaxInvoicesEditAddForm.replaceAbreviatures(short_name: string);
var
  i : Integer;
  short_name_abbreviature : string;
  long_name_abbreviature : string;
  p :Integer;
begin
  TaxInvoicesEditDM.AbbreviatureDSet.Close;
  TaxInvoicesEditDM.AbbreviatureDSet.SelectSQL.Text := 'select * from TI_SP_ABBREVIATIONS';
  TaxInvoicesEditDM.AbbreviatureDSet.Open;
  TaxInvoicesEditDM.AbbreviatureDSet.FetchAll;
  TaxInvoicesEditDM.AbbreviatureDSet.First;
  //ShowMessage(IntToStr(TaxInvoicesEditDM.AbbreviatureDSet.RecordCount));
  for i:=1 to TaxInvoicesEditDM.AbbreviatureDSet.RecordCount do
  begin
   short_name_abbreviature := TaxInvoicesEditDM.AbbreviatureDSet['short_name'];
   long_name_abbreviature := TaxInvoicesEditDM.AbbreviatureDSet['long_name'];

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
   TaxInvoicesEditDM.AbbreviatureDSet.Next;
  end;
  full_name_customer := short_name;
  FullNameMemo.Text := full_name_customer;
end;

procedure TTaxInvoicesEditAddForm.SaveFullNameButtonClick(Sender: TObject);
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
  TaxInvoicesEditDM.WriteTransaction.StartTransaction;
  TaxInvoicesEditDM.pFIBStoredProc.StoredProcName := 'TI_SP_CUSTOMER_FULL_NAME_UPD';
  TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_customer').Value := PParameter.id_customer;
  TaxInvoicesEditDM.pFIBStoredProc.ParamByName('full_name_customer').Value := FullNameMemo.Text;
  TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
  TaxInvoicesEditDM.WriteTransaction.Commit;

  FullNameCheckBox.Checked      := False;
  FullNameMemo.ReadOnly         := True;
  SaveFullNameButton.Visible    := False;
  PParameter.Full_name_customer := FullNameMemo.Text;
end;

procedure TTaxInvoicesEditAddForm.NumOrderTextEditExit(Sender: TObject);
begin
//  PodNumTextEdit.Text := NumOrderTextEdit.Text;
    if (TaxInvoicesEditDM.DSet['IS_SAME_NUM_NAKL'] = 1)then
    begin
      PodNumTextEdit.Text   := NumOrderTextEdit.Text;
    end
    else
    begin
      PodNumTextEdit.Text   := '';
    end;
end;

procedure TTaxInvoicesEditAddForm.DataVipDateEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then NumOrderTextEdit.SetFocus;
end;

procedure TTaxInvoicesEditAddForm.PlacePokupCheckBoxClick(Sender: TObject);
begin
  PlacePokupMemo.Properties.ReadOnly := not(PlacePokupCheckBox.Checked);
  SavePlacePokupButton.Visible := PlacePokupCheckBox.Checked;
end;

procedure TTaxInvoicesEditAddForm.SavePlacePokupButtonClick(
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
  TaxInvoicesEditDM.WriteTransaction.StartTransaction;
  TaxInvoicesEditDM.pFIBStoredProc.StoredProcName := 'TI_SP_CUSTOMER_FULL_ADR_UPD';
  TaxInvoicesEditDM.pFIBStoredProc.ParamByName('id_customer').Value := PParameter.id_customer;
  TaxInvoicesEditDM.pFIBStoredProc.ParamByName('FULL_ADR_CUSTOMER').Value := PlacePokupMemo.Text;
  TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
  TaxInvoicesEditDM.WriteTransaction.Commit;

  PlacePokupCheckBox.Checked         := False;
  PlacePokupMemo.Properties.ReadOnly := True;
  SavePlacePokupButton.Visible       := False;
  PParameter.place_customer          := PlacePokupMemo.Text;
end;

procedure TTaxInvoicesEditAddForm.DoPrintDecember;
  const NameReportDecabr2011 = '\Reports\TaxInvoices\VidNaklDecember.fr3';
  const NameReportMart2014 = '\Reports\TaxInvoices\VidNaklMart2014.fr3';
  const NameReportDecabr2014 = '\Reports\TaxInvoices\VidNaklDecember2014.fr3';
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
  num_nakl : string;
begin
  NotPDV := 'без ПДВ';

  if (TaxInvoicesEditDM.VidNaklInfoDSet['DATA_VIPISKI']<StrtoDate('01.03.2014')) then
    TaxInvoicesEditDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportDecabr2011,True)
  else
    if (TaxInvoicesEditDM.VidNaklInfoDSet['DATA_VIPISKI']>=StrtoDate('01.03.2014'))and(TaxInvoicesEditDM.VidNaklInfoDSet['DATA_VIPISKI']<StrtoDate('01.12.2014')) then
      TaxInvoicesEditDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportMart2014,True)
    else
      TaxInvoicesEditDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportDecabr2014,True);

  data_nakl := DateToStr(TaxInvoicesEditDM.VidNaklInfoDSet['DATA_VIPISKI']);
  ipn_prodavec := (TaxInvoicesEditDM.VidNaklInfoDSet['ipn_seller']);
  ipn_customer := (TaxInvoicesEditDM.VidNaklInfoDSet['ipn_customer']);
  sv_prodavec  := (TaxInvoicesEditDM.VidNaklInfoDSet['numreestr_seller']);
  sv_customer  := (TaxInvoicesEditDM.VidNaklInfoDSet['numreestr_customer']);
  tel_prodavec := TaxInvoicesEditDM.VidNaklInfoDSet['phone_seller'];
  tel_customer := TaxInvoicesEditDM.VidNaklInfoDSet['phone_customer'];
  num_nakl     := IntToStr(TaxInvoicesEditDM.VidNaklInfoDSet['num_nakl']);


  TaxInvoicesEditDM.Report.Variables.Clear;

  TaxInvoicesEditDM.Report.Variables['numn1']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['numn2']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['numn3']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['numn4']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['numn5']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['numn6']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['numn7']  := ''''+'''';

  TaxInvoicesEditDM.Report.Variables['tp1']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tp2']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tp3']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tp4']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tp5']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tp6']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tp7']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tp8']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tp9']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tp10'] := ''''+'''';

  TaxInvoicesEditDM.Report.Variables['tc1']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tc2']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tc3']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tc4']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tc5']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tc6']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tc7']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tc8']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tc9']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tc10'] := ''''+'''';

  TaxInvoicesEditDM.Report.Variables['sp1']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sp2']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sp3']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sp4']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sp5']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sp6']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sp7']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sp8']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sp9']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sp10'] := ''''+'''';

  TaxInvoicesEditDM.Report.Variables['sc1']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sc2']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sc3']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sc4']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sc5']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sc6']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sc7']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sc8']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sc9']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sc10'] := ''''+'''';

  TaxInvoicesEditDM.Report.Variables['D1']  := data_nakl[1];
  TaxInvoicesEditDM.Report.Variables['D2']  := data_nakl[2];
  TaxInvoicesEditDM.Report.Variables['D3']  := data_nakl[4];
  TaxInvoicesEditDM.Report.Variables['D4']  := data_nakl[5];
  TaxInvoicesEditDM.Report.Variables['D5']  := data_nakl[7];
  TaxInvoicesEditDM.Report.Variables['D6']  := data_nakl[8];
  TaxInvoicesEditDM.Report.Variables['D7']  := data_nakl[9];
  TaxInvoicesEditDM.Report.Variables['D8']  := data_nakl[10];

  i := 7;
  if (num_nakl <> '')then
  begin
   while Length(num_nakl)>0 do
   begin
    case i of
      1:TaxInvoicesEditDM.Report.Variables['numn1']  := Copy(num_nakl, Length(num_nakl), 1);
      2:TaxInvoicesEditDM.Report.Variables['numn2']  := Copy(num_nakl, Length(num_nakl), 1);
      3:TaxInvoicesEditDM.Report.Variables['numn3']  := Copy(num_nakl, Length(num_nakl), 1);
      4:TaxInvoicesEditDM.Report.Variables['numn4']  := Copy(num_nakl, Length(num_nakl), 1);
      5:TaxInvoicesEditDM.Report.Variables['numn5']  := Copy(num_nakl, Length(num_nakl), 1);
      6:TaxInvoicesEditDM.Report.Variables['numn6']  := Copy(num_nakl, Length(num_nakl), 1);
      7:TaxInvoicesEditDM.Report.Variables['numn7']  := Copy(num_nakl, Length(num_nakl), 1);
    end;
    Delete(num_nakl, Length(num_nakl), 1);
    i:=i-1;
   end;
  end
  else
  begin
    TaxInvoicesEditDM.Report.Variables['numn1']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['numn2']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['numn3']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['numn4']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['numn5']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['numn6']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['numn7']  := ''''+'''';
  end;


  i := 10;
  if (tel_prodavec <> '')then
  begin
   while Length(tel_prodavec)>0 do
   begin
    case i of
      1:TaxInvoicesEditDM.Report.Variables['tp1']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      2:TaxInvoicesEditDM.Report.Variables['tp2']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      3:TaxInvoicesEditDM.Report.Variables['tp3']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      4:TaxInvoicesEditDM.Report.Variables['tp4']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      5:TaxInvoicesEditDM.Report.Variables['tp5']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      6:TaxInvoicesEditDM.Report.Variables['tp6']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      7:TaxInvoicesEditDM.Report.Variables['tp7']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      8:TaxInvoicesEditDM.Report.Variables['tp8']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      9:TaxInvoicesEditDM.Report.Variables['tp9']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
     10:TaxInvoicesEditDM.Report.Variables['tp10'] := Copy(tel_prodavec, Length(tel_prodavec), 1);
    end;
    Delete(tel_prodavec, Length(tel_prodavec), 1);
    i:=i-1;
   end;
  end
  else
  begin
    TaxInvoicesEditDM.Report.Variables['tp1']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tp2']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tp3']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tp4']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tp5']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tp6']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tp7']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tp8']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tp9']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tp10'] := ''''+'''';
  end;


  i := 10;
  if (tel_customer<>'')then
  begin
   while Length(tel_customer)>0 do
   begin
    case i of
      1:TaxInvoicesEditDM.Report.Variables['tc1']  := Copy(tel_customer, Length(tel_customer), 1);
      2:TaxInvoicesEditDM.Report.Variables['tc2']  := Copy(tel_customer, Length(tel_customer), 1);
      3:TaxInvoicesEditDM.Report.Variables['tc3']  := Copy(tel_customer, Length(tel_customer), 1);
      4:TaxInvoicesEditDM.Report.Variables['tc4']  := Copy(tel_customer, Length(tel_customer), 1);
      5:TaxInvoicesEditDM.Report.Variables['tc5']  := Copy(tel_customer, Length(tel_customer), 1);
      6:TaxInvoicesEditDM.Report.Variables['tc6']  := Copy(tel_customer, Length(tel_customer), 1);
      7:TaxInvoicesEditDM.Report.Variables['tc7']  := Copy(tel_customer, Length(tel_customer), 1);
      8:TaxInvoicesEditDM.Report.Variables['tc8']  := Copy(tel_customer, Length(tel_customer), 1);
      9:TaxInvoicesEditDM.Report.Variables['tc9']  := Copy(tel_customer, Length(tel_customer), 1);
     10:TaxInvoicesEditDM.Report.Variables['tc10'] := Copy(tel_customer, Length(tel_customer), 1);
    end;
    Delete(tel_customer, Length(tel_customer), 1);
    i:=i-1;
   end;
  end
  else
  begin
    TaxInvoicesEditDM.Report.Variables['tc1']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tc2']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tc3']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tc4']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tc5']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tc6']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tc7']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tc8']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tc9']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tc10'] := ''''+'''';
  end;


  i := 10;
  while Length(sv_prodavec)>0 do
  begin
    case i of
      1:TaxInvoicesEditDM.Report.Variables['sp1']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      2:TaxInvoicesEditDM.Report.Variables['sp2']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      3:TaxInvoicesEditDM.Report.Variables['sp3']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      4:TaxInvoicesEditDM.Report.Variables['sp4']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      5:TaxInvoicesEditDM.Report.Variables['sp5']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      6:TaxInvoicesEditDM.Report.Variables['sp6']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      7:TaxInvoicesEditDM.Report.Variables['sp7']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      8:TaxInvoicesEditDM.Report.Variables['sp8']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      9:TaxInvoicesEditDM.Report.Variables['sp9']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
     10:TaxInvoicesEditDM.Report.Variables['sp10'] := Copy(sv_prodavec, Length(sv_prodavec), 1);
    end;
   Delete(sv_prodavec, Length(sv_prodavec), 1);
   i:=i-1;
  end;

  i := 10;
  while Length(sv_customer)>0 do
  begin
    case i of
      1:TaxInvoicesEditDM.Report.Variables['sc1']  := Copy(sv_customer, Length(sv_customer), 1);
      2:TaxInvoicesEditDM.Report.Variables['sc2']  := Copy(sv_customer, Length(sv_customer), 1);
      3:TaxInvoicesEditDM.Report.Variables['sc3']  := Copy(sv_customer, Length(sv_customer), 1);
      4:TaxInvoicesEditDM.Report.Variables['sc4']  := Copy(sv_customer, Length(sv_customer), 1);
      5:TaxInvoicesEditDM.Report.Variables['sc5']  := Copy(sv_customer, Length(sv_customer), 1);
      6:TaxInvoicesEditDM.Report.Variables['sc6']  := Copy(sv_customer, Length(sv_customer), 1);
      7:TaxInvoicesEditDM.Report.Variables['sc7']  := Copy(sv_customer, Length(sv_customer), 1);
      8:TaxInvoicesEditDM.Report.Variables['sc8']  := Copy(sv_customer, Length(sv_customer), 1);
      9:TaxInvoicesEditDM.Report.Variables['sc9']  := Copy(sv_customer, Length(sv_customer), 1);
     10:TaxInvoicesEditDM.Report.Variables['sc10'] := Copy(sv_customer, Length(sv_customer), 1);
    end;
   Delete(sv_customer, Length(sv_customer), 1);
   i:=i-1;
  end;

  if not ((TaxInvoicesEditDM.VidNaklInfoDSet['NUM_SPECIALNOTES'] = null) or (TaxInvoicesEditDM.VidNaklInfoDSet['NUM_SPECIALNOTES'] = '') ) then
  begin
    num_specialnotes := TaxInvoicesEditDM.VidNaklInfoDSet['NUM_SPECIALNOTES'];
    TaxInvoicesEditDM.Report.Variables['NUM1']:= num_specialnotes[1];
    TaxInvoicesEditDM.Report.Variables['NUM2']:= num_specialnotes[2];
  end
  else
  begin
    TaxInvoicesEditDM.Report.Variables['NUM1']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['NUM2']:= ''''+'''';
  end;

  if (not (TaxInvoicesEditDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'] = null) and (TaxInvoicesEditDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'] <> '01.01.1900')) then
  begin
    data_termsdelivery := TaxInvoicesEditDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'];
    TaxInvoicesEditDM.Report.Variables['TD1']  := data_termsdelivery[1];
    TaxInvoicesEditDM.Report.Variables['TD2']  := data_termsdelivery[2];
    TaxInvoicesEditDM.Report.Variables['TD3']  := data_termsdelivery[4];
    TaxInvoicesEditDM.Report.Variables['TD4']  := data_termsdelivery[5];
    TaxInvoicesEditDM.Report.Variables['TD5']  := data_termsdelivery[7];
    TaxInvoicesEditDM.Report.Variables['TD6']  := data_termsdelivery[8];
    TaxInvoicesEditDM.Report.Variables['TD7']  := data_termsdelivery[9];
    TaxInvoicesEditDM.Report.Variables['TD8']  := data_termsdelivery[10];
  end
  else
  begin
    TaxInvoicesEditDM.Report.Variables['TD1']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD2']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD3']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD4']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD5']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD6']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD7']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD8']  := ''''+'''';
  end;

  if ipn_prodavec = '0' then
  begin
    TaxInvoicesEditDM.Report.Variables['IP1']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP2']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP3']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP4']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP5']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP6']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP7']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP8']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP9']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP10']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP11']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP12']:= ipn_prodavec;
  end
  else
  begin
    TaxInvoicesEditDM.Report.Variables['IP1'] := ipn_prodavec[1];
    TaxInvoicesEditDM.Report.Variables['IP2'] := ipn_prodavec[2];
    TaxInvoicesEditDM.Report.Variables['IP3'] := ipn_prodavec[3];
    TaxInvoicesEditDM.Report.Variables['IP4'] := ipn_prodavec[4];
    TaxInvoicesEditDM.Report.Variables['IP5'] := ipn_prodavec[5];
    TaxInvoicesEditDM.Report.Variables['IP6'] := ipn_prodavec[6];
    TaxInvoicesEditDM.Report.Variables['IP7'] := ipn_prodavec[7];
    TaxInvoicesEditDM.Report.Variables['IP8'] := ipn_prodavec[8];
    TaxInvoicesEditDM.Report.Variables['IP9'] := ipn_prodavec[9];
    TaxInvoicesEditDM.Report.Variables['IP10']:= ipn_prodavec[10];
    TaxInvoicesEditDM.Report.Variables['IP11']:= ipn_prodavec[11];
    TaxInvoicesEditDM.Report.Variables['IP12']:= ipn_prodavec[12];
  end;

  if ipn_customer = '0' then
  begin
    TaxInvoicesEditDM.Report.Variables['IC1']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC2']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC3']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC4']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC5']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC6']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC7']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC8']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC9']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC10']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC11']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC12']:= ipn_customer;
  end
  else
  begin
    TaxInvoicesEditDM.Report.Variables['IC1'] := ipn_customer[1];
    TaxInvoicesEditDM.Report.Variables['IC2'] := ipn_customer[2];
    TaxInvoicesEditDM.Report.Variables['IC3'] := ipn_customer[3];
    TaxInvoicesEditDM.Report.Variables['IC4'] := ipn_customer[4];
    TaxInvoicesEditDM.Report.Variables['IC5'] := ipn_customer[5];
    TaxInvoicesEditDM.Report.Variables['IC6'] := ipn_customer[6];
    TaxInvoicesEditDM.Report.Variables['IC7'] := ipn_customer[7];
    TaxInvoicesEditDM.Report.Variables['IC8'] := ipn_customer[8];
    TaxInvoicesEditDM.Report.Variables['IC9'] := ipn_customer[9];
    TaxInvoicesEditDM.Report.Variables['IC10']:= ipn_customer[10];
    TaxInvoicesEditDM.Report.Variables['IC11']:= ipn_customer[11];
    TaxInvoicesEditDM.Report.Variables['IC12']:= ipn_customer[12];
  end;


 ModalResult := mrCancel;
 //TaxInvoicesEditDM.Report.DesignReport;
 //Close;
 TaxInvoicesEditDM.Report.ShowReport;

 {DSet1.First;
 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;  }
end;

procedure TTaxInvoicesEditAddForm.TypeDocumentButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  TypeDoc:Variant;
begin
  TypeDoc := LoadTypeDocumentPackage(owner,TaxInvoicesEditDM.DB.Handle,'TaxInvoices\TypeDocument.bpl','View_TypeDocument',2);
  If VarArrayDimCount(TypeDoc)>0 then
  begin
    PParameter.ID_TYPE_DOCUMENT   := TypeDoc[0];
    PParameter.NAME_TYPE_DOCUMENT := TypeDoc[1];
    TypeDocumentButtonEdit.Text   := TypeDoc[1];

    {if (OsoblPrimCheckBox.Checked = True) then
    begin
      // отбор типа причины по типу документа
      TaxInvoicesEditDM.WriteTransaction.StartTransaction;
      TaxInvoicesEditDM.pFIBStoredProc.StoredProcName := 'TI_SELECT_SPECIALNOTES_TYPE_DOC';
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_TYPE_DOC').Value := PParameter.ID_TYPE_DOCUMENT;
      TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
      TaxInvoicesEditDM.WriteTransaction.Commit;
      PParameter.id_SpecialNotes   := TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_SPECIALNOTES').Value;
      PParameter.Name_SpecialNotes := TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NUM_SPECIALNOTES').Value;
      SpecialNotesButtonEdit.Text  := TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_SPECIALNOTES').Value;
    end;}

  end;
end;

procedure TTaxInvoicesEditAddForm.DoPrintDecemberTwoEkz;
  const NameReportDecabr2011 = '\Reports\TaxInvoices\VidNaklDecemberTwoEkz.fr3';
  const NameReportMart2014 = '\Reports\TaxInvoices\VidNaklMart2014TwoEkz.fr3';
  const NameReportDecabr2014='\Reports\TaxInvoices\VidNaklDecember2014TwoEkz.fr3';
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
  num_nakl     : string;
begin
  NotPDV := 'без ПДВ';

  if (TaxInvoicesEditDM.VidNaklInfoDSet['DATA_VIPISKI']<StrtoDate('01.03.2014')) then
    TaxInvoicesEditDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportDecabr2011,True)
  else
    if (TaxInvoicesEditDM.VidNaklInfoDSet['DATA_VIPISKI']>=StrtoDate('01.03.2014'))and(TaxInvoicesEditDM.VidNaklInfoDSet['DATA_VIPISKI']<StrtoDate('01.12.2014')) then
      TaxInvoicesEditDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportMart2014,True)
    else
      TaxInvoicesEditDM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+NameReportDecabr2014,True);

  data_nakl := DateToStr(TaxInvoicesEditDM.VidNaklInfoDSet['DATA_VIPISKI']);
  ipn_prodavec := (TaxInvoicesEditDM.VidNaklInfoDSet['ipn_seller']);
  ipn_customer := (TaxInvoicesEditDM.VidNaklInfoDSet['ipn_customer']);
  sv_prodavec  := (TaxInvoicesEditDM.VidNaklInfoDSet['numreestr_seller']);
  sv_customer  := (TaxInvoicesEditDM.VidNaklInfoDSet['numreestr_customer']);
  tel_prodavec := TaxInvoicesEditDM.VidNaklInfoDSet['phone_seller'];
  tel_customer := TaxInvoicesEditDM.VidNaklInfoDSet['phone_customer'];
  num_nakl     := IntToStr(TaxInvoicesEditDM.VidNaklInfoDSet['num_nakl']);


  TaxInvoicesEditDM.Report.Variables.Clear;

  TaxInvoicesEditDM.Report.Variables['numn1']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['numn2']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['numn3']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['numn4']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['numn5']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['numn6']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['numn7']  := ''''+'''';

  TaxInvoicesEditDM.Report.Variables['tp1']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tp2']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tp3']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tp4']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tp5']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tp6']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tp7']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tp8']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tp9']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tp10'] := ''''+'''';

  TaxInvoicesEditDM.Report.Variables['tc1']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tc2']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tc3']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tc4']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tc5']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tc6']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tc7']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tc8']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tc9']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['tc10'] := ''''+'''';

  TaxInvoicesEditDM.Report.Variables['sp1']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sp2']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sp3']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sp4']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sp5']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sp6']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sp7']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sp8']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sp9']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sp10'] := ''''+'''';

  TaxInvoicesEditDM.Report.Variables['sc1']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sc2']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sc3']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sc4']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sc5']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sc6']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sc7']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sc8']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sc9']  := ''''+'''';
  TaxInvoicesEditDM.Report.Variables['sc10'] := ''''+'''';

  TaxInvoicesEditDM.Report.Variables['D1']  := data_nakl[1];
  TaxInvoicesEditDM.Report.Variables['D2']  := data_nakl[2];
  TaxInvoicesEditDM.Report.Variables['D3']  := data_nakl[4];
  TaxInvoicesEditDM.Report.Variables['D4']  := data_nakl[5];
  TaxInvoicesEditDM.Report.Variables['D5']  := data_nakl[7];
  TaxInvoicesEditDM.Report.Variables['D6']  := data_nakl[8];
  TaxInvoicesEditDM.Report.Variables['D7']  := data_nakl[9];
  TaxInvoicesEditDM.Report.Variables['D8']  := data_nakl[10];

  i := 7;
  if (num_nakl <> '')then
  begin
   while Length(num_nakl)>0 do
   begin
    case i of
      1:TaxInvoicesEditDM.Report.Variables['numn1']  := Copy(num_nakl, Length(num_nakl), 1);
      2:TaxInvoicesEditDM.Report.Variables['numn2']  := Copy(num_nakl, Length(num_nakl), 1);
      3:TaxInvoicesEditDM.Report.Variables['numn3']  := Copy(num_nakl, Length(num_nakl), 1);
      4:TaxInvoicesEditDM.Report.Variables['numn4']  := Copy(num_nakl, Length(num_nakl), 1);
      5:TaxInvoicesEditDM.Report.Variables['numn5']  := Copy(num_nakl, Length(num_nakl), 1);
      6:TaxInvoicesEditDM.Report.Variables['numn6']  := Copy(num_nakl, Length(num_nakl), 1);
      7:TaxInvoicesEditDM.Report.Variables['numn7']  := Copy(num_nakl, Length(num_nakl), 1);
    end;
    Delete(num_nakl, Length(num_nakl), 1);
    i:=i-1;
   end;
  end
  else
  begin
    TaxInvoicesEditDM.Report.Variables['numn1']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['numn2']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['numn3']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['numn4']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['numn5']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['numn6']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['numn7']  := ''''+'''';
  end;

  i := 10;
  if (tel_prodavec <> '')then
  begin
   while Length(tel_prodavec)>0 do
   begin
    case i of
      1:TaxInvoicesEditDM.Report.Variables['tp1']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      2:TaxInvoicesEditDM.Report.Variables['tp2']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      3:TaxInvoicesEditDM.Report.Variables['tp3']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      4:TaxInvoicesEditDM.Report.Variables['tp4']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      5:TaxInvoicesEditDM.Report.Variables['tp5']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      6:TaxInvoicesEditDM.Report.Variables['tp6']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      7:TaxInvoicesEditDM.Report.Variables['tp7']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      8:TaxInvoicesEditDM.Report.Variables['tp8']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
      9:TaxInvoicesEditDM.Report.Variables['tp9']  := Copy(tel_prodavec, Length(tel_prodavec), 1);
     10:TaxInvoicesEditDM.Report.Variables['tp10'] := Copy(tel_prodavec, Length(tel_prodavec), 1);
    end;
    Delete(tel_prodavec, Length(tel_prodavec), 1);
    i:=i-1;
   end;
  end
  else
  begin
    TaxInvoicesEditDM.Report.Variables['tp1']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tp2']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tp3']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tp4']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tp5']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tp6']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tp7']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tp8']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tp9']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tp10'] := ''''+'''';
  end;


  i := 10;
  if (tel_customer<>'')then
  begin
   while Length(tel_customer)>0 do
   begin
    case i of
      1:TaxInvoicesEditDM.Report.Variables['tc1']  := Copy(tel_customer, Length(tel_customer), 1);
      2:TaxInvoicesEditDM.Report.Variables['tc2']  := Copy(tel_customer, Length(tel_customer), 1);
      3:TaxInvoicesEditDM.Report.Variables['tc3']  := Copy(tel_customer, Length(tel_customer), 1);
      4:TaxInvoicesEditDM.Report.Variables['tc4']  := Copy(tel_customer, Length(tel_customer), 1);
      5:TaxInvoicesEditDM.Report.Variables['tc5']  := Copy(tel_customer, Length(tel_customer), 1);
      6:TaxInvoicesEditDM.Report.Variables['tc6']  := Copy(tel_customer, Length(tel_customer), 1);
      7:TaxInvoicesEditDM.Report.Variables['tc7']  := Copy(tel_customer, Length(tel_customer), 1);
      8:TaxInvoicesEditDM.Report.Variables['tc8']  := Copy(tel_customer, Length(tel_customer), 1);
      9:TaxInvoicesEditDM.Report.Variables['tc9']  := Copy(tel_customer, Length(tel_customer), 1);
     10:TaxInvoicesEditDM.Report.Variables['tc10'] := Copy(tel_customer, Length(tel_customer), 1);
    end;
    Delete(tel_customer, Length(tel_customer), 1);
    i:=i-1;
   end;
  end
  else
  begin
    TaxInvoicesEditDM.Report.Variables['tc1']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tc2']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tc3']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tc4']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tc5']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tc6']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tc7']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tc8']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tc9']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['tc10'] := ''''+'''';
  end;


  i := 10;
  while Length(sv_prodavec)>0 do
  begin
    case i of
      1:TaxInvoicesEditDM.Report.Variables['sp1']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      2:TaxInvoicesEditDM.Report.Variables['sp2']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      3:TaxInvoicesEditDM.Report.Variables['sp3']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      4:TaxInvoicesEditDM.Report.Variables['sp4']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      5:TaxInvoicesEditDM.Report.Variables['sp5']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      6:TaxInvoicesEditDM.Report.Variables['sp6']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      7:TaxInvoicesEditDM.Report.Variables['sp7']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      8:TaxInvoicesEditDM.Report.Variables['sp8']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
      9:TaxInvoicesEditDM.Report.Variables['sp9']  := Copy(sv_prodavec, Length(sv_prodavec), 1);
     10:TaxInvoicesEditDM.Report.Variables['sp10'] := Copy(sv_prodavec, Length(sv_prodavec), 1);
    end;
   Delete(sv_prodavec, Length(sv_prodavec), 1);
   i:=i-1;
  end;

  i := 10;
  while Length(sv_customer)>0 do
  begin
    case i of
      1:TaxInvoicesEditDM.Report.Variables['sc1']  := Copy(sv_customer, Length(sv_customer), 1);
      2:TaxInvoicesEditDM.Report.Variables['sc2']  := Copy(sv_customer, Length(sv_customer), 1);
      3:TaxInvoicesEditDM.Report.Variables['sc3']  := Copy(sv_customer, Length(sv_customer), 1);
      4:TaxInvoicesEditDM.Report.Variables['sc4']  := Copy(sv_customer, Length(sv_customer), 1);
      5:TaxInvoicesEditDM.Report.Variables['sc5']  := Copy(sv_customer, Length(sv_customer), 1);
      6:TaxInvoicesEditDM.Report.Variables['sc6']  := Copy(sv_customer, Length(sv_customer), 1);
      7:TaxInvoicesEditDM.Report.Variables['sc7']  := Copy(sv_customer, Length(sv_customer), 1);
      8:TaxInvoicesEditDM.Report.Variables['sc8']  := Copy(sv_customer, Length(sv_customer), 1);
      9:TaxInvoicesEditDM.Report.Variables['sc9']  := Copy(sv_customer, Length(sv_customer), 1);
     10:TaxInvoicesEditDM.Report.Variables['sc10'] := Copy(sv_customer, Length(sv_customer), 1);
    end;
   Delete(sv_customer, Length(sv_customer), 1);
   i:=i-1;
  end;

  if  ((TaxInvoicesEditDM.VidNaklInfoDSet['NAME_SPECIALNOTES_TWO_EKZ'] <>null) and  (TaxInvoicesEditDM.VidNaklInfoDSet['NAME_SPECIALNOTES_TWO_EKZ'] <>''))then
  begin
    num_specialnotes := TaxInvoicesEditDM.VidNaklInfoDSet['NUM_SPECIALNOTES_TWO_EKZ'];
    TaxInvoicesEditDM.Report.Variables['NUM1']:= num_specialnotes[1];
    TaxInvoicesEditDM.Report.Variables['NUM2']:= num_specialnotes[2];
  end
  else
  begin
    TaxInvoicesEditDM.Report.Variables['NUM1']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['NUM2']:= ''''+'''';
  end;

  if (not (TaxInvoicesEditDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'] = null) and (TaxInvoicesEditDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'] <> '01.01.1900')) then
  begin
    data_termsdelivery := TaxInvoicesEditDM.VidNaklInfoDSet['DATA_TERMSDELIVERY'];
    TaxInvoicesEditDM.Report.Variables['TD1']  := data_termsdelivery[1];
    TaxInvoicesEditDM.Report.Variables['TD2']  := data_termsdelivery[2];
    TaxInvoicesEditDM.Report.Variables['TD3']  := data_termsdelivery[4];
    TaxInvoicesEditDM.Report.Variables['TD4']  := data_termsdelivery[5];
    TaxInvoicesEditDM.Report.Variables['TD5']  := data_termsdelivery[7];
    TaxInvoicesEditDM.Report.Variables['TD6']  := data_termsdelivery[8];
    TaxInvoicesEditDM.Report.Variables['TD7']  := data_termsdelivery[9];
    TaxInvoicesEditDM.Report.Variables['TD8']  := data_termsdelivery[10];
  end
  else
  begin
    TaxInvoicesEditDM.Report.Variables['TD1']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD2']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD3']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD4']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD5']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD6']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD7']  := ''''+'''';
    TaxInvoicesEditDM.Report.Variables['TD8']  := ''''+'''';
  end;

  if ipn_prodavec = '0' then
  begin
    TaxInvoicesEditDM.Report.Variables['IP1']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP2']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP3']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP4']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP5']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP6']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP7']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP8']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP9']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP10']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP11']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IP12']:= ipn_prodavec;
  end
  else
  begin
    TaxInvoicesEditDM.Report.Variables['IP1'] := ipn_prodavec[1];
    TaxInvoicesEditDM.Report.Variables['IP2'] := ipn_prodavec[2];
    TaxInvoicesEditDM.Report.Variables['IP3'] := ipn_prodavec[3];
    TaxInvoicesEditDM.Report.Variables['IP4'] := ipn_prodavec[4];
    TaxInvoicesEditDM.Report.Variables['IP5'] := ipn_prodavec[5];
    TaxInvoicesEditDM.Report.Variables['IP6'] := ipn_prodavec[6];
    TaxInvoicesEditDM.Report.Variables['IP7'] := ipn_prodavec[7];
    TaxInvoicesEditDM.Report.Variables['IP8'] := ipn_prodavec[8];
    TaxInvoicesEditDM.Report.Variables['IP9'] := ipn_prodavec[9];
    TaxInvoicesEditDM.Report.Variables['IP10']:= ipn_prodavec[10];
    TaxInvoicesEditDM.Report.Variables['IP11']:= ipn_prodavec[11];
    TaxInvoicesEditDM.Report.Variables['IP12']:= ipn_prodavec[12];
  end;

  if ipn_customer = '0' then
  begin
    TaxInvoicesEditDM.Report.Variables['IC1']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC2']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC3']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC4']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC5']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC6']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC7']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC8']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC9']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC10']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC11']:= ''''+'''';
    TaxInvoicesEditDM.Report.Variables['IC12']:= ipn_customer;
  end
  else
  begin
    TaxInvoicesEditDM.Report.Variables['IC1'] := ipn_customer[1];
    TaxInvoicesEditDM.Report.Variables['IC2'] := ipn_customer[2];
    TaxInvoicesEditDM.Report.Variables['IC3'] := ipn_customer[3];
    TaxInvoicesEditDM.Report.Variables['IC4'] := ipn_customer[4];
    TaxInvoicesEditDM.Report.Variables['IC5'] := ipn_customer[5];
    TaxInvoicesEditDM.Report.Variables['IC6'] := ipn_customer[6];
    TaxInvoicesEditDM.Report.Variables['IC7'] := ipn_customer[7];
    TaxInvoicesEditDM.Report.Variables['IC8'] := ipn_customer[8];
    TaxInvoicesEditDM.Report.Variables['IC9'] := ipn_customer[9];
    TaxInvoicesEditDM.Report.Variables['IC10']:= ipn_customer[10];
    TaxInvoicesEditDM.Report.Variables['IC11']:= ipn_customer[11];
    TaxInvoicesEditDM.Report.Variables['IC12']:= ipn_customer[12];
  end;
 ModalResult := mrCancel;
 //TaxInvoicesEditDM.Report.DesignReport;
 //Close;
 TaxInvoicesEditDM.Report.ShowReport;

 {DSet1.First;
 if zDesignReport then Report.DesignReport
                  else Report.ShowReport;  }
end;

procedure TTaxInvoicesEditAddForm.ToolButton_addClick(Sender: TObject);
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

  Add := LoadDogManedger.AddKosht(self,TaxInvoicesEditDM.DB.Handle,-1,1,0,0,0,0,0,date);
      if VarArrayDimCount(Add) > 0 then
      begin
      {
      Cnt := VarArrayHighBound(Add, 1);
       Проверка, есть ли однаковые разделы, кеквы, статьи }

         i:=0;
        if TaxInvoicesEditDM.rxMemoryData_smet.Locate('id_smet',Add[i][7],[])=true then
         begin
          if TaxInvoicesEditDM.RxMemoryData_smet.Locate('id_razd',Add[i][8],[])=true then
           begin
            if TaxInvoicesEditDM.rxMemoryData_smet.Locate('id_stat',Add[i][9],[])=true then
             begin
              if TaxInvoicesEditDM.RxMemoryData_smet.Locate('id_kekv',Add[i][10],[])=true then
               begin
//                 MessageBox(0,'Found','Update',MB_OK);
                 TaxInvoicesEditDM.RxMemoryData_smet.Open;
                 TaxInvoicesEditDM.RxMemoryData_smet.Edit;
                 TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').Value := Add[i][3]+TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').Value;

                 TaxInvoicesEditDM.RxMemoryData_smet.Post;
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
      TaxInvoicesEditDM.RxMemoryData_smet.Locate('id', id_dt_smet, []);
      TaxInvoicesEditDM.RxMemoryData_smet.Open;
      TaxInvoicesEditDM.RxMemoryData_smet.Insert;
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_smet').Value := Add[i][7];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_razd').Value := Add[i][8];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_stat').Value := Add[i][9];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').Value := Add[i][3];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_smet').Value := Add[i][0];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_razd').Value := Add[i][1];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_stat').Value := Add[i][2];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('kod_smety').Value := Add[i][4];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_razd').Value := Add[i][5];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_stat').Value := Add[i][6];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_kekv').Value := Add[i][10];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('kod_kekv').Value := Add[i][11];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_kekv').Value := Add[i][12];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id').Value := 0;
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('flag_del').Value := 0;
      TaxInvoicesEditDM.RxMemoryData_smet.Post;


    end;
    end;
   // SumNds();
  end;
end;

procedure TTaxInvoicesEditAddForm.SpeedButton_redClick(Sender: TObject);
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
  if TaxInvoicesEditDM.RxMemoryData_smet.RecordCount = 0 then Exit;

  if TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300' then
  begin
    summa_NDS := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').AsCurrency;
  end
  else
    summa_Not_NDS := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').AsCurrency;

   Add := LoadDogManedger.AddKosht(self,TaxInvoicesEditDM.DB.Handle,-1,2,
                                   TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_smet').AsInteger,
                                   TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_razd').AsInteger,
                                   TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_stat').AsInteger,
                                   TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_kekv').AsInteger,
                                   TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').AsCurrency,date);
      if VarArrayDimCount(Add) > 0 then
      begin
        i:=0;
        TaxInvoicesEditDM.RxMemoryData_smet.Open;
        TaxInvoicesEditDM.RxMemoryData_smet.edit;
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_smet').Value   := Add[i][7];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_razd').Value   := Add[i][8];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_stat').Value   := Add[i][9];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').Value  := Add[i][3];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_smet').Value := Add[i][0];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_razd').Value := Add[i][1];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_stat').Value := Add[i][2];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('kod_smety').Value := Add[i][4];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_razd').Value    := Add[i][5];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_stat').Value    := Add[i][6];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_kekv').Value   := Add[i][10];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('kod_kekv').Value  := Add[i][11];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_kekv').Value := Add[i][12];
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id').Value := 0;
        TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('flag_del').Value := 0;
        TaxInvoicesEditDM.RxMemoryData_smet.Post;

     end;
end;

procedure TTaxInvoicesEditAddForm.ToolButton_delClick(Sender: TObject);
var
  summa_old_Not_NDS : Double;
  summa_old_NDS     : Double;
  summa_NDS         : Double;
  summa_Not_NDS     : Double;
begin
  if TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300' then
    begin
      summa_NDS := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').AsCurrency;
    end
  else


  if TaxInvoicesEditDM.RxMemoryData_smet.RecordCount = 0 then Exit;
  TaxInvoicesEditDM.RxMemoryData_smet.Delete;
end;

procedure TTaxInvoicesEditAddForm.BudgetButtonClick(Sender: TObject);
var
  ViewForm       : TTaxInvoicesEditBudgetForm;
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
begin
  RefreshButtonClick(Self);
  // ничего не делать, если старая налоговая
  if (TaxInvoicesEditDM.VidNaklInfoDSet['pk_id']='-1') then Exit;
  //проверка на пустоту сумм
  if (TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_20'] = null) then
    summa_val_deliv_20 := 0
  else
    summa_val_deliv_20 := TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_20'];

  if (TaxInvoicesEditDM.VidNaklInfoDSet['summa_tax'] = null) then
    summa_tax := 0
  else
    summa_tax := TaxInvoicesEditDM.VidNaklInfoDSet['summa_tax'];

  if (TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_vat_extemptions'] = null) then
    summa_val_deliv_vat_extemptions := 0
  else
    summa_val_deliv_vat_extemptions := TaxInvoicesEditDM.VidNaklInfoDSet['summa_val_deliv_vat_extemptions'];

  if ((summa_tax = 0) and (summa_val_deliv_vat_extemptions = 0) and (summa_val_deliv_20 = 0)) then
    begin
      ShowMessage('Заповніть суми податкової накладної');
      Exit;
    end;

  ViewForm := TTaxInvoicesEditBudgetForm.Create(Self,TaxInvoicesEditDM.DB.Handle, TaxInvoicesEditDM);
  ViewForm.Label_val_deliv_20.Caption := FloatToStrF(summa_val_deliv_20,ffFixed,10,2);
  ViewForm.Label_Tax.Caption          := FloatToStrF(summa_tax,ffFixed,10,2);
  ViewForm.Label_vat_extemption.Caption := FloatToStrF(summa_val_deliv_vat_extemptions,ffFixed,10,2);

  // отображение проводок
  for i := 0 to TaxInvoicesEditDM.RxMemoryData_smet.RecordCount - 1 do
    TaxInvoicesEditDM.RxMemoryData_smet.Delete;

    TaxInvoicesEditDM.Smeta_Vid_N_DSet.Close;
    TaxInvoicesEditDM.Smeta_Vid_N_DSet.SelectSQL.Text := 'select * from TI_BUDGET_NDS_SEL where id_nakl = :id and is_vid = 1';
    TaxInvoicesEditDM.Smeta_Vid_N_DSet.ParamByName('id').Value := id_vid_nakl_Ins;
    TaxInvoicesEditDM.Smeta_Vid_N_DSet.Open;
    TaxInvoicesEditDM.Smeta_Vid_N_DSet.FetchAll;
    TaxInvoicesEditDM.Smeta_Vid_N_DSet.First;
    sum_All_Nds     := 0;
    sum_All_Not_NDS := 0;
    for i := 0 to TaxInvoicesEditDM.Smeta_Vid_N_DSet.RecordCount-1 do
    begin
      TaxInvoicesEditDM.RxMemoryData_smet.Open;
      TaxInvoicesEditDM.RxMemoryData_smet.Insert;
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_smet').Value   := TaxInvoicesEditDM.Smeta_Vid_N_DSet['id_smet'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_razd').Value   := TaxInvoicesEditDM.Smeta_Vid_N_DSet['id_razd'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_stat').Value   := TaxInvoicesEditDM.Smeta_Vid_N_DSet['id_stat'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').Value  := TaxInvoicesEditDM.Smeta_Vid_N_DSet['sum_smet'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_smet').Value := TaxInvoicesEditDM.Smeta_Vid_N_DSet['name_smet'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_razd').Value := TaxInvoicesEditDM.Smeta_Vid_N_DSet['name_razd'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_stat').Value := TaxInvoicesEditDM.Smeta_Vid_N_DSet['name_stat'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('kod_smety').Value := TaxInvoicesEditDM.Smeta_Vid_N_DSet['kod_smety'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_razd').Value    := TaxInvoicesEditDM.Smeta_Vid_N_DSet['n_razd'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_stat').Value    := TaxInvoicesEditDM.Smeta_Vid_N_DSet['n_stat'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('id_kekv').Value   := TaxInvoicesEditDM.Smeta_Vid_N_DSet['id_kekv'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('kod_kekv').Value  := TaxInvoicesEditDM.Smeta_Vid_N_DSet['kod_kekv'];
      TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('name_kekv').Value := TaxInvoicesEditDM.Smeta_Vid_N_DSet['name_kekv'];
      TaxInvoicesEditDM.RxMemoryData_smet.Post;
      TaxInvoicesEditDM.Smeta_Vid_N_DSet.Next;

      if TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('n_stat').Value = '7300' then
        sum_All_Nds     := sum_All_Nds + TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').Value
      else
        sum_All_Not_NDS := sum_All_Not_NDS + TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('sum_smet').Value;
    end;
    if TaxInvoicesEditDM.Smeta_Vid_N_DSet.IsEmpty = True then
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

          {if TaxInvoicesEditDM.VidNaklInfoDSet['pk_id']= null
           then pk_id := 0
           else pk_id := StrToInt64(TaxInvoicesEditDM.VidNaklInfoDSet.FieldByName('pk_id').AsString); }

          {if ((pk_id = 0) or (pk_id = -1))
           then
              ViewForm.provodka := False
            else
            ViewForm.provodka := True;}


  ViewForm.ShowModal;
  if (ViewForm.ModalResult = mrok) then
  begin
    if TaxInvoicesEditDM.VidNaklInfoDSet['pk_id'] = '0' then
    begin
      //осуществить проводку
      TaxInvoicesEditDM.WriteTransaction.StartTransaction;
      //изменение проводок
      TaxInvoicesEditDM.pFIBStoredProc.StoredProcName               := 'TI_BUDGET_NDS_DEL';     // удаляем все проводки и перезаписываем
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_NAKL').Value := id_vid_nakl_Ins;
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_vid').Value  := 1 ;
      TaxInvoicesEditDM.pFIBStoredProc.ExecProc;

      // добавление проводок в таблицу TI_BUDGET_NDS
      TaxInvoicesEditDM.RxMemoryData_smet.First;
      for i:=0 to TaxInvoicesEditDM.RxMemoryData_smet.RecordCount - 1 do
      begin
        TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                   := 'TI_BUDGET_NDS_INS';
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_NAKL').Value     := id_vid_nakl_Ins;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_SMET').Value     := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('ID_SMET').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_RAZD').Value     := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('ID_RAZD').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_STAT').Value     := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('ID_STAT').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('SUM_SMET').Value    := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('SUM_SMET').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_SMET').Value   := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('NAME_SMET').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_RAZD').Value   := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('NAME_RAZD').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_STAT').Value   := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('NAME_STAT').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('KOD_SMETY').Value   := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('KOD_SMETY').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('N_RAZD').Value      := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('N_RAZD').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('N_STAT').Value      := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('N_STAT').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_KEKV').Value     := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('ID_KEKV').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('KOD_KEKV').Value    := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('KOD_KEKV').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_KEKV').Value   := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('NAME_KEKV').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_VID').Value      := 1;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_LGOTA').Value    := 0;
        TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
        TaxInvoicesEditDM.RxMemoryData_smet.Next;
      end;
      //если есть НДС - осуществляем проводку в бухгалтерию
      //TaxInvoicesEditDM.WriteTransaction.Commit;
     // TaxInvoicesEditDM.WriteTransaction.StartTransaction;
      if StrToFloat(ViewForm.Label_Tax.Caption)<>0 then
      begin
        //добавление проводок в буфера
        TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                          := 'TI_PROVODKA_VID_NAKL';
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_VID_NAKL').Value        := id_vid_nakl_Ins;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IP_ADRESS_COMPUTER').Value := TaxInvoicesUser.ip_computer;
        TaxInvoicesEditDM.pFIBStoredProc.ExecProc;

        // добавление проводки
        KEY_SESSION := TaxInvoicesEditDM.pFIBStoredProc.ParamByName('KEY_SESSION_DOC').value;
        workdate    := TaxInvoicesEditDM.pFIBStoredProc.ParamByName('DATE_PROV').value;
        //ShowMessage(IntToStr(KEY_SESSION));

        STRU.KEY_SESSION   := KEY_SESSION;
        STRU.WORKDATE      := WORKDATE;
        STRU.DBHANDLE      := TaxInvoicesEditDM.DB.Handle;
        STRU.TRHANDLE      := TaxInvoicesEditDM.WriteTransaction.Handle;
        STRU.KERNEL_ACTION := 1;
        STRU.ID_USER       := TaxInvoicesUser.id_user;

        try
          DoResult:=Kernel.KernelDo(@STRU);
        except
         on E:Exception do
         begin
           ShowMessage('Помилка ядра ' + E.Message);
           TaxInvoicesEditDM.WriteTransaction.Rollback;
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
         TaxInvoicesEditDM.WriteTransaction.Rollback;
         Exit;
       end;
      end;
      TaxInvoicesEditDM.WriteTransaction.Commit;
    end
    //если это изменение бюджетов удалить всё и записать новую проводку
    else
    begin
      TaxInvoicesEditDM.WriteTransaction.StartTransaction;
    //изменение проводок
      TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                   := 'TI_BUDGET_NDS_DEL';     // удаляем все проводки и перезаписываем
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_NAKL').Value := id_vid_nakl_Ins;
      TaxInvoicesEditDM.pFIBStoredProc.ParamByName('is_vid').Value  := 1;

      TaxInvoicesEditDM.pFIBStoredProc.ExecProc;

      TaxInvoicesEditDM.RxMemoryData_smet.First;
      for i:=0 to TaxInvoicesEditDM.RxMemoryData_smet.RecordCount - 1 do   //записываем новые
      begin
        TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                   := 'TI_BUDGET_NDS_INS';
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_NAKL').Value := id_vid_nakl_Ins;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_SMET').Value     := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('ID_SMET').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_RAZD').Value     := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('ID_RAZD').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_STAT').Value     := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('ID_STAT').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('SUM_SMET').Value    := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('SUM_SMET').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_SMET').Value   := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('NAME_SMET').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_RAZD').Value   := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('NAME_RAZD').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_STAT').Value   := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('NAME_STAT').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('KOD_SMETY').Value   := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('KOD_SMETY').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('N_RAZD').Value      := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('N_RAZD').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('N_STAT').Value      := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('N_STAT').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_KEKV').Value     := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('ID_KEKV').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('KOD_KEKV').Value    := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('KOD_KEKV').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('NAME_KEKV').Value   := TaxInvoicesEditDM.RxMemoryData_smet.FieldByName('NAME_KEKV').Value;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_VID').Value      := 1;
        TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IS_LGOTA').Value    := 0;
        TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
        TaxInvoicesEditDM.RxMemoryData_smet.Next;
      end;


              KEY_SESSION := TaxInvoicesEditDM.DB.Gen_Id('KERNEL_GEN_ID_SESSION', 1);
              STRU.KEY_SESSION := KEY_SESSION;
              STRU.WORKDATE := TaxInvoicesEditDM.VidNaklInfoDSet['date_prov'];
              STRU.DBHANDLE := TaxInvoicesEditDM.DB.Handle;
              STRU.TRHANDLE := TaxInvoicesEditDM.WriteTransaction.Handle;
              STRU.KERNEL_ACTION := 2;
              STRU.PK_ID := StrToInt64(TaxInvoicesEditDM.VidNaklInfoDSet.FieldByName('pk_id').AsString);
              STRU.ID_USER := TaxInvoicesUser.id_user;

              try
                DoResult:=Kernel.KernelDo(@STRU);
              //  TaxInvoicesDM.WriteTransaction.Commit;
              except
               on E:Exception do
               begin
                 ShowMessage('Помилка ядра ' + E.Message);
                 TaxInvoicesEditDM.WriteTransaction.Rollback;
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
                TaxInvoicesEditDM.WriteTransaction.Rollback;
                Exit;
              end;

              //добавление проводок в буфера
              TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                          := 'TI_PROVODKA_VID_NAKL';
              TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_VID_NAKL').Value        := id_vid_nakl_Ins;
              TaxInvoicesEditDM.pFIBStoredProc.ParamByName('IP_ADRESS_COMPUTER').Value := TaxInvoicesUser.ip_computer;
              TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
              // добавление проводки
              KEY_SESSION := TaxInvoicesEditDM.pFIBStoredProc.ParamByName('KEY_SESSION_DOC').value;
              workdate    := TaxInvoicesEditDM.pFIBStoredProc.ParamByName('DATE_PROV').value;

              STRU.KEY_SESSION   := KEY_SESSION;
              STRU.WORKDATE      := WORKDATE;
              STRU.DBHANDLE      := TaxInvoicesEditDM.DB.Handle;
              STRU.TRHANDLE      := TaxInvoicesEditDM.WriteTransaction.Handle;
              STRU.KERNEL_ACTION := 1;
              STRU.ID_USER       := TaxInvoicesUser.id_user;

              try
                DoResult:=Kernel.KernelDo(@STRU);
              except
                on E:Exception do
                begin
                 ShowMessage('Помилка ядра ' + E.Message);
                 TaxInvoicesEditDM.WriteTransaction.Rollback;
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
                TaxInvoicesEditDM.WriteTransaction.Rollback;
                Exit;
              end;
      TaxInvoicesEditDM.WriteTransaction.commit;
    end;
  end;
end;

procedure TTaxInvoicesEditAddForm.NoteCheckBoxClick(Sender: TObject);
begin
  NoteButtonEdit.Enabled  := NoteCheckBox.Checked;
end;

procedure TTaxInvoicesEditAddForm.NoteButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Parameter:TTiSimpleParam;
  Note:Variant;
begin
  Parameter := TTiSimpleParam.Create;
  Parameter.DB_Handle := TaxInvoicesEditDM.DB.Handle;
  Parameter.Owner := self;
  Note := DoFunctionFromPackage(Parameter,Notes_Const);
  Parameter.Destroy;
  If VarArrayDimCount(Note)>0 then
  begin
    NoteButtonEdit.Text     := Note[1];
    PParameter.id_note      := Note[0];
    PParameter.article_note := Note[1];
  end;
end;

procedure TTaxInvoicesEditAddForm.EditTaxButtonClick(Sender: TObject);
var
  ViewForm : TTaxInvoicesEditTaxForm;
begin
  ViewForm                      := TTaxInvoicesEditTaxForm.Create(Self,TaxInvoicesEditDM.DB.Handle);
  ViewForm.TaxCurrencyEdit.Text := TaxInvoicesEditDM.VidNaklInfoDSet['summa_tax'];
  ViewForm.ShowModal;
  if (ViewForm.ModalResult = mrok) then
  begin
    TaxInvoicesEditDM.WriteTransaction.StartTransaction;
    TaxInvoicesEditDM.pFIBStoredProc.StoredProcName                   := 'TI_UPD_TAX';
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('ID_NAKL_DOC').Value := id_vid_nakl_doc_Ins;
    TaxInvoicesEditDM.pFIBStoredProc.ParamByName('SUMMA_TAX').Value   := ViewForm.TaxCurrencyEdit.Value;
    TaxInvoicesEditDM.pFIBStoredProc.ExecProc;
    TaxInvoicesEditDM.WriteTransaction.Commit;
  end;
  RefreshButton.Click;
end;

procedure TTaxInvoicesEditAddForm.OznakaCheckBoxClick(Sender: TObject);
begin
  OznakaTextEdit.Enabled := OznakaCheckBox.Checked;
end;

end.
