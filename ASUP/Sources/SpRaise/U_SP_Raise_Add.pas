{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник надбавок"                             }
{                 Модуль добавления/изменения надбавок                         }
{                                               ответственный: Тимофеев Антон  }
unit U_SP_Raise_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  EditControl, Dialogs, StdCtrls, ExtCtrls, FieldControl, Mask, CheckEditUnit,
  Buttons, U_SPRaise_DataModule, SpCommon, ComCtrls, SpComboBox, ActnList,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  uFControl, uLabeledFControl, uCharControl, uIntControl, cxLabel;

type
  TSP_Raise_Add = class(TForm)
    CE_Name: TCheckEdit;
    FC_Name: TFieldControl;
    CE_Min: TCheckEdit;
    CE_Max: TCheckEdit;
    CE_Def: TCheckEdit;
    CE_One: TCheckEdit;
    FC_Def: TFieldControl;
    FC_Max: TFieldControl;
    FC_Min: TFieldControl;
    FC_One: TFieldControl;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    M_full: TMemo;
    CB_Spec: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    RangeRadio: TRadioButton;
    FixRadio: TRadioButton;
    Panel1: TPanel;
    RB_Cor: TRadioButton;
    RB_New: TRadioButton;
    DT_DateBeg: TDateTimePicker;
    DT_DateEnd: TDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    BonusBox: TSpComboBox;
    TypeBox: TSpComboBox;
    Label9: TLabel;
    Label10: TLabel;
    FC_Vid: TFieldControl;
    FC_Type: TFieldControl;
    CB_Percental: TCheckBox;
    CB_Use_SHT: TCheckBox;
    CB_USE_SM_Okl: TCheckBox;
    CB_USE_Stavka: TCheckBox;
    ActionList1: TActionList;
    AcceptAction: TAction;
    CB_Calc_type: TComboBox;
    Label11: TLabel;
    Label12: TLabel;
    AbsorbeGroup: TSpComboBox;
    AbsorbePriority: TEdit;
    Label13: TLabel;
    SbOk: TBitBtn;
    SbCancel: TBitBtn;
    MayBeeMoreThanOnce: TCheckBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label18: TLabel;
    DisplayOrder: TqFIntControl;
    ReasonText: TcxTextEdit;
    lblReason: TcxLabel;
    chStimulBonus: TCheckBox;
    chIsProlong: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CE_MinKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBCancelClick(Sender: TObject);
    procedure RangeRadioClick(Sender: TObject);
    procedure RB_CorClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AcceptActionExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    IdCalcType:Shortint;
  public
    FormControl: TEditControl;
    DS:char;
    Add, CanDateCor:Boolean;
    id:string;
    date_beg,date_end:TDate;
    DMod: TDMSPRaise;
    constructor Create(AOwner: TComponent; IdCType:Shortint); reintroduce;
  end;

var
  SP_Raise_Add: TSP_Raise_Add;

implementation

{$R *.dfm}

constructor TSP_Raise_Add.Create(AOwner: TComponent; IdCType:Shortint);
begin
//    SpInit(DMod.FIBDatabase.Handle);
    inherited Create(AOwner);
    IdCalcType:=IdCType;
end;


procedure TSP_Raise_Add.FormCreate(Sender: TObject);
begin
  FormControl := TEditControl.Create;
  FormControl.Add([FC_Name, FC_Def, FC_Min, FC_Max, FC_One, FC_Type, FC_Vid]);
  FormControl.Prepare(emNew);

  BonusBox.LoadFromRegistry;
  TypeBox.LoadFromRegistry;
  AbsorbeGroup.LoadFromRegistry;

  DS:=DecimalSeparator;
  DecimalSeparator:='.';

  DT_DateBeg.Date:=Date;
  DT_DateEnd.Date:=StrToDate('31.12.2500');
end;

procedure TSP_Raise_Add.CE_MinKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=',') then Key:='.';
end;

procedure TSP_Raise_Add.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormControl.Free;
  BonusBox.SaveIntoRegistry;
  TypeBox.SaveIntoRegistry;
  AbsorbeGroup.SaveIntoRegistry;
  DecimalSeparator:=DS;
end;

procedure TSP_Raise_Add.SBCancelClick(Sender: TObject);
begin
	ModalResult := mrCancel;
	Close;
end;

