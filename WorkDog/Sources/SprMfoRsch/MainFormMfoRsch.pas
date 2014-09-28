unit MainFormMfoRsch;
{*******************************************************************************
* MainFormMfoRsch                                                              *
*                                                                              *
* Справочник банковских и регистрационных реквизитов ДонНУ                     *
* Copyright ©  2004, Бурмистрова Е.                                            *
*******************************************************************************}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ToolWin, ComCtrls, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, ImgList, iBase, cxCheckBox,
  ActnList, Menus, Mask, ToolEdit, CurrEdit, cxTL, dxBar, dxBarExtItems,
  DBCtrls, dogLangPackUnit2, DogLoaderUnit,
  cxDropDownEdit, cxCalendar, cxRadioGroup, cxGroupBox;

type
  TfrmMainFormMfoRsch = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ImageList1: TImageList;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    pFIBDatabase: TpFIBDatabase;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSet_mfo_rsch: TpFIBDataSet;
    DataSource1: TDataSource;
    ActionList1: TActionList;
    add: TAction;
    red: TAction;
    del: TAction;
    upd: TAction;
    cl: TAction;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    dxBarManager1: TdxBarManager;
    DisabledLargeImages: TImageList;
    LargeImages: TImageList;
    dxBarLargeButton_add: TdxBarLargeButton;
    dxBarLargeButton_red: TdxBarLargeButton;
    dxBarLargeButton_upd: TdxBarLargeButton;
    dxBarLargeButton_del: TdxBarLargeButton;
    dxBarListItem1: TdxBarListItem;
    dxBarLargeButton_get: TdxBarLargeButton;
    dxBarLargeButton_close: TdxBarLargeButton;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    pFIBDataSet_get: TpFIBDataSet;
    pFIBDataSet_buff: TpFIBDataSet;
    Panel1: TPanel;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    cxCheckBox4: TcxCheckBox;
    cxCheckBox5: TcxCheckBox;
    cxCheckBox6: TcxCheckBox;
    cxCheckBox7: TcxCheckBox;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cxTextEdit_name: TcxTextEdit;
    cxTextEdit_put: TcxTextEdit;
    cxTextEdit_comment: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    CurrencyEdit_sum_pay: TCurrencyEdit;
    CurrencyEdit_sum_case: TCurrencyEdit;
    dxBarDateCombo1: TdxBarDateCombo;
    dxBarDateCombo2: TdxBarDateCombo;
    dxBarSubItem1: TdxBarSubItem;
    dxBarSubItem2: TdxBarSubItem;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    Label7: TLabel;
    cxDateEdit_def: TcxDateEdit;
    Label6: TLabel;
    SearchEdit: TcxTextEdit;
    cxGroupBox1: TcxGroupBox;
    RadioButtonMFO: TcxRadioButton;
    RadioButtonName: TcxRadioButton;
    cbAddKPK: TcxCheckBox;
    cbSP: TcxCheckBox;
    KPKFirst: TcxCheckBox;
    KEKVFirst: TcxCheckBox;
    ArndNDS: TcxCheckBox;
    cxCheckBoxSum: TcxCheckBox;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn9: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn10: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn11: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn12: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pFIBDataSet_mfo_rschAfterScroll(DataSet: TDataSet);
    procedure redExecute(Sender: TObject);
    procedure updExecute(Sender: TObject);
    procedure clExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure cxGrid1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure dxBarLargeButton_closeClick(Sender: TObject);
    procedure dxBarLargeButton_redClick(Sender: TObject);
    procedure dxBarLargeButton_updClick(Sender: TObject);
    procedure dxBarLargeButton_getClick(Sender: TObject);
    procedure pFIBDataSet_getAfterScroll(DataSet: TDataSet);
    procedure cxDateEdit1PropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SearchEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
  constructor Create (Aowner:TComponent;DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; Pr_vizova: String; id_rate_native: Variant); overload;
    { Public declarations }
  end;
  function WorkSpMfoRsch(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; Pr_vizova: String; id_rate_native: Variant):Variant;stdcall;
  exports WorkSpMfoRsch;
var
  frmMainFormMfoRsch: TfrmMainFormMfoRsch;
  ret_mfo_rsch: Variant;
  priznak_vizova: String;
  id_locate: Int64;

