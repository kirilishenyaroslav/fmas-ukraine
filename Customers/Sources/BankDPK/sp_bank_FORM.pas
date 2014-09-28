unit sp_bank_FORM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, FIBQuery, pFIBQuery, pFIBStoredProc,
  pFIBDatabase, StdCtrls, Db, FIBDataSet, pFIBDataSet, Grids, DBGrids,
  Menus, ActnList, ExtCtrls, cxStyles, cxCustomData,IBase,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxRadioGroup, cxContainer, cxTextEdit,Variants, FIBDatabase, ImgList,
  dxBar, dxBarExtItems, cxTL, cxGroupBox, dogLoaderUnit, cxCheckBox,
  cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, cxButtons, cxLabel;

resourcestring
 rsm_Warning   = 'Увага.';
 rsm_Delete    = 'Ви дійсно бажаєте видалити обраний запис?';

const
 TABLE    = 'SP_BANK';
// SEL_VIEW = 'PUB_SP_BANK_SEL';
 ADD_PROC = 'PUB_SP_BANK_ADD';
 DEL_PROC = 'PUB_SP_SP_BANK_DEL';
 MOD_PROC = 'PUB_SP_SP_BANK_MOD';
 PK_FIELD = 'ID_BANK';

type
  TFsp_bank = class(TForm)
    StoredProc: TpFIBStoredProc;
    DataSource1: TDataSource;
    DataSet: TpFIBDataSet;
    Query: TpFIBQuery;
    ActionList1: TActionList;
    ActionMod: TAction;
    ActionDel: TAction;
    ActionAdd: TAction;
    ActionSel: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID_BANK: TcxGridDBColumn;
    cxGrid1DBTableView1MFO: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_MFO: TcxGridDBColumn;
    cxGrid1DBTableView1CITY: TcxGridDBColumn;
    cxGrid1DBTableView1USE_BEG: TcxGridDBColumn;
    cxGrid1DBTableView1USE_END: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    WorkDatabase: TpFIBDatabase;
    SmallImages: TImageList;
    N7: TMenuItem;
    N8: TMenuItem;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    UpdateButton: TdxBarLargeButton;
    DelButton: TdxBarLargeButton;
    ChooseButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    CloseButton: TdxBarLargeButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
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
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
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
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    Panel1: TPanel;
    Label1: TLabel;
    SearchEdit: TcxTextEdit;
    cxGroupBox1: TcxGroupBox;
    RadioButtonMFO: TcxRadioButton;
    RadioButtonName: TcxRadioButton;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    Panel2: TPanel;
    cxCheckBox1: TcxCheckBox;
    DepEdit: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxButton1: TcxButton;
    dxBarLargeButton1: TdxBarLargeButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridDblClick(Sender: TObject);
    procedure SelButtonClick(Sender: TObject);
    procedure ActionModExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionSelExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure UpdateButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure ChooseButtonClick(Sender: TObject);
    procedure cxGrid1DblClick(Sender: TObject);
    procedure SearchEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
  public
   CurFS:TFormStyle;
   ActualDate:TDateTime;
   OwnerSPObject: TObject;
   ResultValue:Variant;
   id_department : integer;
   dontRef : boolean;
   constructor Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime);overload;
   procedure DeleteRecord;
   procedure AddRecord;
   procedure ModRecord;
   procedure RefreshDbGrid;
  end;


