unit SpSotr_FilterForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxControls, cxContainer,
  cxEdit, cxMaskEdit, cxButtonEdit, ActnList, StdCtrls, cxButtons, IBase,
  PackageLoad, zTypes, cxLabel, unit_ZGlobal_Consts, ExtCtrls,
  cxDropDownEdit, cxCalendar, Dates, cxRadioGroup, cxCheckBox, cxGroupBox,
  uCommonSP, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type TSotrFilter = record
   Is_department:boolean;
   Id_department:integer;
   Kod_department:string[10];
   Name_Department:String;

   Is_man:      Boolean;
   Tn:          Integer;

   FIO:         string;
   Is_main_job: Boolean;
   Is_notmain_job:Boolean;
   Is_just_leaved:Boolean;

   Is_period:   Boolean;
   DateBeg:     TDate;
   DateEnd:     TDate;
   oldDateBeg:  TDate;
   oldDateEnd:  TDate;

   Is_prop:     Boolean;
   Id_prop:     Integer;
   has_prop:    Boolean;
   prop_name:   String;

   Is_priv:     Boolean;
   id_priv:     Integer;
   has_priv:    Boolean;
   priv_name:   String;

   Is_raise:    Boolean;
   Id_Raise:    Integer;
   has_raise:   Boolean;
   raise_name:  String;

   is_filtered: boolean;
end;


type
  TfmFilterForm = class(TForm)
    OkBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList1: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    DB: TpFIBDatabase;
    DSourceProp: TDataSource;
    DSetProp: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    CheckBoxMan: TcxCheckBox;
    CheckBoxDepartment: TcxCheckBox;
    CheckBoxProp: TcxCheckBox;
    Panel4: TPanel;
    Panel5: TPanel;
    CheckBoxPriv: TcxCheckBox;
    CheckBoxRaise: TcxCheckBox;
    PropEdit: TcxLookupComboBox;
    RB_HasProp: TcxRadioButton;
    RB_HasNotProp: TcxRadioButton;
    PrivEdit: TcxButtonEdit;
    RB_HasPriv: TcxRadioButton;
    RB_HasNotPriv: TcxRadioButton;
    DepBtnEdit: TcxButtonEdit;
    DepTextEdit: TcxTextEdit;
    ManTextEdit: TcxTextEdit;
    RaiseEdit: TcxButtonEdit;
    RB_HasRaise: TcxRadioButton;
    RB_HasNotRaise: TcxRadioButton;
    Panel6: TPanel;
    CheckBoxPeriod: TcxCheckBox;
    DateEditBeg: TcxDateEdit;
    cxLabel2: TcxLabel;
    DateEditEnd: TcxDateEdit;
    LeavedJob: TcxCheckBox;
    CheckBoxMainJob: TcxCheckBox;
    ManBtnEdit: TcxButtonEdit;
    CheckBoxNotMainJob: TcxCheckBox;
    procedure ManBtnEditKeyPress(Sender: TObject; var Key: Char);
    procedure ManBtnEditExit(Sender: TObject);
    procedure DepTextEditExit(Sender: TObject);
    procedure DepTextEditKeyPress(Sender: TObject; var Key: Char);
    procedure ManBtnEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure DepBtnEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CancelActionExecute(Sender: TObject);
    procedure OkActionExecute(Sender: TObject);
    procedure CheckBoxDepartmentClick(Sender: TObject);
    procedure DepBtnEditPropertiesChange(Sender: TObject);
    procedure CheckBoxPropClick(Sender: TObject);
    procedure CheckBoxPrivClick(Sender: TObject);
    procedure PrivEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure CheckBoxRaiseClick(Sender: TObject);
    procedure RaiseEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CheckBoxManClick(Sender: TObject);
    procedure CheckBoxPeriodClick(Sender: TObject);
    procedure CheckBoxMainJobClick(Sender: TObject);
    procedure CheckBoxNotMainJobClick(Sender: TObject);

  private
   // PId_man:LongWord;
    PId_Priv:Integer;
    PId_Raise:Integer;
    pFilter:TSotrFilter;
    //pDB_Handle:TISC_DB_HANDLE;
    pLanguageIndex:Byte;
    procedure GetMan;
    procedure GetDepartment;
    procedure SetFilter(SotrFilter:TSotrFilter);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; ADB_Handle:TISC_DB_HANDLE); reintroduce;
    property FilterParams:TSotrFilter read pFilter write SetFilter;
  end;