implementation
uses
  mfo_rsch_edit, WSUnit;

{$R *.dfm}

constructor TfrmMainFormMfoRsch.Create (Aowner:TComponent;DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; Pr_vizova: String; id_rate_native: Variant);
var
  DataSet: TpFIBDataSet;
  f : TForm;
begin
  inherited Create (Aowner);
  pFIBDatabase.Handle := DBHANDLE;

  f := WaitScreenShow(Self);
  id_locate := id_rate_native;
  DataSet := TpFIBDataSet.Create(Self);
  DataSet.Database := pFIBDatabase;
  DataSet.Transaction := pFIBTransactionRead;
  DataSet.SQLs.SelectSQL.Text := 'select pub_sp_customer.short_name, a.ORGANIZATION ' +
                                 'from   pub_sp_customer, pub_sys_data a ' +
                                 'where  pub_sp_customer.id_customer=a.organization';
  DataSet.Active := true;

  if (Pr_vizova = 'spr') or (Pr_vizova = 'type_dog') then
  begin
    pFIBDataSet_buff.Active := false;
    pFIBDataSet_buff.Active := true;
    pFIBDataSet_mfo_rsch.Active := false;
    pFIBDataSet_mfo_rsch.ParamByName('ddd').Value := Date;
    pFIBDataSet_mfo_rsch.ParamByName('p').Value := DataSet.FBN('ORGANIZATION').AsInteger;
    pFIBDataSet_mfo_rsch.Active := true;
    {позиционирование при выборе}
    if id_rate_native > 0 then
    pFIBDataSet_mfo_rsch.Locate('id_rate_account', id_rate_native, []);

    FormStyle:=frmStyle;
    Caption := 'Банківські та реєстраційні реквізити'+' '+DataSet.FieldByName('short_name').AsString;
    Priznak_vizova := pr_vizova;
  end
  else
  begin
    pFIBDataSet_buff.Active := false;
    pFIBDataSet_buff.Active := true;
    DataSource1.DataSet := pFIBDataSet_get;
    pFIBDataSet_get.Active := false;
    pFIBDataSet_get.ParamByName('ddd').Value := Date;
    pFIBDataSet_get.ParamByName('p').Value := DataSet.FBN('ORGANIZATION').AsInteger;
    pFIBDataSet_get.Active := true;
    {позиционирование при выборе}
    if id_rate_native > 0 then
    pFIBDataSet_get.Locate('id_rate_account', id_rate_native, []);
    FormStyle:=frmStyle;
    Caption := 'Банківські та реєстраційні реквізити'+' '+DataSet.FieldByName('short_name').AsString;
    Priznak_vizova := pr_vizova;
  end;
  DataSet.Close;
  DataSet.Free;
  WaitScreenClose(f);
end;


function WorkSpMfoRsch(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; Pr_vizova: String; id_rate_native: Variant):Variant;
var
  MfoRsch: TfrmMainFormMfoRsch;
begin
  MfoRsch := TfrmMainFormMfoRsch.Create(AOwner, DBHandle, frmStyle, Pr_vizova, id_rate_native);
  if frmStyle = fsNormal then
  begin
    MfoRsch.ShowModal;
    MfoRsch.Free;
    WorkSpMfoRsch := ret_mfo_rsch;     // возвращает данные по рег. данным
  end;
end;


procedure TfrmMainFormMfoRsch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMainFormMfoRsch.FormCreate(Sender: TObject);
begin

//  pFIBDataSet_mfo_rsch.Database := pFIBDatabase;
//  pFIBDataSet_mfo_rsch.Transaction := pFIBTransactionRead;
{  pFIBDataSet_mfo_rsch.Active := false;
  pFIBDataSet_mfo_rsch.Active := true;
 }
