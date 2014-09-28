unit gr_StudentCards_Filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxCheckBox, StdCtrls, cxButtons,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls,
  cxGroupBox, cxSpinEdit, cxDropDownEdit, Unit_ZGlobal_Consts,
  IBase, PackageLoad, ZTypes, Dates, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet,  ZMessages, cxRadioGroup, cxLabel, ZProc,
  ActnList;


type TZTypeDataFilter = (tztdfPeople,tztdfDepartment,tztdfVidOpl,tztdfNULL);

function TypeDataFilterToByte(AParameter:TZTypeDataFilter):Byte;

type TGrDataFilter = record
 KodSetup1:integer;
 KodSetup2:integer;
 TypeId:TZTypeDataFilter;
 Id:integer;
 TextId:string;
 ModalResult:TModalResult;
end;

type
  TGrStudentCardsFilter = class(TForm)
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditDataFilterPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FilterTypePropertiesChange(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    PParameter:TGrDataFilter;
    PLanguageIndex:byte;
  public
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:TGrDataFilter);reintroduce;
    property Parameter:TGrDataFilter read PParameter;
  end;

function ViewFilter(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:TGrDataFilter):TGrDataFilter;
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
 end;
end;

function ViewFilter(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:TGrDataFilter):TGrDataFilter;
var Filter:TGrStudentCardsFilter;
    Res:TGrDataFilter;
begin
Filter := TGrStudentCardsFilter.Create(AOwner,ADB_Handle,AParameter);
Res:=AParameter;
if Filter.ShowModal=mrYes then
   Res:=Filter.Parameter;
Res.ModalResult:=Filter.ModalResult;
Filter.Free;
ViewFilter:=Res;
end;

constructor TGrStudentCardsFilter.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:TGrDataFilter);
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
 FilterType.Properties.Items[2].Caption := LabelNotFilter_Caption[PLanguageIndex];

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

procedure TGrStudentCardsFilter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

procedure TGrStudentCardsFilter.EditDataFilterPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var ResultView:Variant;
begin
case FilterType.ItemIndex of
 0: ResultView:=LoadPeopleModal(Self,DB.Handle);
 1: ResultView:=LoadDepartment(Self,DB.Handle,zfsNormal);
end;
if VarArrayDimCount(ResultView)> 0 then
 If ResultView[0]<>NULL then
  begin
   case FilterType.ItemIndex of
     0:
      begin
       PParameter.TypeId := tztdfPeople;
       EditDataFilter.Text := VarToStr(ResultView[4])+' - '+
                              VarToStr(ResultView[1])+' '+
                              VarToStr(ResultView[2])+' '+
                              VarToStr(ResultView[3]);
       PParameter.Id := ResultView[0];
       PParameter.TextId := EditDataFilter.Text;
      end;
     1:
      begin
       PParameter.TypeId := tztdfDepartment;
       EditDataFilter.Text := VarToStr(ResultView[1]);
       PParameter.Id := ResultView[0];
       PParameter.TextId := VarToStr(ResultView[1]);
      end;
     2:
      begin
       PParameter.TypeId := tztdfVidOpl;
       EditDataFilter.Text := VarToStr(ResultView[2])+' - '+
                              VarToStr(ResultView[1]);
       PParameter.Id := ResultView[0];
       PParameter.TextId := EditDataFilter.Text;
      end;
   end;
  end;
end;

procedure TGrStudentCardsFilter.FilterTypePropertiesChange(Sender: TObject);
var CurrentSelect:byte;
begin
CurrentSelect:=0;
case PParameter.TypeId of
 tztdfPeople: CurrentSelect:=0;
 tztdfDepartment: CurrentSelect:=1;
 tztdfNULL: CurrentSelect:=2;
end;
BoxDataFilter.Enabled := (FilterType.ItemIndex<>FilterType.Properties.Items.Count-1);
EditDataFilter.Text := IfThen(FilterType.ItemIndex=CurrentSelect,PParameter.TextId,'');
end;

procedure TGrStudentCardsFilter.ActionYesExecute(Sender: TObject);
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

procedure TGrStudentCardsFilter.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

end.
