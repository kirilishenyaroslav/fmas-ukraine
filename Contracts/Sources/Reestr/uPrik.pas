unit uPrik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, StdCtrls, cxButtons, DB,
  FIBDataSet, pFIBDataSet, ibase, cnConsts, cn_Common_Funcs, Registry,
  uReestr_DM;

type
  TfrmPrik = class(TForm)
    cancel_button: TcxButton;
    ok_button: TcxButton;
    type_prik_commbobox: TcxComboBox;
    cxLabel1: TcxLabel;
    spec_combobox: TcxComboBox;
    cxLabel2: TcxLabel;
    form_stud_combobox: TcxComboBox;
    cxLabel3: TcxLabel;
    Kat_stud_combobox: TcxComboBox;
    cxLabel4: TcxLabel;
    Read_DataSet: TpFIBDataSet;
    cxLabel5: TcxLabel;
    Facul_ComboBox: TcxComboBox;
    procedure cancel_buttonClick(Sender: TObject);
    procedure ok_buttonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure type_prik_commboboxPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Facul_ComboBoxPropertiesChange(Sender: TObject);
  private
    DM : TfrmReestr_DM;
  public
    aHandle : TISC_DB_HANDLE;
    id_prik, id_facul, id_spec, id_form_stud, id_kat_stud : array of Int64;
    PLanguageIndex : Byte;
    id_user : Int64;
    Date_beg_reg : Tdate;
  end;

var
  frmPrik: TfrmPrik;

implementation

uses uReg, uReg_Add;

{$R *.dfm}

procedure TfrmPrik.cancel_buttonClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfrmPrik.ok_buttonClick(Sender: TObject);
var
  T : TfrReg_Add;
  Reg : TRegistry;