//  pFIBDataSet_get.Database := pFIBDatabase;
//  pFIBDataSet_get.Transaction := pFIBTransactionRead;
  {pFIBDataSet_get.Active := false;
  pFIBDataSet_get.Active := true;
 }
  //интерфейс
  cxGrid1DBTableView1DBColumn1.Caption   := rsh_MFO;
  cxGrid1DBTableView1DBColumn2.Caption   := rsh_RateAcc;
  cxGrid1DBTableView1DBColumn3.Caption   := rsh_Bank;
  cxCheckBox1.Properties.Caption         := rsn_Pr1;
  cxCheckBox2.Properties.Caption         := rsn_Pr2;
  cxCheckBox3.Properties.Caption         := rsn_Pr3;
  cxCheckBox4.Properties.Caption         := rsn_Pr4;
  cxCheckBox5.Properties.Caption         := rsn_Pr5;
  cxCheckBox6.Properties.Caption         := rsn_Pr6;
  cxCheckBox7.Properties.Caption         := rsn_Pr7;
  GroupBox3.Caption                      := rsn_Dan_buf;
  Label4.Caption                         := rsn_Put;
  Label5.Caption                         := rstd_Comment;
  Label2.Caption                         := rsn_Pr8;
  Label1.Caption                         := rsn_Pr9;
end;


procedure TfrmMainFormMfoRsch.pFIBDataSet_mfo_rschAfterScroll(
  DataSet: TDataSet);
begin
  cxCheckBox1.Checked := pFIBDataSet_mfo_rsch.FieldByName('CREATE_VIP').AsBoolean;
  cxCheckBox2.Checked := pFIBDataSet_mfo_rsch.FieldByName('CREATE_REE').AsBoolean;
  cxCheckBox3.Checked := pFIBDataSet_mfo_rsch.FieldByName('KAZNACHEY').AsBoolean;
  cxCheckBox4.Checked := pFIBDataSet_mfo_rsch.FieldByName('ADD_OKPO').AsBoolean;
  cxCheckBox5.Checked := pFIBDataSet_mfo_rsch.FieldByName('ADD_REGSCH').AsBoolean;
  cxCheckBox6.Checked := pFIBDataSet_mfo_rsch.FieldByName('ADD_KEKV').AsBoolean;
  cxCheckBox7.Checked := pFIBDataSet_mfo_rsch.FieldByName('REE_OUTCH').AsBoolean;
  cbAddKPK.Checked := pFIBDataSet_mfo_rsch.FieldByName('ADD_KPK').AsBoolean;
  cbSP.Checked := pFIBDataSet_mfo_rsch.FieldByName('ADD_SP').AsBoolean;
  KPKFirst.Checked := pFIBDataSet_mfo_rsch.FieldByName('ADD_KPK_FIRST').AsBoolean;
  KEKVFirst.Checked := pFIBDataSet_mfo_rsch.FieldByName('ADD_KEKV_FIRST').AsBoolean;
  ArndNDS.Checked:= pFIBDataSet_mfo_rsch.FieldByName('ARND_NDS_RAH').AsBoolean;
  cxCheckBoxSum.Checked:= pFIBDataSet_mfo_rsch.FieldByName('ADD_SUM').AsBoolean;

  CurrencyEdit_sum_pay.Text := pFIBDataSet_mfo_rsch.FieldByName('SUM_PAY').AsString;
  CurrencyEdit_sum_case.Text := pFIBDataSet_mfo_rsch.FieldByName('SUM_CASE').AsString;


  pFIBDataSet_buff.Active := false;
  pFIBDataSet_buff.ParamByName('d_id_rate_acc').Value := pFIBDataSet_mfo_rsch.FieldByName('id_rate_account').AsVariant;
  pFIBDataSet_buff.Active := true;
  cxTextEdit_name.Text := pFIBDataSet_buff.FieldByName('V_ALIAS_BUFF').AsString;
  cxTextEdit_put.Text := pFIBDataSet_buff.FieldByName('V_PATH_BUFF').AsString;
  cxTextEdit_comment.Text := pFIBDataSet_buff.FieldByName('V_COMMENT').AsString;
end;

procedure TfrmMainFormMfoRsch.redExecute(Sender: TObject);
begin
  dxBarLargeButton_redClick(Self);
end;

procedure TfrmMainFormMfoRsch.updExecute(Sender: TObject);
begin
  dxBarLargeButton_updClick(Self);
end;

procedure TfrmMainFormMfoRsch.clExecute(Sender: TObject);
begin
  dxBarLargeButton_closeClick(Self);
end;

procedure TfrmMainFormMfoRsch.N1Click(Sender: TObject);
begin
  dxBarLargeButton_redClick(Self);
end;