procedure TSP_Raise_Add.RangeRadioClick(Sender: TObject);
begin
    CE_Max.Enabled := RangeRadio.Checked;
    CE_Min.Enabled := RangeRadio.Checked;
    CE_Def.Enabled := RangeRadio.Checked;
    CE_One.Enabled := FixRadio.Checked;

    FC_One.Required := FixRadio.Checked;
    FC_Max.Required := RangeRadio.Checked;
    FC_Min.Required := RangeRadio.Checked;
    FC_Def.Required := RangeRadio.Checked;
end;

procedure TSP_Raise_Add.RB_CorClick(Sender: TObject);
begin
  DT_DateBeg.Enabled:=(RB_New.Checked)or((RB_Cor.Checked)and(CanDateCor));
  DT_DateEnd.Enabled:=(RB_New.Checked)or((RB_Cor.Checked)and(CanDateCor));
  Label8.Visible:=RB_Cor.Checked;

  if RB_Cor.Checked then
   begin
     DT_DateBeg.Date:=date_beg;
     DT_DateEnd.Date:=date_end;
   end
   else
   begin
     if date_end<>StrToDate('31.12.2500') then
      DT_DateBeg.Date:=date_end
      else DT_DateBeg.Date:=Date;
     DT_DateEnd.Date:=StrToDate('31.12.2500');
   end
end;

procedure TSP_Raise_Add.FormDestroy(Sender: TObject);
begin
  //SpDone;
end;

procedure TSP_Raise_Add.AcceptActionExecute(Sender: TObject);
var n,i:integer;
    more, max, min, def,
    spec, s, perc, usesh,
    usesm, usest, StimulBonus, IsProlong:string;
