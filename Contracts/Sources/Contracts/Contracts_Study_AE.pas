unit Contracts_Study_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, StdCtrls, cxControls, cxGroupBox, cxButtons,
  cnConsts, ibase,
  AllPeopleUnit, Buttons, DB, FIBDataSet, pFIBDataSet, DM;

type
  Tfrm_Contracts_Study_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Frame_GroupBox: TcxGroupBox;
    Studer_Label: TLabel;
    Studer_Edit: TcxButtonEdit;
    EditFizLizo_Btn: TSpeedButton;
    LowSpecimen_Edit: TcxButtonEdit;
    LowSpecimen_Label: TLabel;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Studer_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Studer_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditFizLizo_BtnClick(Sender: TObject);
    procedure LowSpecimen_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    DM:TDM_Contracts;
    PLanguageIndex:byte;
    DB_sp_Handle:TISC_DB_HANDLE;
    need_represent : Boolean;
    procedure FormIniLanguage;
  public
     ID_MAN, id_man_parent: int64;
     ID_DOG_ROOT, ID_STUD: int64;
     CN_USE_EDBO_FIZ_LIC : Integer;
     is_main_dog : Boolean;
     constructor Create(AOwner:TComponent; LanguageIndex : byte; DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;

var
  frm_Contracts_Study_AE: Tfrm_Contracts_Study_AE;

implementation


{$R *.dfm}
constructor Tfrm_Contracts_Study_AE.Create(AOwner:TComponent; LanguageIndex : byte; DB_Handle:TISC_DB_HANDLE);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 FormIniLanguage();
 DB_sp_Handle:= DB_Handle;
 Screen.Cursor:=crDefault;
 end;


procedure Tfrm_Contracts_Study_AE.FormIniLanguage;
begin
Studer_Label.caption:=    cnConsts.cn_Studer[PLanguageIndex];
EditFizLizo_Btn.Hint :=   cnConsts.cn_FizLizoEdit[PLanguageIndex];
LowSpecimen_Label.caption:=    cnConsts.cn_LowSpecimen[PLanguageIndex];
OkButton.Caption:=        cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=    cnConsts.cn_Cancel[PLanguageIndex];
end;

procedure Tfrm_Contracts_Study_AE.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Contracts_Study_AE.OkButtonClick(Sender: TObject);
begin
  if Studer_Edit.Text= '' then
   begin
    ShowMessage(cnConsts.cn_Studer_Need[PLanguageIndex]);
    Studer_Edit.SetFocus;
    exit;
   end;

  {if need_represent then
   if LowSpecimen_Edit.Text = '' then
    Begin
     ShowMessage(cnConsts.cn_LowSpecimen_Need[PLanguageIndex]);
     Studer_Edit.SetFocus;
     exit;
    end;
   } 
  ModalResult := mrOk;
end;

procedure Tfrm_Contracts_Study_AE.FormShow(Sender: TObject);
begin
  if CN_USE_EDBO_FIZ_LIC = 1
   then EditFizLizo_Btn.Enabled := False
   else EditFizLizo_Btn.Enabled := True;
   
  Studer_Edit.setFocus;

  if caption = cnConsts.cn_InsertBtn_Caption[PLanguageIndex]
   then Studer_EditPropertiesButtonClick(self, 1);
end;

procedure Tfrm_Contracts_Study_AE.Studer_EditKeyPress(Sender: TObject;
  var Key: Char);
var Massiv: Variant;
begin
if key = #13 then OkButton.SetFocus
else
if key <> #0 then
begin
   if ID_MAN = -1 then Massiv:=AllPeopleUnit.GetMan(Self, DB_sp_Handle ,False,False)
  else Massiv:=AllPeopleUnit.GetMan(Self, DB_sp_Handle ,False,False, ID_MAN);
if VarArrayDimCount(Massiv)>0 then
 begin
  ID_MAN:=-1; // обнуление
  ID_MAN:= Massiv[0];
  Studer_Edit.text := Massiv[1];
 end;
end;

end;

procedure Tfrm_Contracts_Study_AE.Studer_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Massiv: Variant;
  is_select : Boolean;
begin
  is_select := false;
  need_represent := false;
  if is_main_dog then
   Begin
    if CN_USE_EDBO_FIZ_LIC = 0 then
     Begin
      Massiv := AllPeopleUnit.GetManForASUP(Self, DB_sp_Handle ,False, True, ID_MAN);

      If VarArrayDimCount(Massiv)>0 then
       begin
        ID_MAN:=-1; // обнуление
        ID_MAN:= Massiv[0];
        Studer_Edit.text := Massiv[1];

        is_select := True;
       end;
     End
     else
      Begin
       Massiv := AllPeopleUnit.GetManFromEdbo(Self, DB_sp_Handle, False, id_man);

       If VarArrayDimCount(Massiv)>0 then
        begin
         ID_MAN:=-1; // обнуление
         ID_MAN:= Massiv[0];
         Studer_Edit.text := Massiv[1];

         is_select := True;
        End
      end;
   end
   else
    Begin
     Massiv := AllPeopleUnit.GetManForASUP(Self, DB_sp_Handle ,False, True, ID_MAN);

     If VarArrayDimCount(Massiv)>0 then
      begin
       ID_MAN:=-1; // обнуление
       ID_MAN:= Massiv[0];
       Studer_Edit.text := Massiv[1];

       is_select := True;
      end;
    end;

  If is_select then
   Begin
    // определяю совершеннолетие
    Dm := TDM_Contracts.Create(self);
    Dm.DB.Handle := DB_sp_Handle;
    Dm.ReadDataset.SelectSQL.Clear;
    Dm.ReadDataset.SelectSQL.Text := 'select IS18 from CN_MAN_BORNDATE_IS18(:id_man)';
    Dm.ReadDataset.ParamByName('id_man').AsInt64 := ID_MAN;
    Dm.ReadDataset.Open;
    need_represent := bool(Dm.ReadDataset['IS18']);
    LowSpecimen_Edit.Enabled := need_represent;
    Dm.ReadDataset.Close;
    Dm.Free;
   end; 
end;

procedure Tfrm_Contracts_Study_AE.EditFizLizo_BtnClick(Sender: TObject);
begin
  if CN_USE_EDBO_FIZ_LIC = 0 then
   Begin
    If ID_MAN <> -1 then ShowManEditForm(Self,  DB_sp_Handle , ID_MAN,  True);

    Dm := TDM_Contracts.Create(self);
    Dm.DB.Handle := DB_sp_Handle;
    Dm.ReadDataset.SelectSQL.Clear;
    Dm.ReadDataset.SelectSQL.Text := 'select * from CN_GET_FIO_BY_ID_MAN(' + inttostr(ID_MAN) + ')';
    Dm.ReadDataset.Open;
    Studer_Edit.Text := Dm.ReadDataset['FIO_PEOPLE'];
    Dm.ReadDataset.Close;

    // по особому желанию трудящихся обновляю таблицы с фамилиями сразу после редактирования
    with DM.StProc do
     try
      Transaction.StartTransaction;
      StoredProcName := 'CN_DT_DOG_ROOT_FIO_PEOPLE_UPT';
      Prepare;
      ParamByName('ID_DOG_ROOT').AsInt64 := ID_DOG_ROOT;
      ParamByName('ID_STUD').AsInt64     := ID_STUD;
      ParamByName('ID_MAN').AsInt64      := ID_MAN;
      ParamByName('FIO').AsString        := Studer_Edit.Text;
      ExecProc;
      Transaction.Commit;
     except
      Transaction.Rollback;
      raise;
     end;
    Dm.Free;
   end;
end;

procedure Tfrm_Contracts_Study_AE.LowSpecimen_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Massiv: Variant;
begin
  Massiv:=AllPeopleUnit.GetManForASUP(Self, DB_sp_Handle ,False,True, ID_MAN);

  if VarArrayDimCount(Massiv)>0 then
   begin
    id_man_parent:=-1; // обнуление
    id_man_parent:= Massiv[0];
    LowSpecimen_Edit.text := Massiv[1];
   end;
end;

end.