procedure TfrmMainFormMfoRsch.N2Click(Sender: TObject);
begin
  dxBarLargeButton_updClick(Self);
end;

procedure TfrmMainFormMfoRsch.cxGrid1DblClick(Sender: TObject);
begin
  if priznak_vizova <> 'spr' then dxBarLargeButton_getClick(Self);
end;

procedure TfrmMainFormMfoRsch.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  if (priznak_vizova = 'get') or (priznak_vizova = 'type_dog') then
  begin
    dxBarLargeButton_getClick(Self);
  end;
end;

procedure TfrmMainFormMfoRsch.dxBarLargeButton_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainFormMfoRsch.dxBarLargeButton_redClick(Sender: TObject);
var
  MfoRate: TfrmMfoRsch_edit;
  id_rate: Variant;
begin
  if priznak_vizova = 'spr' then
  id_rate := pFIBDataSet_mfo_rsch.FieldByName('id_rate_account').AsVariant
  else
  id_rate := pFIBDataSet_get.FieldByName('id_rate_account').AsVariant;

  MfoRate := TfrmMfoRsch_edit.Create(Self, id_rate ,true);
  MfoRate.ShowModal;

 if MfoRate.ModalResult = mrOk then
 begin
  pFIBDataSet_mfo_rsch.Active := false;
  pFIBDataSet_mfo_rsch.Active := true;
  pFIBDataSet_mfo_rsch.Locate('id_rate_account', id_rate, []);

  pFIBDataSet_get.Active := false;
  pFIBDataSet_get.Active := true;
 end;
 MfoRate.Free;
end;

procedure TfrmMainFormMfoRsch.dxBarLargeButton_updClick(Sender: TObject);
begin
  pFIBDataSet_mfo_rsch.Active := false;
  pFIBDataSet_mfo_rsch.Active := true;
end;

procedure TfrmMainFormMfoRsch.dxBarLargeButton_getClick(Sender: TObject);
begin
if priznak_vizova = 'get' then
begin
  ret_mfo_rsch := VarArrayCreate([0,1], varVariant);
  ret_mfo_rsch[0] := VarArrayOf([
  pFIBDataSet_get.FieldByName('id_rate_account').AsVariant,
  pFIBDataSet_get.FieldByName('name_customer').AsString,
  pFIBDataSet_get.FieldByName('mfo').AsString,
  pFIBDataSet_get.FieldByName('rate_account').AsString,
  pFIBDataSet_get.FieldByName('name_mfo').AsString,
  pFIBDataSet_get.FieldByName('id_bank').AsVariant,
  pFIBDataSet_get.FieldByName('name_mfo').AsString,
  pFIBDataSet_get.FieldByName('sum_pay').AsVariant,
  pFIBDataSet_get.FieldByName('sum_case').AsVariant,
  pFIBDataSet_get.FieldByName('add_sum').AsVariant]);
  close;
end
else
begin
  ret_mfo_rsch := VarArrayCreate([0,1], varVariant);
  ret_mfo_rsch[0] := VarArrayOf([
  pFIBDataSet_mfo_rsch.FieldByName('id_rate_account').AsVariant,
  pFIBDataSet_mfo_rsch.FieldByName('name_customer').AsString,
  pFIBDataSet_mfo_rsch.FieldByName('mfo').AsString,
  pFIBDataSet_mfo_rsch.FieldByName('rate_account').AsString,
  pFIBDataSet_mfo_rsch.FieldByName('name_mfo').AsString,
  pFIBDataSet_mfo_rsch.FieldByName('id_bank').AsVariant,
  pFIBDataSet_mfo_rsch.FieldByName('name_mfo').AsString,
  pFIBDataSet_mfo_rsch.FieldByName('sum_pay').AsVariant,
  pFIBDataSet_mfo_rsch.FieldByName('sum_case').AsVariant,
  pFIBDataSet_mfo_rsch.FieldByName('add_sum').AsVariant,
  pFIBDataSet_mfo_rsch.FieldByName('name_rsch').AsVariant]);
  close;
end;
end;

procedure TfrmMainFormMfoRsch.pFIBDataSet_getAfterScroll(
  DataSet: TDataSet);
