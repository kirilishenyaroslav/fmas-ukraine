unit DateAcc_Filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxCheckBox, StdCtrls, cxButtons,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls,
  cxGroupBox, cxSpinEdit, cxDropDownEdit, Unit_ZGlobal_Consts, GlobalSpr,
  IBase, PackageLoad, ZTypes, Dates, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet,  ZMessages, cxRadioGroup, cxLabel, ZProc,
  ActnList, uCommonSp;


type TZTypeDataFilter = (tztdfPeople,tztdfDepartment,tztdfVidOpl,tztdfNULL);

function TypeDataFilterToByte(AParameter:TZTypeDataFilter):Byte;

type TZDataFilter = record
 KodSetup1:integer;
 KodSetup2:integer;
 TypeId:TZTypeDataFilter;
 Id:integer;
 TextId:string;
 ModalResult:TModalResult;
end;

type
  TZDatesAccFilter = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    BoxKodSetup: TcxGroupBox;
    MonthesList1: TcxComboBox;
    YearSpinEdit1: TcxSpinEdit;
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    BoxDataFilter: TcxGroupBox;
    EditDataFilter: TcxButtonEdit;
    FilterType: TcxRadioGroup;
    MonthesList2: TcxComboBox;
    YearSpinEdit2: TcxSpinEdit;
    LabelFrom: TcxLabel;
    LabelTo: TcxLabel;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    EdCodeDataFilter: TcxTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditDataFilterPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FilterTypePropertiesChange(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure EdCodeDataFilterExit(Sender: TObject);
  private
    PParameter:TZDataFilter;
    PLanguageIndex:byte;
    procedure GetDepartment;
    procedure GetMan;
  public
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:TZDataFilter);reintroduce;
    property Parameter:TZDataFilter read PParameter;
  end;

function ViewFilter(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:TZDataFilter):TZDataFilter;
implementation

uses StrUtils;

{$R *.dfm}

function TypeDataFilterToByte(AParameter:TZTypeDataFilter):Byte;
begin
 Result:=0;
 case AParameter of
  tztdfPeople: Result:=1;
  tztdfDepartment: Result:=2;
  tztdfNULL: Result:=3;
  tztdfVidOpl: Result:=4;
 end;
end;

function ViewFilter(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:TZDataFilter):TZDataFilter;
var Filter:TZDatesAccFilter;
    Res:TZDataFilter;
begin
Filter := TZDatesAccFilter.Create(AOwner,ADB_Handle,AParameter);
Res:=AParameter;
if Filter.ShowModal=mrYes then
   Res:=Filter.Parameter;
Res.ModalResult:=Filter.ModalResult;
Filter.Free;
ViewFilter:=Res;
end;


procedure TZDatesAccFilter.GetMan;
var Man:Variant;
begin
  if (Trim(EdCodeDataFilter.Text)<>'')
  then begin
            Man:=ManByTn(StrToInt(EdCodeDataFilter.Text),DB.Handle);
            if VarArrayDimCount(Man)>0
            then begin
                      PParameter.TypeId    := tztdfPeople;
                      PParameter.Id         :=Man[0];
                      EdCodeDataFilter.Text :=Man[1];
                      EditDataFilter.Text:=Man[2];
              end;
  end
  else begin
            PParameter.Id         :=-1;
            EdCodeDataFilter.Text :='';
            EditDataFilter.Text   :='';
    end;
end;


procedure TZDatesAccFilter.GetDepartment;
var Dep:Variant;
begin
      if (Trim(EdCodeDataFilter.Text)<>'')
      then begin
                Dep:=DepartmentByKod(EdCodeDataFilter.Text,DB.Handle);

                if VarArrayDimCount(Dep)>0
                then begin
                          PParameter.TypeId    := tztdfDepartment;
                          EdCodeDataFilter.Text:= Dep[1];
                          EditDataFilter.Text  := Dep[2];
                          PParameter.Id        := Dep[0];
                          PParameter.TextId    := Dep[2];
                end;
      end
      else begin
                if (Trim(EditDataFilter.Text)='')
                then begin
                          EdCodeDataFilter.Text:= '';
                          EditDataFilter.Text  := '';
                          PParameter.Id        := -1;
                          PParameter.TextId    := '';
                end;
      end;