function GetBanks(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant; stdcall;
function bank_ImportBank(bank : TImportBank; AOwner : TComponent; DBHandle : TISC_DB_HANDLE; WTrans : TISC_TR_HANDLE) : boolean; stdcall;

exports  GetBanks, bank_ImportBank;


implementation
uses sp_bank_FORM_ADD, sys_options, BaseTypes, uCommonSp, sp_bank_FORM_HIS;
{$R *.DFM}

function GetBanks(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
var T:TFsp_bank;
    Res:Variant;
begin
    if FS=fsMDIChild
    then begin
               T:=TFsp_bank.Create(AOwner, DBHANDLE,FS,ActualDate);
    end
    else begin
               T:=TFsp_bank.Create(AOwner, DBHANDLE,FS,ActualDate);
               if T.ShowModal=mrYes
               then  Res:=T.ResultValue;
               T.Free;
    end;

    GetBanks:=Res;
end;


function bank_ImportBank(bank : TImportBank; AOwner : TComponent; DBHandle : TISC_DB_HANDLE; WTrans : TISC_TR_HANDLE) : boolean;
var
 f : TFsp_bank_ADD;
 query : TpFIBQuery;
 db : TpFIBDatabase;
 tr : TpFIBTransaction;

 function ShowInfo : integer;
 begin
  f := TFsp_bank_ADD.Create(AOwner);
  f.Caption := 'Імпортовано банк';
  f.SkipChecks := true;
  f.NameEdit.Text := bank.name;
  f.CityEdit.Text := bank.city;
  f.mfoEdit.Text := bank.mfo;
//  f.OKButton.Visible := false;
  Result := mrCancel;
  f.ShowModal;
  if f.MResult = 'ok' then Result := mrOk;
//  if f.MResult = 'ok' then Result := mrOk;
  f.Free;
 end;

begin
  if bank.bShowInfo then if ShowInfo = mrCancel then begin
   Result := false;
   exit;
  end;
  try
   db := TpFIBDatabase.Create(AOwner);
   db.SQLDialect := 3;
   db.Handle := DBHandle;
   tr := TpFIBTransaction.Create(AOwner);
   tr.Handle := WTrans;
   db.DefaultTransaction := tr;

   Query := TpFIBQuery.Create(AOwner);
   Query.Database := db;
   Query.Transaction := tr;
   Query.Transaction.StartTransaction;

   Query.SQL.Text := 'select count(*) from pub_sp_bank where mfo = ''' + bank.mfo + ''' and deleted = 0';
   Query.ExecQuery;
   if Query.Fields[0].AsInteger <> 0 then begin
    ShowMessage('Банк із даним МФО вже існує.');
    Result := false;
    query.Close;
    Query.Transaction.Commit;
    Query.Free;
    tr.Free;
    db.Free;
    exit;
   end;
   Query.Close;
//   ShowMessage('rtew');
   Query.SQL.Text := 'EXECUTE PROCEDURE PUB_SP_BANK_ADD(' +
    '''' + bank.mfo + ''', ' +
    '''' + bank.name + ''', ' +
    '''' + bank.city + ''', ' + IntToStr(SYS_ID_USER) + ',' + QuotedStr(GetCompName) + ',' + QuotedStr(GetIPAddress) +  ')';
   Query.ExecQuery;
   Query.Transaction.Commit;
   Query.Free;
   tr.Free;
   db.Free;
   //ShowInfo;
   Result := true;
  except
   exit;
  end;
end;


constructor TFsp_bank.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime);
begin
      inherited Create(AOwner);
      id_department := SYS_CURRENT_DEPARTMENT;
      Self.WorkDatabase.Handle:=DBHAndle;
      self.ActualDate:=ActualDate;
      CurFS:=FS;
//      DataSet.SQLs.SelectSQL.Text := 'select * from ' + SEL_VIEW ;
      StoredProc.Database :=WorkDatabase;
      StoredProc.Transaction := WriteTransaction;
      DataSet.DataBase := WorkDatabase;
      DataSet.Transaction :=ReadTransaction;
      Query.DataBase :=WorkDatabase;
      Query.Transaction :=ReadTransaction;
      self.FormStyle:=FS;
      if (CurFS=fsNormal)
      then begin
              //Действия которые необходимо выполнить при
              //открытии справочника модально
              ChooseButton.Enabled:=true;
      end;

end;


procedure TFsp_bank.RefreshDbGrid;
var
 selected_id : integer;