function ShowFilter(AOwner:TComponent;ADB:TISC_DB_HANDLE;var SotrFilter:TSotrFilter): boolean;

implementation

{$R *.dfm}
uses ZProc, zMessages;

function ShowFilter(AOwner:TComponent;ADB:TISC_DB_HANDLE;var SotrFilter: TSotrFilter): boolean;
var FilterForm: TfmFilterForm;
    Y,M,D: word;
begin
   FilterForm := TfmFilterForm.Create(AOwner,ADB);
   FilterForm.FilterParams := SotrFilter;
 //  FilterForm.CheckBoxPeriod.Checked:=True;
   FilterForm.DateEditBeg.Date  := SotrFilter.DateBeg;
   FilterForm.DateEditEnd.DAte  := SotrFilter.DateEnd;

   FilterForm.ShowModal;
   if FilterForm.ModalResult = mrYes then
   begin
      SotrFilter := FilterForm.FilterParams;
      Result := True;
   end
   else Result := False;
   FilterForm.Destroy;

end;


constructor TfmFilterForm.Create(AOwner:TComponent; ADB_Handle:TISC_DB_HANDLE);
var yyy, mmm, ddd :word;
date_beg : tdate;
begin
  inherited Create(AOwner);
  pLanguageIndex                        := LanguageIndex;
//  pDB_Handle                            := ADB_Handle;
  DB.Handle                             := ADB_Handle;
//******************************************************************************
  Caption                               := GetConst('Filter',tcForm);
//******************************************************************************
  pFilter.Id_department                 := -1;
  pFilter.Kod_department                := '';
  pFilter.Name_Department               := '';
  pFilter.Tn                            := -1;
  pFilter.FIO                           := '';
  PId_Priv                              := -1;
  PId_Raise                             := -1;
//******************************************************************************

  CheckBoxMan.Properties.Caption        := GetConst('Percon',tcCheckBox);

  CheckBoxDepartment.Properties.Caption := GetConst('Department',tcCheckBox);
  CheckBoxProp.Properties.Caption       := GetConst('Properties',tcCheckBox);
  CheckBoxPriv.Properties.Caption       := GetConst('Privilege',tcCheckBox);
  CheckBoxRaise.Properties.Caption      := GetConst('Raise',tcCheckBox);
  CheckBoxPeriod.Properties.Caption     := GetConst('Period',tcCheckBox);
  CheckBoxMainJob.Properties.Caption    := GetConst('MainJob',tcCheckBox);
  CheckBoxNotMainJob.Properties.Caption := GetConst('NotMainJob',tcCheckBox);
  LeavedJob.Properties.Caption          := GetConst('LeavedJob',tcCheckBox);

  RB_HasNotProp.Caption                 := GetConst('HasNotCharactic',tcRadioButton);
  RB_HasNotPriv.Caption                 := GetConst('HasNotCharactic',tcRadioButton);
  RB_HasNotRaise.Caption                := GetConst('HasNotCharactic',tcRadioButton);
  RB_HasProp.Caption                    := GetConst('HasCharactic',tcRadioButton);
  RB_HasPriv.Caption                    := GetConst('HasCharactic',tcRadioButton);
  RB_HasRaise.Caption                   := GetConst('HasCharactic',tcRadioButton);

  //DecodeDate(Date,Yyy,Mmm,Ddd);
  //date_beg:=  EncodeDate(Yyy,Mmm,1);
  //DateEditBeg.Date:= date_beg;
  //DateEditEnd.Date := IncMonth(date_beg,4)-1;

//******************************************************************************
  OkAction.Caption                      := GetConst('Ok',tcButton);
  CancelAction.Caption                  := GetConst('Cancel',tcButton);
  OkAction.Hint                         := OkAction.Caption;
  CancelAction.Hint                     := CancelAction.Caption;

  DSetProp.SQLs.SelectSQL.Text          := 'SELECT * FROM Z_SP_PEOPLE_PROP_SEL(''F'')';
  DSetProp.Open;

  PropEdit.Properties.ListSource        := DSourceProp;
  PropEdit.Properties.ListFieldNames    := 'NAME_PEOPLE_PROP';
  PropEdit.Properties.KeyFieldNames     := 'ID_PEOPLE_PROP';