begin
  reg:=TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if  reg.OpenKey('\Software\Contracts\Reestr\',True) then
   begin
    reg.WriteString('LastPrik',IntToStr(id_prik[type_prik_commbobox.ItemIndex]));
   end;
   finally
   Reg.Free;
  end;

  if  type_prik_commbobox.Text='' then
   Begin
    ShowMessage('ÕÂÓ·ı≥‰ÌÓ ‚Ë·‡ÚË Ì‡Í‡Á');
    exit;
   End;

  T:=TfrReg_Add.Create(self);
  T.PLanguageIndex:=PLanguageIndex;
  T.Caption:=cn_InsertBtn_Caption[PLanguageIndex];
  T.id_user:=Id_User;
  T.Sql_select:='SELECT * FROM CN_SELECT_FOR_REESTR_BY_PRIK('+IntToStr(id_prik[type_prik_commbobox.ItemIndex])+','
                                                             +IntToStr(id_facul[Facul_ComboBox.ItemIndex])+','
                                                             +IntToStr(id_spec[spec_combobox.ItemIndex])+','
                                                             +IntToStr(id_form_stud[form_stud_combobox.ItemIndex])+','
                                                             +IntToStr(id_kat_stud[Kat_stud_combobox.ItemIndex])+', :date_beg_reg)';
  T.Name_prik:=type_prik_commbobox.Text;
  T.Name_facul:=Facul_ComboBox.Text;
  T.Name_spec:=spec_combobox.Text;
  T.Name_Form:=form_stud_combobox.Text;
  T.Name_kat:=Kat_stud_combobox.Text;
  T.Date_beg_reg := Date_beg_reg;
  T.showModal;
  T.Free;

  ModalResult:=mrOk;
end;

procedure TfrmPrik.FormShow(Sender: TObject);
var
  I:Integer;
  Reg : TRegistry;
  id_prik_reg : Int64;
  run : Boolean;
begin
  DM := TfrmReestr_DM.Create(self);
  DM.DB.Handle := aHandle;
  DM.DB.Connected := True;
  DM.Tran_Read.StartTransaction;

  Read_DataSet.Close;
  Read_DataSet.SQLs.SelectSQL.Text:='SELECT * FROM EXCH_DT_PRIK_ZACH_ABIT pza WHERE IS_OLD=0 and exists (SELECT first(1) NUM_DOG_OUT FROM CN_SELECT_FOR_REESTR_BY_PRIK(pza.id_prikz,-1,-1,-1,-1, :date_beg_reg)) order by NPRIKZ';
  Read_DataSet.ParamByName('Date_beg_reg').AsDate := Date_beg_reg;
  Read_DataSet.Open;

  Read_DataSet.FetchAll;
  SetLength(id_prik,Read_DataSet.RecordCount);

  type_prik_commbobox.Properties.Items.Clear;

  i:=0; Read_DataSet.First;
  while not Read_DataSet.Eof do
   Begin
    if (Read_DataSet['ID_PRIKZ']<>null) and (Read_DataSet['NPRIKZ']<>null) and (Read_DataSet['DPRIKZ']<>null) then
     Begin
      id_prik[i]:=Read_DataSet['ID_PRIKZ'];
      type_prik_commbobox.Properties.Items.add('Õ‡Í‡Á π'+Read_DataSet['NPRIKZ']+' ‚≥‰ '+DateToStr(Read_DataSet['DPRIKZ']));
      i:=i+1;
     End;
    Read_DataSet.Next;
   end;

  reg:=TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if  reg.OpenKey('\Software\Contracts\Reestr\',False) then
    begin
     id_prik_reg := StrToInt(Reg.ReadString('LastPrik'));

     i := 0; run := True;
     While ((i<Read_DataSet.RecordCount) and (run)) do
      Begin
        if id_prik[i] = id_prik_reg then
         Begin
          type_prik_commbobox.ItemIndex:=i;
          run := false;
         End;
        i:=i+1;
      end;
    end;
   finally
    Reg.free;
  end;
  if type_prik_commbobox.Text = '' then type_prik_commbobox.ItemIndex:=0;
end;

procedure TfrmPrik.type_prik_commboboxPropertiesChange(Sender: TObject);
var
  i:Integer;
begin
//---------------------------SELECT FACUL---------------------------------------
  Read_DataSet.Close;
  Read_DataSet.SQLs.SelectSQL.clear;
  Read_DataSet.SQLs.SelectSQL.Add('    SELECT distinct f.name, f.id_facul ');
  Read_DataSet.SQLs.SelectSQL.Add('      FROM cn_dt_stud_inf si ');
  Read_DataSet.SQLs.SelectSQL.Add('inner join exch_dt_nst_dog e ');
  Read_DataSet.SQLs.SelectSQL.Add('        on (si.id_dog=e.id_dog_cn and e.date_beg=si.date_beg)');
  Read_DataSet.SQLs.SelectSQL.Add('inner join cn_sp_facul f ');
  Read_DataSet.SQLs.SelectSQL.Add('        on (f.id_facul=si.id_facul) ');
  Read_DataSet.SQLs.SelectSQL.Add('     Where e.id_prikz=:id_prik ');
  Read_DataSet.ParamByName('id_prik').AsInt64:=id_prik[type_prik_commbobox.ItemIndex];
  Read_DataSet.Open;

  Read_DataSet.FetchAll;
  SetLength(id_facul, Read_DataSet.RecordCount+1);

  Facul_ComboBox.Properties.OnChange := nil;
  Facul_ComboBox.Properties.Items.Clear;
  Facul_ComboBox.Text:='';
  Facul_ComboBox.Properties.Items.Add('”—≤ ‘¿ ”À‹“≈“»');
  id_facul[0]:=-1;

  i:=1; Read_DataSet.First;
  while not Read_DataSet.Eof do
   Begin
    if (Read_DataSet['ID_FACUL']<>null) and (Read_DataSet['NAME']<>null) then
     Begin
      id_facul[i]:=Read_DataSet['ID_FACUL'];
      Facul_ComboBox.Properties.Items.add(Read_DataSet['NAME']);
      i:=i+1;
     End;
    Read_DataSet.Next;
   end;
  Facul_ComboBox.Properties.OnChange := Facul_ComboBoxPropertiesChange;
  Facul_ComboBox.ItemIndex :=0;
{//---------------------------SELECT SPEC----------------------------------------
  Read_DataSet.Close;
  Read_DataSet.SQLs.SelectSQL.clear;
  Read_DataSet.SQLs.SelectSQL.Add('    SELECT distinct s.name, s.id_spec ');
  Read_DataSet.SQLs.SelectSQL.Add('      FROM cn_dt_stud_inf si ');
  Read_DataSet.SQLs.SelectSQL.Add('inner join exch_dt_nst_dog e ');
  Read_DataSet.SQLs.SelectSQL.Add('        on (si.id_dog=e.id_dog_cn and e.date_beg=si.date_beg)');
  Read_DataSet.SQLs.SelectSQL.Add('inner join cn_sp_spec s ');
  Read_DataSet.SQLs.SelectSQL.Add('        on (s.id_spec=si.id_spec) ');
  Read_DataSet.SQLs.SelectSQL.Add('     Where e.id_prikz=:id_prik ');
  Read_DataSet.ParamByName('id_prik').AsInt64:=id_prik[type_prik_commbobox.ItemIndex];
  Read_DataSet.Open;

  Read_DataSet.FetchAll;
  SetLength(id_spec,Read_DataSet.RecordCount+1);

  spec_combobox.Properties.Items.Clear;
  spec_combobox.Text:='';
  spec_combobox.Properties.Items.Add('”—≤ —œ≈÷≤¿À‹ÕŒ—“≤');
  id_spec[0]:=-1;

  i:=1; Read_DataSet.First;
  while not Read_DataSet.Eof do
   Begin
    if (Read_DataSet['ID_SPEC']<>null) and (Read_DataSet['NAME']<>null) then
     Begin
      id_spec[i]:=Read_DataSet['ID_SPEC'];
      spec_combobox.Properties.Items.add(Read_DataSet['NAME']);
      i:=i+1;
     End;
    Read_DataSet.Next;
   end;
  spec_combobox.ItemIndex:=0;     }
//---------------------------SELECT FORM STUD-----------------------------------
  Read_DataSet.Close;
  Read_DataSet.SQLs.SelectSQL.clear;
  Read_DataSet.SQLs.SelectSQL.Add('    SELECT distinct s.name, s.ID_FORM_STUD');
  Read_DataSet.SQLs.SelectSQL.Add('      FROM cn_dt_stud_inf si');
  Read_DataSet.SQLs.SelectSQL.Add('inner join exch_dt_nst_dog e');
  Read_DataSet.SQLs.SelectSQL.Add('        on (si.id_dog=e.id_dog_cn and e.date_beg=si.date_beg)');
  Read_DataSet.SQLs.SelectSQL.Add('inner join cn_sp_form_stud s');
  Read_DataSet.SQLs.SelectSQL.Add('        on (s.ID_FORM_STUD=si.ID_FORM_STUD)');
  Read_DataSet.SQLs.SelectSQL.Add('     Where e.id_prikz=:id_prik');
  Read_DataSet.ParamByName('id_prik').AsInt64:=id_prik[type_prik_commbobox.ItemIndex];
  Read_DataSet.Open;

  Read_DataSet.FetchAll;
  SetLength(id_form_stud,Read_DataSet.RecordCount+1);

  form_stud_combobox.Properties.Items.Clear;
  form_stud_combobox.Text:='';
  form_stud_combobox.Properties.Items.Add('”—≤ ‘Œ–Ã» Õ¿¬◊¿ÕÕﬂ');
  id_form_stud[0]:=-1;

  i:=1; Read_DataSet.First;
  while not Read_DataSet.Eof do
   Begin
    if (Read_DataSet['ID_FORM_STUD']<>null) and (Read_DataSet['NAME']<>null) then
     Begin
      id_form_stud[i]:=Read_DataSet['ID_FORM_STUD'];
      form_stud_combobox.Properties.Items.add(Read_DataSet['NAME']);
      i:=i+1;
     End;
    Read_DataSet.Next;
   end;
  form_stud_combobox.ItemIndex:=0;
//---------------------------SELECT KAT STUD------------------------------------
Read_DataSet.Close;
  Read_DataSet.SQLs.SelectSQL.clear;
  Read_DataSet.SQLs.SelectSQL.Add('    SELECT distinct s.name, s.ID_KAT_STUD');
  Read_DataSet.SQLs.SelectSQL.Add('      FROM cn_dt_stud_inf si');
  Read_DataSet.SQLs.SelectSQL.Add('inner join exch_dt_nst_dog e');
  Read_DataSet.SQLs.SelectSQL.Add('        on (si.id_dog=e.id_dog_cn  and e.date_beg=si.date_beg)');
  Read_DataSet.SQLs.SelectSQL.Add('inner join CN_SP_KAT_STUD s');
  Read_DataSet.SQLs.SelectSQL.Add('        on (s.ID_KAT_STUD=si.ID_KAT_STUD)');
  Read_DataSet.SQLs.SelectSQL.Add('     Where e.id_prikz=:id_prik');
  Read_DataSet.ParamByName('id_prik').AsInt64:=id_prik[type_prik_commbobox.ItemIndex];
  Read_DataSet.Open;

  Read_DataSet.FetchAll;
  SetLength(id_kat_stud,Read_DataSet.RecordCount+1);

  Kat_stud_combobox.Properties.Items.Clear;
  Kat_stud_combobox.Text:='';
  Kat_stud_combobox.Properties.Items.Add('”—≤  ¿“≈√Œ–≤Ø Õ¿¬◊¿ÕÕﬂ');
  id_kat_stud[0]:=-1;

  i:=1; Read_DataSet.First;
  while not Read_DataSet.Eof do
   Begin
    if (Read_DataSet['ID_KAT_STUD']<>null) and (Read_DataSet['NAME']<>null) then
     begin
      id_kat_stud[i]:=Read_DataSet['ID_KAT_STUD'];
      Kat_stud_combobox.Properties.Items.add(Read_DataSet['NAME']);
      i:=i+1;
     End;
    Read_DataSet.Next;
   end;
  Kat_stud_combobox.ItemIndex:=0;
end;

procedure TfrmPrik.FormCreate(Sender: TObject);
begin
   PLanguageIndex:=cn_Common_Funcs.cnLanguageIndex();
   ok_button.caption:= cn_Accept[PLanguageIndex];
   ok_button.Hint:= cn_Accept[PLanguageIndex];

   cancel_button.Caption:= cn_cancel[PLanguageIndex];
   cancel_button.Hint:= cn_cancel[PLanguageIndex];
end;

procedure TfrmPrik.Facul_ComboBoxPropertiesChange(Sender: TObject);
var
  i : integer;
begin
  if Facul_ComboBox.ItemIndex = 0 then
   begin
    Read_DataSet.Close;
    Read_DataSet.SQLs.SelectSQL.clear;
    Read_DataSet.SQLs.SelectSQL.Add('    SELECT distinct s.name, s.id_spec ');
    Read_DataSet.SQLs.SelectSQL.Add('      FROM cn_dt_stud_inf si ');
    Read_DataSet.SQLs.SelectSQL.Add('inner join exch_dt_nst_dog e ');
    Read_DataSet.SQLs.SelectSQL.Add('        on (si.id_dog=e.id_dog_cn and e.date_beg=si.date_beg)');
    Read_DataSet.SQLs.SelectSQL.Add('inner join cn_sp_spec s ');
    Read_DataSet.SQLs.SelectSQL.Add('        on (s.id_spec=si.id_spec) ');
    Read_DataSet.SQLs.SelectSQL.Add('     Where e.id_prikz=:id_prik ');
    Read_DataSet.ParamByName('id_prik').AsInt64 := id_prik[type_prik_commbobox.ItemIndex];
    Read_DataSet.Open;
   end
  else
   begin
    Read_DataSet.Close;
    Read_DataSet.SQLs.SelectSQL.clear;
    Read_DataSet.SQLs.SelectSQL.Add('    SELECT distinct s.name, s.id_spec ');
    Read_DataSet.SQLs.SelectSQL.Add('      FROM cn_dt_stud_inf si ');
    Read_DataSet.SQLs.SelectSQL.Add('inner join exch_dt_nst_dog e ');
    Read_DataSet.SQLs.SelectSQL.Add('        on (si.id_dog=e.id_dog_cn and e.date_beg=si.date_beg)');
    Read_DataSet.SQLs.SelectSQL.Add('inner join cn_sp_spec s ');
    Read_DataSet.SQLs.SelectSQL.Add('        on (s.id_spec=si.id_spec) ');
    Read_DataSet.SQLs.SelectSQL.Add('inner join CN_JN_FACUL_SPEC jfs ');
    Read_DataSet.SQLs.SelectSQL.Add('        on (jfs.id_spec=s.id_spec) ');
    Read_DataSet.SQLs.SelectSQL.Add('     Where e.id_prikz=:id_prik and jfs.id_facul=:id_facul');
    Read_DataSet.ParamByName('id_prik').AsInt64   := id_prik[type_prik_commbobox.ItemIndex];
    Read_DataSet.ParamByName('id_facul').AsInt64  := id_facul[Facul_ComboBox.ItemIndex];
    Read_DataSet.Open;
   end;

  Read_DataSet.FetchAll;
  SetLength(id_spec,Read_DataSet.RecordCount+1);

  spec_combobox.Properties.Items.Clear;
  spec_combobox.Text:='';
  spec_combobox.Properties.Items.Add('”—≤ —œ≈÷≤¿À‹ÕŒ—“≤');
  id_spec[0]:=-1;

  i:=1; Read_DataSet.First;
  while not Read_DataSet.Eof do
   Begin
    if (Read_DataSet['ID_SPEC']<>null) and (Read_DataSet['NAME']<>null) then
     Begin
      id_spec[i]:=Read_DataSet['ID_SPEC'];
      spec_combobox.Properties.Items.add(Read_DataSet['NAME']);
      i:=i+1;
     End;
    Read_DataSet.Next;
   end;
  spec_combobox.ItemIndex:=0;
end;

end.
