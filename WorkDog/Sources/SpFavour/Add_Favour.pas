unit Add_Favour;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCheckBox, cxDropDownEdit, cxCalendar, cxMaskEdit,
  cxButtonEdit, cxControls, cxContainer, cxEdit, cxTextEdit, StdCtrls,
  cxLookAndFeelPainters, cxButtons, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, pFIBStoredProc, FIBQuery, pFIBQuery,IBAse,
  LoaderUnit,dogLoaderUnit,LoadDogManedger, ActnList,SprTypeFav, cxSplitter,
  cxCurrencyEdit,DateUtils;

type
  TForm1 = class(TForm)
    MainDB: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    pFIBStoredProc1: TpFIBStoredProc;
    GroupBox1: TGroupBox;
    NameEdit: TcxTextEdit;
    CodeEdit: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    DateBeg: TcxDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    DateEnd: TcxDateEdit;
    Label5: TLabel;
    Label6: TLabel;
    EdizmEdit: TcxButtonEdit;
    ActionList1: TActionList;
    Action1: TAction;
    SaveProc: TpFIBStoredProc;
    pFIBTransaction2: TpFIBTransaction;
    Label8: TLabel;
    GroupBox3: TGroupBox;
    TypeEdit: TcxButtonEdit;
    GroupBox2: TGroupBox;
    Label18: TLabel;
    S_Label: TLabel;
    R_Label: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    St_Label: TLabel;
    Label15: TLabel;
    KEKV_Label: TLabel;
    SumEditButton: TcxButton;
    SumEdit: TcxCurrencyEdit;
    Sn: TLabel;
    Rn: TLabel;
    Stn: TLabel;
    Kn: TLabel;
    AllowSumBox: TcxCheckBox;
    NdsBox: TcxCheckBox;
    DblNdsBox: TcxCheckBox;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    TarBox: TcxCheckBox;
    Label7: TLabel;
    EditPR_VNZ: TcxCurrencyEdit;
    Label9: TLabel;
    Label10: TLabel;
    NameEdit2: TcxTextEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure EdizmEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Action1Execute(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure SumEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxSplitter1AfterClose(Sender: TObject);
    procedure cxSplitter1AfterOpen(Sender: TObject);
    procedure TypeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SumEditButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CodeEditKeyPress(Sender: TObject; var Key: Char);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateBegKeyPress(Sender: TObject; var Key: Char);
    procedure DateEndKeyPress(Sender: TObject; var Key: Char);
    procedure TypeEditKeyPress(Sender: TObject; var Key: Char);
    procedure EdizmEditKeyPress(Sender: TObject; var Key: Char);
    procedure SumEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
     id_S     : integer;
     id_R     : integer;
     id_St    : integer;
     id_kekv  : integer;
     Sum      : extended;
     id_edizm : integer;
     PrCall   : String;
     id_type_f: Integer;
     id_fav   : Integer;
     id_fav_price : Integer;
     id_type_f_loc: Integer;
     Rn_       : string;
     Sn_       : string;
     id_out_fav:integer;

     procedure  InitConnection(DBhandle : TISC_DB_HANDLE);
     constructor Create(AOwner:TComponent; DBhandle : TISC_DB_HANDLE;frmStyle: TFormStyle;Pr_vizova: String;id_favour:Integer); overload;
    { Public declarations }
  end;
var
  FavourFrm: TForm1;
implementation

uses AArray;
// -----------------------------------------------------------------------------
// Конструктор класса
constructor TForm1.Create(AOwner: TComponent;DBhandle : TISC_DB_HANDLE;frmStyle: TFormStyle;Pr_vizova: String;id_favour:Integer);
begin
 inherited Create (Aowner);
 InitConnection(DBHandle); // Инициализируем связь с БД
 PrCall:=Pr_vizova;
 // Инициализация базовых параметров формы.
 FormStyle  := frmStyle;
 id_fav:=id_favour;

 // ---------------------------------------------
 // -- Признак вызова формы на просмотр услуги
 if Pr_vizova = 'view' then
 begin
  // Заполняем поля значениями из БД
  pFIBStoredProc1.Transaction.StartTransaction;
  pFIBStoredProc1.StoredProcName:='PUB_SP_ARND_FAVOUR_SEL_ID';
  pFIBStoredProc1.ParamByName('ID_F').AsInteger:=id_favour;
  pFIBStoredProc1.ExecProc;

  NameEdit.Text:=pFIBStoredProc1.FldByName['name_f'].AsString;
  CodeEdit.Text:=pFIBStoredProc1.FldByName['code_f'].AsString;
  DateBeg.Date:=pFIBStoredProc1.FldByName['date_beg'].AsDateTime;
  DateEnd.Date:=pFIBStoredProc1.FldByName['date_end'].AsDateTime;
  EdizmEdit.Text:=pFIBStoredProc1.FldByName['ed_izm'].AsString;
  S_Label.Caption:= pFIBStoredProc1.FldByName['SM'].AsString;
  R_Label.Caption:= pFIBStoredProc1.FldByName['razd'].AsString;
  ST_Label.Caption:= pFIBStoredProc1.FldByName['st'].AsString;
  Kekv_Label.Caption:= pFIBStoredProc1.FldByName['kekv'].AsString;
  SumEdit.Text:=pFIBStoredProc1.FldByName['Summ'].AsString;
  TypeEdit.Text:=pFIBStoredProc1.FldByName['type_name'].AsString;
  EditPR_VNZ.Text:=pFIBStoredProc1.FldByName['PR_VNZ'].AsString;
  NameEdit2.Text:=pFIBStoredProc1.FldByName['name_f_long'].AsString;

  id_S       := pFIBStoredProc1.FldByName['id_smo'].AsInteger;
  id_R       := pFIBStoredProc1.FldByName['id_razdo'].AsInteger;
  id_St      := pFIBStoredProc1.FldByName['id_sto'].AsInteger;
  id_Kekv    := pFIBStoredProc1.FldByName['id_kekvo'].AsInteger;

  Sn.Caption := pFIBStoredProc1.FldByName['SN'].AsString + '.';
  Rn.Caption := pFIBStoredProc1.FldByName['RN'].AsString + '.';
  Stn.Caption:= pFIBStoredProc1.FldByName['STN'].AsString + '.';
  Kn.Caption := pFIBStoredProc1.FldByName['KEKVN'].AsString + '.';

  Rn_:=pFIBStoredProc1.FldByName['RN'].AsString;
  Sn_:=pFIBStoredProc1.FldByName['STN'].AsString;

  id_fav_price := pFIBStoredProc1.FldByName['ID_FAV_PRICE'].AsInteger;
  id_type_f_loc:= pFIBStoredProc1.FldByName['ID_TYPE_F'].AsInteger;
  id_edizm := pFIBStoredProc1.FldByName['ID_F_EDIZM'].AsInteger;
  Sum := pFIBStoredProc1.FldByName['Summ'].AsDouble;


   if pFIBStoredProc1.FldByName['ALLOW_SUMM_EDIT'].AsString = '1' then begin
    AllowSumBox.Checked:=True; end
  else begin
    AllowSumBox.Checked:=False; end;

  if pFIBStoredProc1.FldByName['is_nds'].AsString = '1' then begin
    NdsBox.Checked:=True; end
  else begin
    NdsBox.Checked:=False; end;

  if pFIBStoredProc1.FldByName['is_dblnds'].AsString = '1' then begin
    DblNdsBox.Checked:=True; end
  else begin
    DblNdsBox.Checked:=False; end;

  if pFIBStoredProc1.FldByName['is_tar_print'].AsString = '1' then begin
    TarBox.Checked:=True; end
  else begin
    TarBox.Checked:=False; end;


  // Деактивируем возможность редактирования
  CodeEdit.Properties.ReadOnly:=true;
  CodeEdit.Style.Color:=$00D9EBE0;
  NameEdit.Properties.ReadOnly:=true;
  NameEdit.Style.Color:=$00D9EBE0;
  NameEdit2.Properties.ReadOnly:=true;
  NameEdit2.Style.Color:=$00D9EBE0;
  DateBeg.Properties.ReadOnly:=true;
  DateBeg.Style.Color:=$00D9EBE0;
  DateEnd.Properties.ReadOnly:=true;
  DateEnd.Style.Color:=$00D9EBE0;
  SumEdit.Properties.ReadOnly:=true;
  SumEdit.Style.Color:=$00D9EBE0;
  EditPR_VNZ.Properties.ReadOnly:=true;
  EditPR_VNZ.Style.Color:=$00D9EBE0;

  SumEditButton.Enabled:=false;
  //SumEdit.Properties.Buttons.Items[0].Visible:=false;
  EdizmEdit.Properties.Buttons.Items[0].Visible:=false;
  EdizmEdit.Style.Color:=$00D9EBE0;
  TypeEdit.Properties.Buttons.Items[0].Visible:=false;
  TypeEdit.Style.Color:=$00D9EBE0;

  EdizmEdit.Properties.ReadOnly:=true;
//  cxSplitter1.OpenSplitter;
end;
 // ---------------------------------------------
 // -- Вызов формы на редактирование
 if Pr_vizova = 'red' then
 begin
  pFIBStoredProc1.Transaction.StartTransaction;
  pFIBStoredProc1.StoredProcName:='PUB_SP_ARND_FAVOUR_SEL_ID';
  pFIBStoredProc1.ParamByName('ID_F').AsInteger:=id_favour;
  pFIBStoredProc1.ExecProc;

  NameEdit.Text:=pFIBStoredProc1.FldByName['name_f'].AsString;
  CodeEdit.Text:=pFIBStoredProc1.FldByName['code_f'].AsString;
  DateBeg.Date:=pFIBStoredProc1.FldByName['date_beg'].AsDateTime;
  DateEnd.Date:=pFIBStoredProc1.FldByName['date_end'].AsDateTime;
  EdizmEdit.Text:=pFIBStoredProc1.FldByName['ed_izm'].AsString;
  S_Label.Caption:= pFIBStoredProc1.FldByName['SM'].AsString;
  R_Label.Caption:= pFIBStoredProc1.FldByName['razd'].AsString;
  ST_Label.Caption:= pFIBStoredProc1.FldByName['st'].AsString;
  Kekv_Label.Caption:= pFIBStoredProc1.FldByName['kekv'].AsString;
  SumEdit.Value:=pFIBStoredProc1.FldByName['Summ'].AsDouble;
  TypeEdit.Text:=pFIBStoredProc1.FldByName['type_name'].AsString;
   EditPR_VNZ.Text:=pFIBStoredProc1.FldByName['PR_VNZ'].AsString;
  id_S       := pFIBStoredProc1.FldByName['id_smo'].AsInteger;
  id_R       := pFIBStoredProc1.FldByName['id_razdo'].AsInteger;
  id_St      := pFIBStoredProc1.FldByName['id_sto'].AsInteger;
  id_Kekv    := pFIBStoredProc1.FldByName['id_kekvo'].AsInteger;
  NameEdit2.Text:=pFIBStoredProc1.FldByName['name_f_long'].AsString;

  Sn.Caption := pFIBStoredProc1.FldByName['SN'].AsString + '.';
  Rn.Caption := pFIBStoredProc1.FldByName['RN'].AsString + '.';
  Stn.Caption:= pFIBStoredProc1.FldByName['STN'].AsString + '.';
  Kn.Caption := pFIBStoredProc1.FldByName['KEKVN'].AsString + '.';

  Rn_:=pFIBStoredProc1.FldByName['RN'].AsString;
  Sn_:=pFIBStoredProc1.FldByName['STN'].AsString;

  id_fav_price := pFIBStoredProc1.FldByName['ID_FAV_PRICE'].AsInteger;
  id_type_f_loc:= pFIBStoredProc1.FldByName['ID_TYPE_F'].AsInteger;
  id_type_f:= pFIBStoredProc1.FldByName['ID_TYPE_F'].AsInteger;
  id_edizm := pFIBStoredProc1.FldByName['ID_F_EDIZM'].AsInteger;
  Sum := pFIBStoredProc1.FldByName['Summ'].AsDouble;

  //SumEditButton.Enabled:=false;
  //SumEdit.Enabled:=false;

   if pFIBStoredProc1.FldByName['ALLOW_SUMM_EDIT'].AsString = '1' then begin
    AllowSumBox.Checked:=True; end
  else begin
    AllowSumBox.Checked:=False; end;

  if pFIBStoredProc1.FldByName['is_nds'].AsString = '1' then begin
    NdsBox.Checked:=True; end
  else begin
    NdsBox.Checked:=False; end;

  if pFIBStoredProc1.FldByName['is_dblnds'].AsString = '1' then begin
    DblNdsBox.Checked:=True; end
  else begin
    DblNdsBox.Checked:=False; end;

  if pFIBStoredProc1.FldByName['is_tar_print'].AsString = '1' then begin
    TarBox.Checked:=True; end
  else begin
    TarBox.Checked:=False; end;


 end;
 if Pr_vizova = 'add' then
 begin

 end;
end;
// -----------------------------------------------------------------------------
// Инициализация соединения с БД
procedure TForm1.InitConnection(DBhandle : TISC_DB_HANDLE);
begin
 MainDB.Handle:= DBhandle;
 pFIBTransaction1.StartTransaction;
// pFIBDataSet_spr.Database:=pFIBDatabase;
end;

procedure TForm1.cxButton1Click(Sender: TObject);
begin
end;
// -----------------------------------------------------------------------------
// Вызов справочника единиц измерения (Справочник стандартный)
procedure TForm1.EdizmEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 i, o : TAArray;
begin
 i := TAArray.Create;
 o := TAArray.Create;
 i['Owner'].AsObject := Self;
 i['FormStyle'].AsVariant := fsNormal;
 i['Caption'].AsString := 'Довiдник одиниць вимiру';
 i['CaptionEdit'].AsString := 'Одиниця вимiру';
 i['TableName'].AsString := 'PUB_SP_EDIZM';
 i['KEY_FIELD'].AsString := 'ID_F_EDIZM';
 i['parent_field'].AsString := 'linkto';
 i['FIELDS'].AsString := 'EDIZM_SHORT;EDIZM_FULL';
 i['FIELDS_caption'].AsString := 'Скорочена назва;Повна назва';
 i['SearchField'].AsString := 'EDIZM_SHORT';
 i['AddProc'].AsString := 'PUB_SP_EDIZM_INS';
 i['DelProc'].AsString := 'PUB_SP_EDIZM_DEL';
 i['UpdProc'].AsString := 'PUB_SP_EDIZM_UPD';
 i['DBHandle'].AsInteger := integer(MainDB.Handle);

 LoaderUnit.LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivTree.bpl', i, o);

 if o['MoadResult'].AsVariant = mrOk then
 begin
   id_edizm:= o['ID_F_EDIZM'].asInt64;
   EdizmEdit.Text:=o['EDIZM_SHORT'].AsString
  end;

end;
// -----------------------------------------------------------------------------
// выход по клавише Esc
procedure TForm1.Action1Execute(Sender: TObject);
begin
 Close;
end;
// -----------------------------------------------------------------------------
// Процедура сохранения услуги
procedure TForm1.cxButton2Click(Sender: TObject);
begin
 // -- Блок проверок, на заполненность всех полей

 if (id_S = null) or (id_S = 0) then begin
  ShowMessage('Ви не ввели кошторис!');
  SumEdit.SetFocus;
  Exit;
 end;

 if CodeEdit.Text = '' then begin
  ShowMessage('Ви не ввели код послуги!');
  CodeEdit.SetFocus;
  Exit;
 end;

 if NameEdit.Text = '' then begin
  ShowMessage('Ви не ввели назву послуги!');
  NameEdit.SetFocus;
  Exit;
 end;

 if TypeEdit.Text = '' then begin
  ShowMessage('Ви не ввели тип послуги!');
  TypeEdit.SetFocus;
  Exit;
 end;

 if EdizmEdit.Text = '' then begin
  ShowMessage('Ви не ввели одиницю виміру послуги!');
  EdizmEdit.SetFocus;
  Exit;
 end;

 if DateBeg.Text = '' then begin
  ShowMessage('Ви не ввели дату початка функціювання послуги!');
  DateBeg.SetFocus;
  Exit;
 end;

 if DateEnd.Text = '' then begin
  ShowMessage('Ви не ввели дату закінчення функціювання послуги!');
  DateEnd.SetFocus;
  Exit;
 end;

 if SumEdit.Text = '' then begin
  ShowMessage('Ви не ввели сумму та кошториси!');
  SumEdit.SetFocus;
  Exit;
 end;

 if NdsBox.Checked = true then
 begin
  pFIBStoredProc1.Transaction.StartTransaction;
  pFIBStoredProc1.StoredProcName:='PUB_GET_NAME_ST_BY_KOD';
  pFIBStoredProc1.ParamByName('NUM_RAZD').AsString:=Rn_;
  pFIBStoredProc1.ParamByName('NUM_ST').AsString:='7300';
  pFIBStoredProc1.ParamByName('ACTUAL_DATE').AsDateTime:=DateBeg.Date;
  pFIBStoredProc1.ExecProc;

  if (pFIBStoredProc1.FldByName['ID_ST'].AsInteger = null) or (pFIBStoredProc1.FldByName['ID_ST'].AsInteger = 0) then
  begin
    ShowMessage('Данна послуга не має ПДВ!');
    Exit;
  end;
 end;


 // Если услуга открыта только на просмотр - выходим
 if PrCall = 'view' then
 begin
  Close;
 end;
 // Если услуга открыта только на добавление - сохраняем
 if PrCall = 'add' then
 begin
  // Заполняем параметры для сохранения значений в БД
  SaveProc.Transaction.StartTransaction;
  SaveProc.StoredProcName:='PUB_SP_ARND_FAVOUR_ADD';
  SaveProc.ParamByName('code_f').AsString:=CodeEdit.Text;
  SaveProc.ParamByName('name_f').AsString:=NameEdit.Text;
  SaveProc.ParamByName('date_beg').AsDateTime:=DateBeg.Date;
  SaveProc.ParamByName('date_end').AsDateTime:=DateEnd.Date;
  SaveProc.ParamByName('PR_VNZ').AsExtended:=StrToFloatDef(EditPR_VNZ.text, 0.5);
  SaveProc.ParamByName('name_f_long').AsString:=NameEdit2.Text;

  SaveProc.ParamByName('id_s').AsInteger:=id_S;
  SaveProc.ParamByName('id_r').AsInteger:=id_R;
  SaveProc.ParamByName('id_st').AsInteger:=id_St;
  SaveProc.ParamByName('id_kekv').AsInteger:=id_kekv;
  SaveProc.ParamByName('summ').AsExtended :=Sum;
  SaveProc.ParamByName('id_f_edizm').AsInteger:=id_edizm;
  SaveProc.ParamByName('id_type').AsInteger:=id_type_f;
  SaveProc.ExecProc;
  id_out_fav:=SaveProc.FldByName['ID_FAV_OUT'].AsInteger;
  SaveProc.Transaction.Commit;
  Close;
 end;
 // Если услуга открыта только на изменение - сохраняем
 if PrCall = 'red' then
 begin

  SaveProc.Transaction.StartTransaction;
  SaveProc.StoredProcName:='PUB_SP_ARND_FAVOUR_MOD_ID';

  SaveProc.ParamByName('id_f').AsInteger:=id_fav;
  SaveProc.ParamByName('code_f').AsString:=CodeEdit.Text;
  SaveProc.ParamByName('name_f').AsString:=NameEdit.Text;
  SaveProc.ParamByName('date_beg').AsDateTime:=DateBeg.Date;
  SaveProc.ParamByName('date_end').AsDateTime:=DateEnd.Date;
  SaveProc.ParamByName('id_s').AsInteger:=id_S;
  SaveProc.ParamByName('id_r').AsInteger:=id_R;
  SaveProc.ParamByName('id_st').AsInteger:=id_St;
  SaveProc.ParamByName('id_kekv').AsInteger:= id_kekv;
  SaveProc.ParamByName('summ').AsDouble :=Sum;
  SaveProc.ParamByName('id_f_edizm').AsInteger :=id_edizm;
  SaveProc.ParamByName('id_type_f').AsInteger :=id_type_f;
  SaveProc.ParamByName('id_fav_price').AsInteger :=id_fav_price;
  SaveProc.ParamByName('PR_VNZ').AsExtended:=StrToFloatDef(EditPR_VNZ.text, 0.5);
  SaveProc.ParamByName('name_f_long').AsString:=NameEdit2.Text;

  SaveProc.ExecProc;

  SaveProc.Transaction.Commit;

  Close;
 end;
 ModalResult:=mrOk;
end;
// -----------------------------------------------------------------------------
// Привязка разбивки по сметам (и суммы)
procedure TForm1.SumEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 S, R, St : integer;
 Kekv     : integer;
 S_Name   : string;
 R_Name   : string;
 St_Name  : string;
 kekv_name: string;
 i        : integer;
 k        : integer;
 PSum     : extended;
 Add      : variant;
 cnt      : integer;
begin
 //вызов формы добавления см/з/ст/к

 if id_S <> 0 then // Для редактирования
    Add := LoadDogManedger.AddKosht(self,MainDB.Handle, -1, 2, id_S, id_R, id_St, id_kekv, Sum, Date)
 else              // Для просмотра
    Add := LoadDogManedger.AddKosht(self,MainDB.Handle, -1, 0, 0 , 0, 0, 0, 0, Date);

  // SumEdit.Properties.

 if VarArrayDimCount(Add) <= 0 then
 begin
   Exit
 end;

 Cnt := VarArrayHighBound(Add, 1);

 for k := 0 to Cnt do
 begin
   id_S      := Add[k][7];
   id_R      := Add[k][8];
   id_St     := Add[k][9];
   S_Name    := Add[k][0];
   S_Label.Caption   := S_Name; // Метка
   R_Name    := Add[k][1];
   R_Label.Caption   := R_Name; // Метка
   St_Name   := Add[k][2];
   St_Label.Caption  := St_Name;// Метка
   S         := Add[k][4];
   R         := Add[k][5];
   St        := Add[k][6];
   id_kekv   := Add[k][10];
   kekv      := Add[k][11];
   kekv_name := Add[k][12];
   KEKV_Label.Caption:= kekv_name;// Метка
   sum       := Add[k][3];
   SumEdit.Text:= FloatToStr(sum);
 end;
 if (SumEdit.Text <> '' ) then
 begin
   GroupBox2.Visible:=true;
//   cxSplitter1.OpenSplitter;
 end;

end;
{$R *.dfm}

// После закрытия сплиттера меняем размер формы
procedure TForm1.cxSplitter1AfterClose(Sender: TObject);
begin
 Self.Height:=205;
end;

procedure TForm1.cxSplitter1AfterOpen(Sender: TObject);
begin
 Self.Height:=344;
end;
// Вызов справочника типов услуг
procedure TForm1.TypeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 SprTypeFav:TForm2;
begin
 SprTypeFav:=TForm2.Create(self,MainDB.Handle,fsNormal);
 SprTypeFav.Caption      := 'Довідник типів послуг';
 if SprTypeFav.ShowModal = mrOk then
 begin
   if SprTypeFav.is_edit = '1' then begin
     AllowSumBox.Checked:=True; end
   else begin
     AllowSumBox.Checked:=False; end;

   if SprTypeFav.is_nds = '1' then begin
     NdsBox.Checked:=True; end
   else begin
     NdsBox.Checked:=False; end;

   if SprTypeFav.is_dblnds = '1' then begin
     DblNdsBox.Checked:=True; end
   else begin
     DblNdsBox.Checked:=False; end;

   if SprTypeFav.is_tar_print = '1' then begin
     TarBox.Checked:=True; end
   else begin
     TarBox.Checked:=False; end;


   id_type_f:=SprTypeFav.SelectedID;
   TypeEdit.Text:=SprTypeFav.TypeName;
   Exit;
 end;

end;

procedure TForm1.SumEditButtonClick(Sender: TObject);
var
 S, R, St : integer;
 Kekv     : integer;
 S_Name   : string;
 R_Name   : string;
 St_Name  : string;
 kekv_name: string;
 i        : integer;
 k        : integer;
 PSum     : extended;
 Add      : variant;
 cnt      : integer;
begin
 //вызов формы добавления см/з/ст/к

 if id_S <> 0 then // Для редактирования
    Add := LoadDogManedger.AddKoshtPr(self,MainDB.Handle, -1, 2, id_S, id_R, id_St, id_kekv, Sum, Date,DateBeg.Date,DateEnd.Date)
 else              // Для просмотра
    Add := LoadDogManedger.AddKoshtPr(self,MainDB.Handle, -1, 0, 0 , 0, 0, 0, 0, Date,DateBeg.Date,DateEnd.Date);

// SumEdit.Properties.

 if VarArrayDimCount(Add) <= 0 then
 begin
   Exit
 end;

 Cnt := VarArrayHighBound(Add, 1);

 for k := 0 to Cnt do
 begin
   id_S      := Add[k][7];
   id_R      := Add[k][8];
   id_St     := Add[k][9];
   S_Name    := Add[k][0];
   S_Label.Caption   := S_Name; // Метка
   R_Name    := Add[k][1];
   R_Label.Caption   := R_Name; // Метка
   St_Name   := Add[k][2];
   St_Label.Caption  := St_Name;// Метка
   S         := Add[k][4];
   R         := Add[k][5];
   St        := Add[k][6];
   id_kekv   := Add[k][10];
   kekv      := Add[k][11];
   kekv_name := Add[k][12];
   KEKV_Label.Caption:= kekv_name;// Метка
   sum       := Add[k][3];
   SumEdit.Value:= sum;
   Sn.Caption :=IntToStr(S) + '.';
   Rn.Caption :=IntToStr(R) + '.';
   Stn.Caption:=IntToStr(St) + '.';
   Kn.Caption :=IntToStr(kekv) + '.';

   Rn_:=IntToStr(R);
   Sn_:=IntToStr(St);


 end;
 if (SumEdit.Text <> '' ) then
 begin
   cxButton2.SetFocus;
 end;


  
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 DateBeg.Date := EncodeDate(Yearof(now), MonthOf(now), 1);
 DateEnd.Date := EncodeDate(9999, 12, 31);
// TarDateBeg.Date:=EncodeDate(YearOf(now), MonthOf(now),1);
// TarDateEnd.Date:=EncodeDate(9999, 12, 31);
end;

procedure TForm1.CodeEditKeyPress(Sender: TObject; var Key: Char);
begin
 if CodeEdit.Text <> '' then
 begin
   if Key = #13 then begin
    NameEdit.SetFocus;
    end;
 end;
end;

procedure TForm1.NameEditKeyPress(Sender: TObject; var Key: Char);
begin
  if NameEdit.Text <> '' then
 begin
   if Key = #13 then begin
    DateBeg.SetFocus;
    end;
 end;
end;

procedure TForm1.DateBegKeyPress(Sender: TObject; var Key: Char);
begin
 if DateBeg.Text <> '' then
 begin
   if Key = #13 then begin
    DateEnd.SetFocus;
    end;
 end;
end;

procedure TForm1.DateEndKeyPress(Sender: TObject; var Key: Char);
begin
  if DateEnd.Text <> '' then
 begin
   if Key = #13 then begin
    TypeEdit.SetFocus;
    end;
 end;
end;

procedure TForm1.TypeEditKeyPress(Sender: TObject; var Key: Char);
begin
 if TypeEdit.Text <> '' then
 begin
   if Key = #13 then begin
//    TypeEdit.Properties.OnButtonClick;
    EdizmEdit.SetFocus;
    end;
 end;
end;

procedure TForm1.EdizmEditKeyPress(Sender: TObject; var Key: Char);
begin
 if DateEnd.Text <> '' then
 begin
   if Key = #13 then begin
    TypeEdit.SetFocus;
    end;
 end;
end;

procedure TForm1.SumEditKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
    SumEditButtonClick(self);
    end;
end;



end.