end;

procedure TfmFilterForm.GetMan;
var Man:Variant;
begin
  if ManBtnEdit.Text<>'' then
    begin
      if StrToInt(ManBtnEdit.Text)=pFilter.Tn then Exit;
      Man:=ManByTn(StrToInt(ManBtnEdit.Text),DB.Handle);
      if VarArrayDimCount(Man)>0 then
        begin
          pFilter.Tn    :=Man[1];
          pFilter.FIO   :=Man[2];
          ManTextEdit.Text:=pFilter.FIO;
        end;
    end
  else
    begin
      ManTextEdit.Text:='';
      pFilter.Tn:=-1;
      pFilter.FIO:='';
    end;
end;

procedure TfmFilterForm.GetDepartment;
var Dep:Variant;
begin
      if  (Trim(DepTextEdit.Text)='')
      then begin
                if (Trim(DepBtnEdit.Text)<>'')
                then begin
                          if DepBtnEdit.Text=pFilter.Kod_department then Exit;
                          Dep:=DepartmentByKod(DepBtnEdit.Text,DB.Handle);

                          if VarArrayDimCount(Dep)>0
                          then begin
                                    pFilter.Id_department  :=Dep[0];
                                    pFilter.Kod_department :=Dep[1];
                                    pFilter.Name_Department:=Dep[2];
                                    DepTextEdit.Text:=pFilter.Name_Department;
                          end;
                end
                else begin
                          if (Trim(DepTextEdit.Text)='')
                          then begin
                                    DepTextEdit.Text:='';
                                    pFilter.Id_department:=-1;
                                    pFilter.Kod_department:='';
                                    pFilter.Name_Department:='';
                          end;
                end;
      end;
end;


procedure TfmFilterForm.ManBtnEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then GetMan;
end;

procedure TfmFilterForm.ManBtnEditExit(Sender: TObject);
begin
  GetMan;
end;

procedure TfmFilterForm.DepTextEditExit(Sender: TObject);
begin
  GetDepartment;
end;

procedure TfmFilterForm.DepTextEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then GetDepartment;
end;

procedure TfmFilterForm.ManBtnEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var Man:Variant;
begin
Man:=LoadPeopleModal(Self,DB.Handle);
if VarArrayDimCount(Man)> 0 then
 If Man[0]<>NULL then
  begin
   pFilter.Tn := Man[4];
   pFilter.FIO := VarToStr(Man[1])+' '+VarToStr(Man[2])+' '+VarToStr(Man[3]);
   ManTextEdit.Text := pFilter.FIO;
   ManBtnEdit.Text  := IntToStr(pFilter.Tn);
  end;
end;

procedure TfmFilterForm.DepBtnEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
{var Department:Variant;
begin
Department:=LoadDepartment(Self,DB.Handle,zfsNormal);
if VarArrayDimCount(Department)> 0 then
 if Department[0]<>NULL then
  begin
   pFilter.Id_department := Department[0];
   pFilter.Name_Department := Department[1];
   pFilter.Kod_department := Department[3];
   DepTextEdit.Text := pFilter.Name_Department;
   DepBtnEdit.Text  := pFilter.Kod_department;
  end;
end;}
var sp: TSprav;
begin
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(Db.Handle);
            FieldValues['ShowStyle'] := 0;
            FieldValues['Select'] := 1;
            FieldValues['Actual_Date'] := DateEditEnd.Date;
            Post;
        end;
    end;
    sp.Show;
    if sp.Output = nil then
        ShowMessage('BUG: Output is NIL!!!')
    else
    if not sp.Output.IsEmpty then
       begin
        DepBtnEdit.Text := varToStrDef(sp.Output['DEPARTMENT_CODE'],'');
        DepTextEdit.Text := varToStrDef(sp.Output['NAME_FULL'],'');
        pFilter.Id_department := sp.Output['ID_DEPARTMENT'];
        pFilter.Kod_department := DepBtnEdit.Text;
        pFilter.Name_Department := '('+DepBtnEdit.Text+') '+DepTextEdit.Text;
       end;
    sp.Free;