begin
 if DataSet.RecordCount = 0 then exit;
 selected_id := DataSet.FieldByName(PK_FIELD).AsInteger;
 Dataset.CloseOpen(true);
 while (DataSet.FieldByName(PK_FIELD).Value <> selected_id) do begin
  DataSet.Next;
  if DataSet.eof then break;
 end;
end;



procedure TFsp_bank.ExitButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
end;

procedure TFsp_bank.DelButtonClick(Sender: TObject);
begin
 DeleteRecord;
end;

procedure TFsp_bank.DeleteRecord;
var
 PK_Index : integer;
 selected_id : integer;
begin
 if DataSet.RecordCount = 0 then exit;
 if (SYS_IS_CH) then if DataSet['ID_DEPARTMENT'] <> SYS_CURRENT_DEPARTMENT then
 begin
   agShowMessage('Неможливо видалити банк іншого підрозділу.');
   exit;
 end;
 PK_Index := DataSet.FieldByName(PK_FIELD).AsInteger;
 if agMessageDlg(rsm_Warning, rsm_Delete, mtWarning, [mbYes, mbNo]) = mrNo then exit;

 try
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure(DEL_PROC, [PK_Index, SYS_MAX_TIMESTAMP, SYS_ID_USER, GetCompName, GetIPAddress]);
  StoredProc.Transaction.Commit;
 except
  exit;
 end;
 selected_id := cxGrid1DBTableView1.Controller.FocusedRowIndex;
 DataSet.CloseOpen(true);
 cxGrid1DBTableView1.Controller.FocusedRowIndex := selected_id;
end;

procedure TFsp_bank.AddButtonClick(Sender: TObject);
begin
          AddRecord;
end;

procedure TFsp_bank.AddRecord;
var
 PK_Index : integer;
 use_beg, use_end : TDateTime;
 Fsp_bank_ADD :TFsp_bank_ADD;
begin
 Fsp_bank_ADD := TFsp_bank_ADD.Create(Self);
 Fsp_bank_ADD.Caption := 'Додати запис';
 Fsp_bank_ADD.id_bank := -1;
 Fsp_bank_ADD.OKButton.Caption := 'Додати';
 Fsp_bank_ADD.ShowModal;
 if Fsp_bank_ADD.MResult = 'cancel' then exit;

 use_beg := now;
 use_end := SYS_MAX_TIMESTAMP;

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure(ADD_PROC, [Fsp_bank_ADD.MFOEdit.Text, Fsp_bank_ADD.NameEdit.Text, Fsp_bank_ADD.CityEdit.Text, SYS_ID_USER, GetCompName, GetIPAddress]);
 PK_Index:=StoredProc.ParamByName('P_ID_BANK').AsInteger;
 StoredProc.Transaction.Commit;

 DataSet.CloseOpen(true);
 DataSet.Locate('ID_BANK', PK_Index, []);

 Fsp_bank_ADD.Free;
end;

procedure TFsp_bank.ModRecord;
var
 PK_Index : int64;
 use_beg, use_end : TDateTime;
 Fsp_bank_ADD : TFsp_bank_ADD;
begin

 if DataSet.RecordCount = 0 then exit;
 if (SYS_IS_CH) then if DataSet['ID_DEPARTMENT'] <> SYS_CURRENT_DEPARTMENT then
 begin
   agShowMessage('Неможливо змінити банк іншого підрозділу.');
   exit;
 end;

 Fsp_bank_ADD := TFsp_bank_ADD.Create(Self);
 Fsp_bank_ADD.Caption := 'Змінити запис';
 Fsp_bank_ADD.OKButton.Caption := 'Змінити';

 Fsp_bank_ADD.NameEdit.Text := DataSet.FieldByName('NAME_MFO').AsString;
 Fsp_bank_ADD.CityEdit.Text := DataSet.FieldByName('CITY').AsString;
 Fsp_bank_ADD.MFOEdit.Text := DataSet.FieldByName('MFO').AsString;
