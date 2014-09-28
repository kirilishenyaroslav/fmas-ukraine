unit SprTypeDogEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxMaskEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, Buttons, ExtCtrls, ComCtrls, cxMemo, cxDropDownEdit,
  cxMRUEdit, DB, FIBDataSet, pFIBDataSet, MainFormSprTypeDog, cxButtonEdit,
  GlobalSPR, FIBQuery, pFIBQuery, pFIBStoredProc,
  cxLookAndFeelPainters, cxButtons, LoadDogManedger, DBCtrls,
  cxCheckListBox, cxDBCheckListBox, RxMemDS, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, ImgList, ToolWin, cxCalc, cxCheckBox,
  cxTL, dogLoaderUnit, dogLangPackUnit2, FIBDatabase,
  pFIBDatabase, cxCalendar, ActnList;

                                                                                  
type
  TfrmTypeDogEdit = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    TextEdit_Short_Name: TcxTextEdit;
    TextEdit_Name: TcxTextEdit;
    cxComboBox_active: TcxComboBox;
    pFIBDataSet_type_dog_cust: TpFIBDataSet;
    cxMaskEdit_dog: TcxMaskEdit;
    pFIBStoredProc_dog_edit: TpFIBStoredProc;
    pFIBDataSet_tip_dog: TpFIBDataSet;
    pFIBDataSet_acc: TpFIBDataSet;
    TabSheet3: TTabSheet;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    GroupBox1: TGroupBox;
    cxButtonEdit_kontrag: TcxButtonEdit;
    Label8: TLabel;
    cxTextEdit_schet: TcxTextEdit;
    GroupBox2: TGroupBox;
    cxButtonEdit_schet: TcxButtonEdit;
    Label10: TLabel;
    cxTextEdit_mfo_kontr: TcxTextEdit;
    Label11: TLabel;
    cxTextEdit_bank_kontr: TcxTextEdit;
    Label6: TLabel;
    cxTextEdit_mfo_un: TcxTextEdit;
    Label7: TLabel;
    cxTextEdit_rsch_un: TcxTextEdit;
    Label12: TLabel;
    cxTextEdit_bank_un: TcxTextEdit;
    Label13: TLabel;
    DataSource: TDataSource;
    pFIBDataSet_shablon: TpFIBDataSet;
    RxMemoryData_tip_dog: TRxMemoryData;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    DataSource_group_doc: TDataSource;
    pFIBDataSet_group_doc: TpFIBDataSet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxButton_del_kontr: TcxButton;
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
    Timer1: TTimer;
    GroupBox4: TGroupBox;
    cxMemo_comment: TcxMemo;
    Label14: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label9: TLabel;
    pFIBTransaction_edit: TpFIBTransaction;
    cxButton_rsch: TcxButton;
    Label15: TLabel;
    GroupBox5: TGroupBox;
    cxButtonEdit_bl_sch: TcxButtonEdit;
    Label16: TLabel;
    Label17: TLabel;
    cxTextEdit_bl_sch: TcxTextEdit;
    Label18: TLabel;
    Label19: TLabel;
    cxTextEdit_Num: TcxTextEdit;
    cxDateEdit_date: TcxDateEdit;
    ToolBar1: TToolBar;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    name_group_doc: TcxGridDBColumn;
    nomer_group: TcxGridDBColumn;
    flag_del: TcxGridDBColumn;
    id_group_doc: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel4: TPanel;
    ToolButtonAdd: TSpeedButton;
    ToolButton_del: TSpeedButton;
    ActionList: TActionList;
    add: TAction;
    del: TAction;
    cxButton_bl: TcxButton;
    cxMemo_def_note: TcxMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonEdit_kontragPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit_PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxMaskEdit_dogKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure ToolButtonAddClick(Sender: TObject);
    procedure ToolButton_delClick(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxButton_del_kontrClick(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure cxButton_rschClick(Sender: TObject);
    procedure cxButtonEdit_bl_schPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure addExecute(Sender: TObject);
    procedure delExecute(Sender: TObject);
    procedure cxButton_blClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
  procedure CloseForm();
    { Private declarations }
  public
  constructor Create(Aowner:TComponent;id_tip_dog: Variant; Vizov: String);

    { Public declarations }
  end;

var
  frmTypeDogEdit: TfrmTypeDogEdit;
  def_acc, def_cust, def_cust_acc :Variant;    // Переменные по контрагентам
  p_Tip_Dog, id_td: Variant;
  p_active: Integer;
  Pr_vizov: String;
  rate_acc, ret_mfo, ret_schet: Variant; //идентификатор счета ДонНУ
  i: Integer;
  id_bl_sch: Variant;//идентификатор балансового счета

implementation

{$R *.dfm}

constructor
TfrmTypeDogEdit.Create(Aowner:TComponent;id_tip_dog: Variant; Vizov: String);
var
  i: Integer;
  j, k: Integer;
  doc_group_str: String;

begin
//////////////////////////Редактирование//////////////////////////////////////////
if Vizov = 'red' then
    begin
      inherited Create(Aowner);
      pFIBDataSet_type_dog_cust.Database := TfrmTypeDog(self.Owner).pFIBDatabase;
      pFIBDataSet_type_dog_cust.Transaction := TfrmTypeDog(self.Owner).pFIBTransactionRead;
      pFIBDataSet_tip_dog.Database := TfrmTypeDog(Self.Owner).pFIBDatabase;
      pFIBDataSet_tip_dog.Transaction := TfrmTypeDog(Self.Owner).pFIBTransactionRead;
      pFIBDataSet_shablon.Database := TfrmTypeDog(Self.Owner).pFIBDatabase;
      pFIBDataSet_shablon.Transaction := TfrmTypeDog(Self.Owner).pFIBTransactionRead;
      pFIBDataSet_group_doc.Database := TfrmTypeDog(self.Owner).pFIBDatabase;
      pFIBDataSet_group_doc.Transaction := TfrmTypeDog(self.Owner).pFIBTransactionRead;

      pFIBDataSet_type_dog_cust.Active := false;
      pFIBDataSet_type_dog_cust.Active := true;
      pFIBDataSet_shablon.Active := false;
      pFIBDataSet_shablon.Active := true;

      pFIBDataSet_shablon.FetchAll;
      pFIBDataSet_tip_dog.Active := false;
      pFIBDataSet_tip_dog.ParamByName('d_id_tip_dog').Value := id_tip_dog;
      pFIBDataSet_tip_dog.Active := true;
      cxMaskEdit_dog.Text := pFIBDataSet_tip_dog.FieldByName('tip_dog').AsString;
      TextEdit_Short_Name.Text := pFIBDataSet_tip_dog.FieldByName('short_name').AsString;
      TextEdit_Name.Text := pFIBDataSet_tip_dog.FieldByName('name').AsString;
      if pFIBDataSet_tip_dog.FieldByName('tip_active').AsInteger = 1 then
         begin
           cxComboBox_active.ItemIndex := 1;
         end
         else
         begin
           cxComboBox_active.ItemIndex := 0;
         end;
      id_td := id_tip_dog;
      DBLookupComboBox1.Enabled := false;
      cxMemo_def_note.Text := pFIBDataSet_tip_dog.FieldByName('def_note').AsString;
      cxMemo_comment.Text := pFIBDataSet_tip_dog.FieldByName('comment').AsString;
      cxTextEdit_Num.Text := pFIBDataSet_tip_dog.FieldByName('def_number').AsString;
      if pFIBDataSet_tip_dog.FieldByName('def_date').AsDateTime = 0 then
      cxDateEdit_date.Text := '' else
      cxDateEdit_date.Date := pFIBDataSet_tip_dog.FieldByName('def_date').AsDateTime;
      cxTextEdit_bl_sch.Text := pFIBDataSet_tip_dog.FieldByName('name_bl_acc').AsString;
      cxButtonEdit_bl_sch.Text := pFIBDataSet_tip_dog.FieldByName('kod_bl_acc').AsString;
      id_bl_sch := pFIBDataSet_tip_dog.FieldByName('id_bl_account').AsInteger;


     pFIBDataSet_group_doc.Active := false;
     pFIBDataSet_group_doc.ParamByName('param_tip_dog').Value := id_tip_dog;
     pFIBDataSet_group_doc.Active := true;
     pFIBDataSet_group_doc.FetchAll;
     pFIBDataSet_group_doc.First;
       for k := 0 to pFIBDataSet_group_doc.RecordCount-1 do
          begin
            RxMemoryData_tip_dog.Open;
            RxMemoryData_tip_dog.Insert;
            RxMemoryData_tip_dog.FieldByName('name_group').Value := pFIBDataSet_group_doc.FieldByName('NAME_GROUP_DOC').AsString;
            RxMemoryData_tip_dog.FieldByName('id_group').Value := pFIBDataSet_group_doc.FieldByName('ID_GROUP_DOC').AsVariant;
            RxMemoryData_tip_dog.FieldByName('nomer_grup').Value := pFIBDataSet_group_doc.FieldByName('N_GROUP_DOC').AsString;
            RxMemoryData_tip_dog.FieldByName('flag_del').Value := 0;
            RxMemoryData_tip_dog.Post;
            pFIBDataSet_group_doc.Next;
          end;

  ////////////////////////////

      pFIBDataSet_shablon.Locate('id_shablon', pFIBDataSet_tip_dog.FieldByName('DEF_ID_SHABLON').AsVariant, []);
      DBLookupComboBox1.KeyValue := pFIBDataSet_tip_dog.FieldByName('DEF_ID_SHABLON').AsVariant;

 //Данные по ДонНУ
      cxTextEdit_rsch_un.Text := pFIBDataSet_tip_dog.FieldByName('DEF_RSCHET').AsString;
      cxTextEdit_mfo_un.Text := pFIBDataSet_tip_dog.FieldByName('DEF_MFO').AsString;
      cxTextEdit_bank_un.Text := pFIBDataSet_tip_dog.FieldByName('DEF_BANK_NAME').AsString;
      cxButtonEdit_schet.Text := pFIBDataSet_tip_dog.FieldByName('DEF_NAME_CUSTOMER').AsString;

 //Данные по контрагенту
      def_cust := pFIBDataSet_tip_dog.FieldByName('def_customer').AsVariant;
      cxButtonEdit_kontrag.Text := pFIBDataSet_tip_dog.FieldByName('DEF_CUSTOMER_NAME').AsString;
      def_cust_acc := pFIBDataSet_tip_dog.FieldByName('DEF_ID_RATE_ACC').AsVariant;
      cxTextEdit_schet.Text := pFIBDataSet_tip_dog.FieldByName('DEF_CUST_RSCHET').AsString;
      cxTextEdit_mfo_kontr.Text := pFIBDataSet_tip_dog.FieldByName('DEF_CUST_MFO').AsString;
      cxTextEdit_bank_kontr.Text := pFIBDataSet_tip_dog.FieldByName('DEF_CUST_MFO_NAME').AsString;
      rate_acc := pFIBDataSet_tip_dog.FieldByName('def_account').AsVariant;

 //Если не заполнено поле по контрагенту, то кнопка не видна
    if def_cust > 0 then
    begin
      cxButton_del_kontr.Enabled := true;
    end;

    if rate_acc > 0 then
    begin
      cxButton_rsch.Enabled := true;
    end;

    if id_bl_sch > 0 then
    begin
      cxButton_bl.Enabled := true;
    end;

 {    if rate_acc<0  then
      begin
        rate_acc:=0;
      end;}

 //     DBLookupComboBox1.Enabled:=false;

      Pr_vizov := Vizov;
      Caption := 'Редагування'+' '+pFIBDataSet_tip_dog.FieldByName('short_name').AsString;
    end
///////////////////////////////////////Добавление////////////////////////////////////
    else
    if Vizov = 'add' then
    begin
      inherited Create(Aowner);
      Pr_vizov := Vizov;
      Caption := 'Додання типу договору';

      pFIBDataSet_tip_dog.Database := TfrmTypeDog(Self.Owner).pFIBDatabase;
      pFIBDataSet_tip_dog.Transaction := TfrmTypeDog(Self.Owner).pFIBTransactionRead;
      pFIBDataSet_tip_dog.Active := false;
      pFIBDataSet_tip_dog.Active := true;
      cxMaskEdit_dog.Text := pFIBDataSet_tip_dog.FieldByName('MAX_NOMER').AsVariant + 1;

    end
///////////////////////////Просмотр типа договора////////////////////////////////////
    else
    if Vizov = 'prosmotr' then
    begin
      inherited Create(Aowner);
      pFIBDataSet_type_dog_cust.Database := TfrmTypeDog(self.Owner).pFIBDatabase;
      pFIBDataSet_type_dog_cust.Transaction := TfrmTypeDog(self.Owner).pFIBTransactionRead;
      pFIBDataSet_tip_dog.Database := TfrmTypeDog(Self.Owner).pFIBDatabase;
      pFIBDataSet_tip_dog.Transaction := TfrmTypeDog(Self.Owner).pFIBTransactionRead;
      pFIBDataSet_shablon.Database := TfrmTypeDog(Self.Owner).pFIBDatabase;
      pFIBDataSet_shablon.Transaction := TfrmTypeDog(Self.Owner).pFIBTransactionRead;
      pFIBDataSet_group_doc.Database := TfrmTypeDog(self.Owner).pFIBDatabase;
      pFIBDataSet_group_doc.Transaction := TfrmTypeDog(self.Owner).pFIBTransactionRead;

      pFIBDataSet_type_dog_cust.Active := false;
      pFIBDataSet_type_dog_cust.Active := true;
      pFIBDataSet_shablon.Active := false;
      pFIBDataSet_shablon.Active := true;

      pFIBDataSet_shablon.FetchAll;
      pFIBDataSet_tip_dog.Active := false;
      pFIBDataSet_tip_dog.ParamByName('d_id_tip_dog').Value := id_tip_dog;
      pFIBDataSet_tip_dog.Active := true;
      cxMaskEdit_dog.Text := pFIBDataSet_tip_dog.FieldByName('tip_dog').AsString;
      TextEdit_Short_Name.Text := pFIBDataSet_tip_dog.FieldByName('short_name').AsString;
      TextEdit_Name.Text := pFIBDataSet_tip_dog.FieldByName('name').AsString;
      if pFIBDataSet_tip_dog.FieldByName('tip_active').AsInteger = 1 then
         begin
           cxComboBox_active.ItemIndex := 1;
         end
         else
         begin
           cxComboBox_active.ItemIndex := 0;
         end;
      id_td := id_tip_dog;
      DBLookupComboBox1.Enabled := false;
      cxMemo_def_note.Text := pFIBDataSet_tip_dog.FieldByName('def_note').AsString;
      cxMemo_comment.Text := pFIBDataSet_tip_dog.FieldByName('comment').AsString;
      cxTextEdit_Num.Text := pFIBDataSet_tip_dog.FieldByName('def_number').AsString;
      if pFIBDataSet_tip_dog.FieldByName('def_date').AsDateTime = 0 then
      cxDateEdit_date.Text := '' else
      cxDateEdit_date.Date := pFIBDataSet_tip_dog.FieldByName('def_date').AsDateTime;
      cxTextEdit_bl_sch.Text := pFIBDataSet_tip_dog.FieldByName('name_bl_acc').AsString;
      cxButtonEdit_bl_sch.Text := pFIBDataSet_tip_dog.FieldByName('kod_bl_acc').AsString;
      id_bl_sch := pFIBDataSet_tip_dog.FieldByName('id_bl_account').AsInteger;

     pFIBDataSet_group_doc.Active := false;
     pFIBDataSet_group_doc.ParamByName('param_tip_dog').Value := id_tip_dog;
     pFIBDataSet_group_doc.Active := true;
     pFIBDataSet_group_doc.FetchAll;
     pFIBDataSet_group_doc.First;
       for k := 0 to pFIBDataSet_group_doc.RecordCount-1 do
          begin
            RxMemoryData_tip_dog.Open;
            RxMemoryData_tip_dog.Insert;
            RxMemoryData_tip_dog.FieldByName('name_group').Value := pFIBDataSet_group_doc.FieldByName('NAME_GROUP_DOC').AsString;
            RxMemoryData_tip_dog.FieldByName('id_group').Value := pFIBDataSet_group_doc.FieldByName('ID_GROUP_DOC').AsVariant;
            RxMemoryData_tip_dog.FieldByName('nomer_grup').Value := pFIBDataSet_group_doc.FieldByName('N_GROUP_DOC').AsString;
            RxMemoryData_tip_dog.FieldByName('flag_del').Value := 0;
            RxMemoryData_tip_dog.Post;
            pFIBDataSet_group_doc.Next;
          end;

  ////////////////////////////

      pFIBDataSet_shablon.Locate('id_shablon', pFIBDataSet_tip_dog.FieldByName('DEF_ID_SHABLON').AsVariant, []);
      DBLookupComboBox1.KeyValue := pFIBDataSet_tip_dog.FieldByName('DEF_ID_SHABLON').AsVariant;

 //Данные по ДонНУ
      cxTextEdit_rsch_un.Text := pFIBDataSet_tip_dog.FieldByName('DEF_RSCHET').AsString;
      cxTextEdit_mfo_un.Text := pFIBDataSet_tip_dog.FieldByName('DEF_MFO').AsString;
      cxTextEdit_bank_un.Text := pFIBDataSet_tip_dog.FieldByName('DEF_BANK_NAME').AsString;
      cxButtonEdit_schet.Text := pFIBDataSet_tip_dog.FieldByName('DEF_NAME_CUSTOMER').AsString;

 //Данные по контрагенту
      def_cust := pFIBDataSet_tip_dog.FieldByName('def_customer').AsVariant;
      cxButtonEdit_kontrag.Text := pFIBDataSet_tip_dog.FieldByName('DEF_CUSTOMER_NAME').AsString;
      cxTextEdit_schet.Text := pFIBDataSet_tip_dog.FieldByName('DEF_CUST_RSCHET').AsString;
      cxTextEdit_mfo_kontr.Text := pFIBDataSet_tip_dog.FieldByName('DEF_CUST_MFO').AsString;
      cxTextEdit_bank_kontr.Text := pFIBDataSet_tip_dog.FieldByName('DEF_CUST_MFO_NAME').AsString;
      rate_acc := pFIBDataSet_tip_dog.FieldByName('def_account').AsVariant;

      cxButton_del_kontr.Visible := false;
      cxButton_del_kontr.Visible := false;

      Pr_vizov := Vizov;
      Caption := 'Перегляд'+' '+pFIBDataSet_tip_dog.FieldByName('short_name').AsString;
      cxMaskEdit_dog.Enabled := false;
      cxComboBox_active.Enabled := false;
      TextEdit_Short_Name.Enabled := false;
      TextEdit_Name.Enabled := false;
      DBLookupComboBox1.Enabled := false;
      cxMemo_def_note.Enabled := false;
      ToolButtonAdd.Enabled := false;
      ToolButton_del.Enabled := false;
      cxButtonEdit_kontrag.Enabled := false;
      cxButtonEdit_schet.Enabled := false;
      cxTextEdit_bank_kontr.Enabled := false;
      cxTextEdit_mfo_kontr.Enabled := false;
      cxTextEdit_schet.Enabled := false;
      cxTextEdit_bank_un.Enabled := false;
      cxTextEdit_mfo_un.Enabled := false;
      cxTextEdit_rsch_un.Enabled := false;
      cxTextEdit_Num.Enabled := false;
      cxDateEdit_date.Enabled := false;
      cxTextEdit_bl_sch.Enabled := false;
      cxButtonEdit_bl_sch.Enabled := false;
      cxButton_rsch.Visible := false;

end;

end;


procedure TfrmTypeDogEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Pr_vizov = 'red' then
  begin
    TfrmTypeDog(self.Owner).pFIBTransactionRead.Commit;
  end;  
  Action := caFree;
end;

procedure TfrmTypeDogEdit.cxButtonEdit_kontragPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  kont: Variant;
begin
 if Pr_vizov = 'prosmotr' then begin
   Exit;
 end;
  if VarIsClear(def_cust) then def_cust := -1;
  if VarIsClear(def_cust_acc) then def_cust_acc := -1;
  if VarisNull(def_cust_acc) then def_cust_acc := -1;

  if def_cust < 0 then def_cust := -1;
  if def_cust_acc < 0 then def_cust_acc := -1;

  kont :=  ShowCustomers(Self, TfrmTypeDog(self.Owner).pFIBDatabase.Handle,fsNormal,Date,csmRateAcc, def_cust, def_cust_acc);

  if VarArrayDimCount(kont) > 0 then
  begin
    def_cust_acc := kont[1];
    cxTextEdit_schet.Text := kont[2];
    cxTextEdit_mfo_kontr.Text := kont[5];
    cxTextEdit_bank_kontr.Text := kont[6];
    def_cust := kont[0];
    pFIBDataSet_type_dog_cust.Active := false;
    pFIBDataSet_type_dog_cust.ParamByName('param_cust').Value := def_cust;
    pFIBDataSet_type_dog_cust.Active := true;
    cxButtonEdit_kontrag.Text := pFIBDataSet_type_dog_cust.FieldByName('name_customer').AsString;
    cxButton_del_kontr.Enabled := true;
  end;
end;

procedure TfrmTypeDogEdit.cxButtonEdit_PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  ret: Variant;
begin
if Pr_vizov = 'prosmotr' then
begin
  Exit;
end;
  if VarIsClear(rate_acc) then rate_acc := -1;
  if rate_acc < 0 then rate_acc := -1;

  ret := LoadDogManedger.WorkSpMfoRsch(self, TfrmTypeDog(Self.Owner).pFIBDatabase.Handle, fsNormal, 'type_dog', rate_acc);
  if VarArrayDimCount(ret) > 0 then
  begin
    if ret[0][0] > 0 then begin
      rate_acc := ret[0][0];
      ret_mfo := ret[0][2];
      ret_schet := ret[0][3];
      cxButtonEdit_schet.Text := ret[0][1];
      cxTextEdit_mfo_un.Text := ret[0][2];
      cxTextEdit_rsch_un.Text := ret[0][3];
      cxTextEdit_bank_un.Text := ret[0][6];
      cxButton_rsch.Enabled := true;
  end;
  end;
end;

procedure TfrmTypeDogEdit.cxMaskEdit_dogKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in ['0'..'9'])  and (key <> #8)
  then    key := #0;
  if key = #13 then
   begin
     PageControl1.ActivePageIndex:=0;
     TextEdit_Short_Name.SetFocus;
   end;

end;

procedure TfrmTypeDogEdit.FormCreate(Sender: TObject);
var
  is_root_tip_dog: Variant;
  DataSetRoot: TpFIBDataSet;
begin
  pFIBDataSet_type_dog_cust.Database := TfrmTypeDog(self.Owner).pFIBDatabase;
  pFIBDataSet_type_dog_cust.Transaction := TfrmTypeDog(self.Owner).pFIBTransactionRead;
  pFIBDataSet_tip_dog.Database := TfrmTypeDog(Self.Owner).pFIBDatabase;
  pFIBDataSet_tip_dog.Transaction := TfrmTypeDog(Self.Owner).pFIBTransactionRead;
  pFIBDataSet_acc.Database := TfrmTypeDog(self.Owner).pFIBDatabase;
  pFIBDataSet_acc.Transaction := TfrmTypeDog(self.Owner).pFIBTransactionRead;
  pFIBDataSet_shablon.Database := TfrmTypeDog(Self.Owner).pFIBDatabase;
  pFIBDataSet_shablon.Transaction := TfrmTypeDog(Self.Owner).pFIBTransactionRead;
  pFIBDataSet_group_doc.Database := TfrmTypeDog(self.Owner).pFIBDatabase;
  pFIBDataSet_group_doc.Transaction := TfrmTypeDog(self.Owner).pFIBTransactionRead;
  pFIBDataSet_group_doc.Active := false;
  pFIBDataSet_group_doc.Active := true;
  pFIBDataSet_type_dog_cust.Active := false;
  pFIBDataSet_type_dog_cust.Active := true;
  pFIBDataSet_tip_dog.Active := false;
  pFIBDataSet_tip_dog.Active := true;
  pFIBDataSet_acc.Active := false;
  pFIBDataSet_acc.Active := true;
  pFIBDataSet_shablon.Active := false;
  pFIBDataSet_shablon.Active := true;
  pFIBDataSet_shablon.FetchAll;

  // Интерфейс
  TabSheet1.Caption := rstd_osn_dannie;
  TabSheet2.Caption := rstd_po_umolch;
  TabSheet3.Caption:=rstd_nastr;
{  Label1.Caption:=rstd_Tip_dog;
  Label3.Caption:=rstd_Name;
  Label2.Caption:=rstd_Short_name;
  Label4.Caption:=rstd_Active;
  Label9.Caption:=rstd_Name_pack;
  Label5.Caption:=rsh_Dog_note;
  GroupBox2.Caption := rstd_rate;
  Label13.Caption:=rsh_Name_cust;
  Label10.Caption:=rsh_MFO;
  Label8.Caption:=rsh_RateAcc;
  Label11.Caption:=rsh_Bank;
  Label6.Caption:=rsh_MFO;
  Label7.Caption:=rsh_RateAcc;
  Label12.Caption:=rsh_Bank;}
//  cxGrid1DBTableView1DBColumn1.Caption   := rstd_Tip_dog;
//  cxGrid1DBTableView1DBColumn2.Caption   := rstd_Name;

// проверка на возможность редактировать основные данные и группы
  DataSetRoot := TpFIBDataSet.Create(Self);
  DataSetRoot.Database := TfrmTypeDog(Self.Owner).pFIBDatabase;
  DataSetRoot.Transaction := TfrmTypeDog(Self.Owner).pFIBTransactionRead;
  DataSetRoot.SQLs.SelectSQL.Text := 'select d.is_root_tip_dog from dog_sys_options d';
  DataSetRoot.Active := true;
  is_root_tip_dog := DataSetRoot.FBN('is_root_tip_dog').AsInteger;
  if (is_root_tip_dog) = 1 then
  begin
    add.Enabled := false;
    del.Enabled := false;
    cxMaskEdit_dog.Properties.ReadOnly := true;
    TextEdit_Short_Name.Properties.ReadOnly := true;
    TextEdit_Name.Properties.ReadOnly := true;
    DBLookupComboBox1.ReadOnly := true;
    cxComboBox_active.Properties.ReadOnly := true;
  end;
  DataSetRoot.Active := false;
  DataSetRoot.Free;
end;

procedure TfrmTypeDogEdit.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmTypeDogEdit.cxButton2Click(Sender: TObject);
var
  str: String;
  Temp_Str: String;
  Temp_Int,Current_Pos: Integer;
  F_Del: TStringList;
  Id_Doc: TStringList;
  i: Integer;
  per_tip_dog: Variant;
//  A: Array of Integer;
begin
    if Pr_vizov = 'prosmotr' then
    begin
      Close;
      Exit;
    end;

          // проверка на заполнение типа договора
    if  Trim(cxMaskEdit_dog.Text) = '' then
        begin
        MessageDlg('Увага', errTipDogNotNumber, mtError, [mbOk]);
        PageControl1.ActivePageIndex:=0;
        cxMaskEdit_dog.SetFocus;
        Exit;
    end;

           // проверка на заполнение сокращенного названия
    if Trim(TextEdit_Short_Name.Text) = '' then
    begin
        MessageDlg('Увага',errTipDogShortNameEmpty, mtError, [mbOk]);
        PageControl1.ActivePageIndex:=0;
        TextEdit_Short_Name.SetFocus;
        Exit;
    end;

           // проверка на заполнение названия
    if Trim(TextEdit_Name.Text) = '' then
    begin
        MessageDlg('Увага',errTipDogNameEmpty, mtError, [mbOk]);
        //TextEdit_Short_Name.SetFocus;
        PageControl1.ActivePageIndex:=0;
        TextEdit_Name.SetFocus;
        Exit;
    end;

          // проверка на заполнение активности, получение активности
    if cxComboBox_active.ItemIndex = -1 then
    begin
        MessageDlg('Увага',errTipDogActiveEmpty, mtError, [mbOk]);
        PageControl1.ActivePageIndex:=0;
        cxComboBox_active.SetFocus;
        Exit;
    end;

          // проверка на заполнение пакета
    if Trim(DBLookupComboBox1.Text) = '' then
    begin
        MessageDlg('Увага',errTipDogProgNameEmpty, mtError, [mbOk]);
        PageControl1.ActivePageIndex:=0;
        DBLookupComboBox1.SetFocus;
        Exit;
    end;

       //если это тип договора по Шаблону 9 (командировки), то д.б. собственный счет
    if DBLookupComboBox1.KeyValue = 11 then
    begin
      if Trim(cxButtonEdit_schet.Text) = '' then
        begin
          ShowMessage('Заповніть власний рахунок!');
          Exit;
        end;
    end;

    if cxComboBox_active.ItemIndex = 1 then
      begin
        p_Active := 1;
      end
      else
      begin
        p_Active := -1;
      end;

    if Pr_vizov = 'add' then
    begin
    try
      pFIBStoredProc_dog_edit.Database := TfrmTypeDog(Self.Owner).pFIBDatabase;
      pFIBStoredProc_dog_edit.Transaction := TfrmTypeDog(Self.Owner).pFIBTransactionWrite;
      TfrmTypeDog(self.Owner).pFIBTransactionWrite.DefaultDatabase := TfrmTypeDog(Self.Owner).pFIBDatabase;
      TfrmTypeDog(self.Owner).pFIBTransactionWrite.StartTransaction;
      pFIBStoredProc_dog_edit.StoredProcName := 'PUB_SP_TIP_DOG_INS';
      pFIBStoredProc_dog_edit.Prepare;
      pFIBStoredProc_dog_edit.ParamByName('D_TIP_DOG').Value := Trim(cxMaskEdit_dog.Text);
      pFIBStoredProc_dog_edit.ParamByName('D_SHORT_NAME').Value := Trim(TextEdit_Short_Name.Text);
      pFIBStoredProc_dog_edit.ParamByName('D_NAME').Value := Trim(TextEdit_Name.Text);
      pFIBStoredProc_dog_edit.ParamByName('D_ACTIVE').Value := p_active;
      pFIBStoredProc_dog_edit.ParamByName('D_ID_SHABLON').Value := DBLookupComboBox1.KeyValue;
      pFIBStoredProc_dog_edit.ParamByName('D_DEF_NOTE').Value := Trim(cxMemo_def_note.Text);
      pFIBStoredProc_dog_edit.ParamByName('D_DEF_CUST_ACCOUNT').Value := def_cust_acc;
      pFIBStoredProc_dog_edit.ParamByName('D_DEF_ACCOUNT').Value := rate_acc;
      pFIBStoredProc_dog_edit.ParamByName('D_DEF_CUSTOMER').Value := def_cust;
      pFIBStoredProc_dog_edit.ParamByName('D_ID_BL_ACCOUNT').Value := id_bl_sch;
      pFIBStoredProc_dog_edit.ParamByName('D_DEF_NUMBER').Value := cxTextEdit_Num.Text;
      if Trim(cxDateEdit_date.Text) = '' then
      pFIBStoredProc_dog_edit.ParamByName('D_DEF_DATE').Value := Null else
      pFIBStoredProc_dog_edit.ParamByName('D_DEF_DATE').Value := cxDateEdit_date.Date;

      pFIBStoredProc_dog_edit.ExecProc;

      per_tip_dog := pFIBStoredProc_dog_edit.ParamByName('V_ID_TIP_DOG').AsVariant;
      TfrmTypeDog(Self.Owner).TipDogId(pFIBStoredProc_dog_edit.ParamByName('V_ID_TIP_DOG').AsVariant);

      RxMemoryData_tip_dog.First;
        for  i :=0 to RxMemoryData_tip_dog.RecordCount-1 do
        begin
          pFIBStoredProc_dog_edit.StoredProcName := 'DOG_GROUP_TIP_DOG_INSERT';
          pFIBStoredProc_dog_edit.Prepare;
          pFIBStoredProc_dog_edit.ParamByName('ID_TIP_DOG').Value := per_tip_dog;
          pFIBStoredProc_dog_edit.ParamByName('ID_GROUP_DOC').Value :=  RxMemoryData_tip_dog.FieldByName('id_group').Value;

          if RxMemoryData_tip_dog.FieldByName('Flag_del').Value = 1 then
          pFIBStoredProc_dog_edit.ParamByName('VALUE_GROUP').Value := 0 else
          pFIBStoredProc_dog_edit.ParamByName('VALUE_GROUP').Value := 1;

          pFIBStoredProc_dog_edit.ExecProc;

          RxMemoryData_tip_dog.Next;
        end;


      Except on e:Exception do
        begin
          ShowMessage(e.Message);
          TfrmTypeDog(Self.Owner).pFIBTransactionWrite.Rollback;
          Exit;
        end;
      end;
//        TfrmTypeDog(Self.Owner).TipDogId(pFIBStoredProc_dog_edit.ParamByName('V_ID_TIP_DOG').AsVariant);
        TfrmTypeDog(Self.Owner).pFIBTransactionWrite.Commit;
        Close;
    end
    else
    begin
    try
      pFIBStoredProc_dog_edit.Database:=TfrmTypeDog(Self.Owner).pFIBDatabase;
      TfrmTypeDog(self.Owner).pFIBTransaction_lock.Active := false;
      pFIBStoredProc_dog_edit.Transaction:=TfrmTypeDog(Self.Owner).pFIBTransactionWrite;
      TfrmTypeDog(self.Owner).pFIBTransactionWrite.DefaultDatabase := TfrmTypeDog(Self.Owner).pFIBDatabase;
      TfrmTypeDog(self.Owner).pFIBTransactionWrite.StartTransaction;
      pFIBStoredProc_dog_edit.StoredProcName := 'PUB_SP_TIP_DOG_UPD';
      pFIBStoredProc_dog_edit.Prepare;
      pFIBStoredProc_dog_edit.ParamByName('d_ID_TIP_DOG').Value := id_td;
      pFIBStoredProc_dog_edit.ParamByName('d_TIP_DOG').Value := Trim(cxMaskEdit_dog.Text);
      pFIBStoredProc_dog_edit.ParamByName('d_SHORT_NAME').Value := Trim(TextEdit_Short_Name.Text);
      pFIBStoredProc_dog_edit.ParamByName('d_NAME').Value := Trim(TextEdit_Name.Text);
      pFIBStoredProc_dog_edit.ParamByName('d_ACTIVE').Value := p_active;
      pFIBStoredProc_dog_edit.ParamByName('D_ID_SHABLON').Value := DBLookupComboBox1.KeyValue;
      pFIBStoredProc_dog_edit.ParamByName('d_DEF_NOTE').Value := Trim(cxMemo_def_note.Text);
      pFIBStoredProc_dog_edit.ParamByName('d_DEF_CUST_ACCOUNT').Value := def_cust_acc;
      pFIBStoredProc_dog_edit.ParamByName('d_DEF_ACCOUNT').Value := rate_acc;
      pFIBStoredProc_dog_edit.ParamByName('d_DEF_CUSTOMER').Value := def_cust;
      pFIBStoredProc_dog_edit.ParamByName('D_ID_BL_ACCOUNT').Value := id_bl_sch;
      pFIBStoredProc_dog_edit.ParamByName('D_DEF_NUMBER').Value := cxTextEdit_Num.Text;
      pFIBStoredProc_dog_edit.ParamByName('D_DEF_NUMBER').Value := cxTextEdit_Num.Text;
      if Trim(cxDateEdit_date.Text) = '' then
      pFIBStoredProc_dog_edit.ParamByName('D_DEF_DATE').Value := Null else
      pFIBStoredProc_dog_edit.ParamByName('D_DEF_DATE').Value := cxDateEdit_date.Date;

        pFIBStoredProc_dog_edit.ExecProc;

        RxMemoryData_tip_dog.First;
        for  i :=0 to RxMemoryData_tip_dog.RecordCount-1 do
        begin
          pFIBStoredProc_dog_edit.StoredProcName := 'DOG_GROUP_TIP_DOG_INSERT';
          pFIBStoredProc_dog_edit.Prepare;
          pFIBStoredProc_dog_edit.ParamByName('ID_TIP_DOG').Value := id_td;
          pFIBStoredProc_dog_edit.ParamByName('ID_GROUP_DOC').Value :=  RxMemoryData_tip_dog.FieldByName('id_group').Value;

          if RxMemoryData_tip_dog.FieldByName('Flag_del').Value = 1 then
          pFIBStoredProc_dog_edit.ParamByName('VALUE_GROUP').Value := 0 else
          pFIBStoredProc_dog_edit.ParamByName('VALUE_GROUP').Value := 1;

          pFIBStoredProc_dog_edit.ExecProc;

          RxMemoryData_tip_dog.Next;
        end;

        Except  on e:Exception do
          begin
            ShowMessage(e.Message);
            TfrmTypeDog(Self.Owner).pFIBTransactionWrite.Rollback;
            Exit;
          end;
        end;
        TfrmTypeDog(Self.Owner).pFIBTransactionWrite.Commit;
        Close;
    end;
end;


procedure TfrmTypeDogEdit.CloseForm();
begin
  Close;
end;

procedure TfrmTypeDogEdit.ToolButtonAddClick(Sender: TObject);
var
  Group, t_id_group: Variant;
  cnt: Integer;
  i,j, k: Integer;
begin
  if Pr_vizov = 'prosmotr' then
  exit
  else
  begin
    Group := LoadDogManedger.WorkGroupDoc(self, TfrmTypeDog(Self.Owner).pFIBDatabase.Handle, fsNormal, 'tip_dog');
    if VarArrayDimCount(Group) > 0 then
       begin
         Cnt := VarArrayHighBound(Group, 1);
         for i := 0 to Cnt do
           begin
             t_id_group := group[i][0];
             k := 0;
                 //проверка на совпадение групп
                 RxMemoryData_tip_dog.First;
                 for j := 0 to RxMemoryData_tip_dog.RecordCount-1 do
                 begin
                   if RxMemoryData_tip_dog.FieldByName('id_group').Value = t_id_group then
                   begin
                     k := k + 1;
                     RxMemoryData_tip_dog.Next;
                   end;
                   RxMemoryData_tip_dog.Next;
                 end;
                 ///////
                 if k = 0 then
                 begin
                   RxMemoryData_tip_dog.Open;
                   RxMemoryData_tip_dog.Insert;
                   RxMemoryData_tip_dog.FieldByName('id_group').Value := group[i][0];
                   RxMemoryData_tip_dog.FieldByName('name_group').Value := group[i][1];
                   RxMemoryData_tip_dog.FieldByName('nomer_grup').Value := group[i][2];
                   RxMemoryData_tip_dog.FieldByName('flag_del').Value := 0;
                   RxMemoryData_tip_dog.Post;
                 end
                 else
                 begin
                   RxMemoryData_tip_dog.Next;
                 end;
           end;
         end;
  end;
end;

procedure TfrmTypeDogEdit.ToolButton_delClick(Sender: TObject);
begin
  //проверка на признак вызова
  if Pr_vizov = 'prosmotr' then
  begin
    exit;
  end;

   //проверка на непустое значение
  if nomer_group.EditValue=0 then
  begin
    Exit;
  end;

    begin
      RxMemoryData_tip_dog.Open;
      RxMemoryData_tip_dog.Edit;
      if RxMemoryData_tip_dog.FieldByName('Flag_del').Value = 1 then
        begin
          RxMemoryData_tip_dog.FieldByName('Flag_del').Value := 0;
        end
        else
        begin
          if MessageBox(Handle,PChar('Вы дійсно бажаєте видалити запис?'),
          'Підтвердження видалення',MB_YesNo or MB_Iconquestion) = mrYes then
          RxMemoryData_tip_dog.FieldByName('Flag_del').Value := 1;
        end;
      RxMemoryData_tip_dog.Post;

    end;
end;

procedure TfrmTypeDogEdit.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect: TRect;
begin
  Arect := AViewInfo.Bounds;
  ACanvas.Canvas.Pen.Color := clBlack;
  if AViewInfo.GridRecord.Values[2] = 1 then
    begin
      ACanvas.Canvas.Font.Color := clRed;
      ACanvas.Canvas.Font.Style := [fsStrikeOut];
      ACanvas.Canvas.FillRect(Arect);
    end
    else
    begin
      ACanvas.Canvas.Font.Color := clBlack;
      ACanvas.Canvas.Font.Style := [];
      ACanvas.Canvas.FillRect(Arect);
    end;
end;

procedure TfrmTypeDogEdit.cxButton_del_kontrClick(Sender: TObject);
begin
      def_cust_acc := -1;
      def_cust := -1;
      cxButtonEdit_kontrag.Text := '';
      cxTextEdit_mfo_kontr.Text := '';
      cxTextEdit_bank_kontr.Text := '';
      cxTextEdit_schet.Text := '';
      cxButton_del_kontr.Enabled := false;
end;

procedure TfrmTypeDogEdit.DBLookupComboBox1Click(Sender: TObject);
var
  DataSet: TpFIBDataSet;
  s: String;
  param_id_ini_shablon: Integer;
begin
  DataSet := TpFIBDataSet.Create(Self);
  DataSet.Database := TfrmTypeDog(self.Owner).pFIBDatabase;
  param_id_ini_shablon := DBLookupComboBox1.KeyValue;
  s := 'select dog_ini_shablon.comment from   dog_ini_shablon'+' '+
       'where  dog_ini_shablon.id_ini_shablon='+IntToStr(param_id_ini_shablon);
  DataSet.SelectSQL.Add(s);
  DataSet.Active := true;
  cxMemo_comment.Text := DataSet.FieldByName('comment').AsString;
  DataSet.Free;
end;

procedure TfrmTypeDogEdit.cxButton_rschClick(Sender: TObject);
begin
      rate_acc := -1;
      cxButtonEdit_schet.Text := '';
      cxTextEdit_mfo_un.Text := '';
      cxTextEdit_bank_un.Text := '';
      cxTextEdit_rsch_un.Text := '';
      cxButton_rsch.Enabled := false;
end;

procedure TfrmTypeDogEdit.cxButtonEdit_bl_schPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Res: Variant;

begin
  Res:=GlobalSpr.GetSch(self,TfrmTypeDog(Self.Owner).pFIBDatabase.Handle,fsNormal,Date ,DEFAULT_ROOT_ID,0,0);
  if VarArrayDimCount(RES)>0 then
    begin
      id_bl_sch:=RES[0][0];
      cxButtonEdit_bl_sch.Text := RES[0][3];
      cxTextEdit_bl_sch.Text := RES[0][1];
      cxButton_bl.Enabled := true;
    end;
end;

procedure TfrmTypeDogEdit.addExecute(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 2 then ToolButtonAddClick(Self);
end;

procedure TfrmTypeDogEdit.delExecute(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 2 then ToolButton_delClick(Self);

end;

procedure TfrmTypeDogEdit.cxButton_blClick(Sender: TObject);
begin
  id_bl_sch := -1;
  cxTextEdit_bl_sch.Text := '';
  cxButtonEdit_bl_sch.Text := '';
  cxButton_bl.Enabled := false;
end;

procedure TfrmTypeDogEdit.PageControl1Change(Sender: TObject);
begin
 del.Enabled:=not PageControl1.ActivePageIndex=1;
end;

end.