end;


procedure TfmFilterForm.CancelActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TfmFilterForm.OkActionExecute(Sender: TObject);
begin


  pFilter.FIO             := ManTextEdit.Text;
  pFilter.Is_man          := CheckBoxMan.Checked;

  if CheckBoxMainJob.Checked then pFilter.Is_main_job       := true;
  if CheckBoxNotMainJob.Checked then pFilter.Is_notmain_job := true;
  if CheckBoxNotMainJob.Checked and CheckBoxMainJob.Checked then
  begin
      pFilter.Is_main_job       := false;
      pFilter.Is_notmain_job    := false;
  end;

  pFilter.Name_Department := DepTextEdit.Text;
  pFilter.Is_department   := CheckBoxDepartment.Checked;

  if CheckBoxPeriod.Checked then
  begin
      pFilter.Is_period       := true;
      pFilter.DateBeg         := DateEditBeg.Date;
      pFilter.DateEnd         := DateEditEnd.Date;
      pFilter.Is_just_leaved  := LeavedJob.Checked;
  end
  else
  begin
      pFilter.Is_period       := false;
      pFilter.DateBeg         := StrToDate('01.01.1900');
      pFilter.DateEnd         := StrToDate('31.12.9999');
  end;
  pFilter.oldDateBeg      := DateEditBeg.Date;
  pFilter.oldDateEnd      := DateEditEnd.Date;

  pFilter.is_filtered     := True;

  pFilter.Is_priv         := CheckBoxPriv.Checked;
  pFilter.id_priv         := PId_Priv;
  pFilter.has_priv        := RB_HasPriv.Checked;
  pFilter.priv_name       := PrivEdit.Text;

  pFilter.Is_prop         := CheckBoxProp.Checked;
  pFilter.Id_prop         := PropEdit.EditValue;
  pFilter.has_prop        := RB_HasProp.Checked;
  pFilter.prop_name       := Propedit.Text;

  pFilter.Is_raise        := CheckBoxRaise.Checked;
  pFilter.Id_Raise        := PId_Raise;
  pFilter.Has_raise       := RB_HasRaise.Checked;
  pFilter.raise_name      := RaiseEdit.Text;

  ModalResult             := mrYes;
end;

procedure TfmFilterForm.SetFilter(SotrFilter:TSotrFilter);
var
    Y,M,D: word;
begin
with SotrFilter do
if is_filtered then
  begin
    if Tn>0 then
      ManBtnEdit.Text          := IntToStr(Tn);
    ManTextEdit.Text           := FIO;
    DepBtnEdit.Text            := Kod_department;
    DepTextEdit.Text           := Name_Department;
    CheckBoxPeriod.Checked     := Is_period;
    DateEditBeg.Date           := DateBeg;
    DateEditEnd.Date           := DateEnd;
    if not Is_period then
    begin
        DateEditBeg.Date       := oldDateBeg;
        DateEditEnd.Date       := oldDateEnd;
    end;

    CheckBoxMan.Checked        := Is_man;
    CheckBoxDepartment.Checked := Is_department;

    pFilter.Id_department      := Id_department;
    pFilter.Kod_department     := Kod_department;
    pFilter.Name_Department    := Name_Department;
    pFilter.Tn                 := Tn;
    pFilter.FIO                := FIO;

    pFilter.DateBeg            := DateBeg;
    pFilter.DateEnd            := DateEnd;
    pFilter.is_filtered        := True;
    pFilter.Is_department      := Is_department;
    pFilter.Is_man             := Is_man;
    CheckBoxMainJob.Checked    := Is_main_job;
    CheckBoxNotMainJob.Checked := Is_notmain_job;
    if not Is_main_job and not Is_notmain_job then
    begin
        CheckBoxMainJob.Checked    := true;
        CheckBoxNotMainJob.Checked := true;
    end;
    LeavedJob.Checked          := Is_just_leaved;

    CheckBoxProp.Checked       := Is_prop;
    Id_Prop                    := Id_prop;
    RB_HasProp.Checked         := Has_prop;
    RB_HasNotProp.Checked      := not Has_prop;
    PropEdit.Text              := prop_name;

    CheckBoxPriv.Checked       := Is_priv;
    Id_Prop                    := Id_priv;
    RB_HasPriv.Checked         := Has_priv;
    RB_HasNotPriv.Checked      := not Has_priv;
    PrivEdit.Text              := priv_name;

    CheckBoxRaise.Checked      := Is_raise;
    PId_Raise                  := Id_Raise;
    RB_HasRaise.Checked        := Has_raise;
    RB_HasNotRaise.Checked     := not Has_raise;
    RaiseEdit.Text             := raise_name;
  end