end;


constructor TZDatesAccFilter.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:TZDataFilter);
begin
 inherited Create(AOwner);
 PParameter:=AParameter;
 PLanguageIndex:=LanguageIndex;
//******************************************************************************
 Caption                                := FilterBtn_Caption[PLanguageIndex];
 YesBtn.Caption                         := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption                      := CancelBtn_Caption[PLanguageIndex];
 YesBtn.Hint                            := YesBtn.Caption;
 CancelBtn.Hint                         := CancelBtn.Caption;

 FilterType.Properties.Items[0].Caption := LabelMan_Caption[PLanguageIndex];
 FilterType.Properties.Items[1].Caption := LabelDepartment_Caption[PLanguageIndex];
 FilterType.Properties.Items[2].Caption := LabelVidOpl_Caption[PLanguageIndex];
 FilterType.Properties.Items[3].Caption := LabelNotFilter_Caption[PLanguageIndex];

 LabelFrom.Caption                      := LabelDateBeg_Caption[PLanguageIndex];
 LabelTo.Caption                        := AnsiLowerCase(LabelDateEnd_Caption[PLanguageIndex]);
 MonthesList1.Properties.Items.Text     := MonthesList_Text[PlanguageIndex];
 MonthesList2.Properties.Items.Text     := MonthesList_Text[PlanguageIndex];
//******************************************************************************
  DB.Handle := ADB_Handle;
  ReadTransaction.StartTransaction;
 if PParameter.KodSetup1=0 then
  begin
   DSet.SQLs.SelectSQL.Text              := 'SELECT * FROM Z_KOD_SETUP_RETURN';
   DSet.Open;
   YearSpinEdit1.Value:=YearMonthFromKodSetup(DSet.FieldValues['KOD_SETUP']);
   MonthesList1.ItemIndex:= YearMonthFromKodSetup(DSet.FieldValues['KOD_SETUP'],false)-1;
  end
 else
  begin
   YearSpinEdit1.Value:=YearMonthFromKodSetup(PParameter.KodSetup1);
   MonthesList1.ItemIndex:= YearMonthFromKodSetup(PParameter.KodSetup1,false)-1;
  end;
 if PParameter.KodSetup2=0 then
  begin
   if not DSet.Active then
    begin
     DSet.SQLs.SelectSQL.Text              := 'SELECT * FROM Z_KOD_SETUP_RETURN';
     DSet.Open;
    end;
   YearSpinEdit2.Value:=YearMonthFromKodSetup(DSet.FieldValues['KOD_SETUP']);
   MonthesList2.ItemIndex:= YearMonthFromKodSetup(DSet.FieldValues['KOD_SETUP'],false)-1;
  end
 else
  begin
   YearSpinEdit2.Value:=YearMonthFromKodSetup(PParameter.KodSetup2);
   MonthesList2.ItemIndex:= YearMonthFromKodSetup(PParameter.KodSetup2,false)-1;
  end;
 case PParameter.TypeId of
  tztdfPeople:
   begin
    FilterType.ItemIndex:=0;
    BoxDataFilter.Enabled:=True;
    EditDataFilter.Text := PParameter.TextId;
   end;
  tztdfDepartment:
   begin
    FilterType.ItemIndex:=1;
    BoxDataFilter.Enabled:=True;
    EditDataFilter.Text := PParameter.TextId;
   end;
  tztdfVidOpl:
   begin
    FilterType.ItemIndex:=2;
    BoxDataFilter.Enabled:=True;
    EditDataFilter.Text := PParameter.TextId;
   end;
  tztdfNULL:
   begin
    FilterType.ItemIndex:=3;
    BoxDataFilter.Enabled:=False;
    EditDataFilter.Text := '';
   end;
 end;
//******************************************************************************
end;

procedure TZDatesAccFilter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

procedure TZDatesAccFilter.EditDataFilterPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var ResultView:Variant;
    sp: TSprav;
