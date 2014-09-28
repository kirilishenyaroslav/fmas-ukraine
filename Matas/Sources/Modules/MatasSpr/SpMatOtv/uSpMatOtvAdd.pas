{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpMatOtvAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, IBase, cxLookAndFeelPainters, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxMRUEdit, GlobalSPR, uCommonSp,
  DB, FIBDataSet, pFIBDataSet, cxLookupEdit, cxDBLookupEdit, uResources, uMatasUtils,
  cxCheckBox, cxButtonEdit, cxDBLookupComboBox, uPackageManager, uMatasVars, cxGroupBox,
  cxCalendar;

type
  TfmSpMatOtvAdd = class(TForm)
    PibLabel: TLabel;
    DepartmentLabel: TLabel;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    DepartmentEdit: TcxButtonEdit;
    PeopleEdit: TcxButtonEdit;
    cxTipMol: TcxComboBox;
    KatLabel: TLabel;
    LabelComment: TLabel;
    cxComment: TcxTextEdit;
    cxDateBeg: TcxDateEdit;
    cxDateEnd: TcxDateEdit;
    LabelDE: TLabel;
    LabelDB: TLabel;
    chkWeb: TCheckBox;
    procedure OkButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DepartmentEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure PeopleEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    {Constructor Create(AOwner : TComponent; FMode : TFormMode;
                                aPibEdit : String; aDepartmentEdit : String;
                                aID_SPODR : Int64; aId_Man : Int64;
                                DBHANDLE : TISC_DB_HANDLE); overload;}

  private
    DBHANDLE : TISC_DB_HANDLE;
    function  CheckData : Boolean;
  public
    ID_SPODR : Integer;
    Id_Man : Integer;
    FMode : Integer;
    IS_SKLAD, DISABLE: integer;
    Constructor Create(AOwner : TComponent; FMode : Integer;
                                aPibEdit : String;
                                aDepartmentEdit : String;
                                aID_SPODR : Integer;
                                aId_Man : Integer;
                                aIsSklad: smallint;
                                aDisable: smallint;
                                DBHANDLE : TISC_DB_HANDLE;
                                aCheckWeb: Integer);
  end;

implementation

uses uSpMatOtv;

{$R *.dfm}

Constructor TfmSpMatOtvAdd.Create(AOwner : TComponent; FMode : Integer;
                                aPibEdit : String; aDepartmentEdit : String;
                                aID_SPODR : Integer; aId_Man : Integer;
                                aIsSklad: smallint; aDisable: smallint;
                                DBHANDLE : TISC_DB_HANDLE; aCheckWeb: Integer);
begin
    inherited Create(AOwner);

    Self.FMode := FMode;
    Self.DBHANDLE := DBHANDLE;

    if FMode = 0
    then begin
        Caption:=MAT_SYS_PREFIX + MAT_FORMCAP_SP_MO+' :: '+MAT_STR_MODE_ADD;
//        Caption := 'Добавление';
        ID_SPODR := -1;
        Id_Man := -1;
        IS_SKLAD:=0;
        DISABLE:=0;
        PeopleEdit.Text := '';
        DepartmentEdit.Text := '';
        chkWeb.Checked:=False;
    end;

    if FMode = 1
    then begin
        Caption:=MAT_SYS_PREFIX + MAT_FORMCAP_SP_MO+' :: '+MAT_STR_MODE_EDIT;
//        Caption := 'Редактирование';
        ID_SPODR := aID_SPODR;
        Id_Man := aId_Man;
        IS_SKLAD:=aIsSklad;
        DISABLE:=aDisable;
        PeopleEdit.Text := aPibEdit;
        DepartmentEdit.Text := aDepartmentEdit;
        if aCheckWeb = 1 then chkWeb.Checked:=True else chkWeb.Checked:=False;
    end;
    OkButton.Caption:=MAT_BUTTON_OK_CONST;
    CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
    PibLabel.Caption:=MAT_STR_MO_LABEL_FIO;
    DepartmentLabel.Caption:=MAT_STR_MO_LABEL_SPODR;
    KatLabel.Caption:=MAT_STR_MO_LABEL_KAT;
    LabelComment.Caption:=MAT_STR_COL_COMMENT;
    with cxTipMol.Properties.Items do
    begin
     Clear;
     Add(MAT_STR_MO_ITEMS_KAT1);
     Add(MAT_STR_MO_ITEMS_KAT2);
    end;
    Self.cxTipMol.ItemIndex:=IS_SKLAD;
     if (MatasCheckAccess('/ROOT/MATAS/Web','Edit', false)=0) then
     chkWeb.Visible:=True
     else chkWeb.Visible:=False;
end;

function  TfmSpMatOtvAdd.CheckData : Boolean;
begin
    CheckData := True;

    if Id_Man < 1
    then begin
        CheckData := False;
        agMessageDlg(MAT_STR_WARNING, MAT_STR_NEED_PEOPLE, mtError,[mbOk]);
        exit;
    end;

    if ID_SPODR = -1
    then begin
        CheckData := False;
        agMessageDlg(MAT_STR_WARNING, MAT_STR_NEED_SPODR, mtError,[mbOk]);
    end;
end;

procedure TfmSpMatOtvAdd.OkButtonClick(Sender: TObject);
begin
 IS_SKLAD:=cxTipMol.ItemIndex;
 DISABLE:=0;
 if not CheckData then ModalResult := mrNone;
end;

procedure TfmSpMatOtvAdd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
  Key:=VK_TAB;
 if Key=VK_ESCAPE	then
  CancelButton.SetFocus;
 if (Key=VK_F10) or ((Key=VK_END) and (Shift=[ssCtrl])) then
  OkButton.SetFocus;

end;

procedure TfmSpMatOtvAdd.DepartmentEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    sp: TSprav;
begin
    // Выходные параметры:
    // Id_Department - идентификатор
    // Name_Short - сокращенное название
    // Name_Full - полное название
    // создать справочник
    sp := GetSprav(ExtractFilePath(Application.ExeName)+'SpDepartment.bpl');
    if sp <> nil then
    begin
        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(self.DBHANDLE);
            FieldValues['ShowStyle'] := 0;
            FieldValues['Select'] := 1;
            FieldValues['Root_Department'] := _ID_DEP_ROOT;
//            FieldValues['Id_Dep_Property'] := -1;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
    sp.Show;
    if sp.Output = nil then
        ShowMessage(MAT_STR_NOTHING_SELECT)
    else
    if not sp.Output.IsEmpty then
    begin
     DepartmentEdit.Text := sp.Output['Name_full'];
     ID_SPODR := sp.Output['Id_Department'];
    end;
    sp.Free;
end;

procedure TfmSpMatOtvAdd.PeopleEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 Res : Variant;
begin
 Res:=uPackageManager.GetMan(self, self.DBHANDLE, ID_MAN);
 if VarArrayDimCount(Res)>0
 then
 begin
  Id_Man := (Res[0]);
  PeopleEdit.Text := VarToStr(Res[1]);
  end;
end;

end.