else
  begin
    DecodeDate(Date,Y,M,D);
    DateBeg                 := EncodeDate(Y,M,1);
    DateEnd                 := IncMonth(DateBeg,4)-1;
                               //     EncodeDate(Y+(M+2) div 12,(M+3) mod 12,1)-1;
    DateEditBeg.Date        := DateBeg;
    DateEditEnd.Date        := DateEnd;
  end;
end;

procedure TfmFilterForm.CheckBoxDepartmentClick(Sender: TObject);
begin
      DepBtnEdit.Enabled :=CheckBoxDepartment.Checked;
      DepTextEdit.Enabled:=CheckBoxDepartment.Checked;
end;

procedure TfmFilterForm.DepBtnEditPropertiesChange(Sender: TObject);
begin
    DepTextEdit.Text:='';
end;

procedure TfmFilterForm.CheckBoxPropClick(Sender: TObject);
begin
    PropEdit.Enabled:=CheckBoxProp.Checked;
    RB_HasNotProp.Enabled:=CheckBoxProp.Checked;
    RB_HasProp.Enabled:=CheckBoxProp.Checked;    
end;

procedure TfmFilterForm.CheckBoxPrivClick(Sender: TObject);
begin
    PrivEdit.Enabled:=CheckBoxPriv.Checked;
    RB_HasNotPriv.Enabled:=CheckBoxPriv.Checked;
    RB_HasPriv.Enabled:=CheckBoxPriv.Checked;
end;

procedure TfmFilterForm.PrivEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  Privilege:Variant;
begin
    Privilege:=LoadPrivileges(self,DB.Handle,zfsModal);
    if VarArrayDimCount(Privilege)> 0 then
      if Privilege[0]<>NULL then
      begin
          PrivEdit.Text := Privilege[1];
          PId_Priv      := Privilege[0];
      end;
end;


procedure TfmFilterForm.CheckBoxRaiseClick(Sender: TObject);
begin
    RaiseEdit.Enabled:=CheckBoxRaise.Checked;
    RB_HasRaise.Enabled:=CheckBoxRaise.Checked;
    RB_HasNotRaise.Enabled:=CheckBoxRaise.Checked;
end;

procedure TfmFilterForm.RaiseEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
//var
 // res:Variant;
begin
   { res:=getSP_Raises(self, DB.Handle);
    if VarArrayDimCount(res)> 0 then
        if res[0]<>NULL then
        begin
            RaiseEdit.Text:=res[1];
            PId_Raise     :=res[0];
        end;     }
end;

procedure TfmFilterForm.CheckBoxManClick(Sender: TObject);
begin
    ManBtnEdit.Enabled      :=CheckBoxMan.Checked;
    ManTextEdit.Enabled     :=CheckBoxMan.Checked;
end;

procedure TfmFilterForm.CheckBoxPeriodClick(Sender: TObject);
begin
    DateEditBeg.Enabled   :=CheckBoxPeriod.Checked;
    DateEditEnd.Enabled   :=CheckBoxPeriod.Checked;
    cxLabel2.Enabled      :=CheckBoxPeriod.Checked;
    LeavedJob.Enabled      :=CheckBoxPeriod.Checked;
end;

procedure TfmFilterForm.CheckBoxMainJobClick(Sender: TObject);
begin
    if not CheckBoxMainJob.Checked then CheckBoxNotMainJob.Checked:=true; 
end;

procedure TfmFilterForm.CheckBoxNotMainJobClick(Sender: TObject);
begin
    if not CheckBoxNotMainJob.Checked then CheckBoxMainJob.Checked:=true;
end;

end.