begin
   case FilterType.ItemIndex of
     0:
      begin
       ResultView:=LoadPeopleModal(Self,DB.Handle);
       if VarArrayDimCount(ResultView)> 0 then
       If ResultView[0]<>NULL then
       begin
             PParameter.TypeId := tztdfPeople;
             EditDataFilter.Text := VarToStr(ResultView[4])+' - '+
                                    VarToStr(ResultView[1])+' '+
                                    VarToStr(ResultView[2])+' '+
                                    VarToStr(ResultView[3]);
             PParameter.Id := ResultView[0];
             PParameter.TextId := EditDataFilter.Text;
       end;
      end;
     1:
      begin
           sp := GetSprav('SpDepartment');
           if sp <> nil
           then begin
                     // заполнить входные параметры
                     with sp.Input do
                     begin
                          Append;
                          FieldValues['DBHandle'] := Integer(DB.Handle);
                          FieldValues['ShowStyle'] := 0;
                          FieldValues['Select'] := 1;
                          FieldValues['Actual_Date'] := Date;
                          Post;
                     end;
           end;
           sp.Show;
           if sp.Output = nil
           then ShowMessage('BUG: Output is NIL!!!')
           else
                if not sp.Output.IsEmpty
                then begin
                           PParameter.TypeId    := tztdfDepartment;
                           EdCodeDataFilter.Text:= varToStrDef(sp.Output['DEPARTMENT_CODE'],'');
                           EditDataFilter.Text  := varToStrDef(sp.Output['NAME_FULL'],'');
                           PParameter.Id        := sp.Output['ID_DEPARTMENT'];
                           PParameter.TextId    := varToStrDef(sp.Output['NAME_FULL'],'');
                end;
           sp.Free;
      end;
      2:
      begin
       ResultView:=LoadVidOpl(Self,DB.Handle,zfsModal,0);
       if VarArrayDimCount(ResultView)> 0 then

       If ResultView[0]<>NULL then
       begin
             PParameter.TypeId := tztdfVidOpl;
             EditDataFilter.Text := VarToStr(ResultView[2])+' - '+
                                    VarToStr(ResultView[1]);
             EdCodeDataFilter.Text:=VarToStr(ResultView[2]);
             PParameter.Id := ResultView[0];
             PParameter.TextId := EditDataFilter.Text;
       end;

      end;
   end;
end;

procedure TZDatesAccFilter.FilterTypePropertiesChange(Sender: TObject);
var CurrentSelect:byte;
begin
CurrentSelect:=0;
case PParameter.TypeId of
 tztdfPeople: CurrentSelect:=0;
 tztdfDepartment: CurrentSelect:=1;
 tztdfNULL: CurrentSelect:=2;
 tztdfVidOpl: CurrentSelect:=3;
end;
BoxDataFilter.Enabled := (FilterType.ItemIndex<>FilterType.Properties.Items.Count-1);
EditDataFilter.Text := IfThen(FilterType.ItemIndex=CurrentSelect,PParameter.TextId,'');
end;

procedure TZDatesAccFilter.ActionYesExecute(Sender: TObject);
begin
if FilterType.ItemIndex = FilterType.Properties.Items.Count-1 then
 begin
  PParameter.TypeId := tztdfNULL;
  PParameter.Id := 0;
  PParameter.TextId := '';
 end;
if PeriodToKodSetup(YearSpinEdit1.Value,MonthesList1.ItemIndex+1)>PeriodToKodSetup(YearSpinEdit2.Value,MonthesList2.ItemIndex+1) then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],ZeInputKodSetups_ErrorText[PLanguageIndex],mtWarning,[mbOK]);
  MonthesList1.SetFocus;
 end
else
 begin
  PParameter.KodSetup1:=PeriodToKodSetup(YearSpinEdit1.Value,MonthesList1.ItemIndex+1);
  PParameter.KodSetup2:=PeriodToKodSetup(YearSpinEdit2.Value,MonthesList2.ItemIndex+1);
  ModalResult:=mrYes;
 end;
end;

procedure TZDatesAccFilter.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TZDatesAccFilter.EdCodeDataFilterExit(Sender: TObject);
begin
   case FilterType.ItemIndex of
     0:
      begin
           GetMan;
      end;
     1:
      begin
           GetDepartment;
      end;
     2:
      begin
      end;
   end;


end;

end.