// Fsp_bank_ADD.Edit1.Text := DataSet['NAME_MFO'];
 Fsp_bank_ADD.id_bank := TFIBBCDField(DataSet.FieldByName(PK_FIELD)).AsInt64;

 Fsp_bank_ADD.ShowModal;
 if Fsp_bank_ADD.MResult = 'cancel' then exit;
 {
  PUB_SP_SP_BANK_MOD

  IN_ID_BANK INTEGER,
  IN_MFO VARCHAR(16),
  IN_NAME_MFO VARCHAR(80),
  IN_CITY VARCHAR(30)
 }
 PK_Index := TFIBBCDField(DataSet.FieldByName(PK_FIELD)).AsInt64;
 use_beg  := now;
 use_end  := SYS_MAX_TIMESTAMP;
 PK_Index:=Dataset.FieldByName('ID_BANK').AsVariant;

  WriteTransaction.StartTransaction;
  StoredProc.StoredProcName := 'PUB_SP_SP_BANK_MOD';
  StoredProc.Prepare;
  StoredProc.ParamByName('IN_ID_BANK').AsInt64 := PK_Index;
  StoredProc.ParamByName('IN_MFO').AsString := Fsp_bank_ADD.MFOEdit.Text;
  StoredProc.ParamByName('IN_NAME_MFO').AsString := Fsp_bank_ADD.NameEdit.Text;
  StoredProc.ParamByName('IN_CITY').AsString := Fsp_bank_ADD.CityEdit.Text;
  StoredProc.ParamByName('ID_USER').AsInteger := SYS_ID_USER;
  StoredProc.ParamByName('COMP_IP').AsString := GetIPAddress;
  StoredProc.ParamByName('COMP_NAME').AsString := GetCompName;
  {
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure(MOD_PROC, [PK_Index, Fsp_bank_ADD.MFOEdit.Text, Fsp_bank_ADD.NameEdit.Text, Fsp_bank_ADD.CityEdit.Text]);
    StoredProc.Transaction.Commit;
  }
   try
      StoredProc.ExecProc;
    except on e:Exception do
      begin
        ShowMessage(e.Message);
        WriteTransaction.Rollback;
        Exit;
      end;
    end;
 WriteTransaction.Commit;
 
 Dataset.CloseOpen(true);
 DataSet.Locate('ID_BANK', PK_Index, []);
 Fsp_bank_ADD.Free;
end;

procedure TFsp_bank.EditButtonClick(Sender: TObject);
begin
 ModRecord;
end;

procedure TFsp_bank.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TFsp_bank.DBGridDblClick(Sender: TObject);
begin
 if ChooseButton.Enabled and (ivAlways = ChooseButton.Visible) then ChooseButtonClick(Self);
end;

procedure TFsp_bank.SelButtonClick(Sender: TObject);
begin
 ModalResult := mrOK;
end;

procedure TFsp_bank.ActionModExecute(Sender: TObject);
begin
 ModRecord;
end;

procedure TFsp_bank.ActionDelExecute(Sender: TObject);
begin
 DeleteRecord;
end;

procedure TFsp_bank.ActionAddExecute(Sender: TObject);
begin
 AddRecord;
end;

procedure TFsp_bank.ActionSelExecute(Sender: TObject);
begin
 DBGridDblClick(Sender);
end;

procedure TFsp_bank.N1Click(Sender: TObject);
begin
 AddRecord;
end;

procedure TFsp_bank.N2Click(Sender: TObject);
begin
 ModRecord;
end;

procedure TFsp_bank.N3Click(Sender: TObject);
begin
 DeleteRecord;
end;

procedure TFsp_bank.N6Click(Sender: TObject);
begin
 DBGridDblClick(Sender);
end;

procedure TFsp_bank.N5Click(Sender: TObject);
begin
 RefreshDbGrid;
end;

procedure TFsp_bank.FormShow(Sender: TObject);
begin
 DataSet.ParamByName('ID_DEP').AsInteger := id_department;
 DataSet.Open;
 cxGrid1DBTableView1.DataController.FocusedRowIndex := 0;