begin
  cxCheckBox1.Checked := pFIBDataSet_get.FieldByName('CREATE_VIP').AsBoolean;
  cxCheckBox2.Checked := pFIBDataSet_get.FieldByName('CREATE_REE').AsBoolean;
  cxCheckBox3.Checked := pFIBDataSet_get.FieldByName('KAZNACHEY').AsBoolean;
  cxCheckBox4.Checked := pFIBDataSet_get.FieldByName('ADD_OKPO').AsBoolean;
  cxCheckBox5.Checked := pFIBDataSet_get.FieldByName('ADD_REGSCH').AsBoolean;
  cxCheckBox6.Checked := pFIBDataSet_get.FieldByName('ADD_KEKV').AsBoolean;
  cxCheckBox7.Checked := pFIBDataSet_get.FieldByName('REE_OUTCH').AsBoolean;
  cbAddKPK.Checked := pFIBDataSet_get.FieldByName('ADD_KPK').AsBoolean;
  cbSP.Checked := pFIBDataSet_get.FieldByName('ADD_SP').AsBoolean;
  ArndNDS.Checked:= pFIBDataSet_get.FieldByName('ARND_NDS_RAH').AsBoolean;
  cxCheckBoxSum.Checked:= pFIBDataSet_get.FieldByName('ADD_SUM').AsBoolean;

  CurrencyEdit_sum_pay.Text := pFIBDataSet_get.FieldByName('SUM_PAY').AsString;
  CurrencyEdit_sum_case.Text := pFIBDataSet_get.FieldByName('SUM_CASE').AsString;

  pFIBDataSet_buff.Active := false;
  pFIBDataSet_buff.ParamByName('d_id_rate_acc').Value := pFIBDataSet_get.FieldByName('id_rate_account').AsVariant;
  pFIBDataSet_buff.Active := true;
  cxTextEdit_name.Text := pFIBDataSet_buff.FieldByName('V_ALIAS_BUFF').AsString;
  cxTextEdit_put.Text := pFIBDataSet_buff.FieldByName('V_PATH_BUFF').AsString;
  cxTextEdit_comment.Text := pFIBDataSet_buff.FieldByName('V_COMMENT').AsString;end;

procedure TfrmMainFormMfoRsch.cxDateEdit1PropertiesChange(Sender: TObject);
begin
if  Priznak_vizova = 'get' then
  begin
    pFIBDataSet_get.Active := false;
    pFIBDataSet_get.ParamByName('ddd').Value := cxDateEdit_def.Date;
    pFIBDataSet_get.Active := true;
  end
  else
  begin
    pFIBDataSet_mfo_rsch.Active := false;
    pFIBDataSet_mfo_rsch.ParamByName('ddd').Value := cxDateEdit_def.Date;
    pFIBDataSet_mfo_rsch.Active := true;
  end;
end;

procedure TfrmMainFormMfoRsch.FormShow(Sender: TObject);
begin
  cxDateEdit_def.Date := Date;
  if id_locate > 0 then
  if (priznak_vizova='get') then pFIBDataSet_get.Locate('id_rate_account', id_locate, [])
  else pFIBDataSet_mfo_rsch.Locate('id_rate_account', id_locate, []);
end;

procedure TfrmMainFormMfoRsch.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_RETURN) and (priznak_vizova <> 'spr') then
  dxBarLargeButton_getClick(Self);
end;

procedure TfrmMainFormMfoRsch.SearchEditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (priznak_vizova = 'spr') or (priznak_vizova = 'type_dog') then
  begin
   if RadioButtonMFO.Checked then pFIBDataSet_mfo_rsch.Locate('MFO', SearchEdit.Text, [loPartialKey]);
   if RadioButtonName.Checked then pFIBDataSet_mfo_rsch.Locate('RATE_ACCOUNT', SearchEdit.Text, [loPartialKey]);
   if Key = VK_return then
     begin
       cxGrid1.SetFocus;
     end;
  end
  else
  begin
   if RadioButtonMFO.Checked then pFIBDataSet_get.Locate('MFO', SearchEdit.Text, [loPartialKey]);
   if RadioButtonName.Checked then pFIBDataSet_get.Locate('RATE_ACCOUNT', SearchEdit.Text, [loPartialKey]);
   if Key = VK_return then
     begin
       cxGrid1.SetFocus;
     end;
  end;
end;

end.