begin
  n:=M_full.Lines.Count;
  for i:=0 to n-1 do
    more:=more+M_full.Lines[i]+' ';

  FormControl.Read;

  if not FormControl.CheckFill then
  begin
    ModalResult := 0;
    Exit;
  end;

  if RangeRadio.Checked
   then begin max:=CE_Max.Text; min:=CE_Min.Text; def:=CE_Def.Text; end
   else begin max:=CE_One.Text; min:=CE_One.Text; def:=CE_One.Text; end;

  if Add then
   if (DT_DateBeg.Date>=DT_DateEnd.Date) then
    begin
      MessageDlg('Дата початку має бути меншою за дату кінця!',mtError,[mbYes],0);
      ModalResult := 0;
      Exit;
    end;

  if (not Add)and(RB_New.Checked)then
   if (Date_Beg>=DT_DateBeg.Date) then
    begin
      MessageDlg('Не можливо створити нову надбавку'+#13+'раніше ніж почала діяти попередня!',mtError,[mbYes],0);
      ModalResult := 0;
      Exit;
    end;

  if (StrToFloat(Min) > StrToFloat(Max)) then
  begin
    MessageDlg('Мінімум повинен бути не більшим за максимум!',mtError,[mbYes],0);
    ModalResult := 0;
    Exit;
  end;
  if     (StrToFloat(Def) > StrToFloat(Max))or
     (StrToFloat(Min) > StrToFloat(Def))then
  begin
    MessageDlg('Звичайне значення повинно бути у межах діапазону!',mtError,[mbYes],0);
    ModalResult := 0;
    Exit;
  end;

  spec        := 'F';  if CB_Spec.Checked       then spec:='T';
  perc        := 'F';  if CB_Percental.Checked  then perc:='T';
  usesh       := 'F';  if CB_Use_SHT.Checked    then usesh:='T';
  usesm       := 'F';  if CB_USE_SM_Okl.Checked then usesm:='T';
  usest       := 'F';  if CB_USE_Stavka.Checked then usest:='T';
  StimulBonus := 'F';  If chStimulBonus.Checked then StimulBonus:='T';
  IsProlong   := 'F';  If chIsProlong.Checked   then IsProlong := 'T';

  if Add
   then DMod.FIBQuery.SQL.Text:='execute procedure sp_raise_i('+QuotedStr(CE_Name.Text)+','+
                                 QuotedStr(more)+','+ min+','+max+','+def+','+
                                 QuotedStr(spec)+','+QuotedStr(DateToStr(DT_DateBeg.Date))+','+
                                 QuotedStr(DateToStr(DT_DateEnd.Date))+','+QuotedStr(perc)+','+
                                 QuotedStr(usesh)+','+QuotedStr(usesm)+','+QuotedStr(usest)+','+
                                 IntToStr(TypeBox.GetId)+','+IntToStr(BonusBox.GetId)+','+IntToStr(CB_Calc_type.ItemIndex+1)+
                                 ','+IntToStr(AbsorbeGroup.GetId)+','+AbsorbePriority.Text+','+
                                 IntToStr(Integer(MayBeeMoreThanOnce.checked))+','+DisplayOrder.ToString+
                                 ','+QuotedStr(StimulBonus)+','+QuotedStr(ReasonText.Text)+','+QuotedStr(IsProlong)+');'

   else if RB_Cor.Checked then
         DMod.FIBQuery.SQL.Text:='execute procedure sp_raise_correct('+id+','+
                                  QuotedStr(CE_Name.Text)+','+QuotedStr(more)+','+
                                  min+','+max+','+def+','+QuotedStr(spec)+','+
                                  QuotedStr(DateToStr(Date_end))+','+QuotedStr(DateToStr(DT_DateBeg.Date))+','+
                                  QuotedStr(DateToStr(DT_DateEnd.Date))+','+QuotedStr(perc)+','+
                                  QuotedStr(usesh)+','+QuotedStr(usesm)+','+QuotedStr(usest)+','+
                                  IntToStr(TypeBox.GetId)+','+IntToStr(BonusBox.GetId)+','+IntToStr(CB_Calc_type.ItemIndex+1)+
                                  ','+IntToStr(AbsorbeGroup.GetId)+','+AbsorbePriority.Text+','+
                                 IntToStr(Integer(MayBeeMoreThanOnce.checked))+','+DisplayOrder.ToString+
                                 ','+QuotedStr(StimulBonus)+','+QuotedStr(ReasonText.Text)+','+QuotedStr(IsProlong)+');'

         else DMod.FIBQuery.SQL.Text:='execute procedure sp_raise_u('+id+','+
                                  QuotedStr(CE_Name.Text)+','+QuotedStr(more)+','+
                                  min+','+max+','+def+','+QuotedStr(spec)+','+QuotedStr(DateToStr(Date_end))+','+
                                  QuotedStr(DateToStr(DT_DateBeg.Date))+','+QuotedStr(DateToStr(DT_DateEnd.Date))+','+QuotedStr(perc)+','+
                                  QuotedStr(usesh)+','+QuotedStr(usesm)+','+QuotedStr(usest)+','+
                                  IntToStr(TypeBox.GetId)+','+IntToStr(BonusBox.GetId)+','+IntToStr(CB_Calc_type.ItemIndex+1)+
                                  ','+IntToStr(AbsorbeGroup.GetId)+','+AbsorbePriority.Text+','+
                                  IntToStr(Integer(MayBeeMoreThanOnce.checked))+','+DisplayOrder.ToString+
                                 ','+QuotedStr(StimulBonus)+','+QuotedStr(ReasonText.Text)+','+QuotedStr(IsProlong)+');';


  with DMod do
  try
     FIBWriteTransaction.StartTransaction;
     FIBQuery.ExecProc;
     FIBWriteTransaction.Commit;
     ModalResult:=mrOk;
    // Close;
  except on e: Exception do
  begin
    if Add then s:='додати'
     else if RB_Cor.Checked then s:='відкорегувати'
           else s:='змінити';
    MessageDlg('Не вдалося '+s+' запис: '+#13+e.Message,mtError,[mbYes],0);
    FIBWriteTransaction.RollBack;
    ModalResult:=0;
  end;
  end;
end;

procedure TSP_Raise_Add.FormShow(Sender: TObject);
begin
  SPInit(DMod.FIBDatabase.Handle);
  with DMod do
  begin
     if CalcTypeDSet.Active then CalcTypeDSet.Close;
     CalcTypeDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM UP_SP_RAISE_CALC_TYPE_SEL';
     CalcTypeDSet.Open;
     CalcTypeDSet.FetchAll;
     CalcTypeDSet.First;
     if not CalcTypeDSet.IsEmpty then
     begin
        while not CalcTypeDSet.Eof do
        begin
           CB_Calc_type.Items.Add(CalcTypeDSet['Name_Calc_Type']);
           CalcTypeDSet.Next;
        end;
        CB_Calc_type.ItemIndex:=IdCalcType;
     end;
  end;
end;

end.