end;

procedure TFsp_bank.RefreshButtonClick(Sender: TObject);
var
 id_bank : integer;
begin
 if DataSet.RecordCount = 0 then begin
  Dataset.CloseOpen(true);
  exit;
 end;
 id_bank := DataSet['ID_BANK'];
 DataSet.ParamByName('ID_DEP').AsInteger := id_department;
 DataSet.CloseOpen(true);
 DataSet.Locate('ID_BANK', id_bank, [loCaseInsensitive]);
end;

procedure TFsp_bank.cxGrid1DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then if ChooseButton.Enabled then SelButtonClick(Self);
 if Key = #27 then Close;
end;

procedure TFsp_bank.SearchEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then cxGrid1.SetFocus;
end;

procedure TFsp_bank.UpdateButtonClick(Sender: TObject);
begin
 ModRecord;
end;

procedure TFsp_bank.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TFsp_bank.ChooseButtonClick(Sender: TObject);
begin
   if DataSet.Active and (DataSet.RecordCount>0)
   then begin
 if (SYS_IS_CH) then if DataSet['ID_DEPARTMENT'] <> SYS_CURRENT_DEPARTMENT then
 begin
   agShowMessage('Неможливо вибрати банк іншого підрозділу.');
   exit;
 end;
      ResultValue:=VarArrayCreate([0,3],varVariant);
      ResultValue[0]:=DataSet.FieldByName('ID_BANK').Value;
      ResultValue[1]:=DataSet.FieldByName('NAME_MFO').Value;
      ResultValue[2]:=DataSet.FieldByName('MFO').Value;
      ResultValue[3]:=DataSet.FieldByName('CITY').Value;
      ModalResult:=mrYes;
   end
   else begin
     //
   end;
end;

procedure TFsp_bank.cxGrid1DblClick(Sender: TObject);
begin
  ChooseButtonClick(self);
end;

procedure TFsp_bank.SearchEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if RadioButtonMFO.Checked then DataSet.Locate('MFO', SearchEdit.Text, [loPartialKey]);
 if RadioButtonName.Checked then DataSet.Locate('NAME_MFO', SearchEdit.Text, [loPartialKey]);
 if Key = VK_return then begin
  cxGrid1.SetFocus;
 end;
end;

procedure TFsp_bank.cxCheckBox1Click(Sender: TObject);
begin
 if dontRef then exit; 
 cxButton1Click(Self);
 if cxCheckBox1.Checked then id_department := -1 else id_department := SYS_CURRENT_DEPARTMENT;
 DataSet.ParamByName('ID_DEP').AsInteger := id_department;
 RefreshButtonClick(Self);
end;

procedure TFsp_bank.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(WorkDatabase.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;

            //FieldValues['Root_Department'] := 2612;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
        // показать справочник и проанализировать результат (выбор одного подр.)
    sp.Show;
    if sp.Output = nil then ShowMessage('BUG: Output is NIL!!!')
                       else if not sp.Output.IsEmpty then
                            begin
                              id_department := sp.Output['Id_Department'];
                              DepEdit.Text := sp.Output['Name_FULL'];
                              dontRef := true;
                              cxCheckBox1.Checked := false;
                              dontRef := false;
                              RefreshButtonClick(Self);
                            end;
    sp.Free;
end;

procedure TFsp_bank.cxButton1Click(Sender: TObject);
begin
 DepEdit.text := '';
 id_department := -1;
 RefreshButtonClick(Self);
end;

procedure TFsp_bank.dxBarLargeButton1Click(Sender: TObject);
var
 f : TfrmBankHis;
 id_bank : integer;
begin
 if DataSet.RecordCount = 0 then exit;
 f := TfrmBankHis.Create(Self);
 f.DataSet.ParamByName('ID_BANK').AsInt64 := DataSet['ID_BANK'];
 f.ShowModal;
 f.Free;
end;

end.
